local map = vim.keymap.set

return {
  ------------------------------------------------------------------------------
  -- Core {{{1
  ------------------------------------------------------------------------------
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "b0o/schemastore.nvim",
  -- { 'lewis6991/fileline.nvim', lazy = false },
  -- { 'axlebedev/vim-footprints', lazy = false },
  -- }}}
  ------------------------------------------------------------------------------
  -- Find And Replace
  {
    "MagicDuck/grug-far.nvim",
    event = "VeryLazy",
    cmd = { "GrugFar" },
    opts = {
      keymaps = {
        replace = "<C-[>",
        qflist = "<C-q>",
        gotoLocation = "<enter>",
        close = "<C-x>",
      },
    },
  },
  ------------------------------------------------------------------------------
  -- Utilities {{{2
  ------------------------------------------------------------------------------
  {
    -- https://github.com/LunarVim/bigfile.nvim
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    },
    config = function(_, opts)
      require("bigfile").setup(opts)
    end,
  },
  { "will133/vim-dirdiff", cmd = { "DirDiff" } },
  {
    "AndrewRadev/linediff.vim",
    cmd = "Linediff",
    keys = {
      { "<localleader>lL", "<cmd>Linediff<CR>", desc = "linediff: toggle" },
    },
  },
  {
    "axieax/urlview.nvim",
    cmd = { "UrlView" },
    keys = {
      { "<leader>bu", "<cmd>UrlView buffer<cr>", desc = "urlview: buffers" },
      { "<leader>zu", "<cmd>UrlView lazy<cr>", desc = "urlview: lazy" },
      {
        "<leader>bU",
        "<cmd>UrlView buffer action=clipboard<cr>",
        desc = "urlview: copy links",
      },
    },
    opts = {
      default_title = "Links:",
      default_picker = "native",
      default_prefix = "https://",
      default_action = "system",
    },
  },
  {
    "chrisgrieser/nvim-genghis",
    dependencies = "stevearc/dressing.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local g = require("genghis")
      map("n", "<localleader>fp", g.copyFilepath, { desc = "genghis: yank filepath" })
      map("n", "<localleader>fn", g.copyFilename, { desc = "genghis: yank filename" })
      map("n", "<localleader>fr", g.renameFile, { desc = "genghis: rename file" })
      map("n", "<localleader>fm", g.moveAndRenameFile, { desc = "genghis: move and rename" })
      map("n", "<localleader>fc", g.createNewFile, { desc = "genghis: create new file" })
      map("n", "<localleader>fd", g.duplicateFile, { desc = "genghis: duplicate current file" })
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    -- stylua: ignore
    keys = {
      { '<leader>vf', '<cmd>DevdocsOpenFloat<CR>', desc = 'devdocs: open float', },
      { '<leader>vb', '<cmd>DevdocsOpen<CR>', desc = 'devdocs: open in buffer', },
      { '<leader>vo', '<cmd>DevdocsOpenFloat ', desc = 'devdocs: open documentation', },
      { '<leader>vi', '<cmd>DevdocsInstall ', desc = 'devdocs: install' },
      { '<leader>vu', '<cmd>DevdocsUninstall ', desc = 'devdocs: uninstall' },
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
  },
  -- }}}
  --------------------------------------------------------------------------------
  -- Share Code
  { "TobinPalmer/rayso.nvim", cmd = { "Rayso" }, opts = {} },
  {
    "ethanholz/freeze.nvim",
    cmd = "Freeze",
    opts = {},
    keys = {
      { "<leader>F", ":Freeze<cr>", mode = { "v" }, desc = "Freeze Code" },
    },
  },
}
