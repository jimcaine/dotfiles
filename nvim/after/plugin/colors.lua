-- require('github-theme').setup({
--     transparent = true,
-- })


function _getThemes()
  colors = {
    "sonokai",
    "OceanicNext",
    "github_dark",
    "gotham",
    "welpe",
    "material",
  }

  return colors
end


function _getStartupThemes()
  colors = {
    "gotham",
    "welpe",
    "material",
    "OceanicNext",
  }

  return colors
end


function _getRandomColorScheme(colors)
  return colors[math.random(#colors)]
end


local transparent_toggle = false


function ToggleBackgroundTransparent()
  if transparent_toggle then
      local active_color_scheme = vim.g.colors_name
      vim.cmd.colorscheme(active_color_scheme)
  else
      vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
  end

  transparent_toggle = not transparent_toggle
end


function _random_set_transparent()
  if math.random() > 0.5 then
    ToggleBackgroundTransparent()
  end
end


function InitColorScheme()
  local startup_schemes = _getStartupThemes()
  local startup_scheme = _getRandomColorScheme(startup_schemes)
  print("Initializing color scheme: " .. startup_scheme)
  vim.cmd.colorscheme(startup_scheme)
  _random_set_transparent()
end


function SetRandomColorScheme()
  local color_schemes = _getThemes()
  local color_scheme = _getRandomColorScheme(color_schemes)
  print("Setting color scheme: " .. color_scheme)
  vim.cmd.colorscheme(color_scheme)
  _random_set_transparent()
end


vim.keymap.set("n", "<leader>cc", ":lua SetRandomColorScheme()<CR>")
vim.keymap.set("n", "<leader>ct", ":lua ToggleBackgroundTransparent()<CR>")

InitColorScheme()
