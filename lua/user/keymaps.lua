--local keymap = require("keymapper").mapvimkey
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("t", "<C-h>", "wincmd h", opts) -- Navigate Left
-- keymap("t","<C-j>", "wincmd j", opts) -- Navigate Down
-- keymap("t","<C-k>", "wincmd k", opts) -- Navigate Up
-- keymap("t","<C-l>", "wincmd l", opts) -- Navigate Right
-- keymap("n", "<C-h>", "TmuxNavigateLeft", opts) -- Navigate Left
-- keymap("n","<C-j>", "TmuxNavigateDown", opts) -- Navigate Down
-- keymap("n","<C-k>", "TmuxNavigateUp", opts) -- Navigate Up
-- keymap("n","<C-l>", "TmuxNavigateRight", opts) -- Navigate Right
keymap(opts, "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

keymap("n", "<leader>q", "<cmd>confirm q<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- Directory Navigatio}
vim.keymap.set("n", "<leader>m", ":Neotree focus<CR>", opts)
vim.keymap.set("n", "<leader>c", ":Neotree close<CR>", opts)
vim.keymap.set("n", "<leader>nn", ":w <cr>", opts)

local api = vim.api

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Window Management
keymap("n", "<leader>sv", "<cmd>vsplit <CR>", opts) -- Split Vertically
keymap("n", "<leader>sh", "<cmd>split <CR>", opts) -- Split Horizontally
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize -2<CR>", opts)

-- set file type
keymap("n", "<leader>pp", ":set filetype=php <CR>", opts)
keymap("n", "<leader>hh", ":set filetype=html <CR>", opts)
