---
title: Basic Usage - Core Features and Operations of Renomee AI
description: Learn how to use Renomee AI's core features, including file filtering, natural language rules, variables, and the powerful AI Smart Mode.
---

# Basic Usage

Learn how to make the most of Renomee AI's core features.

## 📂 Adding & Filtering Files

### Adding Files
You can add files by dragging them into the app or using the "Select" buttons. Renomee can handle:
- Individual files.
- Entire folders (with optional subfolder support).
- Mixed selections of files and folders.

### Filtering
Once files are loaded, use the filter to narrow down your selection:
- **By Type**: Select only images, documents, or videos.
- **By Size**: Filter out files that are too small or too large.
- **By Date**: Select files modified within a specific range.

## 🗣️ Natural Language Rules

The heart of Renomee is its ability to understand plain language. You don't need to learn complex syntax.

### Common Operations
- **Add Prefix/Suffix**: "Add 'Draft_' to the beginning" or "Add '_final' before the extension."
- **Replace Text**: "Change 'IMG' to 'Photo'."
- **Remove Text**: "Remove 'copy' from all filenames."
- **Case Conversion**: "Make all filenames lowercase."

### Combining Rules
You can chain multiple actions together:
`"Remove 'IMG', make lowercase, and add 'vacation_' prefix"`

## 🔢 Using Variables

Variables allow you to insert dynamic data into your filenames.

| Variable | Description | Example |
| :--- | :--- | :--- |
| `{name}` | Original filename (no extension) | `photo` |
| `{ext}` | File extension | `.jpg` |
| `{n}` | Incremental number | `001, 002...` |
| `{date}` | Modification date | `2025-01-26` |
| `{parent}` | Parent folder name | `Holiday` |

### Date Formatting
You can customize dates: `{date:YYYYMMDD}` or `{date:MMM_DD_YYYY}`.

## 🤖 AI Smart Mode

Enable **AI Mode** to unlock deep content analysis. Renomee will "look" inside your files to help you name them better.

### Document Analysis
- **PDFs & Office Docs**: Extracts titles, authors, and key topics.
- **Large Files**: Optimized support for documents up to 50MB.
- **Smart OCR**: Automatically reads text from scanned PDFs that don't have selectable text.

### Image Recognition
- **EXIF Data**: Uses capture date, camera model, and GPS location.
- **OCR for Images**: Extracts text from screenshots, business cards, and ID photos.

### Audio & Video
- **Music**: Reads ID3 tags like Artist, Album, and Genre.
- **Video**: Identifies resolution (1080p, 4K), duration, and codec.

## 👁️ Preview & Execute

### The Preview Step
Always click **Preview** first. Renomee will show you a side-by-side comparison of the old and new names.
- ✓ **Green**: Ready to rename.
- ⚠ **Yellow**: Warning (e.g., filename already exists).
- ✗ **Red**: Error (e.g., file is locked by another app).

### Executing
Once confirmed, click **Execute Rename**. A progress bar will show the status, especially useful when processing hundreds of files or using AI mode.

### Undo
Made a mistake? No problem. Use the **Undo** button to immediately revert the last operation. You can also access your operation history to undo older tasks.

---

**Ready for more?**
- 🌐 [Renomee AI Full Feature Introduction](https://renomeeai.com/en/product/features/)
- Check out the [FAQ](faq.md) for troubleshooting and advanced tips.
