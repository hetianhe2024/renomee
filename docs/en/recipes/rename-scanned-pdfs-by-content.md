---
title: How to Rename Scanned PDFs by Their Content Using OCR
description: Rename scanned PDF files automatically using OCR text extraction. Renomee AI reads the visible text, identifies the document title or key info, and renames the file — no manual work. Works on Windows 10+ and macOS 10.15+.
---

# How to Rename Scanned PDFs by Their Content Using OCR

**Renomee AI reads the image-based text in scanned PDFs via OCR, extracts the document title or key phrase, and renames the file automatically — no typing, no opening each document.**

This recipe is for: researchers dealing with scanned journal articles, archivists processing digitized records, or anyone with a folder of `scan_001.pdf`, `scan_002.pdf` files that need real names.

---

## What you need

- Renomee AI installed ([download here](https://renomeeai.com/en/product/download/)) — Windows 10+ or macOS 10.15+
- A folder of scanned PDF files (any size up to 50 MB per file)
- 5 minutes

---

## Steps

### 1. Open Renomee and select your scanned PDFs

Click **Select Folder** and navigate to the folder containing your scanned PDFs, or drag the files directly into the Renomee window.

Renomee automatically detects whether each PDF contains selectable text or is image-only. For image-only pages, OCR activates without any extra configuration.

### 2. Enter this rule

```
Rename each PDF using the document title or main heading found in the content
```

For scanned documents with no obvious heading, use:

```
Rename using the first meaningful line of text found by OCR
```

For documents with a date you want to include:

```
Rename as: DocumentTitle_YYYYMMDD.pdf, extracting the date from the document content
```

### 3. Preview before executing

Click **Preview**. Renomee shows a before/after list:

| Before | After (example) |
|--------|----------------|
| `scan_001.pdf` | `Annual_Report_Q3_2024.pdf` |
| `scan_002.pdf` | `Lease_Agreement_Oakwood_Properties.pdf` |
| `scan_003.pdf` | `Research_Findings_Climate_Study_2023.pdf` |

If any result looks wrong, adjust the rule and preview again. No files are changed until you click Execute.

### 4. Execute

Click **Execute**. Renomee processes files in a queue — large batches and heavy OCR workloads are handled automatically without freezing your system.

**Typical speed**: 5–15 seconds per scanned page depending on image quality and document length.

---

## OCR language support

Renomee's OCR engine supports 50+ languages including English, Chinese (Simplified and Traditional), Spanish, French, German, Japanese, Korean, Arabic, and Russian. No configuration needed — language is detected automatically.

---

## Troubleshooting

**Problem: OCR result is garbled or inaccurate**  
Cause: Low-resolution scan (below 150 DPI) or heavy watermarking.  
Fix: Re-scan at 300 DPI if possible. For watermarked documents, use the rule `Rename using text below the header area`.

**Problem: File is renamed to a number or random string**  
Cause: The first recognizable text is a page number or header code.  
Fix: Add context to your rule: `Rename using the document title, ignoring page numbers and headers`.

**Problem: Multiple files get the same name**  
Cause: Documents share the same heading (e.g., "Annual Report").  
Fix: Include a disambiguating field: `Rename as: Title_Date.pdf`. Renomee also appends `_2`, `_3` automatically for true duplicates.

---

## FAQ

**Does OCR send my documents to the cloud?**  
No. All OCR processing runs locally on your machine. Your files are never uploaded.

**What's the maximum file size?**  
50 MB per PDF. Files above this limit are skipped and flagged in the results list.

**Can I undo the renaming?**  
Yes. Renomee saves a full history of every operation. Click **Undo Last Operation** to reverse — even after closing and reopening the app. History is kept for 30 days.

**Does this work on password-protected PDFs?**  
No. Unlock the PDF first (remove the password), then run it through Renomee.

---

## Related recipes

- [Rename PDF research papers by title and author](rename-research-papers-by-title-author.md)
- [Rename invoice PDFs by vendor name and date](rename-invoices-by-vendor-date.md)
- [Rename files by content — general guide](../how-to/rename-files-by-content.md)

---

*Last updated: October 2026 · Applies to Renomee AI v2.0+*
