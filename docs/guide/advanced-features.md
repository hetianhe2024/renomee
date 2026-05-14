---
title: Renomee AI 高级功能 - 正则表达式、脚本模式和批量操作
description: Renomee AI 高级功能教程，包含正则表达式模式、JavaScript 脚本模式、批量导入导出、预设管理、命令行模式等专业级功能详解。
---

# 高级功能

本指南介绍 Renomee AI 的高级功能和专业技巧。

## 🔥 文件内容智能提取

Renomee 的核心差异化功能：不仅识别文件名，还能深度理解文件内部内容。

### 核心创新：内容感知的智能命名机制

```
传统方案：
  用户指令 → AI 生成通用代码（盲猜）→ 执行 → 结果不够智能

Renomee 方案：
  用户指令 → AI 智能理解意图 → 请求提取文件内容权限 → 前端本地提取
           → AI 基于真实内容智能生成命名规则 → 精准命名
```

**关键技术特性：**

- ✅ **智能意图理解** - AI 深度分析用户需求，自动判断需要提取哪些文件内容
- ✅ **内容感知生成** - 基于文件真实内容（而非盲猜）生成命名规则
- ✅ **本地隐私提取** - 文件内容在用户电脑本地提取，不上传服务器（OCR 除外）
- ✅ **精准结果输出** - 避免通用模板，每个文件都能得到准确的命名

### 支持的文件格式与提取规格

以下是 Renomee 支持的所有文件格式及其可提取字段的完整规格。

#### 📄 PDF 文件（`.pdf`）

**提取方式：** 🏠 本地提取（文字版）/ ☁️ OCR（扫描版/图形页）  
**文件大小限制：** ≤ 50 MB  
**提取页数：** 最多前 10 页，文本预览截取前 1000 字符

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 文档标题 | `metadata.title` | PDF 元数据中的标题，或从正文首行智能提取 |
| 作者 | `metadata.author` | PDF 元数据中的作者信息 |
| 主题 | `metadata.subject` | PDF 元数据中的主题 |
| 关键词 | `metadata.keywords` | PDF 元数据中的关键词 |
| 正文预览 | `text_preview` / `page_1` | 前 1000 字符的正文内容 |
| 章节标题 | `headings` | 自动识别的章节标题列表（最多 10 条） |
| 总页数 | `page_count` | PDF 总页数 |
| 是否扫描版 | `is_scanned` | `true` 表示扫描版，需 OCR 才能识别文字 |

**OCR 智能兜底机制 🔥：**

- **纯文字页：** 直接提取文本，快速高效
- **扫描版 PDF：** 自动触发 OCR 识别，用户授权后提取文字内容
- **图形页兜底：** 当 PDF 页面文本稀少（如封面、图表页）时，自动启用 OCR 兜底识别
- **混合文档支持：** 智能识别每一页的内容类型，选择最佳提取方式

**命名场景示例：**

```
用户需求：根据 PDF 标题重命名
结果：document1.pdf → 深度学习在图像识别中的应用研究_张三_2024.pdf

用户需求：识别发票内容重命名
结果：scan001.pdf → 购销合同_甲方乙方_20240316.pdf（OCR识别）

用户需求：整理封面是图片的合同文件
结果：contract.pdf → 软件开发服务合同_甲方乙方_2024.pdf（OCR兜底）
```

---

#### 📝 Word 文档（`.docx`）

**提取方式：** 🏠 本地提取  
**文件大小限制：** ≤ 50 MB  
**提取范围：** 前 2 页文本 + 文档元数据

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 文档标题 | `metadata.title` | Word 文档属性中的标题 |
| 正文预览 | `text_preview` / `page_1` | 文档正文前 1000 字符 |
| 章节标题 | `headings` | 自动识别的标题层级列表 |

**命名场景示例：**

```
用户需求：用文档标题作为文件名
结果：合同.docx → 软件开发服务合同_甲方乙方_20241116.docx

用户需求：根据合同第一段提取甲方名称
结果：contract.docx → 某某公司_软件开发合同_2024.docx
```

