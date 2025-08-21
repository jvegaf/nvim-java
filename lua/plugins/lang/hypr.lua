return {
  {
    'williamboman/mason-lspconfig.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require('utils').list_insert_unique(opts.ensure_installed, { 'hyprls' })
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require('utils').list_insert_unique(opts.ensure_installed, { 'hyprls' })
    end,
  },
  -- treesitter support for hyprlang
  {
    'nvim-treesitter/nvim-treesitter',
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= 'all' then
        opts.ensure_installed = require('utils').list_insert_unique(opts.ensure_installed, { 'hyprlang' })
      end
    end,
  },
}
