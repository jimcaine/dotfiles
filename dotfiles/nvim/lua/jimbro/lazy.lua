local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "jimbro.plugins.colorizer" },
  { import = "jimbro.plugins.colors" },
  { import = "jimbro.plugins.commentary" },
  { import = "jimbro.plugins.copilot" },
  { import = "jimbro.plugins.dressing" },
  { import = "jimbro.plugins.harpoon" },
  { import = "jimbro.plugins.lsp" },
  { import = "jimbro.plugins.lualine" },
  { import = "jimbro.plugins.markdown" },
  { import = "jimbro.plugins.noice" },
  { import = "jimbro.plugins.notify" },
  { import = "jimbro.plugins.nvim-cmp" },
  { import = "jimbro.plugins.nvim-tree" },
  { import = "jimbro.plugins.pencil" },
  { import = "jimbro.plugins.startify" },
  { import = "jimbro.plugins.telescope" },
  { import = "jimbro.plugins.treesitter" },
  { import = "jimbro.plugins.twilight" },
  { import = "jimbro.plugins.zen" },
})
