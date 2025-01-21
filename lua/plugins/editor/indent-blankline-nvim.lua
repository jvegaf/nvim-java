-- Indentation guides
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    indent = { highlight = { "Whitespace", "NonText" }, char = "" },
    whitespace = {
      highlight = { "Whitespace", "NonText" },
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  },
}
