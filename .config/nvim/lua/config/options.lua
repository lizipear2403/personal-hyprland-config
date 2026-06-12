-- 行号
vim.opt.number = true        -- 显示绝对行号
vim.opt.relativenumber = true -- 相对行号（便于跳转，如 5j）

-- 缩进：2 空格，无制表符
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true      -- 输入大写时区分大小写

-- 界面
vim.opt.termguicolors = true  -- 启用真彩色
vim.opt.signcolumn = "yes"    -- 始终显示诊断图标列
vim.opt.cursorline = true     -- 高亮当前行
vim.opt.splitright = true     -- 分屏默认在右侧
vim.opt.splitbelow = true     -- 分屏默认在下方

-- 文件
vim.opt.undofile = true       -- 持久化撤销历史
vim.opt.swapfile = false      -- 关闭 swap 文件
vim.opt.clipboard = "unnamedplus"  -- 与系统剪贴板互通

-- 性能
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10        -- 滚动时保留上下文行数

-- 回车键行为
vim.opt.wrap = false          -- 不自动换行