---

#### 📊 Excel / CSV（`.xlsx` `.xls` `.csv`）

**提取方式：** 🏠 本地提取  
**文件大小限制：** ≤ 50 MB  
**提取范围：** 前 3 个工作表，每个工作表前 10 行

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 工作表名称列表 | `sheet_names` | 所有工作表名称，如 `["销售", "库存", "汇总"]` |
| 列标题（第一行） | `column_headers` | 每个工作表的第一行内容 |
| 总行数 | `row_count` | 所有工作表的总行数 |
| 文本预览 | `text_preview` | 第一个工作表前 10 行的文本内容 |

**命名场景示例：**

```
用户需求：按 Excel 第一个工作表名重命名
结果：数据.xlsx → 销售业绩月报_2024Q3.xlsx

用户需求：把月报文件按 Sheet 名整理到对应文件夹
结果：按工作表名 "销售"、"库存"、"汇总" 分类到不同文件夹
```

---

#### 🖼️ 图片（`.jpg` `.jpeg` `.png` `.heic` `.webp` `.tiff`）

**提取方式：** 🏠 本地提取（EXIF 元数据）/ ☁️ OCR（图片中的文字）  
**文件大小限制：** 无硬性限制（EXIF 提取极快，OCR 支持大图）

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 拍摄时间 | `exif.DateTimeOriginal` / `creation_date` | 相机快门按下的时刻 |
| 相机品牌 | `exif.Make` | 如 `Apple`, `Canon`, `Sony` |
| 相机型号 | `exif.Model` | 如 `iPhone 15 Pro`, `EOS R5` |
| 镜头型号 | `exif.LensModel` | 如 `24-70mm f/2.8` |
| 光圈 | `exif.FNumber` | 如 `f/2.8` |
| 快门速度 | `exif.ExposureTime` | 如 `1/500s` |
| ISO | `exif.ISO` | 如 `ISO800` |
| 焦距 | `exif.FocalLength` | 如 `50mm` |
| GPS 坐标 | `gps.latitude` / `gps.longitude` | 拍摄地点经纬度 |
| 图片宽度 | `width` / `dimensions.width` | 像素宽度 |
| 图片高度 | `height` / `dimensions.height` | 像素高度 |
| OCR 识别文字 | `ocr_text` | 图片中的文字内容（需用户授权） |

**OCR 增强功能 🔥：**

- **智能文字识别：** 支持从截图、扫描图片、证件照等图片中提取文字
- **多语言支持：** 支持中文、英文等多种语言识别
- **场景应用：** 证件扫描件、名片、海报、菜单、路牌等含文字图片的智能命名

**命名场景示例：**

```
用户需求：照片按拍摄日期重命名
结果：IMG_1234.jpg → 20240316_143022.jpg（EXIF）

用户需求：根据截图内的文字命名
结果：screenshot.png → 登录页面_用户名密码_20240316.png（OCR）

用户需求：整理扫描的名片，按姓名分类
结果：card001.jpg → 张三_产品经理_某公司_名片.jpg（OCR）

用户需求：按拍摄参数命名
结果：photo.jpg → Canon_EOS R5_f2.8_1-500s_ISO800_50mm.jpg
```

---

#### 🎵 音频（`.mp3` `.flac` `.wav` `.aac` `.ogg` `.m4a` `.wma`）

**提取方式：** 🏠 本地提取（ID3/音频标签）  
**文件大小限制：** 无硬性限制

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 歌曲标题 | `audio_tags.title` | ID3 标签中的曲目名称 |
| 艺术家 | `audio_tags.artist` | 演唱者/艺术家 |
| 专辑艺术家 | `audio_tags.albumartist` | 专辑主艺术家（合辑时有用） |
| 专辑名 | `audio_tags.album` | 所属专辑 |
| 年份 | `audio_tags.year` | 发行年份 |
| 流派 | `audio_tags.genre` | 音乐风格，如 `Pop`, `Jazz` |
| 曲目编号 | `audio_tags.track` | 专辑中的曲目序号 |
| 时长 | `duration` | 秒数（浮点数），如 `267.5` |
| 比特率 | `bitrate` | bps，如 `320000`（即 320kbps） |
| 采样率 | `sampleRate` | Hz，如 `44100` |

