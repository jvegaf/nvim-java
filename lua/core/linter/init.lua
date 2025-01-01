local lint = require("lint")

lint.linters_by_ft = {
  -- python = { "pylint" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  -- markdown = { "markdownlint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  zsh = { "shellcheck" },
  -- lua = { "luacheck" },
  c = { "clang_tidy" },
  cpp = { "clang_tidy" },
}

-- local lint_augroup = vim.api.nvim_create_autocmd("lint", { clear = true })
-- local lint_augroup = vim.api.nvim_create_autocmd("lint", { clear = false })
-- local lint_augroup = vim.api.nvim_create_autocmd("lint", {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  -- group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>bl", function()
  lint.try_lint()
end, { desc = "Buffer lint" })
