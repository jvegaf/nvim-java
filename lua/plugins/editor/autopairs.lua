return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- Call the autopairs setup function to configure how we want autopairs to work
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"
    npairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      }
    })
    npairs.add_rules(
      {
        Rule("$", "$", { "tex", "latex" })
        -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
        -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
        -- don't move right when repeat character
            :with_move(cond.none())
        -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
        -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
      },
      -- disable for .vim files, but it work for another filetypes
      Rule("a", "a", "-vim")
    )
    -- Get access to auto pairs completion and cmp plugins
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    -- Whenever we accept a choice from an autocompletion, make sure that any pairs are automatically closed
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
