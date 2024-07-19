return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = {},
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason").setup()
      local null_ls = require("null-ls")
      -- run the setup function for none-ls to setup our different formatters
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp" },
          }),
          -- setup lua formatter
          null_ls.builtins.formatting.stylua,
          -- setup eslint linter for javascript
          require("none-ls.diagnostics.eslint_d"),
          -- setup prettier to format languages that are not lua
          null_ls.builtins.formatting.prettierd.with({
            extra_args = function(params)
              return params.options
                and params.options.tabSize
                and {
                  "--tab-width",
                  params.options.tabSize,
                }
            end,
          }),
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
      })

      vim.keymap.set({ "n", "v" }, "gq", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
    end,
  },
}
