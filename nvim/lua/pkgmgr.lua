--
-- lua nvim pkgmgr
--
-- https://github.com/rockerBOO/awesome-neovim
--

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()

  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'yamatsum/nvim-cursorline' -- Highlight words and lines on the cursor
  -- highlight and search for todo comments
  use { "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  }

  --
  -- UI to select things (files, grep results, open buffers...)
  --

  use 'nvim-lua/popup.nvim' -- Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- All the lua functions.
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    }
  }
  use { 'sudormrfbin/cheatsheet.nvim',
    requires = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    }
  }

  --  EasyMotion-like plugin allowing you to jump anywhere in a document.
  use { 'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'kabouzeid/nvim-lspinstall' -- Automatically install lsp.
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'SirVer/ultisnips' -- Snippets plugin
  use 'honza/vim-snippets' -- Snippets collection



  --
  -- Appearance
  --

  use 'norcalli/nvim-colorizer.lua' -- Color highlighter
  use 'kyazdani42/nvim-web-devicons' -- Fork of vim-devicons

  -- Themes
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'shaunsingh/nord.nvim' -- Nord theme

  -- Statusline
  use { 'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  --
  -- Languages
  --
  use {"ellisonleao/glow.nvim", run = "GlowInstall"} -- Markdown preview

end)

