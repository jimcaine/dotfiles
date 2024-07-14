local TransparentToggle = {}
local transparent_active = false


TransparentToggle.toggle = function()
  if transparent_active then
    local active_color_scheme = vim.g.colors_name
    vim.cmd.colorscheme(active_color_scheme)
  else
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NvimTree", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
  end

  transparent_active = not transparent_active
end

vim.api.nvim_set_keymap("n", "<leader>ut", ":lua require('jimbro.custom.nvim-transparent').toggle()<CR>", { noremap = true, silent = true })

return TransparentToggle
