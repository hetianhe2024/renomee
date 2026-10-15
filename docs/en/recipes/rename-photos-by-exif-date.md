---
title: How to Batch Rename Photos by EXIF Date and Camera Model
description: Batch rename JPEG, RAW, and PNG photos using EXIF metadata — capture date, camera model, GPS location, and more. Renomee AI reads EXIF data directly and renames hundreds of photos in seconds. Windows 10+ and macOS 10.15+.
---

# How to Batch Rename Photos by EXIF Date and Camera Model

**Renomee AI reads the EXIF metadata embedded in each photo — capture date, time, camera model, GPS coordinates — and renames the file automatically. Process hundreds of photos from multiple cameras in one batch.**

This recipe is for: photographers organizing shoots, hobbyists cleaning up camera dumps, or anyone with a folder of `IMG_4521.jpg`, `DSC_0034.CR2` files that need meaningful names.

---

## What you need

- Renomee AI installed ([download here](https://renomeeai.com/en/product/download/)) — Windows 10+ or macOS 10.15+
- Photos with EXIF data (JPEG, RAW formats including `.CR2`, `.NEF`, `.ARW`, `.DNG`, PNG)
- 5 minutes

---

## What EXIF data Renomee can read

| EXIF field | Example value | Use in filename |
|-----------|--------------|----------------|
| DateTimeOriginal | 2024-10-15 14:32:07 | `20241015_143207` |
| Camera make + model | Canon EOS R5 | `CanonR5` |
| GPS coordinates | 48.8566° N, 2.3522° E | Can include city via reverse lookup |
| Focal length | 85mm | `85mm` |
| ISO | 800 | `ISO800` |
| Aperture | f/1.8 | `f18` |

---

## Steps

### 1. Select your photo folder

Open Renomee, click **Select Folder**, and choose your photos directory. Enable **Include subfolders** to process photos organized in subdirectories (e.g., by camera card or trip).

### 2. Enter your rule

**Most common — date + sequence:**
```
Rename photos using the EXIF capture date in YYYYMMDD_HHMMSS format
```

**Date + camera model:**
```
Rename as: YYYYMMDD_HHMMSS_CameraModel.jpg, reading from EXIF metadata
```

**Event-based (add your own prefix):**
```
Rename as: Paris2024_YYYYMMDD_HHMMSS.jpg using EXIF date
```

**Multi-camera shoot (separate by camera):**
```
Rename as: CameraModel_YYYYMMDD_HHMMSS.jpg to distinguish cameras
```

### 3. Preview the results

Click **Preview**:

| Before | After (example) |
|--------|----------------|
| `IMG_4521.jpg` | `20241015_143207.jpg` |
| `DSC_0034.CR2` | `20241015_144512_NikonZ6.CR2` |
| `photo_final.jpeg` | `Paris2024_20241015_091823.jpeg` |

### 4. Execute

Click **Execute**. Renomee processes photos in a background queue, keeping your system responsive even for 1,000+ file batches.

**Typical speed**: 1,000 photos renamed in under 30 seconds (EXIF reading is fast — no content analysis needed for metadata-based rules).

---

## Handling photos without EXIF data

Some photos lose EXIF data after editing, screenshotting, or social media download. Renomee handles this gracefully:

- **Fall back to file creation date**: `Rename using the file creation date if EXIF date is missing`
- **Fall back to modification date**: `Rename using the file modification date as a fallback`
- **Flag missing EXIF**: Photos without EXIF are listed separately in the results so you can handle them manually

---

## Tips for photographers

**Tip: Mix cameras from the same shoot.** If you shot with two cameras, both sets of files can be renamed in one batch. The EXIF capture time ensures photos stay in chronological order regardless of camera body.

**Tip: Keep the original extension.** Renomee preserves the original file extension (`.CR2`, `.NEF`, `.ARW`) — RAW files are not converted.

**Tip: Sort by renamed filename = sorted by shoot time.** After renaming with `YYYYMMDD_HHMMSS`, alphabetical sort in any file explorer is also chronological sort.

**Tip: GPS-based location naming.** If your camera records GPS coordinates, try: `Rename as: Location_YYYYMMDD.jpg, using GPS coordinates to identify the location name`. Requires internet connection for reverse geocoding.

---

## Supported photo formats

| Format | EXIF support | Notes |
|--------|-------------|-------|
| JPEG / JPG | ✅ Full | Most common, all EXIF fields |
| PNG | ⚠️ Partial | Limited EXIF; creation date from file metadata |
| CR2, CR3 | ✅ Full | Canon RAW |
| NEF | ✅ Full | Nikon RAW |
| ARW | ✅ Full | Sony RAW |
| DNG | ✅ Full | Adobe universal RAW |
| HEIC | ✅ Full | iPhone photos |

---

## FAQ

**What if two photos have the same timestamp (burst shots)?**  
Renomee appends a counter: `20241015_143207.jpg`, `20241015_143207_2.jpg`, `20241015_143207_3.jpg`.

**Does renaming modify the photo file or EXIF data?**  
No. Only the filename changes. EXIF metadata, color profiles, and image data are completely untouched.

**Can I rename screenshots that have no EXIF?**  
Yes. For screenshots, use: `Rename using the file creation date and time`. Alternatively, if the screenshot contains text (e.g., an error message), Renomee can use OCR to extract that text for the filename.

**My phone photos have EXIF but wrong timezone. Can I correct for it?**  
Use the rule: `Rename using EXIF date, adjusting for UTC+8 timezone`. Renomee applies the offset before formatting the filename.

**Can I undo if something goes wrong?**  
Yes. Full 30-day undo history. Click **Undo Last Operation** to reverse all changes.

---

## Related recipes

- [Batch rename photos by EXIF — general guide](../how-to/batch-rename-photos-by-exif.md)
- [Rename files by content (for screenshots with text)](../how-to/rename-files-by-content.md)

---

*Last updated: October 2026 · Applies to Renomee AI v2.0+*
