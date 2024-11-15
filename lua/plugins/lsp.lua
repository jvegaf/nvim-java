return {
  -- {
  lazy = false,
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    -- Mason
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- LSP
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {
        settings = {
          code_lens = "all",
        },
      },
    },
    { "simrat39/rust-tools.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },
    { "lervag/vimtex" },
    { "akinsho/flutter-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- CMP
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "SergioRibera/cmp-dotenv",
        "davidmh/cmp-nerdfonts",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-git",
        "lukas-reineke/cmp-rg",
        "jdrupal-dev/css-vars.nvim",
        "onsails/lspkind-nvim",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        {
          "L3MON4D3/LuaSnip",
          version = "v2.*",
          build = "make install_jsregexp",
        },
        {
          "rcarriga/cmp-dap",
          ft = { "dap-repl", "dapui_watches" },
        },
        {
          "amarakon/nvim-cmp-buffer-lines",
          ft = { "c", "cpp" },
        },
        {
          "Saecki/crates.nvim",
          event = { "BufRead Cargo.toml" },
          opts = {
            completion = {
              cmp = { enabled = true },
            },
          },
        },
      },
    },

    -- DAP
    {
      "mfussenegger/nvim-dap",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "mfussenegger/nvim-dap-python",
        "mxsdev/nvim-dap-vscode-js",
        {
          "rcarriga/nvim-dap-ui",
          opts = {
            windows = { indent = 2 },
          },
          dependencies = {
            { "nvim-neotest/nvim-nio" },
          },
        },
        { "theHamsta/nvim-dap-virtual-text", opts = { all_frames = true } },
        {
          "Weissle/persistent-breakpoints.nvim",
          opts = { load_breakpoints_event = { "BufReadPost" } },
        },
        -- {
        --   "microsoft/vscode-js-debug",
        --   -- opt = true,
        --   build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        -- },
      },
    },

    -- NULL-LS
    "nvim-lua/plenary.nvim",

    -- Formatter
    {
      "stevearc/conform.nvim",
      opts = {},
      -- config = function()
      --   require("core.formatter") -- formatters
      -- end,
    },

    -- Linters
    { "mfussenegger/nvim-lint" },

    -- UI Tools
    -- {
    -- 	"nvimdev/lspsaga.nvim",
    -- 	-- config = function()
    -- 	-- 	require("lspsaga").setup({
    -- 	-- 		-- symbol_in_winbar = {
    -- 	-- 		-- 	enable = false,
    -- 	-- 		-- },
    -- 	-- 	})
    -- 	-- end,
    -- 	dependencies = {
    -- 		"nvim-treesitter/nvim-treesitter", -- optional
    -- 		"nvim-tree/nvim-web-devicons", -- optional
    -- 	},
    -- },

    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
    -- formatter / linter
    {
      "nvimtools/none-ls.nvim",
    },

    -- References made easy
    {
      "dnlhc/glance.nvim",
      event = "LspAttach",
      config = function()
        require("glance").setup({
          -- your configuration
        })
      end,
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

    -- inlay hints until neovim 0.10 release
    "simrat39/inlay-hints.nvim",
  },
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  config = function()
    -- Everything related to LSP need to have the following order
    -- Mason should be first and then lsp and lastly all of the others
    -- If we change this order, can lead to unexpected behaviour
    require("core.mason") -- lsp management
    -- Lsp needs to be loaded after mason in order for
    -- automatic_installation to work
    require("inlay-hints").setup({
      renderer = "inlay-hints/render/virtline",
    })
    require("core.lsp")       -- lsp engine
    require("core.cmp")       -- completion
    require("core.dap")       -- debuggers management
    require("core.formatter") -- formatters
    require("core.linter")    -- linters
    -- require("core.none-ls")
  end,
  -- },
}
