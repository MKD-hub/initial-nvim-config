local plugin_data = require "lsp.vue_ts_plugin"
local vue_language_server_path = vim.fn.expand "$MASON/packages"
  .. "/vue-language-server"
  .. "/node_modules/@vue/language-server"

local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

return {
  cmd = { "ts_ls" },
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
  on_attach = function(client, bufnr)
    vim.notify(
      ("ts_ls.on_attach fired for buf %d (name=%s)"):format(bufnr, vim.api.nvim_buf_get_name(bufnr)),
      vim.log.levels.INFO
    )
    client.server_capabilities.documentFormattingProvider = false
    local existing_capabilities = client.server_capabilities
    if vim.bo.filetype == "vue" then
      existing_capabilities.semanticTokensProvider.full = false
    else
      existing_capabilities.semanticTokensProvider.full = true
    end
  end,
  settings = {},
  capabilities = {
    offset_encoding = "utf-16",
    textDocument = {
      formatting = false,
    },
  },
}
