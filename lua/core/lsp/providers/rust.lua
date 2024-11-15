local status = pcall(require, "rust-tools")
if not status then
  return
end

local M = {}

function M.load(args)
  -- lspconfig.dartls.setup({
  -- 	on_attach = args.on_attach,
  -- 	capabilities = args.capabilities,
  -- 	flags = args.flags,
  -- })
  local ok, mason_registry = pcall(require, "mason-registry")
  local adapter ---@type any
  if ok then
    -- rust tools configuration for debugging support
    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = ""
    if vim.loop.os_uname().sysname:find("Windows") then
      liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    elseif vim.fn.has("mac") == 1 then
      liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
    else
      liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    end
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
    require("rust-tools").setup({
      tools = {
        executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          only_current_line = false,
          show_parameter_hints = false,
          parameter_hints_prefix = "<-",
          other_hints_prefix = "=>",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = "Comment",
        },
        hover_actions = {
          border = "rounded",
        },
        on_initialized = function()
          vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
            pattern = { "*.rs" },
            callback = function()
              local _, _ = pcall(vim.lsp.codelens.refresh)
            end,
          })
        end,
      },
      dap = {
        adapter = adapter,
      },
      server = {
        on_attach = function(client, bufnr)
          local rt = require("rust-tools")
          vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
        end,

        capabilities = args.capabilities,
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
            },
            checkOnSave = {
              enable = true,
              command = "clippy",
            },
          },
        },
      },
    })
  end
end
return M
