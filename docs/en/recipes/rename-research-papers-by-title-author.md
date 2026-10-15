---
title: How to Rename PDF Research Papers by Title and Author
description: Automatically rename academic PDF papers by extracting the title, first author, and year using AI. Works on arXiv, PubMed, IEEE, Elsevier exports. Process hundreds of papers in minutes. Windows 10+ and macOS 10.15+.
---

# How to Rename PDF Research Papers by Title and Author

**Renomee AI reads each paper's PDF content, extracts the title, first author's last name, and publication year, then renames the file — turning `10.1016_j.neuron.2023.08.021.pdf` into `Deep_Learning_NLP_Zhang_2023.pdf` in seconds.**

This recipe is for: researchers, PhD students, librarians, or anyone who downloads papers from arXiv, PubMed, Google Scholar, IEEE Xplore, or Elsevier and ends up with hundreds of cryptically named files.

---

## What you need

- Renomee AI installed ([download here](https://renomeeai.com/en/product/download/)) — Windows 10+ or macOS 10.15+
- PDF papers (digital or scanned, up to 50 MB each)
- 5 minutes

---

## Steps

### 1. Select your papers folder

Open Renomee, click **Select Folder**, and choose the directory containing your downloaded papers. Enable **Include subfolders** if papers are organized by topic or year.

### 2. Enter your rule

**Standard academic format (title + author + year):**
```
Rename each PDF using the paper title (max 60 characters), first author last name, and publication year
```

**Author-first format (e.g., for Zotero-style):**
```
Rename as: AuthorLastName_Year_ShortTitle.pdf, extracting from paper content
```

**Title only (when author/year aren't critical):**
```
Rename PDFs using the full paper title, truncated to 80 characters
```

**For arXiv papers specifically:**
```
Rename as: ShortTitle_Author_Year.pdf, using the arXiv PDF title and author list
```

### 3. Preview the results

Click **Preview**:

| Before | After (example) |
|--------|----------------|
| `10.1016_j.neuron.2023.08.021.pdf` | `Attention_Mechanisms_Neural_Networks_Zhang_2023.pdf` |
| `arxiv_2024_01234v2.pdf` | `Large_Language_Models_Survey_Brown_2024.pdf` |
| `download (47).pdf` | `CRISPR_Gene_Editing_Review_Liu_2023.pdf` |
| `paper_final_SUBMITTED.pdf` | `Climate_Model_Uncertainty_Thompson_2024.pdf` |

### 4. Execute

Click **Execute**. Renomee processes papers in a queue. For large literature review batches (100–500 papers), processing typically completes in 3–15 minutes depending on file sizes.

---

## Accuracy by publisher

Renomee achieves consistently high accuracy on papers from major academic publishers because they follow standardized PDF formatting:

| Publisher / Source | Expected accuracy | Notes |
|-------------------|-------------------|-------|
| Elsevier (ScienceDirect) | 97–99% | Highly structured title/author layout |
| Springer / Nature | 96–98% | Consistent formatting |
| IEEE Xplore | 95–97% | Title/author in predictable positions |
| PubMed / NCBI | 94–97% | Standard biomedical format |
| arXiv | 93–96% | Some variation in preprint formatting |
| Google Scholar exports | 90–95% | Varies by source journal |
| Scanned papers (via OCR) | 85–93% | Depends on scan quality and layout |

---

## Tips for researchers

**Tip: Process by research topic separately.** Run Renomee on one topic folder at a time (e.g., `/NLP_papers/`, `/climate_papers/`). This makes it easier to review the preview results for accuracy.

**Tip: Handle multi-author papers.** By default, only the first author's last name is used. To include all authors: `Rename using all author last names separated by underscores`. Note this can make filenames very long for papers with 5+ authors.

**Tip: Standardize capitalization.** Add to your rule: `Use title case for the paper title`. This ensures `deep_learning_nlp` becomes `Deep_Learning_NLP`.

**Tip: Keep arXiv IDs for traceability.** `Rename as: ShortTitle_Author_Year_ArXivID.pdf`. The arXiv ID lets you look up the exact version later.

**Tip: Works with Zotero and Mendeley.** After renaming in Renomee, re-import the renamed files into your reference manager. Most managers detect the new filenames and link them correctly to existing citations.

---

## FAQ

**What if the paper has no extractable title (e.g., a scanned older journal article)?**  
Renomee automatically activates OCR for image-based PDFs. For very old scanned papers with degraded print quality, accuracy may be lower — review the preview carefully for these files.

**Can Renomee read paper metadata (DOI, abstract) even if the title formatting is unusual?**  
Yes. If the title isn't in a standard position, Renomee analyzes the full first page and uses the largest, most prominent text block as the title candidate.

**What about papers in Chinese, French, or other non-English languages?**  
Renomee supports 50+ languages for both text extraction and OCR. Non-English titles are extracted correctly and included in the filename using the characters from that language.

**Will very long paper titles get truncated?**  
Specify a character limit in your rule: `Rename using paper title truncated to 60 characters`. Without a limit, Renomee applies a default of 100 characters and removes characters that are invalid in filenames.

**Can I undo if something goes wrong?**  
Yes. Full 30-day undo history. Click **Undo Last Operation** to reverse all renames instantly.

---

## Related recipes

- [Rename scanned PDFs by their content using OCR](rename-scanned-pdfs-by-content.md)
- [Rename PDF files by title — complete guide](../how-to/rename-pdf-by-title.md)
- [Use case: Academic research file organization](../use-cases/research/index.md)

---

*Last updated: October 2026 · Applies to Renomee AI v2.0+*
