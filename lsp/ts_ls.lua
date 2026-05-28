local plugin_data = require "lsp.vue_ts_plugin"

return {
  cmd = { "ts_ls" },
  filetypes = { "ts", "typescript", "javascript", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      plugin_data.vue_plugin,
    },
  },
  on_attach = function(client, bufnr)
    vim.notify(
      ("ts_ls.on_attach fired for buf %d (name=%s)"):format(bufnr, vim.api.nvim_buf_get_name(bufnr)),
      vim.log.levels.INFO
    )
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {},
  capabilities = {
    offset_encoding = "utf-16",
    textDocument = {
      formatting = false,
    },
  },
}
