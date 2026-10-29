---
title: Renomee AI - Intelligent File Renaming Tool
description: Renomee AI is a batch file renaming tool for Windows and macOS that uses AI and OCR to rename files based on their actual content, using plain-language rules instead of regex.
---

# Renomee AI - Smart File Renaming

![Renomee Logo](https://renomeeai.com/logo192.png)

!!! abstract "What Is Renomee AI?"
    **Renomee AI** is a batch file renaming tool for Windows 10+ and macOS 10.15+ that uses AI and natural language rules to rename files based on their actual content. You describe your naming requirement in plain language; Renomee AI reads the file content—PDF text, photo EXIF metadata, scanned document OCR, audio/video tags—combines it with your instructions, and generates a descriptive filename automatically. For example: `scan001.pdf` → `Invoice_ABC_Corp_2024-03-16.pdf`, or `IMG_1234.jpg` → `2024-06-15_Paris_Canon_EOS_R6.jpg`. Supports files up to 50 MB; free tier includes **60 AI-processed files per day**. **Privacy**: original files are never uploaded—only the minimum necessary content is transmitted over TLS 1.3 and deleted immediately after processing.

**Renomee AI is a batch file renaming tool for Windows and macOS that uses AI and OCR to rename files based on their actual content, using plain-language rules instead of regex.**

!!! info "Official Documentation"
    This site is the official technical documentation for RenomeeAI, including AI batch file renaming, OCR, PDF content extraction, and metadata-based renaming. Download the app and see product details on the [RenomeeAI Official Website](https://renomeeai.com/).

No complex expressions, no scripting. Just describe what you want — Renomee reads the file, extracts what matters (title, date, vendor, author), and renames it in seconds. Supports Windows 10+ and macOS 10.15+, processes files up to 50 MB.

## 🎯 Why Renomee?

Forget about learning complex regular expressions. Renomee AI makes renaming as easy as talking:

- 🤖 **AI-Powered Recognition** - Automatically identifies file content to generate meaningful names.
- 🗣️ **Natural Language Rules** - Simply describe what you want in plain English (or Chinese); no coding required.
- 🧠 **Deep Content Understanding** - Goes beyond filenames to "read" inside documents (supports files up to 50MB).
- 🖼️ **Smart OCR** - Automatically extracts text from scanned PDFs, screenshots, and ID photos.
- ⚡ **Optimized Batch Processing** - Queue-based architecture handles hundreds of files smoothly with real-time feedback.
- 🔒 **Privacy by Design** - Only the minimum necessary data is sent to the server. Your actual files are never stored remotely. See [how data transmission works](#how-data-is-handled).
- 📱 **Cross-Platform** - Fully supports Windows 10+ and macOS 10.15+.

## 🚀 Quick Start

### Get Started in 3 Steps

1. **Download**: Visit [Renomee AI Official Home](https://renomeeai.com/en/) to get the installer for your system.
2. **Install**: Run the setup wizard and follow the simple instructions.
3. **Rename**: Launch Renomee and start your first smart renaming task.

### Your First Task

```bash
# Example: Rename photos by their capture date
Select Folder → Enter Rule: "Rename by date taken" → Click Execute
```

It's that simple! For more details, see our [Quick Start Guide](quickstart.md).

## 📚 Core Features

### 1. Intelligent Content Extraction

Renomee doesn't just look at metadata; it understands what's inside:

- 📄 **PDF Documents** - Extracts titles, authors, and key text (supports large files up to 50MB).
- 🖼️ **OCR Fallback** - Automatically switches to OCR for scanned PDFs or image-heavy pages.
- 📝 **Office Docs (Word/Excel)** - Identifies document properties, headings, and sheet names.
- 📸 **Images** - Reads EXIF data (date, location, camera) and uses OCR for text in screenshots or business cards.
- 🎵 **Audio** - Extracts artist, album, and track info.
- 🎬 **Video** - Detects resolution, duration, and codec info.

!!! tip "Content-Aware Naming"
    Renomee generates precise names based on actual content rather than just templates.
    - Research Paper → `Deep_Learning_in_Image_Recognition_Smith_2024.pdf`
    - Scanned Contract → `Sales_Agreement_CompanyA_20240316.pdf` (via OCR)
    - Business Card → `John_Doe_Product_Manager_TechCorp.jpg` (via OCR)

### 2. Natural Language Rules

No need for complex syntax. Just tell the AI what to do:

!!! example "Rule Examples"
    - "Change all jpg images to date format"
    - "Replace spaces with underscores in filenames"
    - "Add 'VID_' prefix to all videos"
    - "Number all files starting from 1 based on creation time"

### 3. High-Performance Batching

Our queue-based system ensures a smooth experience even with large datasets:

- ✅ **Batch Support** - Process hundreds of files in one go.
- ✅ **Large File Optimization** - Smoothly handles content extraction for files up to 50MB.
- ✅ **Real-time Feedback** - Detailed progress bars and status updates.
- ✅ **Smart Queueing** - Automatic task management to prevent system lag.
- ✅ **Multi-folder Support** - Process files from different locations simultaneously.

## 🔐 How Data Is Handled {#how-data-is-handled}

Renomee uses your files' content to generate names. What gets sent to the server depends on the rename rule you apply:

| Scenario | What is sent to server |
| :--- | :--- |
| **Rule doesn't need file content** (e.g., add prefix, sequential numbering) | Filename + file metadata only (size, type, date). File contents are never transmitted. |
| **Rule needs file content** — PDF, images, scanned documents | Only the **first 3 pages** of a document, or the image file itself. Requires your explicit in-app permission. |
| **Structured formats** — Word, Excel | Renomee reads the first 3 pages **locally**, then sends that extracted text to the AI server. The original file is never uploaded. |

**Key principles:**
- Your files are **never stored** on Renomee servers — data is discarded immediately after processing.
- All transmissions are encrypted (TLS 1.3).
- **All Renomee AI features require an internet connection.** Only the minimum necessary data is transmitted — never your original file.
- The free tier includes **60 AI-processed files per day**.

For full details, see the [Privacy Policy](../about/privacy.md).

## 💡 Use Cases

### For Researchers
Organize 500+ research papers (including scans and large PDFs) in minutes instead of hours.

### For Photographers
Automatically categorize and rename thousands of photos by date, location, or event.

### For Finance & Admin
Archive invoices and contracts using OCR to automatically identify vendors and dates.

## 🎓 Resources

- 🌐 [RenomeeAI Official Website](https://renomeeai.com/) - Product home, downloads, and feature pages.
- 🚀 [Quick Start](quickstart.md) - Get up and running in 5 minutes.
- 📖 [User Guide](installation.md) - Detailed feature documentation.
  - ⚙️ [Installation](installation.md) - Requirements and setup steps.
  - 🎯 [Basic Usage](basic-usage.md) - Core operations and tips.
- ❓ [FAQ](faq.md) - Quick answers to common questions.

---

## ❓ Frequently Asked Questions

**What is Renomee AI?**  
Renomee AI is a batch file renaming tool for Windows and macOS that uses AI to read file contents—PDF text, photo EXIF data, scanned document OCR, audio/video metadata—and renames files based on a plain-language rule you describe. No regex or coding required.

**What file types does Renomee AI support?**  
PDF, Word, Excel, PowerPoint, JPEG, PNG, HEIC, MP4, MOV, AVI, MP3, M4A, WAV — 10+ formats in total. Each type uses the most appropriate extraction method (metadata, text parsing, or OCR).

**Does Renomee AI require an internet connection?**  
Yes. All Renomee AI features require a network connection. Only the minimum necessary data is transmitted: the first 3 pages of a document's text, or the image file itself. Your original files are never uploaded or stored on Renomee servers. All data is encrypted (TLS 1.3) and deleted immediately after the filename is generated.

**How accurate is AI-based content extraction?**  
Accuracy by file type: well-formatted PDFs 95%+; photos with EXIF data 99%+; OCR on clear scans (300+ DPI) 90–95%; videos/audio with metadata 98%+. Always use Preview mode before executing batch renames.

**How fast is batch renaming with Renomee AI?**  
Small files (images, PDFs under 5 MB): 50–100 files per minute. OCR-required scans: 5–15 files per minute. Simple metadata-only renames (1,000+ files): under 5 seconds.

**Can I undo a batch rename?**  
Yes. Every operation is fully logged. Go to History → Recent Operations and click Revert to restore all original filenames instantly.

---

**Ready to start?** 👉 [Download RenomeeAI](https://renomeeai.com/en/product/download/)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "@id": "https://renomeeai.readthedocs.io/en/latest/en/#website",
  "name": "Renomee AI Documentation",
  "url": "https://renomeeai.readthedocs.io/en/latest/en/",
  "description": "Official technical documentation for RenomeeAI, including AI batch file renaming, OCR, PDF content extraction, and metadata-based renaming.",
  "about": {
    "@type": "SoftwareApplication",
    "@id": "https://renomeeai.com/#software",
    "name": "RenomeeAI",
    "url": "https://renomeeai.com/"
  },
  "publisher": {
    "@type": "Organization",
    "@id": "https://renomeeai.com/#organization",
    "name": "Beijing Xiaojing Shanyue Technology Co., Ltd."
  }
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is Renomee AI?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Renomee AI is a batch file renaming tool for Windows 10+ and macOS 10.15+ that uses AI and natural language rules to rename files based on their actual content. You describe your naming requirement in plain language; Renomee AI reads the file content—PDF text, photo EXIF metadata, scanned document OCR, audio/video tags—and generates a descriptive filename automatically. Example: scan001.pdf becomes Invoice_ABC_Corp_2024-03-16.pdf. Free tier includes 60 AI-processed files per day."
      }
    },
    {
      "@type": "Question",
      "name": "What file types does Renomee AI support for content-based renaming?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Renomee AI supports 10+ file formats: PDF (title, author, body text up to 50 MB), Word/Excel/PowerPoint (document properties, headings, sheet names), JPEG/PNG/HEIC images (EXIF metadata and OCR text), MP4/MOV/AVI video (title, date, resolution), and MP3/M4A/WAV audio (ID3 tags: artist, song, album). Scanned PDFs and image-heavy documents are handled automatically via the built-in OCR engine."
      }
    },
    {
      "@type": "Question",
      "name": "Does Renomee AI require an internet connection?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. All Renomee AI features require a network connection to process renaming requests. Privacy protection: only the minimum necessary data is transmitted—the first 3 pages of a document's text, or the image file itself (for Word/Excel, text is extracted locally before sending). Original files are never uploaded or stored on Renomee servers. All transmissions are encrypted with TLS 1.3 and data is deleted immediately after the filename is generated."
      }
    },
    {
      "@type": "Question",
      "name": "How accurate is Renomee AI content extraction for file renaming?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Accuracy by file type: well-formatted PDFs achieve 95%+ accuracy; photos with EXIF data reach 99%+ accuracy; OCR on clean scans (300+ DPI) is 90–95% accurate; OCR on low-quality scans falls to 70–85%; videos and audio files with metadata achieve 98%+ accuracy. Always use the Preview mode before executing batch renames to verify results."
      }
    },
    {
      "@type": "Question",
      "name": "How fast is batch file renaming with Renomee AI?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Renomee AI batch processing speeds: small files (images, PDFs under 5 MB) process at 50–100 files per minute; medium files (5–20 MB) at 20–40 files per minute; large files (20–50 MB) at 10–20 files per minute; scanned PDFs requiring OCR at 5–15 files per minute (single-page) or 2–5 files per minute (10–20 page documents)."
      }
    },
    {
      "@type": "Question",
      "name": "Can I undo a batch rename in Renomee AI?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. Renomee AI logs every batch rename operation automatically. To revert: go to History → Recent Operations, select the operation, and click Revert. All original filenames are restored instantly. This undo log is stored locally on your device."
      }
    }
  ]
}
</script>
