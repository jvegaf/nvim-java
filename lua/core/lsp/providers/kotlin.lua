-- local status, lspconfig = pcall(require, "lspconfig")
-- if not status then
-- 	return
-- end

local M = {}

function M.load(args)
	require("lspconfig").kotlin_language_server.setup({
		capabilities = args.capabilities,
    on_attach = args.on_attach,
    flags = args.flags,
	})
end

return M