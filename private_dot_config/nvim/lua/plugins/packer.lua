-- packer plugin configuration

return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Easily install and manage LSP servers, DAP servers, linters, and formatters
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- Interface for tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- EditorConfig helps maintain consistent coding styles
  use 'editorconfig/editorconfig-vim'

  -- Telescope is a highly extendable fuzzy finder over lists
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- Remember last cursor position
  use 'ethanholz/nvim-lastplace'

  -- Manipulate surrounding delimiter pairs
  use 'kylechui/nvim-surround'

end)
