@echo off
REM Renomee 仓库地址验证脚本

echo ========================================
echo Renomee Git 仓库配置验证
echo ========================================
echo.

REM 1. 检查当前目录
echo [1/5] 检查当前目录...
cd /d "%~dp0"
if not exist ".git" (
    echo 错误：当前目录不是 Git 仓库
    pause
    exit /b 1
)
echo ✓ 当前目录是 Git 仓库
echo.

REM 2. 获取 Git 远程仓库地址
echo [2/5] 获取 Git 远程仓库配置...
set GIT_REMOTE_URL=
for /f "tokens=*" %%i in ('git remote get-url origin 2^>nul') do set GIT_REMOTE_URL=%%i

if "%GIT_REMOTE_URL%"=="" (
    echo 错误：未找到远程仓库配置
    pause
    exit /b 1
)

echo Git 远程仓库: %GIT_REMOTE_URL%
echo.

REM 3. 读取 mkdocs.yml 配置
echo [3/5] 读取 mkdocs.yml 配置...
if not exist "mkdocs.yml" (
    echo 警告：未找到 mkdocs.yml 文件
    goto check_readthedocs
)

REM 提取 repo_url
set MKDOCS_REPO_URL=
for /f "tokens=*" %%i in ('findstr /C:"repo_url:" mkdocs.yml') do (
    set LINE=%%i
    set LINE=!LINE:*repo_url: =!
    set LINE=!LINE: =!
    set MKDOCS_REPO_URL=!LINE!
)

REM 提取 repo_name
set MKDOCS_REPO_NAME=
for /f "tokens=*" %%i in ('findstr /C:"repo_name:" mkdocs.yml') do (
    set LINE=%%i
    set LINE=!LINE:*repo_name: =!
    set LINE=!LINE: =!
    set MKDOCS_REPO_NAME=!LINE!
)

echo mkdocs.yml repo_url: %MKDOCS_REPO_URL%
echo mkdocs.yml repo_name: %MKDOCS_REPO_NAME%
echo.

REM 4. 验证配置一致性
echo [4/5] 验证配置一致性...

set ERRORS=0

REM 标准化 Git URL（移除 .git 后缀）
set GIT_URL_NORMALIZED=%GIT_REMOTE_URL:.git=%

REM 检查 repo_url 是否匹配
if "%GIT_URL_NORMALIZED%"=="%MKDOCS_REPO_URL%" (
    echo ✓ repo_url 配置正确
) else (
    echo ✗ repo_url 配置不匹配
    echo   期望: %GIT_URL_NORMALIZED%
    echo   实际: %MKDOCS_REPO_URL%
    set /a ERRORS+=1
)

REM 检查 repo_name 是否匹配（从 URL 提取）
for /f "tokens=2 delims=/" %%a in ("%GIT_URL_NORMALIZED%") do set GIT_USER=%%a
for /f "tokens=3 delims=/" %%b in ("%GIT_URL_NORMALIZED%") do set GIT_REPO=%%b
set EXPECTED_REPO_NAME=%GIT_USER%/%GIT_REPO%

if "%EXPECTED_REPO_NAME%"=="%MKDOCS_REPO_NAME%" (
    echo ✓ repo_name 配置正确
) else (
    echo ✗ repo_name 配置不匹配
    echo   期望: %EXPECTED_REPO_NAME%
    echo   实际: %MKDOCS_REPO_NAME%
    set /a ERRORS+=1
)

echo.

REM 5. 检查 ReadTheDocs 配置
:check_readthedocs
echo [5/5] 检查 ReadTheDocs 配置...
if exist ".readthedocs.yaml" (
    echo ✓ 找到 .readthedocs.yaml 配置文件
) else (
    echo ⚠ 未找到 .readthedocs.yaml 文件（可选）
)
echo.

REM 6. 测试仓库连接（可选）
echo ========================================
echo 仓库连接测试（需要网络）
echo ========================================
echo.
echo 是否测试仓库连接？(Y/N)
choice /C YN /M "选择"
if errorlevel 2 goto summary

echo.
echo 正在测试仓库连接...
git ls-remote --heads origin main >nul 2>&1
if errorlevel 1 (
    echo ✗ 无法连接到远程仓库
    echo   可能原因：
    echo   - 网络连接问题
    echo   - 仓库不存在或无权访问
    echo   - 需要身份验证
) else (
    echo ✓ 仓库连接正常
    echo.
    echo 获取最新提交信息...
    git fetch origin --dry-run 2>&1 | findstr /C:"main" >nul
    if errorlevel 1 (
        echo   本地与远程已同步
    ) else (
        echo   本地与远程有差异
    )
)

:summary
echo.
echo ========================================
echo 验证结果总结
echo ========================================
echo.
echo Git 远程仓库: %GIT_REMOTE_URL%
echo mkdocs.yml repo_url: %MKDOCS_REPO_URL%
echo mkdocs.yml repo_name: %MKDOCS_REPO_NAME%
echo.

if %ERRORS%==0 (
    echo ✅ 所有配置检查通过！
    echo.
    echo 仓库地址配置正确，可以正常使用。
) else (
    echo ⚠️ 发现 %ERRORS% 个配置问题
    echo.
    echo 建议修复：
    echo 1. 检查 mkdocs.yml 中的 repo_url 和 repo_name
    echo 2. 确保与 Git 远程仓库地址一致
    echo 3. 格式：repo_url 应为 https://github.com/用户名/仓库名
    echo 4. 格式：repo_name 应为 用户名/仓库名
)

echo.
echo ========================================
echo ReadTheDocs 配置检查
echo ========================================
echo.
echo 请确认 ReadTheDocs 项目设置：
echo 1. 登录 https://readthedocs.org/
echo 2. 进入项目设置
echo 3. 检查 "Repository URL" 是否为：
echo    %GIT_REMOTE_URL%
echo 4. 检查 "Default branch" 是否为：main
echo.

pause
