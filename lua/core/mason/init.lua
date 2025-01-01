require("mason").setup()
require("mason-lspconfig").setup({
  -- ensure_installed = {
  --   "arduino_language_server",
  --   -- "basedpyright",
  --   "bashls",
  --   "clangd",
  --   "cssls",
  --   -- "tailwindcss",
  --   -- "dartls",
  --   "dockerls",
  --   "dotls",
  --   "emmet_ls",
  --   -- "eslint_d",
  --   "eslint",
  --   "gradle_ls",
  --   "html",
  --   "jdtls",
  --   "jsonls",
  --   "ruff",
  --   "lemminx",
  --   "lua_ls",
  --   "marksman",
  --   -- "pylsp",
  --   "sourcery",
  --   "quick_lint_js",
  --   "rust_analyzer",
  --   "slint_lsp",
  --   "ts_ls",
  --   "yamlls",
  -- },
  -- ensure_installed = { "lua_ls", "tsserver", "jdtls", "angularls", "bashls" },
  automatic_installation = true,
})

-- Now we're using dap_vscode_js and to manage js
require("mason-nvim-dap").setup({
  automatic_installation = true,
  ensure_installed = {
    "firefox",
    "chrome",
    -- "dart-debug-adapter",
    -- "java-debug-adapter",
    -- "kotlin-debug-adapter",
    -- "java-test",
    "python",
  },
  -- automatic_setup = true,
  handlers = {
    function(config)
      -- all sources with no handler get passed here

      -- Keep original functionality
      require("mason-nvim-dap").default_setup(config)
    end,
    -- firefox = function(config)
    -- 	require("mason-nvim-dap").default_setup(config)
    -- end,
  },
})

require("mason-null-ls").setup({
  ensure_installed = {
    -- -- "blue",
    -- "ruff",
    -- "clang-format",
    -- "dart_format",
    -- "eslint_d",
    -- -- "isort",
    -- -- "mypy",
    -- "prettierd",
    -- -- "pylint",
    -- "stylua",
    -- "xmlformatter",
    -- "beautysh",
    -- "jsonlint",
    -- "yamllint",
    -- "yamlfmt",
    -- "shellcheck",
    -- "luacheck",
    -- "markdownlint",
  },
  methods = {
    diagnostics = false,
    formatting = false,
    code_actions = true,
    completion = true,
    hover = true,
  },
  automatic_installation = true,
})
