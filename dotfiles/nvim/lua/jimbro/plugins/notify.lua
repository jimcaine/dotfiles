return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    background_colour = "#000000",
    timeout = 500,
  },
  keys = {
    { "<leader>no", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", { desc = "Notifications" }},
  },
}
