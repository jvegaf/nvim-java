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
      wk.register({
        m = {
          name = "+ChatGPT",
          c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
          e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
          g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
          t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
          k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
          d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
          a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
          o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
          s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
          f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
          x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
          r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
          l = {
            "<cmd>ChatGPTRun code_readability_analysis<CR>",
            "Code Readability Analysis",
            mode = { "n", "v" },
          },
        },
      }, { prefix = "<leader>" })
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
    keys ={
      { "<leader>ma", "<cmd>Telescope gpt<cr>", desc = "Telescope GPT" },
    }
  },
}
