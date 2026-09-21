return {
  cmd = { "gopls" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach = function(client, bufnr)
    vim.keymap.set(
      "n",
      "<leader>h",
      function()
        vim.lsp.buf.hover {
          border = "rounded",
          max_width = 80,
        }
      end,
      {
        buffer = bufnr,
        desc = "LSP: Hover documentation",
      }
    )

    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end,
}
