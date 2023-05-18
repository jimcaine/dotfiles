local colorschemes = {
    "sonokai",
    "OceanicNext",
    "github_dark",
    "gotham",
    "welpe",
    "material",
  }

function _getRandomColorScheme(colorschemes)
  return colorschemes[math.random(#colorschemes)]
end


function SetRandomColorScheme()
  local colorscheme = _getRandomColorScheme(colorschemes)
  print("Setting color scheme: " .. colorscheme)
  vim.cmd.colorscheme(colorscheme)
end


vim.keymap.set("n", "<leader>cc", ":lua SetRandomColorScheme()<CR>")
vim.keymap.set("n", "<leader>cv", ":TransparentToggle<CR>")

SetRandomColorScheme()
vim.cmd(":TransparentEnable")
