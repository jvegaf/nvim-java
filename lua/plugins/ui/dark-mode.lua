return {
  'f-person/auto-dark-mode.nvim',
  lazy = false,
  enabled = false,
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option_value('background', 'dark', {})
      -- vim.cmd("colorscheme tokyonight-night")
      vim.cmd('colorscheme astrotheme')
    end,
    set_light_mode = function()
      vim.api.nvim_set_option_value('background', 'light', {})
      vim.cmd('colorscheme tokyonight-day')
    end,
  },
}
