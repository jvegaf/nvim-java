return {
  {
    "williamboman/mason.nvim",
    config = function()
      -- setup mason with default properties
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
    end,
  },
  -- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "cssls",
          "eslint",
          "gradle_ls",
          "groovyls",
          "html",
          "jdtls",
          "jsonls",
          "lemminx",
          "lua_ls",
          "marksman",
          "quick_lint_js",
          "tsserver",
          "yamlls",
        },
      })
    end,
  },
  -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      -- ensure the java debug adapter is installed
      require("mason-nvim-dap").setup({
        ensure_installed = { "java-debug-adapter", "java-test" },
      })
    end,
  },
  -- utility plugin for configuring the java language server for us
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
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local icons = require("core.icons")

      -- get access to the lspconfig plugins functions
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- setup the lua language server
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      lspconfig.lemminx.setup({
        capabilities = capabilities,
      })

      lspconfig.gradle_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.eslint.setup({
        capabilities = capabilities,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              kubernetes = "/*.yaml",
              -- Add the schema for gitlab piplines
              -- ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.yml",
            },
          },
        },
      })
      local default_diagnostic_config = {
        signs = {
          active = true,
          values = {
            { name = "DiagnosticSignError", text = icons.diagnostics.Error },
            { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
            { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
            { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
          },
        },
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.diagnostic.config(default_diagnostic_config)

      for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
      end

      -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
      -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
      -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
      -- Set vim motion for <Space> + c + r to display references to the code under the cursor
      vim.keymap.set(
        "n",
        "<leader>cr",
        require("telescope.builtin").lsp_references,
        { desc = "[C]ode Goto [R]eferences" }
      )
      -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
      vim.keymap.set(
        "n",
        "<leader>ci",
        require("telescope.builtin").lsp_implementations,
        { desc = "[C]ode Goto [I]mplementations" }
      )
      -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
      vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
      -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
      vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
    end,
  },
  {
    "askfiy/lsp_extra_dim",
    event = { "LspAttach" },
    config = function()
      require("lsp_extra_dim").setup()
    end,
  },
  {
    "nanotee/sqls.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = { "sql" },
  },
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
}
