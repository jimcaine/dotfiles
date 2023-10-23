return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    messages = { enabled = false },
  },
  config = function()
    local notify = require("notify")

    notify.setup({ background_colour = "#000000" })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
