local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
-- opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.backspace = "indent,eol,start"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.splitbelow = true
opt.autochdir = false

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- enable true color for terminals
vim.opt.termguicolors = true

vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.cursorline = true -- highlight the current line

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
