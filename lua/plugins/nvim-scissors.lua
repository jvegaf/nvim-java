return {
	"chrisgrieser/nvim-scissors",
  event = "VeryLazy",
	dependencies = "nvim-telescope/telescope.nvim", -- optional
	opts = {},
  keys = {
    { "<leader>sa", "lua require('scissors').addNewSnippet()", desc = "Add Snippet" },
    { "<leader>se", "lua require('scissors').editSnippet()", desc = "Edit Snippet" },
  }
}
