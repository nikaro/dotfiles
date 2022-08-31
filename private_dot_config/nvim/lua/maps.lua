vim.keymap.set('n', 'gb', ':ls<cr>:buffer', {})                         -- list buffers and jump to the given one
vim.keymap.set('n', 'K', ':bprevious<cr>', {silent = true})             -- go to previous buffer
vim.keymap.set('n', 'J', ':bnext<cr>', {silent = true})                 -- go to next buffer
vim.keymap.set('n', ';p', ':set paste!<cr>', {})                        -- toggle paste mode
vim.keymap.set('n', ';d', ':bdelete<cr>', {})                           -- close current buffer
vim.keymap.set('n', ';w', ':write<cr>', {})                             -- write current buffer
vim.keymap.set('n', ';q', ':quit<cr>', {})                              -- quit current window
vim.keymap.set('n', ';o', 'm`o<esc>', {})                               -- insert newline below
vim.keymap.set('n', ';O', 'm`O<esc>', {})                               -- insert newline above
vim.keymap.set('n', ';U', ':PackerSync<cr>', {})                        -- update plugins
vim.keymap.set('v', ';c', '"+y', {})                                    -- copy to system clipboard
vim.keymap.set('v', '*',  'y/\\V<C-R>=escape(@","/\")<cr><cr>')

-- Find files using Telescope
vim.keymap.set('n', ';ff', ':Telescope find_files<cr>', {})
vim.keymap.set('n', ';fg', ':Telescope live_grep<cr>', {})
vim.keymap.set('n', ';fb', ':Telescope buffers<cr>', {})
vim.keymap.set('n', ';fh', ':Telescope help_tags<cr>', {})
