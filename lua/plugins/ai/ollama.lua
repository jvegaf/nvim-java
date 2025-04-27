return {
  {
    'nomnivore/ollama.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    -- All the user commands added by the plugin
    cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oo',
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = 'ollama prompt',
        mode = { 'n', 'v' },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oG',
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = 'ollama Generate Code',
        mode = { 'n', 'v' },
      },
    },

    ---@type Ollama.Config
    opts = {
      model = 'qwen2.5-coder',
      url = 'http://127.0.0.1:11434',
      serve = {
        on_start = false,
        command = 'ollama',
        args = { 'serve' },
        stop_command = 'pkill',
        stop_args = { '-SIGTERM', 'ollama' },
      },
      -- View the actual default prompts in ./lua/ollama/prompts.lua
      prompts = {
        Sample_Prompt = {
          prompt = 'This is a sample prompt that receives $input and $sel(ection), among others.',
          input_label = '> ',
          model = 'qwen2.5-coder',
          action = 'display',
        },
      },
    },
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   optional = true,
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, {
  --       function()
  --         local status = require('ollama').status()

  --         if status == 'IDLE' then
  --           return '󱙺' -- nf-md-robot-outline
  --         elseif status == 'WORKING' then
  --           return '󰚩' -- nf-md-robot
  --         end
  --       end,
  --       cond = function()
  --         return package.loaded['ollama'] and require('ollama').status() ~= nil
  --       end,
  --     })
  --   end,
  -- },
  {
    'gerazov/ollama-chat.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'nvim-telescope/telescope.nvim',
    },
    -- lazy load on command
    cmd = {
      'OllamaQuickChat',
      'OllamaCreateNewChat',
      'OllamaContinueChat',
      'OllamaChat',
      'OllamaChatCode',
      'OllamaModel',
      'OllamaServe',
      'OllamaServeStop',
    },

    keys = {
      {
        '<leader>ocq',
        '<cmd>OllamaQuickChat<cr>',
        desc = 'Ollama Quick Chat',
        mode = { 'n', 'x' },
        silent = true,
      },
      {
        '<leader>ocn',
        '<cmd>OllamaCreateNewChat<cr>',
        desc = 'Create Ollama Chat',
        mode = { 'n', 'x' },
        silent = true,
      },
      {
        '<leader>occ',
        '<cmd>OllamaContinueChat<cr>',
        desc = 'Continue Ollama Chat',
        mode = { 'n', 'x' },
        silent = true,
      },
      {
        '<leader>och',
        '<cmd>OllamaChat<cr>',
        desc = 'Chat',
        mode = { 'n' },
        silent = true,
      },
      {
        '<leader>ocd',
        '<cmd>OllamaChatCode<cr>',
        desc = 'Chat Code',
        mode = { 'n' },
        silent = true,
      },
    },

    opts = {
      chats_folder = vim.fn.stdpath('data'), -- data folder is ~/.local/share/nvim
      -- you can also choose "current" and "tmp"
      quick_chat_file = 'ollama-chat.md',
      animate_spinner = true, -- set this to false to disable spinner animation
      model = 'openhermes2-mistral',
      model_code = 'codellama',
      url = 'http://127.0.0.1:11434',
      serve = {
        on_start = false,
        command = 'ollama',
        args = { 'serve' },
        stop_command = 'pkill',
        stop_args = { '-SIGTERM', 'ollama' },
      },
    },
  },
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      spec = {
        { '<leader>o', group = '+Ollama' },
        { '<leader>oc', group = '+Ollama chat' },
      },
    },
  },
}
