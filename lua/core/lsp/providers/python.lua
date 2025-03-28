local M = {}

--- Function to load the params needed for lsp
---@param args {} on this case will be on_attach, capabilities and flags
function M.load(args)
  local venv_path = os.getenv('VIRTUAL_ENV')
  local py_path = nil
  -- decide which python executable to use for mypy
  if venv_path ~= nil then
    py_path = venv_path .. '/bin/python3'
  else
    py_path = vim.g.python3_host_prog
  end

  -- require("lspconfig").pylsp.setup({
  --   -- unpack(args),
  --   capabilities = args.capabilities,
  --   on_attach = args.on_attach,
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --         rope = { enabled = true },
  --         -- formatter options
  --         black = { enabled = false },
  --         autopep8 = { enabled = false },
  --         yapf = { enabled = false },
  --         -- linter options
  --         pylint = { enabled = true, executable = "pylint" },
  --         ruff = { enabled = true },
  --         pyflakes = { enabled = false },
  --         pycodestyle = { enabled = false },
  --         -- type checker
  --         pylsp_mypy = {
  --           -- enabled = true,
  --           enabled = false,
  --           overrides = { "--python-executable", py_path, true },
  --           report_progress = true,
  --           live_mode = false,
  --         },
  --         -- auto-completion options
  --         jedi_completion = { fuzzy = false },
  --         -- import sorting
  --         isort = { enabled = true },
  --       },
  --     },
  --   },
  --   flags = {
  --     debounce_text_changes = 200,
  --   },
  -- })

  require('lspconfig').pyright.setup({
    on_attach = args.on_attach,
    flags = args.flags,
    capabilities = args.capabilities,
    settings = {
      pyright = {
        -- using Ruff import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- using Ruff for linting
          -- ignore = { "*" },
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  })

  -- local on_attach = function(client, bufnr)
  --   if client.name == "ruff" then
  --     -- Disable hover in favor of Pyright
  --     client.server_capabilities.hoverProvider = false
  --   end
  -- end

  -- require("lspconfig").ruff.setup({
  --   on_attach = on_attach,
  --   flags = args.flags,
  --   capabilities = args.capabilities,
  --   trace = "messages",
  --   init_options = {
  --     settings = {
  --       logLevel = "debug",
  --     },
  --   },
  -- })

  -- require("lspconfig").sourcery.setup({
  --   on_attach = args.on_attach,
  --   flags = args.flags,
  --   capabilities = args.capabilities,
  --   init_options = {
  --     editor_version = "vim",
  --   },
  --   filetypes = { "python" },
  --   cmd = { "sourcery", "lsp" },
  -- })
end

return M
