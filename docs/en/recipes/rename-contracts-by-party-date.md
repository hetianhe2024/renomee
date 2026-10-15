---
title: How to Rename Contract PDFs by Party Name and Date
description: Automatically rename contract and agreement PDFs by extracting the counterparty name and signing date using AI and OCR. Works on scanned and digital contracts. No manual entry. Windows 10+ and macOS 10.15+.
---

# How to Rename Contract PDFs by Party Name and Date

**Renomee AI reads each contract, extracts the counterparty name and effective date (from either selectable text or scanned image via OCR), and renames the file — turning `Contract_final_v3.pdf` into `NDA_TechCorp_20241015.pdf` automatically.**

This recipe is for: legal professionals, HR teams, procurement managers, or anyone managing a backlog of contracts with generic or inconsistent filenames.

---

## What you need

- Renomee AI installed ([download here](https://renomeeai.com/en/product/download/)) — Windows 10+ or macOS 10.15+
- Contract PDFs (digital or scanned, up to 50 MB each)
- 5 minutes

---

## Steps

### 1. Select your contracts folder

Open Renomee, click **Select Folder**, and choose the directory containing your contracts. Enable **Include subfolders** to process agreements organized by year or contract type.

### 2. Enter your rule

**Standard contract (counterparty + date):**
```
Rename each contract PDF as: ContractType_PartyName_YYYYMMDD.pdf
```

**NDA-specific:**
```
Rename as: NDA_CounterpartyName_SigningDate.pdf
```

**Purchase agreement:**
```
Rename as: PurchaseAgreement_Vendor_YYYYMMDD.pdf, extracting vendor and date from the document
```

**Scanned contracts:**
```
Use OCR to read the contract, then rename as: ContractType_Party_Date.pdf
```

**When contract type is unknown:**
```
Rename using the agreement type, counterparty name, and signing date found in the document
```

### 3. Preview the results

Click **Preview**:

| Before | After (example) |
|--------|----------------|
| `Contract_final_v3.pdf` | `ServiceAgreement_AcmeCorp_20241001.pdf` |
| `scan_contract_0045.pdf` | `NDA_GlobalTech_Ltd_20240815.pdf` |
| `agreement_signed.pdf` | `EmploymentContract_JohnSmith_20240901.pdf` |
| `PO_2024_089.pdf` | `PurchaseOrder_OfficeSupplies_Inc_20241010.pdf` |

If the contract type is ambiguous, Renomee uses context clues ("WHEREAS", "AGREEMENT", "PURCHASE ORDER") to classify it automatically.

### 4. Execute

Click **Execute**. All files are processed sequentially. A progress bar shows real-time status — large scanned contracts take slightly longer due to OCR.

---

## Handling common contract types

| Contract type | Key fields extracted | Example filename |
|--------------|-------------------|-----------------|
| NDA / Confidentiality Agreement | Parties, effective date | `NDA_TechCorp_20241015.pdf` |
| Service Agreement | Service provider, start date | `ServiceAgreement_DesignStudio_20240901.pdf` |
| Purchase Order | Vendor, PO number, date | `PO_OfficeSupplies_Inc_PO2024089_20241010.pdf` |
| Employment Contract | Employee name, start date | `Employment_Jane_Doe_20240701.pdf` |
| Lease Agreement | Tenant / property, start date | `Lease_123MainSt_20240801.pdf` |
| MSA | Client name, effective date | `MSA_GlobalRetail_Co_20230615.pdf` |

---

## Tips for legal teams

**Tip: Establish a naming convention first.** Decide on your preferred format before running the batch: `Type_Party_Date` vs. `Party_Type_Date`. Enter this explicitly in your rule so Renomee applies it consistently.

**Tip: Separate by contract type in subfolders.** After renaming, combine with Renomee's organize feature to move files into `NDAs/`, `ServiceAgreements/`, `PurchaseOrders/` folders automatically.

**Tip: Include both parties for bilateral agreements.** Use: `Rename as: Type_PartyA_PartyB_Date.pdf`. Renomee will list both parties from the agreement header.

**Tip: Handle counterparty variations.** If one counterparty appears as both "Acme Corp." and "Acme Corporation" across documents, add to your rule: `Normalize the party name to remove punctuation and standardize Inc/Corp/Ltd`.

---

## FAQ

**How accurately does Renomee extract counterparty names from contracts?**  
For digital PDFs (selectable text), accuracy is 92–97% on standard contract formats. For scanned contracts at 300 DPI, accuracy is 88–94% depending on scan quality and font clarity.

**What if the document has multiple parties (e.g., tripartite agreements)?**  
Use the rule: `Rename as: Type_Party1_Party2_Date.pdf`. Renomee identifies the primary named parties from the agreement header.

**Does renaming affect digital signatures or certification?**  
No. Renaming only changes the filename in the filesystem. The PDF's digital signatures, embedded metadata, and content are completely untouched. Digitally signed PDFs remain valid after renaming.

**Can I process password-protected contracts?**  
No. Remove the password first, then process. Renomee will flag password-protected files in the preview list.

**What if the signing date and effective date differ?**  
Specify in your rule: `Use the effective date` or `Use the signing date`. Renomee checks both fields and uses whichever you specify.

**Can I undo if something goes wrong?**  
Yes. Renomee keeps a full 30-day operation history. Click **Undo Last Operation** to reverse all changes instantly.

---

## Related recipes

- [Rename invoice PDFs by vendor name and date](rename-invoices-by-vendor-date.md)
- [Rename scanned PDFs by their content using OCR](rename-scanned-pdfs-by-content.md)
- [Rename PDF files by title — general guide](../how-to/rename-pdf-by-title.md)

---

*Last updated: October 2026 · Applies to Renomee AI v2.0+*
