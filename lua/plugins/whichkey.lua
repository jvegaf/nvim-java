return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
    require("which-key").add({
      { "<leader>D", group = " Dadbod" },
      { "<leader>F", group = " File" },
      { "<leader>a", group = " NeoAI" },
      { "<leader>b", group = " Buffer" },
      { "<leader>c", group = " Code" },
      { "<leader>d", group = "󰃤 Debugger" },
      { "<leader>e", group = " FileBrowser" },
      { "<leader>f", group = " Find" },
      { "<leader>g", group = "󰊢 Git" },
      { "<leader>gh", group = "GitSigns" },
      { "<leader>h", group = " Harpoon" },
      { "<leader>n", group = " Sessions" },
      { "<leader>l", group = " LSP" },
      { "<leader>p", group = " Plugins" },
      { "<leader>r", group = " Refactor" },
      { "<leader>s", group = "󰔚 Snippets" },
      { "<leader>u", group = "󱣻 UI" },
      { "<leader>x", group = "󱣻 Diagnostics" },
      { "<leader>z", group = " System" },
    })
  end,
}
