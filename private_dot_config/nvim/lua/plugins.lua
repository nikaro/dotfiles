return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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

end)