**命名场景示例：**

```
用户需求：按 艺术家 - 歌曲名 格式重命名
结果：track01.mp3 → 周杰伦 - 晴天.mp3

用户需求：320kbps 的音乐加 _HQ 后缀
结果：song.mp3 → 周杰伦 - 晴天_HQ.mp3（320kbps）
```

---

#### 🎬 视频（`.mp4` `.mkv` `.webm` `.avi` `.mov` `.m4v`）

**提取方式：** 🏠 本地提取（视频元数据）  
**文件大小限制：** 无硬性限制（只读取元数据，不加载视频流）

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 视频标题 | `audio_tags.title` | 视频文件的标题标签 |
| 视频宽度 | `width` | 像素宽度，如 `1920` |
| 视频高度 | `height` | 像素高度，如 `1080` |
| 帧率 | `fps` | 如 `30`, `60` |
| 时长 | `duration` | 秒数，如 `5400`（90分钟） |
| 比特率 | `bitrate` | 总比特率（bps） |
| 编码格式 | `codec` | 如 `H.264`, `H.265`, `AV1` |

**命名场景示例：**

```
用户需求：按分辨率重命名，1080p 的加 _1080p 后缀
结果：video001.mp4 → 会议录像_1080p.mp4

用户需求：加上时长和编码格式
结果：movie.mp4 → 电影名称_1080p_H265_90min.mp4
```

---

#### 📃 文本类文件（`.txt` `.md` `.log` `.csv` `.json` `.xml` 等）

**提取方式：** 🏠 本地提取  
**文件大小限制：** ≤ 10 MB  
**支持格式：** `.txt` `.md` `.log` `.csv` `.json` `.xml` `.html` `.css` `.js` `.py` 等 30+ 种文本格式

| 可用字段 | 字段路径 | 说明 |
|---------|---------|------|
| 文本预览 | `text_preview` | 前 500 字符的文本内容 |
| 文本总长度 | `text_length` | 字符数 |
| Markdown 标题 | `headings` | `#` 开头的标题列表（最多 10 条，仅 `.md`） |
| CSV 列标题 | `column_headers` | 第一行内容（仅 `.csv`） |
| JSON 顶层键 | `keywords` | 顶层 key 列表（最多 20 个，仅 `.json`） |

**命名场景示例：**

```
用户需求：根据 Markdown 文件的第一个标题重命名
结果：readme.md → 项目介绍_快速开始指南.md

用户需求：根据 JSON 文件的顶层键命名
结果：config.json → 配置文件_server_database_cache.json
```

---

### 提取规格汇总表

| 文件类型 | 格式 | 大小限制 | 提取方式 | 核心可用字段 |
|---------|------|---------|---------|------------|
| PDF | `.pdf` | ≤ 50MB | 🏠 本地 / ☁️ OCR | 标题、作者、正文、章节、页数 |
| Word | `.docx` | ≤ 50MB | 🏠 本地 | 标题、正文、章节 |
| Excel/CSV | `.xlsx` `.xls` `.csv` | ≤ 50MB | 🏠 本地 | 工作表名、列标题、行数 |
| 图片 | `.jpg` `.png` `.heic` `.webp` | 无限制 | 🏠 EXIF / ☁️ OCR | 拍摄时间、相机、参数、GPS、分辨率、文字识别 |
| 音频 | `.mp3` `.flac` `.wav` `.aac` | 无限制 | 🏠 本地 | 标题、艺术家、专辑、年份、时长、比特率 |
| 视频 | `.mp4` `.mkv` `.webm` `.avi` | 无限制 | 🏠 本地 | 分辨率、时长、帧率、编码 |
| 文本 | `.txt` `.md` `.json` 等 30+ | ≤ 10MB | 🏠 本地 | 文本内容、Markdown 标题、JSON 键 |

