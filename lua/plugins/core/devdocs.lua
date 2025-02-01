return {
  "luckasRanarison/nvim-devdocs",
  -- stylua: ignore
  event = 'VeryLazy',
  keys = {
    { '<leader>vf', '<cmd>DevdocsOpenFloat<CR>', desc = 'devdocs: open float', },
    { '<leader>vb', '<cmd>DevdocsOpen<CR>',      desc = 'devdocs: open in buffer', },
    { '<leader>vo', '<cmd>DevdocsOpenFloat ',    desc = 'devdocs: open documentation', },
    { '<leader>vi', '<cmd>DevdocsInstall ',      desc = 'devdocs: install' },
    { '<leader>vu', '<cmd>DevdocsUninstall ',    desc = 'devdocs: uninstall' },
  },
  opts = {
    -- stylua: ignore
    ensure_installed = {
      'git', 'bash', 'lua-5.4', 'html', 'css', 'javascript', 'typescript',
      'react', 'java', 'electron', 'dart', 'kotlin', 'yarn', 'sqlite',
      'spring_boot', 'docker', 'eslint',
    },
    wrap = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
