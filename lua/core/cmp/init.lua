local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").load({ paths = { "./my_snippets" } })

-- Setup nvim-cmp.
vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
      	-- elseif luasnip.expand_or_locally_jumpable() then
      	luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
      	luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  }),
  sources = cmp.config.sources({
    -- { name = "copilot",                 group_index = 2 },
    { name = "nvim_lsp",                group_index = 2 },
    { name = "luasnip",                 group_index = 2 }, -- For luasnip users.
    { name = "crates",                  group_index = 2 }, -- For luasnip users.
    { name = "nvim_lsp_signature_help", group_index = 2 },
    { name = "nvim_lua",                group_index = 2 },
    { name = "path",                    group_index = 2 },
    { name = "emoji",                   group_index = 2 },
    { name = "calc",                    group_index = 2 },
    {
      name = "css_vars",
      priority = 3,
      keyword_length = 3,
      group_index = 1,
    },
    {
      name = "rg",
      priority = 3,
      keyword_length = 4,
      option = { additional_arguments = "--max-depth 8" },
      group_index = 1,
    },
    -- {
    --   name = "buffer",
    --   priority = 3,
    --   keyword_length = 4,
    --   options = {
    --     get_bufnrs = function()
    --       return vim.api.nvim_list_bufs()
    --     end,
    --   },
    --   group_index = 1,
    -- },
    {
      name = "spell",
      max_item_count = 10,
      group_index = 2,
    },
    { name = "norg", group_index = 2 },
    { name = "nerdfonts", group_index = 3 },
    { name = "dotenv", group_index = 4 },
    -- { name = "buffer" },
  }, {
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_map",
      menu = {
        -- copilot = "",
        lua_ls = "[Lua]",
        crates = "[Crates]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
        luasnip = "[SNIP]",
        emoji = "[EMOJI]",
        path = "[PATH]",
        neorg = "[NEORG]",
        buffer = "[BUF]",
        spell = "[SPELL]",
        rg = "[RG]",
        norg = "[NORG]",
        cmdline = "[CMD]",
        cmdline_history = "[HIST]",
        treesitter = "[TS]",
        ["buffer-lines"] = "[BUFL]",
        nerdfonts = "[NF]",
        ["vim-dadbod-completion"] = "[DB]",
        dotenv = "[DOTENV]",
      },
    }),
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  matching = {
    disallow_fuzzy_matching = false,
    disallow_fullfuzzy_matching = true,
    disallow_partial_fuzzy_matching = true,
    disallow_partial_matching = true,
    disallow_prefix_unmatching = false,
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
