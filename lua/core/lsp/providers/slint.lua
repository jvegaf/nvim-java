local status, lspconfig = pcall(require, "lspconfig")

if not status then
  return
end

local M = {}

function M.load(args)
	lspconfig.slint_lsp.setup({
		on_attach = args.on_attach,
		capabilities = args.capabilities,
		flags = args.flags,
	})
end

return M
