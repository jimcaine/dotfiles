local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>es", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>ess", mark.add_file)
