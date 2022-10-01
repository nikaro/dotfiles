-- lspconfig plugin configuration

vim.diagnostic.config {
  -- disable inline diagnostic message
  virtual_text = false
}

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings
  local bufopts = {silent=true, buffer=bufnr}
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>=',function() vim.lsp.buf.formatting { async = true } end, bufopts)
  vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>R', vim.lsp.buf.rename, {silent=true})
end

-- Ansible
require('lspconfig').ansiblels.setup {
  on_attach = on_attach,
}

-- Bash
require('lspconfig').bashls.setup {
  on_attach = on_attach,
}

-- Golang
require('lspconfig').gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unusedvariable = true,
      },
      staticcheck = true,
    },
  },
}
require('lspconfig').golangci_lint_ls.setup {
  on_attach = on_attach,
}

-- Lua
require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
}

-- Python
require('lspconfig').pylsp.setup {
  on_attach = on_attach,
}
require('lspconfig').pyright.setup {
  on_attach = on_attach,
}

-- Ruby
require('lspconfig').solargraph.setup{
  on_attach = on_attach,
}

-- Terraform
require('lspconfig').terraformls.setup {
  on_attach = on_attach,
}

-- YAML
require('lspconfig').yamlls.setup {
  on_attach = on_attach,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      validate = true,
      format = {
        enable = true,
      },
    },
  },
}
