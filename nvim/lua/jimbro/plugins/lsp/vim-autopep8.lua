return {
  "tell-k/vim-autopep8",
  config = function()
    vim.g.autopep8_disable_show_diff = 1
    vim.keymap.set("n", "<leader>fm", "<cmd>Autopep8<cr>", { noremap = true })
  end,
}
