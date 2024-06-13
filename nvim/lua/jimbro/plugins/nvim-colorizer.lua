return {
  "norcalli/nvim-colorizer.lua",
  event = "BufRead",
  config = function()
    require("colorizer").setup()
  end,
  ft = {
    "html",
    "css",
    "sass",
    "scss",
    "vim",
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "lua",
    "json",
    "yaml",
    "toml",
    "md",
    "conf",
  },
}
