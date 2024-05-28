return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  keys = {
    { "<leader>rr", "<cmd>lua require('refactoring').select_refactor()<cr>", mode = { "n", "x" }, desc = "Refactor" },
    {
      "<leader>re",
      "<cmd>lua require('refactoring').refactor('Extract Function')<cr>",
      mode = { "x" },
      desc = "Extract Function",
    },
    {
      "<leader>rf",
      "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>",
      mode = { "x" },
      desc = "Extract Function to file",
    },
    {
      "<leader>rv",
      "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>",
      mode = { "x" },
      desc = "Extract Variable",
    },
    {
      "<leader>ri",
      "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
      mode = { "n", "x" },
      desc = "Inline Variable",
    },
    { "<leader>rb", "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", desc = "Extract Block" },
    {
      "<leader>rbf",
      "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>",
      desc = "Extract Block to file",
    },
  },
}
