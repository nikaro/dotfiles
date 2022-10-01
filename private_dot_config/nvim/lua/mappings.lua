-- neovim mappings

-- go to previous buffer
vim.keymap.set('n', 'gp', ':bprevious<cr>', {silent = true})

-- go to next buffer
vim.keymap.set('n', 'gn', ':bnext<cr>', {silent = true})

-- go to last buffer
vim.keymap.set('n', 'gl', ':b#<cr>', {silent=true})

-- toggle paste mode
vim.keymap.set('n', ';p', ':set paste!<cr>', {silent=true})

-- update plugins
vim.keymap.set('n', '<space>U', ':PackerSync<cr>', {silent=true})

-- yank to clipboard
vim.keymap.set('v', '<space>y', '"+y')
vim.keymap.set('v', '<space>Y', '"+y')

-- past from clipboard
vim.keymap.set('n', '<space>p', '"+p')
vim.keymap.set('n', '<space>P', '"+P')

-- list files in the current workdir
vim.keymap.set('n', '<space>f', ':Telescope find_files<cr>', {silent=true})

-- search a string in the current workdir
vim.keymap.set('n', '<space>/', ':Telescope live_grep<cr>', {silent=true})

-- list buffers
vim.keymap.set('n', '<space>b', ':Telescope buffers<cr>', {silent=true})

-- list help tags
vim.keymap.set('n', '<space>h', ':Telescope help_tags<cr>', {silent=true})

-- list lsp diagnostics in the current buffer
vim.keymap.set('n', '<space>g', ':Telescope diagnostics bufnr=0<cr>', {silent=true})

-- list lsp diagnostics in all buffers
vim.keymap.set('n', '<space>G', ':Telescope diagnostics<cr>', {silent=true})

-- open diagnostic for the error under the cursor
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {silent=true})

-- go to previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {silent=true})

-- go to next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {silent=true})

-- open lsp installer mason
vim.keymap.set('n', '<space>M', ':Mason<cr>', {silent=true})

-- make * stay at the cursor position
vim.keymap.set('n', '*', '*``', {silent=true, noremap=true})
