return {
  "uga-rosa/ccc.nvim",
  event = "FileType",
  keys = {
    { "<Leader>cP", "<cmd>CccPick<CR>", desc = "Color picker" },
    { "<Leader>cC", "<cmd>CccConvert<CR>", desc = "Color Converter" },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
      filetypes = {
        "html",
        "lua",
        "css",
        "scss",
        "sass",
        "less",
        "stylus",
        "javascript",
        "tmux",
        "typescript",
        "json",
      },
      excludes = { "lazy", "mason", "help", "neo-tree", "NvimTree", "Outline" },
    },
  },
}
