return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "williamboman/mason.nvim",
        keys = { { "<leader>pm", "<cmd>Mason<CR>", desc = "Mason" } },
      },
      { "williamboman/mason-lspconfig.nvim" },

      { "WhoIsSethDaniel/mason-tool-installer.nvim" },

      { "j-hui/fidget.nvim", opts = {} },

      {
        "folke/neodev.nvim",
        ft = "lua",
        -- opts = {
        --   debug = true,
        --   experimental = { pathStrict = true },
        --   library = {
        --     runtime = join_paths(vim.env.HOME, "neovim", "share", "nvim", "runtime"),
        --     plugins = { "nvim-dap-ui" },
        --     types = true,
        --   },
        -- },
      },
      {
        "folke/neoconf.nvim",
        cmd = { "Neoconf" },
        opts = {
          local_settings = ".nvim.json",
          global_settings = "nvim.json",
        },
      },
      {
        "nvim-java/nvim-java",
        ft = { "java" },
        dependencies = {
          "nvim-java/lua-async-await",
          "nvim-java/nvim-java-refactor",
          "nvim-java/nvim-java-core",
          "nvim-java/nvim-java-test",
          "nvim-java/nvim-java-dap",
          "MunifTanjim/nui.nvim",
          "neovim/nvim-lspconfig",
          "mfussenegger/nvim-dap",
          {
            "williamboman/mason.nvim",
            opts = {
              registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
              },
            },
          },
        },
        config = function()
          require("java").setup({})
        end,
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Install these LSPs automatically
        ensure_installed = {
          "bashls",
          "cssls",
          "tsserver",
          "eslint",
          "html",
          "gradle_ls",
          "groovyls",
          "lua_ls",
          "jdtls",
          "jsonls",
          "lemminx",
          "marksman",
          "quick_lint_js",
          "yamlls",
        },
      })

      require("mason-tool-installer").setup({
        -- Install these linters, formatters, debuggers automatically
        ensure_installed = {
          -- "java-debug-adapter",
          -- "java-test",
          "prettierd",
          "stylua",
          "clang-format",
          "yamlfmt",
        },
      })

      -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
      -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
      vim.api.nvim_command("MasonToolsInstall")

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- Create your keybindings here...
      end

      -- Call setup on each LSP server
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
          -- if server_name ~= "jdtls" then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
          -- end
        end,
      })

      -- Lua LSP settings
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          },
        },
      })

      -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded" -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  },
  {
    "askfiy/lsp_extra_dim",
    event = { "LspAttach" },
    config = function()
      require("lsp_extra_dim").setup()
    end,
  },
}
