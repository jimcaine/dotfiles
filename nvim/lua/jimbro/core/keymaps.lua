vim.g.mapleader = " "

-- esc maps
vim.keymap.set("i", "jk", "<Esc>", { desc = "Esc map in insert mode"} )
vim.keymap.set("i", "kj", "<Esc>", { desc = "Esc map in insert mode"} )

-- window nav
vim.keymap.set("n", "<leader>j", "<C-w><C-j>")
vim.keymap.set("n", "<leader>k", "<C-w><C-k>")
vim.keymap.set("n", "<leader>h", "<C-w><C-h>")
vim.keymap.set("n", "<leader>l", "<C-w><C-l>")

-- netrw
vim.keymap.set("n", "<leader>ee", "<cmd>Ex<cr>", { desc = "Netrw file nav" } )
vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown preview" } )
