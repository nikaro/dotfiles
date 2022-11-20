-- neovim settings

vim.g.do_filetype_lua = 1                                      -- enable lua filetypes detection
vim.opt.completeopt = 'menuone,noselect'                       -- enable completion
vim.opt.hidden = true                                          -- enabled unsaved buffers in background
vim.opt.ignorecase = true                                      -- ignore capital letters during search
vim.opt.listchars= 'eol:↵,trail:~,tab:> ,nbsp:␣'               -- customize characters in list mode
vim.opt.number = true                                          -- enable line numbers
vim.opt.relativenumber = true                                  -- use relative line numbers
vim.opt.scrolloff = 6                                          -- context around cursor vertical position
vim.opt.showmode = false                                       -- disable mode in cmdline
vim.opt.showtabline = 2                                        -- enable tabline
vim.opt.sidescrolloff = 6                                      -- context around cursor horizontal position
vim.opt.smartcase = true                                       -- override ignorecase option if searching capital letters
vim.opt.smartindent = true                                     -- enable smart indentation
vim.opt.splitbelow = true                                      -- put new windows below current
vim.opt.splitright = true                                      -- put new windows right of current
vim.opt.statusline = ''                                        -- reset status line
vim.opt.statusline:append('%#error#%{&paste?"[PASTE]":""}%*')  -- show if paste mode is enabled
vim.opt.statusline:append(' %{toupper(mode())}')               -- show current mode
vim.opt.statusline:append(' %F')                               -- show full file path
vim.opt.statusline:append(' %r')                               -- show read-only flag
vim.opt.statusline:append('%=')                                -- divider to separate left from right
vim.opt.statusline:append(' %y')                               -- show file type
vim.opt.statusline:append(' %c:%l')                            -- show file type
vim.opt.statusline:append(' (%p%%)')                           -- show percentage through file in lines
vim.opt.undofile = true                                        -- enable undofile
vim.opt.wrap = false                                           -- do not wrap lines
vim.opt.wildmode='longest,full'                                -- complete till longest common string, then start wildmenu
