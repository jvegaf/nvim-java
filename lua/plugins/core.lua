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
  {
    "cappyzawa/trim.nvim",
    event = "BufWrite",
    opts = {
      trim_on_write = true,
      trim_trailing = true,
      trim_last_line = false,
      trim_first_line = false,
      -- ft_blocklist = { "markdown", "text", "org", "tex", "asciidoc", "rst" },
      -- patterns = {[[%s/\(\n\n\)\n\+/\1/]]}, -- Only one consecutive bl
    },
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     -- Apply globals from 1-options.lua
  --     local round_borders = {}
  --     if vim.g.lsp_round_borders_enabled then
  --       round_borders = { border = "rounded" }
  --     end
  --     return {
  --       -- Window mode
  --       floating_window = false, -- Display it as floating window.
  --       hi_parameter = "IncSearch", -- Color to highlight floating window.
  --       handler_opts = round_borders, -- Window style
  --       doc_lines = 0, -- Max doc lines

  --       -- Hint mode
  --       hint_enable = false, -- Display it as hint.
  --       hint_prefix = "👈 ",

  --     }
  --   end,
  --   config = function(_, opts)
  --     require("lsp_signature").setup(opts)
  --   end,
  -- },
  ------------------------------------------------------------------------------
  -- Find And Replace
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = { headerMaxWidth = 80 },
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  ----------------------------------------------------------------------------
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
    enabled = false,
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
  {
    "normen/vim-pio",
    event = "VeryLazy",
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
