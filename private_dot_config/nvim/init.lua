-- neovim configuration

require('settings')
require('plugins/packer')
require('plugins/mason')  -- need to be loaded before lspconfig
require('plugins/lastplace')
require('plugins/lspconfig')
require('plugins/treesitter')
require('plugins/surround')
require('mappings')
