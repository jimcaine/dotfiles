local transparent_active = false

function TransparentToggle()
  if transparent_active then
    local active_color_scheme = vim.g.colors_name
    vim.cmd.colorscheme(active_color_scheme)
  else
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
  end

  transparent_active = not transparent_active
end

return {
  "folke/tokyonight.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
  keys = {
    { "<leader>ut", TransparentToggle, desc = "Toggle transparent background" }
  },
}
