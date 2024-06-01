-- Code Tree Support / Syntax Highlighting
return {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      auto_install = true, -- automatically install syntax support when entering new file type buffer
      ensure_installed = {
        "lua",
        "comment",
        "java",
      },
    },
    config = function(_, opts)
      local configs = require("nvim-treesitter.configs")
      configs.setup(opts)
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    event = "BufRead",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  },
}
