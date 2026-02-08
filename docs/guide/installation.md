---
title: Renomee AI 详细安装说明 - Windows 和 macOS 完整教程
description: Renomee AI 详细安装指南，包含系统要求、下载方式、Windows 和 macOS 安装步骤、便携版使用、安全设置、包管理器安装、更新和卸载教程。
---

# 安装说明

本页提供 Renomee AI 的详细安装指南和系统要求。

## 📋 系统要求

### Windows

| 项目 | 最低要求 | 推荐配置 |
|------|----------|----------|
| **操作系统** | Windows 10 (64位) | Windows 11 |
| **处理器** | Intel Core i3 或同等 | Intel Core i5 或更高 |
| **内存** | 4GB RAM | 8GB RAM 或更多 |
| **存储空间** | 100MB 可用空间 | 500MB 可用空间 |
| **显示器** | 1280×720 分辨率 | 1920×1080 或更高 |

### macOS

| 项目 | 最低要求 | 推荐配置 |
|------|----------|----------|
| **操作系统** | macOS 10.15 (Catalina) | macOS 13 (Ventura) 或更新 |
| **处理器** | Intel 或 Apple Silicon | Apple M1/M2/M3 |
| **内存** | 4GB RAM | 8GB RAM 或更多 |
| **存储空间** | 100MB 可用空间 | 500MB 可用空间 |
| **显示器** | 1280×720 分辨率 | Retina 显示屏 |

## 📥 下载安装包

### 方式 1：官方网站（推荐）

