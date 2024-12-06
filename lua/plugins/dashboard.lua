return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function(_, opts)
    local logo = [[
        ███████╗    ███████╗ ██████╗  ██████╗██╗███████╗████████╗██╗   ██╗
        ██╔════╝    ██╔════╝██╔═══██╗██╔════╝██║██╔════╝╚══██╔══╝╚██╗ ██╔╝
        █████╗      ███████╗██║   ██║██║     ██║█████╗     ██║    ╚████╔╝
        ██╔══╝      ╚════██║██║   ██║██║     ██║██╔══╝     ██║     ╚██╔╝
        ██║         ███████║╚██████╔╝╚██████╗██║███████╗   ██║      ██║
        ╚═╝         ╚══════╝ ╚═════╝  ╚═════╝╚═╝╚══════╝   ╚═╝      ╚═╝

  ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"
    require("dashboard").setup({
      config = {
        header = vim.split(logo, "\n"),
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
