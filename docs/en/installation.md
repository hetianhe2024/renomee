---
title: Installation Guide - Renomee AI for Windows and macOS
description: Detailed installation instructions for Renomee AI, including system requirements, security settings, and update/uninstall procedures.
---

# Installation Guide

This page provides detailed instructions for installing Renomee AI on your system.

## 📋 System Requirements

### Windows
- **OS**: Windows 10 (64-bit) or Windows 11.
- **RAM**: 4GB minimum (8GB recommended).
- **Disk**: 100MB for installation.

### macOS
- **OS**: macOS 10.15 (Catalina) or newer.
- **Processor**: Intel or Apple Silicon (M1/M2/M3).
- **RAM**: 4GB minimum (8GB recommended).

## 📥 Getting the Installer

### Option 1: Official Website (Recommended)
Visit [Renomee AI Official Download Page](https://renomeeai.com/en/product/download/). The site will automatically detect your OS and suggest the right version.

### Option 2: GitHub
Download from [GitHub Releases](https://github.com/hetianhe2024/renomee/releases):
- **Windows**: `.exe` installer or `.zip` portable version.
- **macOS**: `.dmg` for Intel or Apple Silicon.

## 🪟 Windows Installation

### Standard Setup
1. Run the downloaded `.exe` file.
2. If prompted by User Account Control, click **Yes**.
3. Follow the setup wizard to choose your install location and create shortcuts.

### Portable Version
1. Download the `.zip` file.
2. Extract it to any folder.
3. Run `Renomee.exe` directly. No installation required!

!!! info "Windows Defender"
    If you see a "Windows protected your PC" message, click **"More info"** and then **"Run anyway"**. This happens because the app is new; we are working on code signing to remove this in future versions.

## 🍎 macOS Installation

1. Open the `.dmg` file.
2. Drag the **Renomee** icon into your **Applications** folder.
3. Launch it from your Applications or Spotlight.

!!! info "Security Tip"
    If macOS says the app "cannot be opened because it is from an unidentified developer":
    1. Go to **System Settings** > **Privacy & Security**.
    2. Scroll down to the security section and click **"Open Anyway"** for Renomee.

## 📦 Package Managers (Advanced)

### Windows (Winget)
```powershell
winget install Renomee.RenomeeAI
```

### macOS (Homebrew)
```bash
brew install --cask renomee
```

## 🔄 Updates & Uninstallation

### Updating
Renomee checks for updates automatically. When a new version is available, you'll see a notification. Simply click **"Update Now"** to stay current. Your settings and presets will be preserved.

### Uninstalling
- **Windows**: Use "Add or Remove Programs" in your system settings.
- **macOS**: Drag the app from your Applications folder to the Trash.

---

**Next Step**: [Quick Start Guide](quickstart.md)
