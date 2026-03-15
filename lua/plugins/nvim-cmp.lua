return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },

  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    cmp.setup {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
      mapping = cmp.mapping.preset.insert {
        -- A stands for the "alt" key - for navigating up and down on the autocompletion
        ["<A-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<A-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<A-b>"] = cmp.mapping.scroll_docs(-4),
        ["<A-f>"] = cmp.mapping.scroll_docs(4),
        ["<A-c>"] = cmp.mapping.complete(),
        ["<A-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
      },
    }
  end,
}
