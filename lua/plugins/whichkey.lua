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
          b = { name = " Buffer" },
          c = { name = " Code" },
          d = { name = "󰃤 Debugger" },
          D = { name = " Dadbod" },
          f = { name = " Find" },
          F = { name = " File" },
          g = {
            name = "󰊢 Git",
            h = { name = "+GitSigns"}
          },
          h = { name = " Harpoon" },
          l = { name = " LSP" },
          p = { name = " Plugins" },
          r = { name = " Refactor" },
          s = { name = "󰔚 Snippets" },
          u = { name = "󱣻 UI" },
          x = { name = "󱣻 Diagnostics" },
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
