local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua", lsp_format = "fallback" },
    -- python = { "isort", "blue" },
    python = { "ruff", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    vue = { "prettierd", "prettier", stop_after_first = true },
    json = { "jq", lsp_format = "fallback" },
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    yaml = { "yamlfmt", "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    c = { "clang-format", lsp_format = "fallback" },
    cpp = { "clang-format", lsp_format = "fallback" },
    sh = { "beautysh", lsp_format = "fallback" },
    zsh = { "beautysh", lsp_format = "fallback" },
    bash = { "beautysh", lsp_format = "fallback" },
    -- graphql = { { "prettierd", "prettier" } },
    -- svelte = { { "prettierd", "prettier" } },
    -- kotlin = {  "ktlint" } ,
    -- dart = { { "dartfmt" } },
    xml = { "xmlformatter", lsp_format = "fallback" },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      async = false,
    }
  end,
})

vim.keymap.set({ "n", "v" }, "gq", function()
  conform.format({
    timeout_ms = 500,
    async = false,
  })
end, { desc = "[C]ode [F]ormat" })