访问 [Renomee 官网](https://renomeeai.com/)，网站会自动检测您的操作系统并推荐相应版本。

### 方式 2：GitHub Releases

访问 [GitHub Releases](https://github.com/hetianhe2024/renomee/releases) 页面，下载最新版本：

- **Windows:** `Renomee-x.x.x-win.exe`
- **macOS (Intel):** `Renomee-x.x.x-mac-intel.dmg`
- **macOS (Apple Silicon):** `Renomee-x.x.x-mac-arm64.dmg`

!!! info "版本号说明"
    版本号格式：`主版本号.次版本号.修订号`
    
    示例：`1.2.3` 表示主版本 1，次版本 2，修订版 3

## 🪟 Windows 安装步骤

### 标准安装

1. **下载安装包**
   
   双击下载的 `Renomee-Setup.exe` 文件。

2. **用户账户控制**
   
   如果出现 Windows 用户账户控制提示，点击 **"是"** 允许安装。

3. **安装向导**
   
   - 选择安装语言（简体中文）
   - 阅读并接受许可协议
   - 选择安装位置（默认：`C:\Program Files\Renomee`）
   - 选择是否创建桌面快捷方式
   - 点击 **"安装"** 开始安装

4. **完成安装**
   
   安装完成后，勾选 **"立即启动 Renomee"**，点击 **"完成"**。

### 便携版

如果您更喜欢绿色便携版本：

1. 下载 `Renomee-x.x.x-win-portable.zip`
2. 解压到任意文件夹
3. 运行 `Renomee.exe` 即可使用

!!! tip "便携版优势"
    - 无需安装，解压即用
    - 可放在 U 盘随身携带
    - 配置文件保存在同一目录

### Windows Defender 提示

首次运行时，Windows Defender 可能会提示：

```
Windows 保护了你的电脑
```

这是因为应用尚未获得足够的数字签名信任。解决方法：

1. 点击 **"更多信息"**
2. 点击 **"仍然运行"**

我们正在申请代码签名证书，未来版本将不会出现此提示。

## 🍎 macOS 安装步骤

### 标准安装

1. **下载 DMG 文件**
   
   根据您的 Mac 芯片类型选择对应版本：
   
   - Intel 芯片：下载 `intel` 版本
   - Apple Silicon (M1/M2/M3)：下载 `arm64` 版本
   
   !!! question "如何查看 Mac 芯片类型？"
       点击左上角  菜单 → **关于本机** → 查看 "芯片" 或 "处理器"

2. **打开 DMG 文件**
   
   双击下载的 `.dmg` 文件，会弹出安装窗口。

3. **安装应用**
   
   将 **Renomee** 图标拖动到 **应用程序** 文件夹。

4. **启动应用**
   
   从启动台或应用程序文件夹打开 Renomee。

### 安全性与隐私设置

首次运行时，macOS 可能会提示：

```
"Renomee" 是从互联网下载的应用程序，确定要打开吗？
```

**解决方法 1（推荐）：**

1. 打开 **系统设置** → **隐私与安全性**
2. 找到 "Renomee" 的提示
3. 点击 **"仍要打开"**
4. 在弹出的对话框中点击 **"打开"**

**解决方法 2（终端命令）：**

```bash
sudo xattr -rd com.apple.quarantine /Applications/Renomee.app
```

!!! warning "安全提示"
    只对从官方网站下载的应用使用此命令。

## 📦 包管理器安装（高级用户）

### Windows - Winget

```powershell
winget install Renomee.RenomeeAI
```

### macOS - Homebrew

```bash
brew install --cask renomee
```

!!! info "包管理器优势"
    - 自动更新
    - 命令行管理
    - 与系统集成更好

## ✅ 验证安装

安装完成后，验证 Renomee 是否正常工作：

### 1. 检查版本

打开 Renomee，点击 **菜单** → **关于 Renomee**，查看版本信息。

### 2. 测试功能

创建一个测试文件夹：

```
test/
  ├── test1.txt
  ├── test2.txt
  └── test3.txt
```

使用规则 `"添加前缀 renamed_"` 进行测试重命名。

### 3. 查看日志

如果遇到问题，查看日志文件：

- **Windows:** `%APPDATA%\Renomee\logs\`
- **macOS:** `~/Library/Application Support/Renomee/logs/`

## 🔄 更新 Renomee

### 自动更新（推荐）

Renomee 会自动检查更新：

1. 有新版本时会在右上角显示通知
2. 点击通知，查看更新内容
3. 点击 **"立即更新"** 自动下载并安装

### 手动更新

1. 访问 [GitHub Releases](https://github.com/hetianhe2024/renomee/releases)
2. 下载最新版本
3. 覆盖安装即可（会保留您的配置）

## 🗑️ 卸载 Renomee

### Windows

**方式 1：控制面板**

1. 打开 **控制面板** → **程序** → **程序和功能**
2. 找到 **Renomee**，右键选择 **"卸载"**
3. 按照提示完成卸载

**方式 2：设置**

1. 打开 **设置** → **应用** → **已安装的应用**
2. 找到 **Renomee**，点击 **"卸载"**

**清理残留文件：**

```
%APPDATA%\Renomee
%LOCALAPPDATA%\Renomee
```

### macOS

1. 打开 **访达** → **应用程序**
2. 将 **Renomee** 拖到废纸篓
3. 清倒废纸篓

**清理残留文件：**

```bash
rm -rf ~/Library/Application\ Support/Renomee
rm -rf ~/Library/Preferences/com.renomee.*
rm -rf ~/Library/Caches/Renomee
```

## ❓ 安装问题排查

### 无法下载安装包

- 检查网络连接
- 尝试使用其他浏览器
- 使用 GitHub Releases 下载

### 安装失败

- 确保有足够的磁盘空间
- 以管理员身份运行安装程序
- 临时关闭杀毒软件

### 无法启动

- 检查系统要求是否满足
- 查看错误日志文件
- 尝试重新安装

### 仍然无法解决？

请访问 [GitHub Issues](https://github.com/hetianhe2024/renomee/issues) 提交问题，或发送邮件至 support@xiaojingjia.top。

## 📚 下一步

安装完成后，建议阅读：

- 📖 [快速开始](../quickstart.md) - 5分钟上手教程
- 🎯 [基础使用](basic-usage.md) - 详细功能说明
- 🚀 [高级功能](advanced-features.md) - 进阶技巧

---

**祝您使用愉快！** 🎉
