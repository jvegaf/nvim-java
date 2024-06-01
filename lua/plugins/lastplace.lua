return {
  "ethanholz/nvim-lastplace",
  enabled = false,
  lazy = false,
  config = function()
    require("nvim-lastplace").setup({
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "hgcommit" },
      lastplace_open_folds = true,
    })
  end,
}
