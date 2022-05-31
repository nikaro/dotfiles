if vim.fn.has('nvim-0.7') == 1 then
  map = vim.keymap.set
else
  map = vim.api.nvim_set_keymap
end

map('n', 'gb', ':ls<cr>:buffer', {})                         -- list buffers and jump to the given one
map('n', 'K', ':bprevious<cr>', {silent = true})             -- go to previous buffer
map('n', 'J', ':bnext<cr>', {silent = true})                 -- go to next buffer
map('n', ';p', ':set paste!<cr>', {})                        -- toggle paste mode
map('n', ';d', ':bdelete<cr>', {})                           -- close current buffer
map('n', ';w', ':write<cr>', {})                             -- write current buffer
map('n', ';q', ':quit<cr>', {})                              -- quit current window
map('n', ';o', 'm`o<esc>', {})                               -- insert newline below
map('n', ';O', 'm`O<esc>', {})                               -- insert newline above
map('n', ';U', ':PackerSync<cr>', {})                        -- update plugins
map('' , ';c', '"+y', {})                                    -- copy to system clipboard
map('' , '*',  'y/\\V<C-R>=escape(@","/\")<cr><cr>')

-- Find files using Telescope
map('n', ';ff', ':Telescope find_files<cr>', {})
map('n', ';fg', ':Telescope live_grep<cr>', {})
map('n', ';fb', ':Telescope buffers<cr>', {})
map('n', ';fh', ':Telescope help_tags<cr>', {})
