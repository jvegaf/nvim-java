vim.deprecate = function() end

-- This has to be set before initializing lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Bootstrap lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy with dynamic loading of anything in the plugins directory
require('lazy').setup({
  spec = {
    -- import/override with your plugins
    { import = 'plugins.core' },
    { import = 'plugins.editor' },
    { import = 'plugins.coding' },
    { import = 'plugins.lang' },
    { import = 'plugins.ai' },
    { import = 'plugins.ui' },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- These modules are not loaded by lazy
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.commands')

local is_lin = vim.loop.os_uname().sysname == 'Linux'
local is_win = vim.loop.os_uname().sysname == 'Windows_NT'
local is_mac = vim.loop.os_uname().sysname == 'Darwin'

if is_lin then
  require('config.linux')
end

if is_win then
  require('config.windows')
end

if is_mac then
  require('config.macos')
end

if vim.g.neovide then
  vim.print(vim.g.neovide_version)
end
