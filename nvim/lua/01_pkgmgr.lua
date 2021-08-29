--
-- pkgmgr
--
-- pkg manager
--
-- https://github.com/rockerBOO/awesome-neovim
--

-- install
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- config
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- packages
local use = require('packer').use
require('packer').startup(function()
  -- pkg manager
  use 'wbthomason/packer.nvim'              -- Package manager
  -- appearance
  use 'norcalli/nvim-colorizer.lua'         -- Color highlighter
  use 'kyazdani42/nvim-web-devicons'        -- Fork of vim-devicons
  use 'joshdick/onedark.vim'                -- Theme inspired by Atom
  use 'shaunsingh/nord.nvim'                -- Nord theme
  -- git
  use 'tpope/vim-fugitive'                  -- Git commands in nvim
  use 'tpope/vim-rhubarb'                   -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim',          -- Add git info in the signs columns and popups
    requires = { 'nvim-lua/plenary.nvim' }
  }
  -- tags
  use 'ludovicchabant/vim-gutentags'        -- Automatic tags management
  -- todo
    use { "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  }
  -- search
  use 'nvim-lua/popup.nvim'                 -- Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim'               -- All the lua functions.
  use { 'nvim-telescope/telescope.nvim',    -- UI to select things
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
  -- code
  use 'nvim-treesitter/nvim-treesitter'     -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- lsp
  use 'neovim/nvim-lspconfig'               -- LSP client
  use 'kabouzeid/nvim-lspinstall'           -- Automatically install lsp.
  use 'hrsh7th/nvim-cmp'                    -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'                -- Source for LSP
  use 'saadparwaiz1/cmp_luasnip'            -- Source for lua snippets
  use 'hrsh7th/cmp-buffer'                  -- Source for buffers
  use 'hrsh7th/cmp-path'                    -- Source for path
  use 'quangnguyen30192/cmp-nvim-ultisnips' -- Source for ultisnips
  use 'quangnguyen30192/cmp-nvim-tags'      -- Source for tags
  -- snippet
  use 'L3MON4D3/LuaSnip'                    -- Lua snippets
  use 'SirVer/ultisnips'                    -- Snippets tools
  use 'honza/vim-snippets'                  -- Snippets collection
  -- Languages
  use {"ellisonleao/glow.nvim", run = "GlowInstall"} -- Markdown preview
  -- visual tools
  use 'cappyzawa/trim.nvim'                 -- Trailing spaces
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'tpope/vim-commentary'                -- "gc" to comment visual regions/lines
  use 'yamatsum/nvim-cursorline'            -- Highlight words and lines on the cursor
  use { 'phaazon/hop.nvim',                 -- EasyMotion
    as = 'hop',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- Statusline
  use { 'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true }
  }

end)
