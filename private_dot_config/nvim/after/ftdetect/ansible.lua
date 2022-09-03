-- ansible filetype detection

vim.filetype.add({
  pattern = {
    ["defaults/.*%.ya?ml"] = "yaml.ansible",
    ["group_vars/.*%.ya?ml"] = "yaml.ansible",
    ["handlers/.*%.ya?ml"] = "yaml.ansible",
    ["host_vars/.*%.ya?ml"] = "yaml.ansible",
    ["plays/.*%.ya?ml"] = "yaml.ansible",
    ["playbooks/.*%.ya?ml"] = "yaml.ansible",
    ["tasks/.*%.ya?ml"] = "yaml.ansible",
    ["vars/.*%.ya?ml"] = "yaml.ansible",
  },
})
