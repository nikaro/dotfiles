-- helm filetype detection

vim.filetype.add({
  pattern = {
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    ["helmfiles.*%.ya?ml"] = "helm",
  },
})
