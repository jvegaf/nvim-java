return {
  "aznhe21/actions-preview.nvim",
  event = "BufRead",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>xa",
      "<cmd>lua require('actions-preview').code_actions<cr>",
      mode = { "n", "v" },
      desc = "Code Actions",
    },
  },
}
