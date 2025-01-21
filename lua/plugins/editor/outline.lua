return {
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    -- enabled = false,
    config = function()
      require("aerial").setup()
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>la", "<cmd>AerialToggle!<CR>", desc = "Toggle outline" },
    },
  },
  {
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>lo", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },

  {
    "simrat39/symbols-outline.nvim",
    event = "VeryLazy",
    keys = { { "<leader>ls", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup({
        position = "right",
        auto_close = true,
      })
    end,
  },
}