> **注：** 🏠 本地提取 = 文件内容不离开用户电脑；☁️ OCR = 需上传到服务器识别，用户需单独授权

---

### 批量处理与大文件支持 🔥

**智能批量处理架构**

Renomee 采用队列化的批量处理机制，确保在处理大量文件或大文件时仍能保持流畅体验：

**关键特性：**

- ✅ **批量文件支持** - 一次性处理数百个文件，无需逐个操作
- ✅ **大文件处理优化** - 支持 50MB 以内的 PDF、Word、Excel 等大文件内容提取
- ✅ **实时进度反馈** - 批量操作时显示详细进度条和处理状态
- ✅ **智能队列管理** - 内容提取请求自动排队，避免系统卡顿
- ✅ **增量处理机制** - 已提取过的文件内容可复用，提升多轮对话效率

**技术架构优势：**

```
传统工具：
  批量操作 → 界面卡死 → 用户不知进度 → 焦虑等待

Renomee：
  批量操作 → 队列化处理 → 实时进度展示 → 可中断可恢复
           → 内容提取缓存 → 多轮对话复用已提取内容
```

**性能指标：**

| 场景 | 文件数量 | 平均处理时间 | 用户体验 |
|------|---------|-------------|---------|
| 小文件批量重命名 | 1000+ 个 | < 5 秒 | ⭐⭐⭐⭐⭐ |
| 中等文件（5MB）批量提取 | 50 个 | 30-60 秒 | ⭐⭐⭐⭐ |
| 大文件（30-50MB）批量提取 | 20 个 | 60-120 秒 | ⭐⭐⭐⭐ |
| 混合场景（含大文件 OCR） | 100 个 | 2-5 分钟 | ⭐⭐⭐⭐ |

**实际应用场景：**

- 📚 **学术文献管理：** 一次性整理 500+ 篇论文 PDF（包含大文件）
- 📊 **财务报表归档：** 批量提取 100+ 个 Excel 表格的工作表名和内容
- 📷 **摄影素材整理：** 处理数千张照片 EXIF 信息，按拍摄时间分类
- 📄 **合同文档归档：** 批量提取 50+ 个 30MB+ 的扫描版 PDF 合同内容（OCR）

---

## 🎯 正则表达式模式

对于高级用户，Renomee 支持强大的正则表达式。

### 启用正则模式

在规则前添加 `[REGEX]` 标记：

```
[REGEX] ^IMG_(\d+) → Photo_$1
```

### 常用正则模式

#### 提取数字

```regex
[REGEX] .*?(\d+).* → File_$1
```

**示例：**
```
IMG_0001_photo.jpg  →  File_0001.jpg
test123abc.txt      →  File_123.txt
```

#### 替换空格

```regex
[REGEX] \s+ → _
```

**示例：**
```
my photo file.jpg   →  my_photo_file.jpg
```

#### 删除特殊字符

```regex
[REGEX] [^\w\s.-] → 
```

**示例：**
```
file@#$name.txt     →  filename.txt
```

#### 提取日期

```regex
[REGEX] (\d{4})-(\d{2})-(\d{2}) → $1年$2月$3日
```

**示例：**
```
2025-01-26_photo.jpg  →  2025年01月26日_photo.jpg
```

### 正则替换变量

| 变量 | 说明 |
|------|------|
| `$1`, `$2`, ... | 捕获组内容 |
| `$&` | 整个匹配内容 |
| `` $` `` | 匹配前的内容 |
| `$'` | 匹配后的内容 |

## 📝 脚本模式

使用 JavaScript 编写自定义重命名逻辑。

### 启用脚本模式

点击 **"⚡ 脚本"** 按钮，或在规则前添加 `[SCRIPT]` 标记。

### 基础脚本

```javascript
// 返回新文件名
function rename(file) {
  return file.name.toUpperCase() + file.ext;
}
```

