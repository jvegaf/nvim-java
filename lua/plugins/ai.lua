return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        openai_params = {
          model = "gpt-4-1106-preview",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 1000,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      local wk = require("which-key")
      wk.add(
        {
          { "<leader>m",  group = "ChatGPT" },
          { "<leader>mc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
          {
            mode = { "n", "v" },
            { "<leader>ma", "<cmd>ChatGPTRun add_tests<CR>",                 desc = "Add Tests" },
            { "<leader>md", "<cmd>ChatGPTRun docstring<CR>",                 desc = "Docstring" },
            { "<leader>me", "<cmd>ChatGPTEditWithInstruction<CR>",           desc = "Edit with instruction" },
            { "<leader>mf", "<cmd>ChatGPTRun fix_bugs<CR>",                  desc = "Fix Bugs" },
            { "<leader>mg", "<cmd>ChatGPTRun grammar_correction<CR>",        desc = "Grammar Correction" },
            { "<leader>mk", "<cmd>ChatGPTRun keywords<CR>",                  desc = "Keywords" },
            { "<leader>ml", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
            { "<leader>mo", "<cmd>ChatGPTRun optimize_code<CR>",             desc = "Optimize Code" },
            { "<leader>mr", "<cmd>ChatGPTRun roxygen_edit<CR>",              desc = "Roxygen Edit" },
            { "<leader>ms", "<cmd>ChatGPTRun summarize<CR>",                 desc = "Summarize" },
            { "<leader>mt", "<cmd>ChatGPTRun translate<CR>",                 desc = "Translate" },
            { "<leader>mx", "<cmd>ChatGPTRun explain_code<CR>",              desc = "Explain Code" },
          },
        }
      )
    end,
  },
  {
    "Bryley/neoai.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>as", desc = "summarize text" },
      { "<leader>ag", desc = "generate git message" },
    },
    config = function()
      require("neoai").setup({
        -- Options go here
        models = {
          {
            name = "openai",
            model = "gpt-4-1106-preview",
            params = nil,
          },
        },
      })
    end,
  },
  {
    "HPRIOR/telescope-gpt",
    dependencies = { "nvim-telescope/telescope.nvim", "jackMort/ChatGPT.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    version = false,
    opts = {
      extensions = {
        gpt = {
          title = "Gpt Actions",
          commands = {
            "add_tests",
            "chat",
            "docstring",
            "explain_code",
            "fix_bugs",
            "grammar_correction",
            "interactive",
            "optimize_code",
            "summarize",
            "translate",
          },
          theme = require("telescope.themes").get_dropdown({}),
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("gpt")
    end,
    keys = {
      { "<leader>ma", "<cmd>Telescope gpt<cr>", desc = "Telescope GPT" },
    }
  },
}
