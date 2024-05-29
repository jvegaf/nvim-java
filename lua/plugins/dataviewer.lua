return {
  "vidocqh/data-viewer.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua", -- Optional, sqlite support
  },
  opts = {
    autoDisplayWhenOpenFile = true,
    view = {
      float = false,
    }
  },
}
