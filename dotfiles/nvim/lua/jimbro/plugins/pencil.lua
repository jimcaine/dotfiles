return {
  "preservim/vim-pencil",
  init = function()
    vim.g["pencil#textwidth"] = 80
    vim.g["pencil#wrapModeDefault"] = "soft"
    vim.g["pencil#autoformat"] = 1
    vim.g["pencil#spell"] = 0
    vim.g["pencil#mode"] = "markdown"
    vim.g["pencil#keymap"] = "markdown"
  end,
}
