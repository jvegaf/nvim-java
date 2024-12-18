return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = { use_diagnostic_signs = true },
  },
  {
    "aznhe21/actions-preview.nvim",
    lazy = false,
    opts = {},
    keys = {
      {
        "<leader>xa",
        "<cmd> lua require('actions-preview').code_actions <cr>",
        mode = { "n", "v" },
        desc = "Code Actions",
      },
    },
  },
}
