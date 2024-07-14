return {
  "ThePrimeagen/harpoon",
  lazy = false,
  config = true,
  keys = {
    { "<leader>em", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
    { "<leader>en", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Navigate to next harpoon mark" },
    { "<leader>ep", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Navigate to previous harpoon mark" },
    { "<leader>eh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle harpoon menu" },
  },
  wants = { "plenary.nvim" },
}
