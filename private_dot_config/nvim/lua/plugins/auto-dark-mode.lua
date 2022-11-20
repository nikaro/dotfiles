-- auto-dark-mode plugin configuration

require('auto-dark-mode').setup {
  set_dark_mode = function()
    vim.opt.background = 'dark'
    vim.cmd('colorscheme habamax')
  end,
  set_light_mode = function()
    vim.opt.background = 'light'
    vim.cmd('colorscheme shine')
  end,
}

require('auto-dark-mode').init()
