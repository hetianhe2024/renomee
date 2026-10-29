---
title: FAQ - Frequently Asked Questions about Renomee AI
description: Answers to common questions about Renomee AI installation, features, privacy, and licensing.
---

# FAQ

Find quick answers to common questions about Renomee AI.

## 📥 Installation & Updates

### Which operating systems are supported?
Renomee supports Windows 10/11 (64-bit) and macOS 10.15+. We support both Intel and Apple Silicon (M1/M2/M3) Macs. Linux support is currently in development.

### How do I update the app?
Renomee checks for updates automatically. You'll see a notification when a new version is ready. You can also download the latest version from our website and install it over your current version—your settings will be safe.

### Will I lose my presets when I update?
No. Your saved presets, settings, and history are stored separately and will not be affected by updates.

## 🔧 Usage & Features

### How do I rename files in bulk?
Just drag your folder into Renomee, type a rule like "Add date prefix," and click Execute. It's designed to handle hundreds of files at once.

### Can I undo a rename?
Yes! You can click the **Undo** button immediately after a task, or go to **Menu > History** to revert any of your last 10 operations.

### How does AI Mode work?
AI Mode analyzes the actual content of your files. For example, it can read the title of a PDF, the text in a screenshot (OCR), or the location data in a photo to suggest the best name.

### What happens if two files end up with the same name?
Renomee will warn you during the Preview step. By default, it can automatically add a number (e.g., `file(1).jpg`) to avoid conflicts, or you can choose to skip those files.

## 🛡️ Privacy & Security

### Is my data safe?
Yes. Renomee is designed to send only the minimum data necessary. What gets transmitted depends on the rename rule:

- **No content needed** (add prefix, numbering, EXIF date, etc.): only the filename and file metadata are sent. Your file content is never transmitted.
- **Content-based renaming** (PDF, images, scanned docs): only the **first 3 pages** of a document or the image file is sent to the AI server. This requires your explicit permission in the app.
- **Word / Excel files**: Renomee reads the first 3 pages **locally on your device**, then sends only that extracted text to the server. The original file is never uploaded.

Transmitted data is encrypted (TLS 1.3) and is discarded immediately after processing — nothing is stored on our servers.

### Does AI Mode require an internet connection?
**Yes, for content-based AI analysis.** Basic operations — renaming by prefix/suffix, sequential numbering, reading EXIF date from photos — work fully offline. Any feature that requires the AI to read and understand file content (document titles, OCR of scanned pages, image descriptions) requires a network connection to the Renomee AI server.

### Does Renomee store my files or their content on a server?
No. Data sent to the server (text snippets or partial page content) is used only for the current rename request and deleted immediately after. Renomee does not maintain a copy of any file or its content.

## 💳 Licensing & Support

### Is Renomee free?
Renomee offers a **Free Plan** with a daily quota of **60 AI-processed files per day**. Basic renaming operations (prefix/suffix, numbering, date-based rules) have no quota limit. The **Pro Version** removes daily limits and unlocks advanced features like Regex, Scripting, and unlimited AI processing.

### How many devices can I use with one license?
A personal license allows you to activate Renomee on up to **3 devices** (e.g., your laptop, desktop, and a work computer).

### How can I get help?
- **Renomee AI Pricing**: [https://renomeeai.com/en/product/pricing/](https://renomeeai.com/en/product/pricing/)
- **Renomee AI Official Blog**: [https://renomeeai.com/en/blog/](https://renomeeai.com/en/blog/)
- **GitHub**: [Report an issue](https://github.com/hetianhe2024/renomee/issues)
- **Community**: Join the discussion on our GitHub page.

---

**Still have questions?** Feel free to reach out to our support team!
