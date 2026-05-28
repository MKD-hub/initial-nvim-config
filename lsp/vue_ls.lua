local lspconfig = vim.lspconfig
local plugin_data = require "lsp.vue_ts_plugin"
local unpack = table.unpack or unpack

local function ensure_ts_client(bufnr)
  local clients = vim.lsp.get_clients { bufnr = bufnr, name = "ts_ls" }
  local vtsls_clients = vim.lsp.get_clients { bufnr = bufnr, name = "vtsls" }
  if #clients == 0 then
    lspconfig.ts_ls.manager.try_add(bufnr)
    clients = vim.lsp.get_clients { bufnr = bufnr, name = "ts_ls" }
  end
  return clients
end

return {
  cmd = { "vls" },
  filetypes = { "vue" },
  settings = {
    tsserver = {
      pluginPaths = {
        plugin_data.vue_plugin.location,
      },
    },
  },
  -- Offset encoding must match the server's expectation (Vue Language Server speaks utf-16)
  capabilities = {
    offset_encoding = "utf-16",
  },
  on_attach = function(client, bufnr)
    vim.notify(
      ("vue_ls.on_attach fired for buf %d (name=%s)"):format(bufnr, vim.api.nvim_buf_get_name(bufnr)),
      vim.log.levels.INFO
    )
    client.server_capabilities.documentFormattingProvider = false
  end,
  on_init = function(client, bufnr)
    client.handlers["tsserver/request"] = function(_, result, context)
      local ts_clients = ensure_ts_client(context.bufnr)
      if #ts_clients == 0 then
        vim.notify("Could not find ts_ls client, vue_ls requests cannot be forwarded", vim.log.levels.WARN)
        return
      end

      local params = result and result[1]
      if not params then return end

      local id, command, payload = unpack(params)
      if not command then return end

      ts_clients[1]:exec_cmd({
        title = "vue_request_forward",
        command = "typescript.tsserverRequest",
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, res)
        local response = res and res.body
        local response_data = { { id, response } }
        client:notify("tsserver/response", response_data)
      end)
    end
  end,
}
