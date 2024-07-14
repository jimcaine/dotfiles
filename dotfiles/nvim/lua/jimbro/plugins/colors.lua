return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme nightfox]])

    require("jimbro.custom.nvim-transparent").toggle()
  end,
}
