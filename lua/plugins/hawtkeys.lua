return {
  "tris203/hawtkeys.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- an empty table will work for default config
    --- if you use functions, or whichkey, or lazy to map keys
    --- then please see the API below for options
  },
  keys = {
    -- { "<leader>fk", "<cmd>Hawtkeys<cr>", desc = "Hawtkeys" },
    { "<leader>fd", "<cmd>HawtkeysDupes<cr>", desc = "Hawtkeys Duplicates" },
  },
}
