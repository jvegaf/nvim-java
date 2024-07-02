return {
  "aznhe21/actions-preview.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  config = function()
    vim.keymap.set({ "v", "n" }, "<leader>xc", require("actions-preview").code_actions)
  end,
}
