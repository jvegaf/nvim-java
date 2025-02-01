return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75,
        },
      },
      path_display = {
        filename_first = {
          reverse_directories = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")
  end,
}
