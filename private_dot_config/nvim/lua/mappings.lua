-- neovim mappings

vim.keymap.set('n', 'gp', ':bprevious<cr>', {silent=true, desc = 'Go to previous buffer'})
vim.keymap.set('n', 'gn', ':bnext<cr>', {silent=true, desc='Go to next buffer'})
vim.keymap.set('n', 'gl', ':b#<cr>', {silent=true, desc='Go to last buffer'})
vim.keymap.set('n', ';p', ':set paste!<cr>', {silent=true, desc='Toggle paste mode'})
vim.keymap.set('n', '<space>U', ':PackerSync<cr>', {silent=true, desc='Update plugins'})
vim.keymap.set('n', '<space>I', ':PackerInstall<cr>', {silent=true, desc='Install plugins'})
vim.keymap.set('v', '<space>y', '"+y', {desc='Yank to clipboard'})
vim.keymap.set('v', '<space>Y', '"+y', {desc='Yank to clipboard'})
vim.keymap.set('n', '<space>p', '"+p', {desc='Past from clipboard'})
vim.keymap.set('n', '<space>P', '"+P', {desc='Past from clipboard'})
vim.keymap.set('n', '<space>f', ':Telescope find_files<cr>', {silent=true, desc='List files in the current workdir'})
vim.keymap.set('n', '<space>/', ':Telescope live_grep<cr>', {silent=true, desc='Search a string in the current workdir'})
vim.keymap.set('n', '<space>b', ':Telescope buffers<cr>', {silent=true, desc='List buffers'})
vim.keymap.set('n', '<space>h', ':Telescope help_tags<cr>', {silent=true, desc='List help tags'})
vim.keymap.set('n', '<space>g', ':Telescope diagnostics bufnr=0<cr>', {silent=true, desc='List lsp diagnostics in the current buffer'})
vim.keymap.set('n', '<space>G', ':Telescope diagnostics<cr>', {silent=true, desc='List lsp diagnostics in all buffers'})
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {silent=true, desc='Open diagnostic for the error under the cursor'})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {silent=true, desc='Go to previous diagnostic'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {silent=true, desc='Go to next diagnostic'})
vim.keymap.set('n', '<space>M', ':Mason<cr>', {silent=true, desc='Open lsp installer mason'})
vim.keymap.set('n', '*', '*``', {silent=true, noremap=true, desc='Make * stay at the cursor position'})
