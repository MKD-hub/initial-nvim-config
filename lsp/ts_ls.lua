return {
  cmd = { "ts_ls" },
  filetypes = { "tsx", "ts" },
  on_attach = function(client, _) client.server_capabilities.documentFormattingProvider = false end,
  capabilities = {
    textDocument = {
      formatting = false,
    },
  },
}
