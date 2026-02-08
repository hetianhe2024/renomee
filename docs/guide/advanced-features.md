---
title: Renomee AI 高级功能 - 正则表达式、脚本模式和批量操作
description: Renomee AI 高级功能教程，包含正则表达式模式、JavaScript 脚本模式、批量导入导出、预设管理、命令行模式等专业级功能详解。
---

# 高级功能

本指南介绍 Renomee AI 的高级功能和专业技巧。

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

## 📊 元数据提取

从文件中提取和使用元数据。

### 图片 EXIF 数据

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

### 文档属性

```
{doc:Title}        # 文档标题
{doc:Author}       # 作者
{doc:Subject}      # 主题
{doc:Keywords}     # 关键词
{doc:Pages}        # 页数
```

### 音视频标签

```
{audio:Title}      # 歌曲标题
{audio:Artist}     # 艺术家
{audio:Album}      # 专辑
{audio:Year}       # 年份
{audio:Genre}      # 流派
{video:Duration}   # 视频时长
{video:Resolution} # 分辨率
```

### 自定义元数据

添加自己的元数据字段：

1. 菜单 → **元数据** → **编辑自定义字段**
2. 添加字段名和值
3. 在规则中使用 `{custom:fieldname}`

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

- 📖 [API 文档](https://github.com/hetianhe2024/renomee/wiki/API)
- 🔌 [插件开发指南](https://github.com/hetianhe2024/renomee/wiki/Plugin-Development)
- 💬 [社区论坛](https://github.com/hetianhe2024/renomee/discussions)
- 🐛 [问题反馈](https://github.com/hetianhe2024/renomee/issues)

---

**探索更多功能，让文件管理更高效！** 🚀
