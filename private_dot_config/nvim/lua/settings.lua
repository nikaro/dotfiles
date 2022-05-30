local set = vim.opt

set.completeopt = 'menuone,noselect'                       -- enable completion
set.hidden = true                                          -- enabled unsaved buffers in background
set.ignorecase = true                                      -- ignore capital letters during search
set.laststatus= 3                                          -- global statusline
set.listchars= 'eol:↵,trail:~,tab:> ,nbsp:␣'               -- customize characters in list mode
set.number = true                                          -- enable line numbers
set.relativenumber = true                                  -- use relative line numbers
set.scrolloff = 6                                          -- context around cursor vertical position
set.showmode = false                                       -- disable mode in cmdline
set.showtabline = 2                                        -- enable tabline
set.sidescrolloff = 6                                      -- context around cursor horizontal position
set.smartcase = true                                       -- override ignorecase option if searching capital letters
set.smartindent = true                                     -- enable smart indentation
set.splitbelow = true                                      -- put new windows below current
set.splitright = true                                      -- put new windows right of current
set.statusline = ''                                        -- reset status line
set.statusline:append('%#error#%{&paste?"[PASTE]":""}%*')  -- show if paste mode is enabled
set.statusline:append(' %{toupper(mode())}')               -- show current mode
set.statusline:append(' %F')                               -- show full file path
set.statusline:append(' %r')                               -- show read-only flag
set.statusline:append('%=')                                -- divider to separate left from right
set.statusline:append(' %y')                               -- show file type
set.statusline:append(' %c:%l')                            -- show file type
set.statusline:append(' (%p%%)')                           -- show percentage through file in lines
set.undofile = true                                        -- enable undofile
set.wrap = false                                           -- do not wrap lines
set.wildmode='longest,full'                                -- complete till longest common string, then start wildmenu

vim.cmd('colorscheme peachpuff')                           -- set custom colorscheme
