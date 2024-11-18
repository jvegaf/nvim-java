local M = {}

--- Function to load the params needed for lsp
---@param args {} on this case will be on_attach, capabilities and flags
function M.load(args)
  local venv_path = os.getenv("VIRTUAL_ENV")
  local py_path = nil
  -- decide which python executable to use for mypy
  if venv_path ~= nil then
    py_path = venv_path .. "/bin/python3"
  else
    py_path = vim.g.python3_host_prog
  end

  require("lspconfig").pylsp.setup({
    -- unpack(args),
    capabilities = args.capabilities,
    on_attach = args.on_attach,
    settings = {
      pylsp = {
        plugins = {
          rope = { enabled = true },
          -- formatter options
          black = { enabled = true },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          -- linter options
          pylint = { enabled = true, executable = "pylint" },
          ruff = { enabled = true },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          -- type checker
          pylsp_mypy = {
            -- enabled = true,
            enabled = false,
            overrides = { "--python-executable", py_path, true },
            report_progress = true,
            live_mode = false,
          },
          -- auto-completion options
          jedi_completion = { fuzzy = true },
          -- import sorting
          isort = { enabled = true },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
  })

  require("lspconfig").sourcery.setup({
    on_attach = args.on_attach,
    flags = args.flags,
    capabilities = args.capabilities,
    init_options = {
      -- token =
      -- token = MYTOKEN,
      editor_version = "vim",
    },
    filetypes = { "python" },
    cmd = { "sourcery", "lsp" },
    -- single_file_support = true,
    -- init_options = {
    --   -- use_nvim_notify = true,
    --   extension_version = "vim.lsp",
    --   editor_version = "neovim",
    -- },
  })
end

return M
