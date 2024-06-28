return {
  "uga-rosa/ccc.nvim",
  event = "FileType",
  keys = {
    { "<Leader>pc", "<cmd>CccPick<CR>", desc = "Color-picker" },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
      excludes = { "lazy", "mason", "help", "neo-tree" },
    },
  },
}
