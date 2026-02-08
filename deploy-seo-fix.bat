@echo off
REM Renomee ReadTheDocs SEO 修复 - 快速部署脚本

echo ========================================
echo Renomee ReadTheDocs SEO 修复部署
echo ========================================
echo.

REM 1. 检查当前目录
echo [1/5] 检查当前目录...
cd /d "%~dp0"
if not exist "mkdocs.yml" (
    echo 错误：未找到 mkdocs.yml 文件
    echo 请确保在项目根目录运行此脚本
    pause
    exit /b 1
)
echo ✓ 当前目录正确
echo.

REM 2. 安装依赖（可选）
echo [2/5] 检查 Python 环境...
python --version >nul 2>&1
if errorlevel 1 (
    echo 警告：未找到 Python，跳过依赖安装
    echo 如需本地测试，请先安装 Python
) else (
    echo ✓ Python 已安装
    echo.
    echo 是否安装/更新依赖？(Y/N)
    choice /C YN /M "选择"
    if errorlevel 2 goto skip_install
    echo 正在安装依赖...
    pip install -r requirements.txt
    echo ✓ 依赖安装完成
)
:skip_install
echo.

REM 3. 查看修改
echo [3/5] 查看文件修改...
git status
echo.

REM 4. 提交更改
echo [4/5] 准备提交更改...
echo.
echo 修改的文件：
echo - mkdocs.yml (site_url 修正)
echo - docs/index.md (添加元数据)
echo - docs/quickstart.md (添加元数据)
echo - docs/faq.md (添加元数据)
echo - docs/guide/installation.md (添加元数据)
echo - docs/guide/basic-usage.md (添加元数据)
echo - docs/guide/advanced-features.md (添加元数据)
echo - docs/about/changelog.md (添加元数据)
echo - docs/about/privacy.md (添加元数据)
echo.

echo 是否提交并推送这些更改？(Y/N)
choice /C YN /M "选择"
if errorlevel 2 goto skip_commit

echo.
echo 正在提交更改...
git add .
git commit -m "SEO优化：修复title标签和canonical URL问题" -m "- 更新 site_url 为正确的 ReadTheDocs 路径" -m "- 为所有页面添加详细的 title 和 description 元数据" -m "- Title 标签从 2-4 字符增加到 20-40 字符" -m "- 修复 canonical URL 指向错误的问题" -m "- 优化 SEO 配置"

echo.
echo 正在推送到 GitHub...
git push origin main

if errorlevel 1 (
    echo 错误：推送失败
    echo 请检查网络连接或 Git 权限
    pause
    exit /b 1
)

echo ✓ 推送成功
goto check_build

:skip_commit
echo 跳过提交步骤
echo.

:check_build
REM 5. 完成
echo [5/5] 部署完成！
echo.
echo ========================================
echo 后续步骤：
echo ========================================
echo.
echo 1. 访问 ReadTheDocs 查看构建状态：
echo    https://readthedocs.org/projects/renomeeai/builds/
echo.
echo 2. 等待构建完成（约 2-5 分钟）
echo.
echo 3. 验证修复效果：
echo    https://renomeeai.readthedocs.io/en/latest/
echo.
echo 4. 在浏览器中检查：
echo    - 页面 title 标签是否完整
echo    - 查看源代码中的 canonical URL
echo.
echo 5. Bing Webmaster Tools 中请求重新抓取：
echo    https://www.bing.com/webmasters/
echo.
echo ========================================
echo 详细信息请查看：
echo - SEO_FIX_COMPLETE.md
echo - SEO_CHECKLIST.md
echo ========================================
echo.

pause
