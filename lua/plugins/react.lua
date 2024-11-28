return {
  {
    "TiagoMDG/react-comp-gen.nvim",
    name = "react-component-generator",
    config = function()
      require("react-component-generator").setup({
        -- templates_dir = "~/custom-templates-directory", -- Custom templates directory (Optional)
        file_extension = "tsx", -- Preferred file extension (Optional)
      })
    end,
  },
  {
    "napmn/react-extract.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>rE",
        mode = { "v" },
        function()
          require("react-extract").extract_to_new_file()
        end,
        desc = "Extract component",
      },
    },
  },
}