### File 对象属性

| 属性 | 类型 | 说明 |
|------|------|------|
| `file.name` | string | 文件名（不含扩展名） |
| `file.ext` | string | 扩展名（含点） |
| `file.fullName` | string | 完整文件名 |
| `file.path` | string | 文件路径 |
| `file.size` | number | 文件大小（字节） |
| `file.created` | Date | 创建时间 |
| `file.modified` | Date | 修改时间 |
| `file.index` | number | 当前序号 |

### 实用脚本示例

#### 按文件大小分类

```javascript
function rename(file) {
  let prefix;
  if (file.size < 1024 * 1024) {
    prefix = "[小]";
  } else if (file.size < 10 * 1024 * 1024) {
    prefix = "[中]";
  } else {
    prefix = "[大]";
  }
  return prefix + file.fullName;
}
```

#### 智能编号

```javascript
function rename(file) {
  // 从 1 开始，补零到 3 位
  const num = String(file.index + 1).padStart(3, '0');
  return `File_${num}${file.ext}`;
}
```

#### 日期格式化

```javascript
function rename(file) {
  const date = file.modified;
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const day = String(date.getDate()).padStart(2, '0');
  return `${year}${month}${day}_${file.name}${file.ext}`;
}
```

## 🔄 批量处理

Renomee 支持多种批量处理模式。

### 批量导入

使用 CSV 文件批量指定重命名规则：

```csv
原文件名,新文件名
photo1.jpg,2025-01-26_001.jpg
photo2.jpg,2025-01-26_002.jpg
photo3.jpg,2025-01-26_003.jpg
```

导入方式：

1. 准备 CSV 文件（UTF-8 编码）
2. 菜单 → **导入** → **从 CSV 导入**
3. 选择 CSV 文件
4. 预览并执行

### 分组处理

按文件夹分组应用不同规则：

```
📁 Photos/
   ├── 风景/  [规则A] {date}_landscape_{n}
   ├── 人像/  [规则B] {date}_portrait_{n}
   └── 动物/  [规则C] {date}_animal_{n}
```

操作步骤：

1. 选择多个文件夹
2. 启用 **"分组模式"**
3. 为每个组设置不同规则
4. 批量执行

### 递归处理

处理包含多层子文件夹的目录：

```
📁 Project/
   ├── src/
   │   ├── components/
   │   └── utils/
   └── tests/
       └── unit/
```

启用 **"递归模式"** 可以一次处理所有文件。

选项：

- ☑ **保持目录结构** - 文件保留在原文件夹
- ☐ **展平到根目录** - 所有文件移到顶层文件夹
- ☑ **添加路径前缀** - 文件名包含原路径

## 🎨 条件重命名

根据文件属性应用不同规则。

### IF-THEN 规则

```
IF {ext} = .jpg THEN Photo_{n3}
IF {ext} = .png THEN Image_{n3}
ELSE File_{n3}
```

### 条件表达式

| 运算符 | 说明 | 示例 |
|--------|------|------|
| `=` | 等于 | `{ext} = .jpg` |
| `!=` | 不等于 | `{size} != 0` |
| `>` | 大于 | `{size} > 1048576` |
| `<` | 小于 | `{size} < 1024` |
| `>=` | 大于等于 | `{index} >= 10` |
| `<=` | 小于等于 | `{index} <= 100` |
| `CONTAINS` | 包含 | `{name} CONTAINS "photo"` |
| `STARTS` | 以...开头 | `{name} STARTS "IMG"` |
| `ENDS` | 以...结尾 | `{name} ENDS "_old"` |

### 复杂条件

使用 `AND`、`OR`、`NOT` 组合：

```
IF {ext} = .jpg AND {size} > 1048576 THEN
  HighRes_{n3}
ELSE IF {ext} = .jpg AND {size} <= 1048576 THEN
  LowRes_{n3}
ELSE
  {name}
END
```

## 📊 元数据提取与变量使用

