return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufRead", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "query",
        "python",
        "toml",
        "typescript",
        "yaml",
      },
      auto_install = true,
    })
  end,
}
