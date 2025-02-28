return {
  'glepnir/template.nvim',
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
    { '<leader>ft', ':Telecope find_template type=insert<cr>', desc = 'Find File Template' },
  },
}
