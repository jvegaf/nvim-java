return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
    require("which-key").register {
      {
        ["<leader>"] = {
          -- R = { name = " Runner" },
          -- T = { name = "󰙨 Tests" },
          -- n = { name = " Neovim" },
          -- t = { name = " Terminal" },
          c = { name = " Code" },
          d = { name = "󰃤 Debugger" },
          f = { name = " Find" },
          g = { name = "󰊢 Git" },
          h = { name = " Harpoon" },
          l = { name = " LSP" },
          p = { name = " Plugins" },
          r = { name = " Refactor" },
          s = { name = "󰔚 Snippets" },
          -- v = { name = " Venv" },
          z = { name = " System" },
        },
      },
    }
  end,
}



-- return {
--   "folke/which-key.nvim",
--   opts = {
--     icons = {
--       breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--       separator = "➜", -- symbol used between a key and it's label
--       group = "", -- symbol prepended to a group
--     },
--   },
--   keys = {
--     "[",
--     "]",
--   },
-- }
