-- local status, lspconfig = pcall(require, "lspconfig")
-- if not status then
-- 	return
-- end

local M = {}

--- Function to load the params needed for lsp
---@param args {} on this case will be on_attach, capabilities and flags
function M.load(args)
  require("lspconfig").clangd.setup({
    on_attach = args.on_attach,
    flags = args.flags,
    capabilities = {
      offsetEncoding = "utf-8",
    },
  })
end

return M
