return {
  {
    'glepnir/template.nvim',
    enabled = false,
    cmd = { 'Template', 'TemProject' },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('template').setup({
        temp_dir = '~/.config/nvim/templates',
        -- config in there
      })
      require('telescope').load_extension('find_template')
    end,
    keys = {
      { '<leader>ct', ':Template<cr>', desc = 'Create a template file' },
      {
        '<leader>ft',
        function()
          require('telescope').extensions.find_template({ type = 'insert' })
        end,
        desc = 'Find File Template',
      },
    },
  },
  {
    'cvigilv/esqueleto.nvim',
    event = 'VeryLazy',
    branch = 'develop',
    opts = {
      directories = {
        vim.fn.stdpath('config') .. '/templates',
      },
      patterns = {
        -- Filetype
        'cpp',
        'js',
        'lua',
      },
    },
  },
}
