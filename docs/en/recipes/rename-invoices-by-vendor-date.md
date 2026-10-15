---
title: How to Rename Invoice PDFs by Vendor Name and Date
description: Automatically rename invoice PDFs by extracting the vendor name and invoice date using AI and OCR. Works on scanned and digital invoices. No manual data entry. Windows 10+ and macOS 10.15+.
---

# How to Rename Invoice PDFs by Vendor Name and Date

**Renomee AI reads each invoice, extracts the vendor (supplier) name and invoice date using OCR or text extraction, and renames the file — turning `invoice_00234.pdf` into `Acme_Corp_Invoice_20241015.pdf` automatically.**

This recipe is for: accountants, finance teams, small business owners, or anyone managing a folder of unorganized invoice PDFs.

---

## What you need

- Renomee AI installed ([download here](https://renomeeai.com/en/product/download/)) — Windows 10+ or macOS 10.15+
- Invoice PDFs (digital or scanned, up to 50 MB each)
- 5 minutes

---

## Steps

### 1. Select your invoice folder

Open Renomee, click **Select Folder**, and choose the folder containing your invoices. Enable **Include subfolders** if invoices are organized in subdirectories by month or year.

### 2. Enter this rule

For standard invoices (digital PDFs with selectable text):

```
Rename each invoice PDF as: VendorName_Invoice_YYYYMMDD.pdf
```

For scanned invoices (image-based):

```
Use OCR to read the invoice, then rename as: VendorName_Invoice_Date.pdf
```

For invoices that also include an invoice number you want to preserve:

```
Rename as: VendorName_InvoiceNumber_YYYYMMDD.pdf
```

### 3. Preview the results

Click **Preview** and review the proposed names:

| Before | After (example) |
|--------|----------------|
| `invoice_00234.pdf` | `Acme_Corp_Invoice_20241015.pdf` |
| `scan_inv_march.pdf` | `TechSupplies_Ltd_Invoice_20240318.pdf` |
| `INV-2024-0089.pdf` | `GlobalShipping_Invoice_20240822_INV-2024-0089.pdf` |

Adjust the rule if vendor names are truncated or dates are in the wrong format.

### 4. Execute

Click **Execute**. A progress bar tracks processing in real time. For large batches (100+ invoices), Renomee queues the work automatically — no system slowdown.

---

## Handling common invoice formats

| Invoice type | What Renomee detects | Notes |
|-------------|---------------------|-------|
| Digital PDF (e.g., from QuickBooks, Xero) | Vendor name, date, amount | High accuracy — text is selectable |
| Scanned paper invoice | Vendor name, date via OCR | 90–95% accuracy on clean 300 DPI scans |
| Emailed invoice (saved as PDF) | Sender company, date from header | Works well for standard formats |
| Handwritten invoice | Key printed fields only | OCR extracts printed text; handwriting varies |

---

## Practical tips

**Tip: Run a small batch first.** Select 10–20 invoices, preview, and confirm accuracy before processing the entire archive.

**Tip: Use a consistent date format.** Specify in your rule: `date in YYYY-MM-DD format`. This prevents mixing `Oct 15 2024` with `15/10/2024` across different vendors.

**Tip: Archive by year automatically.** After renaming, use Renomee's folder-organize feature to move files into `2024/`, `2023/` subfolders based on the extracted date.

---

## FAQ

**How accurate is vendor name extraction?**  
For digital PDFs from common accounting software (QuickBooks, Xero, FreshBooks, Sage), accuracy exceeds 95%. For scanned invoices, it depends on scan quality — 300 DPI scans typically achieve 90–95% accuracy.

**What if the vendor name includes special characters like `&`, `/`, or `:`?**  
Renomee automatically replaces characters that are invalid in filenames: `&` stays as-is, `/` becomes `-`, `:` becomes `_`.

**Can I rename invoices in multiple currencies or languages?**  
Yes. Renomee's OCR and AI extraction work across 50+ languages. Currency symbols and non-Latin scripts (Chinese, Arabic, etc.) are handled correctly.

**Will renaming change the PDF content or metadata?**  
No. Only the filename changes. The PDF content, internal metadata, and digital signatures remain completely untouched.

**Can I undo if something goes wrong?**  
Yes. Renomee keeps a 30-day history of all operations. Click **Undo Last Operation** to reverse.

---

## Related recipes

- [Rename contract PDFs by party name and date](rename-contracts-by-party-date.md)
- [Rename scanned PDFs by their content using OCR](rename-scanned-pdfs-by-content.md)
- [Automatically rename scanned PDFs — general guide](../how-to/rename-scanned-pdfs-automatically.md)

---

*Last updated: October 2026 · Applies to Renomee AI v2.0+*
