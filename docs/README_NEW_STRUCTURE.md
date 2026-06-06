# 新目录结构说明

## ✅ 已完成

### 1. 目录结构创建

**中文版**（`docs/`）：
```
docs/
├── file-types/          # 文件类型专题
│   ├── pdf/
│   ├── images/
│   ├── documents/
│   ├── audio/
│   └── video/
├── use-cases/           # 使用场景
│   ├── downloads/
│   ├── research/
│   ├── business/
│   └── media/
├── how-to/              # 操作指南（How-to 文章）
└── alternatives/        # 竞品对比
```

**英文版**（`docs/en/`）：
```
docs/en/
├── file-types/          # File Types
│   ├── pdf/
│   ├── images/
│   ├── documents/
│   ├── audio/
│   └── video/
├── use-cases/           # Use Cases
│   ├── downloads/
│   ├── research/
│   ├── business/
│   └── media/
├── how-to/              # How-To Guides
└── alternatives/        # Alternatives
```

### 2. 文档创建

- ✅ `SEO_CONTENT_PLAN.md` - 完整的 SEO 内容规划文档
- ✅ `docs/.templates/how-to-template.md` - 中文模板
- ✅ `docs/en/.templates/how-to-template.md` - 英文模板
- ✅ `mkdocs.yml.new` - 更新后的导航配置（参考）

---

## ⏳ 待完成

### 1. 创建索引页面（Index Pages）

每个目录需要一个 `index.md` 作为导览页：

#### 优先级 🔥🔥🔥
- [ ] `file-types/index.md` - 文件类型总览
- [ ] `use-cases/index.md` - 使用场景总览
- [ ] `how-to/index.md` - 操作指南总览
- [ ] `alternatives/index.md` - 替代方案总览

#### 子目录索引
- [ ] `file-types/pdf/index.md`
- [ ] `file-types/images/index.md`
- [ ] `file-types/documents/index.md`
- [ ] `file-types/audio/index.md`
- [ ] `file-types/video/index.md`
- [ ] `use-cases/downloads/index.md`
- [ ] `use-cases/research/index.md`
- [ ] `use-cases/business/index.md`
- [ ] `use-cases/media/index.md`

**英文版同理**（`en/` 目录下）

---

### 2. 更新 mkdocs.yml

**方式一**（推荐）：
```bash
# 备份当前配置
cp mkdocs.yml mkdocs.yml.backup

# 使用新配置
cp mkdocs.yml.new mkdocs.yml
```

**方式二**（手动）：
在现有 `mkdocs.yml` 的 `nav:` 部分添加新的导航结构。

参考 `mkdocs.yml.new` 文件。

---

### 3. 选择并创建前 5 篇测试文章

根据 `SEO_CONTENT_PLAN.md` 中的建议，优先创建：

1. **How to Rename PDF Files by Title**
   - 中文：`how-to/rename-pdf-files.md`
   - 英文：`en/how-to/rename-pdf-files.md`

2. **Organize Downloads Folder**
   - 中文：`use-cases/downloads/organize-downloads.md`
   - 英文：`en/use-cases/downloads/organize-downloads.md`

3. **Rename Screenshots Automatically**
   - 中文：`use-cases/media/rename-screenshots.md`
   - 英文：`en/use-cases/media/rename-screenshots.md`

4. **Organize Research Papers**
   - 中文：`use-cases/research/organize-papers.md`
   - 英文：`en/use-cases/research/organize-papers.md`

5. **PowerRename Alternative**
   - 中文：`alternatives/powerrename-alternative.md`
   - 英文：`en/alternatives/powerrename-alternative.md`

---

## 📝 下一步操作建议

### 立即执行
1. **确认题目**：从 Top 20 清单中选择前 5 个开始
2. **创建索引页**：先建立骨架（各目录的 index.md）
3. **更新导航**：应用新的 mkdocs.yml 配置

### 本周内
4. **撰写第一篇**：使用模板写第一篇测试文章
5. **本地预览**：`mkdocs serve` 检查效果
6. **部署测试**：确保 ReadTheDocs 构建成功

### 2-4 周
7. **完成 5 篇测试文章**
8. **配置 SEO meta**（title, description）
9. **建立内链网络**

---

## 🔧 快速命令

### 本地预览
```bash
cd d:\renomee-readthedocs\renomee
mkdocs serve
```

### 构建静态站
```bash
mkdocs build
```

### 验证配置
```bash
mkdocs build --strict
```

---

## 📊 文件清单

### 已创建的文件
```
d:\renomee-readthedocs\renomee\
├── docs\
│   ├── SEO_CONTENT_PLAN.md              ← 总体规划文档
│   ├── README_NEW_STRUCTURE.md          ← 本文件
│   ├── .templates\
│   │   └── how-to-template.md           ← 中文模板
│   ├── file-types\                      ← 新目录
│   ├── use-cases\                       ← 新目录
│   ├── how-to\                          ← 新目录
│   ├── alternatives\                    ← 新目录
│   └── en\
│       ├── .templates\
│       │   └── how-to-template.md       ← 英文模板
│       ├── file-types\                  ← 新目录
│       ├── use-cases\                   ← 新目录
│       ├── how-to\                      ← 新目录
│       └── alternatives\                ← 新目录
└── mkdocs.yml.new                       ← 新导航配置
```

---

## ❓ 决策点

**现在需要你确认**：

1. **题目选择**：是否使用建议的前 5 篇？还是要调整？
2. **导航结构**：是否采用 `mkdocs.yml.new` 的结构？
3. **内容深度**：1000-2000 字是否合适？
4. **截图需求**：是否需要准备截图素材？

---

**准备好了就告诉我，我可以帮你：**
- ✍️ 创建所有索引页
- 📝 撰写第一批测试文章
- 🔧 更新 mkdocs.yml
- 🚀 优化 SEO meta

---

*最后更新：2026-06-06*
