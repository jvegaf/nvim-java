return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  -- enabled = false,
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      -- vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme tokyonight")
      -- vim.cmd("colorscheme dracula")
    end,
    set_light_mode = function()
      -- vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme tokyonight-day")
    end,
  },
}
