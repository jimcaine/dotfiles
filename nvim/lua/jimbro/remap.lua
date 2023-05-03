-- leader
vim.g.mapleader = " "

-- esc mappings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- netrw
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- window navigation
vim.keymap.set("n", "<leader>xx", "<C-w><C-j>")
vim.keymap.set("n", "<leader>cc", "<C-w><C-k>")
vim.keymap.set("n", "<leader>zz", "<C-w><C-h>")
vim.keymap.set("n", "<leader>vv", "<C-w><C-l>")

-- buffers
vim.keymap.set("n", "<leader>bd", ":bufdo bd<CR>")
vim.keymap.set("n", "<leader>bdd", ":bufdo bd!<CR>")

-- write / quit
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>ww", ":wq!<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>qq", ":q!<CR>")

-- macros
vim.fn.setreg("t", "SELECT * FROM MY.TABLE WHERE CHR_CD = 8000")

