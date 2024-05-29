return {
  "rcarriga/nvim-notify",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {"<leader>zn", function() require("telescope").extensions.notify.notify() end, desc = "Notifications"},
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup()

    vim.notify = notify

    require("telescope").load_extension("notify")
  end
}
