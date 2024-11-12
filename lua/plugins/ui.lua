return {
  {
    "folke/noice.nvim",
    dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
    opts = function()
      require("noice").setup({
        lsp = {
          signature = {
            enabled = false,
          },
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
              },
            },
            view = "mini",
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,       -- use a classic bottom cmdline for search
          command_palette = true,     -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,         -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,     -- add a border to hover docs and signature help
        },
      })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#bb9af7", bg = "none" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#7dcfff", bg = "none" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupIcon", { fg = "#7dcfff", bg = "none" })
    end,
  },
  {
    "zbirenbaum/neodim",
    enabled = true,
    event = "LspAttach",
    opts = {
      alpha = 0.75,
      blend_color = "#000000",
      update_in_insert = {
        enable = true,
        delay = 100,
      },
      hide = {
        virtual_text = true,
        signs = true,
        underline = true,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>zn", function() require("telescope").extensions.notify.notify() end, desc = "Notifications" },
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup()

      vim.notify = notify

      require("telescope").load_extension("notify")
    end
  },
}
