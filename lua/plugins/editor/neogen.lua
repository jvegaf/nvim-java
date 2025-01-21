return {
  "danymat/neogen",
  event = "VeryLazy",
  config = true,
  cmd = "Neogen",
  keys = {
    {
      "<leader>cg",
      function()
        require("neogen").generate()
      end,
      desc = "Generate Annotations (Neogen)",
    },
  },
}
