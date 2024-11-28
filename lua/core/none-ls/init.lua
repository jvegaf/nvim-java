local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.stylua,
    -- formatting.phpcsfixer,
    -- formatting.blade_formatter,
    formatting.prettier,
    formatting.clang_format,
    formatting.dart_format,
    formatting.black,
    formatting.isort,
    diagnostics.mypy.with({
      extra_args = function()
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
        return { "--python-executable", virtual .. "/bin/python3" }
      end,
    }),
    -- TODO: Need to be tested
    diagnostics.eslint_d.with({ -- js/ts linter
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
      end,
    }),
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --   vim.api.nvim_create_autocmd("BufWritePre", {
      --     group = augroup,
      --     buffer = bufnr,
      --     callback = function()
      --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      --       -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
      --       -- vim.lsp.buf.formatting_sync()
      --       vim.lsp.buf.format({
      --         bufnr = bufnr,
      --         filter = function(attachedClient)
      --           return attachedClient.name == "null-ls"
      --         end,
      --       })
      --     end,
      --   })
      -- end
      vim.keymap.set("n", "gq", function()
        vim.lsp.buf.format({
          async = false,
          filter = function(attachedClient)
            return attachedClient.name == "null-ls"
          end,
        })
      end, { buffer = bufnr, noremap = true, silent = true, desc = "Format buffer" })
    end
  end,
})

mason_null_ls.setup({
  ensure_installed = {
    "stylua",
    "clang_format",
    "dart_format",
    "eslint_d",
    "prettierd",
    "prettier",
    "jq",
    "black",
    "isort",
    "pylint",
    "mypy",
    "ktlint",
  },
  automatic_installation = true,
})
