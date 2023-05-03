
tree = require("nvim-tree")
tree.setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>et", vim.cmd.NvimTreeToggle)

