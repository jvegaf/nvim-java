return {
  -- Fast Neovim http client written in Lua
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    main = "rest-nvim",
    cmd = "Rest",
    keys = {
      { "<Leader>mh", "<cmd>Rest run<CR>", desc = "Execute HTTP request" },
    },
    opts = { skip_ssl_verification = true },
  },
}
