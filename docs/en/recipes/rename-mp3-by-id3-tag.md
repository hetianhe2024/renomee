---
title: How to Rename MP3 Files by ID3 Tag (Artist, Album, Track Number)
description: Batch rename MP3 and audio files using ID3 tag metadata — artist, album, track number, title, year. Renomee AI reads ID3 tags directly and renames hundreds of music files in seconds. Windows 10+ and macOS 10.15+.
---

# How to Rename MP3 Files by ID3 Tag (Artist, Album, Track Number)

**Renomee AI reads the ID3 metadata embedded in each MP3 — artist, album, track number, song title, year — and renames the file automatically. Turn `track01.mp3` into `01_Pink_Floyd_Comfortably_Numb.mp3` without touching a single file manually.**

This recipe is for: music collectors organizing ripped CDs, podcasters managing episode files, or anyone dealing with inconsistently named audio files from different sources.

---

## What you need

- Renomee AI installed ([download here](https://renomeeai.com/en/product/download/)) — Windows 10+ or macOS 10.15+
- MP3 or audio files with ID3 tags
- 5 minutes

---

## What ID3 data Renomee can read

| ID3 field | Example | Tag name |
|-----------|---------|----------|
| Artist | Pink Floyd | `TPE1` |
| Album | The Wall | `TALB` |
| Track number | 06 | `TRCK` |
| Song title | Comfortably Numb | `TIT2` |
| Year | 1979 | `TDRC` / `TYER` |
| Genre | Rock | `TCON` |
| Album artist | Pink Floyd | `TPE2` |

---

## Steps

### 1. Select your music folder

Open Renomee, click **Select Folder**, and choose your music directory. Enable **Include subfolders** to process an entire music library organized by artist or album folders.

### 2. Enter your rule

**Standard music library format:**
```
Rename MP3 files as: TrackNumber_Artist_Title.mp3 using ID3 tags
```

**Album-centric format:**
```
Rename as: TrackNumber_Title.mp3 using ID3 tags (for files already in album folders)
```

**Podcast / audiobook episodes:**
```
Rename as: YYYYMMDD_EpisodeTitle.mp3 using ID3 date and title tags
```

**Year + Artist + Album + Track:**
```
Rename as: Year_Artist_Album_TrackNumber_Title.mp3 using ID3 metadata
```

### 3. Preview the results

Click **Preview**:

| Before | After (example) |
|--------|----------------|
| `track01.mp3` | `01_Pink_Floyd_Comfortably_Numb.mp3` |
| `audio_file_002.mp3` | `06_Led_Zeppelin_Stairway_to_Heaven.mp3` |
| `episode_final.mp3` | `20241015_The_Boring_Company_Deep_Dive.mp3` |
| `cd_rip_03.flac` | `03_Miles_Davis_So_What.flac` |

### 4. Execute

Click **Execute**. ID3 tag reading is very fast — 1,000 audio files can typically be renamed in under 60 seconds.

---

## Supported audio formats

| Format | ID3 / metadata support | Notes |
|--------|----------------------|-------|
| MP3 | ✅ ID3v1, ID3v2.3, ID3v2.4 | Most common |
| FLAC | ✅ Vorbis Comments | Lossless audio |
| M4A / AAC | ✅ iTunes metadata | Apple format |
| OGG | ✅ Vorbis Comments | Open format |
| WAV | ⚠️ Limited | Basic metadata only |
| WMA | ✅ Windows Media tags | Microsoft format |
| AIFF | ✅ ID3 embedded | Pro audio |

---

## Handling files with missing or incomplete ID3 tags

Some audio files (especially old rips or downloaded files) have incomplete tags:

| Problem | Rule to use |
|---------|------------|
| No artist tag | `Rename using title only; skip artist if missing` |
| No track number | `Rename as: Artist_Title.mp3 without track number` |
| All tags missing | `Rename using the filename as-is; flag files with empty tags` |
| Inconsistent artist names | `Normalize artist name: remove "The " prefix` |

**Tip**: After renaming, if you need to *fix* missing ID3 tags rather than just rename files, use a dedicated tag editor like MusicBrainz Picard alongside Renomee.

---

## FAQ

**What if two songs have the same track number and title (e.g., a compilation album)?**  
Renomee appends an auto-incremented counter: `01_Various_Song.mp3`, `01_Various_Song_2.mp3`.

**Does renaming change the ID3 tags or audio content?**  
No. Only the filename changes. The audio data and all ID3 metadata remain completely untouched.

**Can I rename podcast MP3s by episode number and title?**  
Yes. Use: `Rename as: EpisodeNumber_EpisodeTitle.mp3 using ID3 track and title tags`. Most podcast apps embed episode number in the track field.

**What if ID3 tags contain special characters (`&`, `/`, `:`)?**  
Renomee automatically replaces filename-invalid characters: `/` → `-`, `:` → `_`, `?` → removed.

**Can I undo if something goes wrong?**  
Yes. Full 30-day undo history. Click **Undo Last Operation** to reverse all changes.

---

## Related recipes

- [Batch rename photos by EXIF date and camera](rename-photos-by-exif-date.md)
- [Rename files by content — general guide](../how-to/rename-files-by-content.md)

---

*Last updated: October 2026 · Applies to Renomee AI v2.0+*
