return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      view = { width = 40 },
      filters = {
        custom = {
          ".DS_Store",
          ".venv",
          "*.egg-info",
          "*.pyc",
          "__pycache__",
          ".pytest_cache",
        },
      },
    })

    vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
  end,
}
