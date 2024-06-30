local formatters = {
  lua = { "stylua" },
  python = { "autopep8" },
  cpp = { "clang_format" },
  java = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  yaml = { "yamlfmt" },
  dart = { "blink" },
}

local prettier_ft = {
  "css",
  "flow",
  "graphql",
  "html",
  "json",
  "javascriptreact",
  "javascript",
  "less",
  "markdown",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
}

for _, filetype in pairs(prettier_ft) do
  formatters[filetype] = { "prettier" }
end

return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "User FilePost",
  config = function()
    require("conform").setup({
    formatters_by_ft = formatters,
    formatters = {
      blink = {
        command = "/Users/th3g3ntl3man/.opt/blink/target/release/blink",
        args = { "$FILENAME" },
        stdin = false,
        cwd = require("conform.util").root_file({ ".editorconfig", "pubspec.yaml" }),
      },
    },
    })
  end,
}