结合文件内容提取功能，Renomee 支持使用提取的元数据作为变量。

### 图片 EXIF 数据变量

```
{exif:Make}        # 相机品牌
{exif:Model}       # 相机型号
{exif:DateTime}    # 拍摄时间
{exif:GPS}         # GPS 位置
{exif:FocalLength} # 焦距
{exif:ISO}         # ISO 感光度
```

**示例：**

```
规则: {exif:Make}_{exif:Model}_{n3}
结果: Canon_EOS R5_001.jpg
```

### 文档属性变量

```
{doc:Title}        # 文档标题（PDF/Word）
{doc:Author}       # 作者（PDF）
{doc:Subject}      # 主题（PDF）
{doc:Keywords}     # 关键词（PDF）
{doc:Pages}        # 页数（PDF）
```

### 音视频标签变量

```
{audio:Title}      # 歌曲标题
{audio:Artist}     # 艺术家
{audio:Album}      # 专辑
{audio:Year}       # 年份
{audio:Genre}      # 流派
{video:Duration}   # 视频时长
{video:Resolution} # 分辨率（1080p/4K）
```

### OCR 识别文字变量

```
{ocr:text}         # OCR 识别的完整文字
{ocr:first_line}   # OCR 识别的第一行文字
```

**示例（使用自然语言）：**

```
用户：把扫描的身份证按姓名和日期命名
AI 理解：提取 OCR 文字中的姓名和日期，生成规则
结果：scan001.jpg → 张三_身份证_20240316.jpg
```

### 自定义元数据

添加自己的元数据字段：

1. 菜单 → **元数据** → **编辑自定义字段**
2. 添加字段名和值
3. 在规则中使用 `{custom:fieldname}`

!!! tip "与 AI 模式结合"
    启用 AI 模式后，无需手动指定变量，直接用自然语言描述即可。AI 会自动判断需要提取哪些元数据字段。

## 🔧 命令行模式

Renomee 支持命令行调用，适合自动化场景。

### 基本语法

```bash
renomee [选项] <路径>
```

### 常用命令

#### 批量重命名

```bash
renomee --rule "{date}_{n3}{ext}" --path "/photos"
```

#### 使用预设

```bash
renomee --preset "照片按日期命名" --path "/photos"
```

#### 递归处理

```bash
renomee --rule "{name}_backup{ext}" --path "/docs" --recursive
```

#### 预览模式

```bash
renomee --rule "{date}_{n3}{ext}" --path "/photos" --dry-run
```

### 命令行选项

| 选项 | 说明 |
|------|------|
| `--rule <规则>` | 指定重命名规则 |
| `--preset <名称>` | 使用预设 |
| `--path <路径>` | 指定文件或文件夹 |
| `--recursive` | 递归处理子文件夹 |
| `--dry-run` | 预览模式（不实际重命名） |
| `--log <文件>` | 输出日志到文件 |
| `--yes` | 自动确认（无交互） |
| `--filter <类型>` | 过滤文件类型 |

### 示例脚本

#### Windows 批处理

```batch
@echo off
renomee --rule "{date}_{n3}{ext}" --path "C:\Photos" --recursive --log "rename.log"
if %ERRORLEVEL% EQU 0 (
  echo 重命名成功！
) else (
  echo 重命名失败，错误代码: %ERRORLEVEL%
)
```

#### Linux/macOS Shell

```bash
#!/bin/bash
renomee --rule "{date}_{n3}{ext}" \
        --path "/Users/me/Photos" \
        --recursive \
        --filter "jpg,png" \
        --log "rename.log"

if [ $? -eq 0 ]; then
  echo "重命名成功！"
else
  echo "重命名失败，错误代码: $?"
fi
```

## 🔌 插件系统

Renomee 支持第三方插件扩展功能。

### 安装插件

1. 菜单 → **插件** → **插件市场**
2. 浏览可用插件
3. 点击 **"安装"**

### 常用插件

#### 文件哈希

为文件名添加 MD5/SHA1 哈希：

