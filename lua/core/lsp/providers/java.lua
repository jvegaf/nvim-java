local status, lspconfig = pcall(require, 'lspconfig')
if not status then
  return
end

local M = {}

--- Function to load the params needed for lsp
---@param args {} on this case will be on_attach, capabilities and flags
function M.load(args)
  lspconfig.jdtls.setup({
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = 'JavaSE-21',
              path = '$HOME/.sdkman/candidates/java/21.0.6.fx-librca',
              default = true,
            },
          },
        },
      },
    },
  })
end

return M
