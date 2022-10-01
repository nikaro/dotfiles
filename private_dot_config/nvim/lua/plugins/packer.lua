-- packer plugin configuration

-- ensure installation at launch
local ensure_packer = function()
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- install plugins
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

  -- parse devcontainer file
  if vim.fn.filereadable('.devcontainer/devcontainer.json') == 1 and vim.fn.filereadable('/.dockerenv') == 1 then
    local devcontainer = vim.fn.json_decode(vim.fn.readfile('.devcontainer/devcontainer.json'))
    local customs = devcontainer.customizations or {}
    local devc_customs = customs.devc or {}
    local devc_extensions = devc_customs.extensions or {}
    local devc_settings = devc_customs.settings or {}

    -- load plugins
    for _, devc_plugin in ipairs(devc_extensions) do
      use(devc_plugin)
    end

    -- load settings
    for k, v in pairs(devc_settings) do
      if k == 'vimscript' then
        -- vimscript
        for _, script in ipairs(v) do
          vim.cmd(script)
        end
      elseif k == 'lua' then
        -- lua
        for _, script in ipairs(v) do
          vim.cmd('lua' .. script)
        end
      end
    end
  end

  -- install plugins after bootstraping
  if packer_bootstrap then
    require('packer').sync()
  end

end)