```
photo.jpg  →  photo_a3b2c1d4e5f6.jpg
```

#### 重复文件检测

自动标记重复文件：

```
photo.jpg       →  photo.jpg
photo(副本).jpg  →  [重复]photo(副本).jpg
```

#### 云存储同步

重命名后自动同步到云盘：

- Google Drive
- Dropbox
- OneDrive

### 开发自己的插件

参考 [插件开发文档](https://github.com/hetianhe2024/renomee/wiki/Plugin-Development)。

## 💡 使用技巧

### 技巧 1：快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl/Cmd + O` | 打开文件夹 |
| `Ctrl/Cmd + Shift + O` | 打开文件 |
| `Ctrl/Cmd + P` | 预览 |
| `Ctrl/Cmd + Enter` | 执行重命名 |
| `Ctrl/Cmd + Z` | 撤销 |
| `Ctrl/Cmd + S` | 保存预设 |
| `Ctrl/Cmd + ,` | 设置 |
| `F2` | 手动编辑选中文件 |

### 技巧 2：快速过滤

双击文件类型图标快速过滤：

```
📸 双击图片图标 → 只显示图片文件
📄 双击文档图标 → 只显示文档文件
```

### 技巧 3：批量编辑

选中多个文件后，右键菜单：

- **提取到变量** - 将选中文件名提取为变量
- **应用到其他** - 将规则应用到其他文件
- **创建副本** - 先复制再重命名

### 技巧 4：模板库

保存常用规则为模板：

```
📸 摄影类
  - 婚礼照片：{date}_Wedding_{n3}
  - 旅行照片：{date}_{parent}_{n3}
  - 证件照：Portrait_{date}_{n2}

📄 文档类
  - 发票：Invoice_{date}_{n4}
  - 合同：Contract_{date}_{doc:Title}
  - 报告：Report_{date}_{doc:Author}
```

### 技巧 5：安全检查清单

执行重命名前检查：

- ✓ 预览结果是否正确
- ✓ 没有文件名冲突
- ✓ 重要文件已备份
- ✓ 规则应用范围正确
- ✓ 启用了操作历史

## 🚀 性能优化

### 大批量文件处理

处理数千个文件时：

1. **关闭预览模式** - 直接执行
2. **禁用 AI 模式** - 如不需要 AI 识别
3. **使用简单规则** - 避免复杂脚本
4. **分批处理** - 每次处理 500-1000 个文件

### 网络文件夹

处理网络驱动器或 NAS 上的文件：

1. **启用缓存** - 设置 → 高级 → 启用网络缓存
2. **增加超时** - 设置 → 高级 → 网络超时 (秒)
3. **本地预处理** - 先复制到本地，处理后再复制回去

## 📚 相关资源

### 文档导航

- 📖 [用户指南首页](../index.md) - 产品概览和核心功能介绍
- 🎯 [基础使用教程](basic-usage.md) - 界面操作和基本功能
  - 🤖 [AI 智能模式](basic-usage.md#ai-智能模式) - AI 功能入门
  - 🔢 [使用变量](basic-usage.md#使用变量) - 变量系统基础
  - 👁️ [预览功能](basic-usage.md#预览功能) - 安全预览机制
- ⚙️ [安装说明](installation.md) - 系统要求和安装步骤
- ❓ [常见问题](../faq.md) - 问题排查和解答
- 📝 [更新日志](../about/changelog.md) - 版本历史和新功能

### 外部资源

- 📖 [API 文档](https://github.com/hetianhe2024/renomee/wiki/API) - 开发者接口文档
- 🔌 [插件开发指南](https://github.com/hetianhe2024/renomee/wiki/Plugin-Development) - 扩展功能开发
- 💬 [社区论坛](https://github.com/hetianhe2024/renomee/discussions) - 用户交流和讨论
- 🐛 [问题反馈](https://github.com/hetianhe2024/renomee/issues) - Bug 报告和功能建议

---

**探索更多功能，让文件管理更高效！** 🚀
