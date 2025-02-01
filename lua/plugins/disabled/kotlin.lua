return {
  {
    -- Ensure highlighting is installed
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "kotlin" })
      end
    end,
  },
  {
    -- Ensure DAP is installed (DOESN'T WORK)
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "kotlin-debug-adapter" })
      end
    end,
  },
  {
    -- Install and configure LSP
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          settings = {
            kotlin = {
              compiler = {
                jvm = {
                  target = "17",
                },
              },
            },
          },
        },
      },
    },
  },
  --[[
  {
    -- Install Kotlin configurations
    "Mgenuit/nvim-dap-kotlin",
    opts = {
      -- dap_command = "kotlin-debug-adapter",
      -- project_root = "${workspaceFolder}",
      -- enable_logging = false,
      --log_file_path = "",
    },
  },
  ]]
}
