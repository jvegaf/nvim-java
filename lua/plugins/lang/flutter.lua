return {
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("flutter")
    end,
  },
}
