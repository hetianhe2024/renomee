---
title: Changelog - Version History and Feature Updates
description: Complete version history for Renomee AI, including new features, improvements, bug fixes, and known issues.
---

# Changelog

This page tracks all updates and changes to Renomee AI.

## Versioning
We use `Major.Minor.Patch` format:
- **Major**: Significant new features or architectural changes.
- **Minor**: New features added.
- **Patch**: Bug fixes and minor improvements.

---

## [2.0.0] - 2026-04-08

### 🔥 Core Enhancements

#### Smart OCR Fallback for PDFs
- **Intelligent Page Recognition**: Automatically detects pages with sparse text (e.g., covers, diagrams).
- **OCR Fallback**: Automatically enables OCR when standard text extraction fails or returns minimal content.
- **Mixed Document Support**: Handles PDFs containing both text and image-based pages seamlessly.

#### Optimized Batch Operations ⚡
- **Real-time Progress**: Detailed progress bars and status updates during batch tasks.
- **Queue-based Architecture**: Smoothly handles large numbers of files without system lag.
- **Interrupt & Resume**: Support for pausing, canceling, and resuming batch processes.

#### Content Extraction Queue Refactoring 🏗️
- **Smart Queue Management**: Prevents system resource exhaustion by queueing extraction requests.
- **Incremental Processing**: Reuses extracted content to speed up multi-turn interactions.
- **Large File Stability**: Reliable extraction for PDF, Word, and Excel files up to 50MB.

### ✨ New Features
- **Image OCR**: Text recognition for screenshots, ID photos, and business cards.
- **Large File Support**: Content extraction for documents up to 50MB.
- **Excel Extraction**: Support for sheet names, column headers, and row counts.
- **Media Metadata**: Extraction of ID3 tags for audio and resolution/codec for video.
- **Expanded Format Support**: Support for 30+ text formats including Markdown, JSON, and CSV.

### 🎨 UI/UX Improvements
- **Refined Chat Interface**: Cleaner look and better interaction flow.
- **Enhanced File List**: Clearer status indicators for content extraction.
- **Transparent Trial Status**: Real-time tracking of remaining trial usage.

### 🐛 Bug Fixes
- Fixed occasional freezes during large file extraction.
- Fixed OCR fallback issues.
- Optimized memory usage for large batch tasks.
- Improved context retention in multi-turn AI interactions.

---

## [1.0.0] - 2024-10-15

### 🎉 Initial Release
- **Core Features**: Natural language rules, variable system, preview/undo, and history.
- **AI Mode**: Basic metadata extraction for photos, docs, and media.
- **Cross-Platform**: Full support for Windows 10/11 and macOS 10.15+.

---

## 🚀 Upcoming Features
- [ ] Plugin System
- [ ] Cloud Config Sync
- [ ] Mobile App (iOS/Android)
- [ ] Linux Support

---

## Feedback
Have a suggestion or found a bug?
- 📧 Email: support@xiaojingjia.top
- 🐛 [GitHub Issues](https://github.com/hetianhe2024/renomee/issues)
- 📝 [Renomee AI Blog](https://renomeeai.com/en/blog/) - Product updates and tips

---
**Stay Updated!**
- ⭐ [Star on GitHub](https://github.com/hetianhe2024/renomee)
- 📝 [Renomee AI Official Blog](https://renomeeai.com/en/blog/)
