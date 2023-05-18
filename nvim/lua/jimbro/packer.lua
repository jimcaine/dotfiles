return require('packer').startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  -- navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('theprimeagen/harpoon')
  use 'nvim-tree/nvim-web-devicons'
  use('nvim-tree/nvim-tree.lua')

  use('natecraddock/workspaces.nvim')

  -- dashboard / startup screen
  use('mhinz/vim-startify')

  -- style
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('xiyaowong/transparent.nvim')
  use('mhartington/oceanic-next')
  use('tstelzer/welpe.vim')
  use('whatyouhide/vim-gotham')
  use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use('sainnhe/sonokai')
  use('marko-cerovac/material.nvim')
  use('folke/tokyonight.nvim')

  -- motions / macros
  use('tpope/vim-commentary')
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  -- project find / sed
  use({
    "ray-x/sad.nvim",
    requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    config = function()
      require("sad").setup{}
    end,
  })

  -- navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('theprimeagen/harpoon')
  use 'nvim-tree/nvim-web-devicons'
  use('nvim-tree/nvim-tree.lua')

  -- repl
  use('jpalardy/vim-slime')

  -- treesitter / syntax highlighting
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('p00f/nvim-ts-rainbow')

  -- formatters
  use('jose-elias-alvarez/null-ls.nvim')

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  use('github/copilot.vim')

end)
