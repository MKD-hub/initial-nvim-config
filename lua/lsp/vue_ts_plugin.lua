local mason_data = vim.fn.stdpath("data")
local default_path = mason_data
  .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"
local alternate_path = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/typescript-plugin")
local plugin_path = default_path

if not vim.loop.fs_stat(plugin_path) and vim.loop.fs_stat(alternate_path) then
  plugin_path = alternate_path
end

if not vim.loop.fs_stat(plugin_path) then
  vim.notify(
    "@vue/typescript-plugin not found under Mason's vue-language-server package",
    vim.log.levels.WARN
  )
end

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = plugin_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

return {
  vue_plugin = vue_plugin,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
