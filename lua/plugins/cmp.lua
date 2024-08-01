local api, fn, fmt, k = vim.api, vim.fn, string.format, vim.keycode

return {
  -- https://github.com/hrsh7th/nvim-cmp
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "SergioRibera/cmp-dotenv",
    "davidmh/cmp-nerdfonts",
    "fazibear/cmp-nerdfonts",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-path",
    "lukas-reineke/cmp-rg",
    "onsails/lspkind.nvim",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    "jdrupal-dev/css-vars.nvim",
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
    {
      "Exafunction/codeium.nvim",
      enabled = false,
      event = "VeryLazy",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("codeium").setup({})
      end,
    },
    {
      "f3fora/cmp-spell",
      ft = { "gitcommit", "NeogitCommitMessage", "markdown", "norg", "org" },
    },
    {
      "rcarriga/cmp-dap",
      ft = { "dap-repl", "dapui_watches" },
    },
    {
      "amarakon/nvim-cmp-buffer-lines",
      ft = { "c", "cpp" },
    },
    {
      "jsongerber/nvim-px-to-rem",
      ft = { "css", "scss" },
      opts = { disable_keymaps = true },
    },
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    local MIN_MENU_WIDTH, MAX_MENU_WIDTH = 25, math.min(50, math.floor(vim.o.columns * 0.5))
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
        ["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- Tab through suggestions or when a snippet is active, tab to the next argument
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Tab backwards through suggestions or when a snippet is active, tab to the next argument
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-q>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      }),
      sources = cmp.config.sources({
        { name = "path", group_index = 2 },
        { name = "copilot", priority = 11, group_index = 1 },
        { name = "codeium", priority = 11, group_index = 1 },
        { name = "nvim_px_to_rem", priority = 7, group_index = 1 },
        { name = "nvim_lsp", priority = 10, group_index = 1 },
        { name = "luasnip", priority = 9, group_index = 1 },
        { name = "path", priority = 4, group_index = 1 },
        { name = "emoji", priority = 3, group_index = 1 },
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
        {
          name = "buffer",
          priority = 3,
          keyword_length = 4,
          options = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
          group_index = 1,
        },
        {
          name = "spell",
          max_item_count = 10,
          group_index = 2,
        },
        { name = "norg", group_index = 2 },
        { name = "nerdfonts", group_index = 3 },
        { name = "dotenv", group_index = 4 },
      }),
      formatting = {
        deprecated = true,
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          item.menu = ({
            copilot = "[CPL]",
            codeium = "[CM]",
            nvim_lsp = "[LSP]",
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
            ["lab.quick_data"] = "[LAB]",
            nerdfonts = "[NF]",
            natdat = "[NATDAT]",
            nvim_px_to_rem = "[PX2REM]",
            ["vim-dadbod-completion"] = "[DB]",
            dotenv = "[DOTENV]",
          })[entry.source.name]

          local label, length = item.abbr, api.nvim_strwidth(item.abbr)
          local function format_icon(icon)
            return fmt("%s ", icon)
          end
          vim.o.pumblend = 0

          if length < MIN_MENU_WIDTH then
            item.abbr = label .. string.rep(" ", MIN_MENU_WIDTH - length)
          end
          if #item.abbr >= MAX_MENU_WIDTH then
            item.abbr = item.abbr:sub(1, MAX_MENU_WIDTH) --.. ellipsis
          end

          local custom_sources = {
            "emoji",
            "lab.quick_data",
            "natdat",
            "crates",
            "copilot",
            "nerdfonts",
            "nvim_px_to_rem",
          }

          -- if not rvim.find_string(custom_sources, entry.source.name) and item.kind ~= "Color" then
          --   item.kind = format_icon(symbols[item.kind])
          -- end
          -- if entry.source.name == "emoji" then
          --   item.kind = format_icon(codicons.misc.smiley)
          -- end
          -- if entry.source.name == "lab.quick_data" then
          --   item.kind = format_icon(ui.icons.misc.beaker)
          --   item.kind_hl_group = "CmpItemKindLab"
          -- end
          -- if entry.source.name == "natdat" then
          --   item.kind = format_icon(codicons.misc.calendar)
          --   item.kind_hl_group = "CmpItemKindDynamic"
          -- end
          -- if entry.source.name == "crates" then
          --   item.kind = format_icon(ui.codicons.misc.package)
          -- end
          if entry.source.name == "copilot" then
            item.kind = format_icon("")
            item.kind_hl_group = "CmpItemKindCopilot"
          end
          if entry.source.name == "codeium" then
            item.kind = format_icon("")
            item.kind_hl_group = "CmpItemKindCodeium"
          end
          if entry.source.name == "nerdfonts" then
            item.kind = format_icon("")
            item.kind_hl_group = "CmpItemKindNerdFont"
          end
          if entry.source.name == "nvim_px_to_rem" then
            item.kind = format_icon("")
            item.kind_hl_group = "CmpItemKindNerdFont"
          end

          return item
        end,
      },
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     mode = "symbol",
      --     max_width = 50,
      --     symbol_map = {
      --       Copilot = "",
      --     },
      --   }),
      -- },
      window = {
        -- Add borders to completions popups
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          -- require("copilot_cmp.comparators").prioritize,

          -- Below is the default comparitor list and order for nvim-cmp
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
  end,
}
