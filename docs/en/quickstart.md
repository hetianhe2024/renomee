---
title: Quick Start - Get Started with Renomee AI in 5 Minutes
description: A step-by-step guide to downloading, installing, and using Renomee AI for the first time. Learn about rules, variables, and AI mode.
---

# Quick Start

This guide will help you get up and running with Renomee AI in less than 5 minutes.

## 📥 Download & Install

### For Windows
1. Go to the [Renomee AI Official Download Page](https://renomeeai.com/en/product/download/).
2. Click **"Download for Windows"**.
3. Run `Renomee-Setup.exe` and follow the prompts.

!!! tip "System Requirements"
    - Windows 10 or higher (64-bit).
    - At least 100MB of free space.

### For macOS
1. Go to the [Renomee AI Official Download Page](https://renomeeai.com/en/product/download/).
2. Click **"Download for macOS"**.
3. Open the `.dmg` file and drag Renomee to your **Applications** folder.

!!! tip "System Requirements"
    - macOS 10.15 (Catalina) or higher.
    - Supports both Apple Silicon and Intel chips.

## 🎯 Your First Rename

### Step 1: Launch the App
Open Renomee from your Start Menu (Windows) or Launchpad (macOS).

### Step 2: Add Files
There are three ways to add files:
- **Drag & Drop**: Simply drag files or folders into the Renomee window.
- **Select Folder**: Click the "Select Folder" button to browse.
- **Select Files**: Click "Select Files" to pick specific items.

### Step 3: Enter a Rule
Type what you want to do in the rule box using plain English:

!!! success "Example Rules"
    === "By Date"
        `Rename by date taken, format: YYYY-MM-DD`
        **Result**: `IMG_001.jpg` → `2025-01-26_001.jpg`

    === "Add Prefix"
        `Add prefix "Travel_"`
        **Result**: `IMG_001.jpg` → `Travel_IMG_001.jpg`

    === "Replace Text"
        `Replace "IMG" with "Photo"`
        **Result**: `IMG_001.jpg` → `Photo_001.jpg`

### Step 4: Preview
Click **"Preview"** to see the changes before they happen. No files will be modified in this mode.

### Step 5: Execute
Once you're happy with the preview, click **"Execute Rename"**.

✅ **Done!** Your files are now organized.

## 🎓 Pro Tips

### Using Variables
You can use placeholders for dynamic naming:
- `{date}`: File date (YYYY-MM-DD)
- `{name}`: Original filename
- `{ext}`: File extension
- `{n}`: Incremental number (001, 002...)

Example Rule: `{date}_{n3}_{name}{ext}`

### AI Smart Mode
Enable **AI Mode** to let Renomee analyze file content:
- **Photos**: Identifies subjects and locations.
- **Documents**: Extracts titles and authors (supports 50MB files).
- **OCR**: Reads text from screenshots and scanned PDFs.

## ❓ Need Help?
- Check the [FAQ](faq.md).
- Visit [GitHub Issues](https://github.com/hetianhe2024/renomee/issues).
- Email us: support@xiaojingjia.top

---

**Mastered the basics?** Explore [Basic Usage](basic-usage.md) to learn more!
