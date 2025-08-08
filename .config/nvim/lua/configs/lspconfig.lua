require("nvchad.configs.lspconfig").defaults()

local servers = {
  "cssls",
  "html",
  "tsserver",
  "vue_language_server", -- Note: 'vue-language-server' in Mason becomes 'vue_language_server' in nvim-lspconfig
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
