local cmp_nvim_lsp = require('cmp_nvim_lsp')

local navic = require('nvim-navic')
-- local ih = require("inlay-hints")

local status, builtin = pcall(require, 'telescope.builtin')
if not status then
  return
end

-- local utils_status, utils = pcall(require, "core.lsp.utils.format_util")
-- if not utils_status then
-- 	return
-- end

local keymap = vim.keymap

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local mappingOpts = { noremap = true, silent = true }
-- mappingOpts.desc = "Diagnostics float"
-- keymap.set("n", "xe", vim.diagnostic.open_float, mappingOpts)
mappingOpts.desc = 'Diagnostics goto prev'
keymap.set('n', 'gk', vim.diagnostic.get_prev, mappingOpts)
mappingOpts.desc = 'Diagnostics goto next'
keymap.set('n', 'gj', vim.diagnostic.get_next, mappingOpts)
-- mappingOpts.desc = "Diagnostics goto setloclist"
-- keymap.set("n", "xq", vim.diagnostic.setloclist, mappingOpts)

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local filetype = vim.bo.filetype

    if client and client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { buffer = ev.buf }
    bufopts.desc = 'Diagnostics buffer declarations'
    keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

    bufopts.desc = 'Diagnostics lsp definitions'
    keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer hover'
    keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer implementation'
    keymap.set('n', 'gI', builtin.lsp_implementations, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer signature help'
    keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)

    -- bufopts.desc = "Diagnostics lsp buffer"
    -- keymap.set("n", "<leader>xx", builtin.diagnostics, bufopts)

    -- bufopts.desc = "Diagnostics lsp buffer add workspace folder"
    -- keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)

    -- bufopts.desc = "Diagnostics lsp buffer remove workspace folder"
    -- keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer list workspace folders'
    keymap.set('n', '<leader>xl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer type definition'
    keymap.set('n', 'gy', builtin.lsp_type_definitions, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer rename'
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

    bufopts.desc = 'Diagnostics lsp buffer code action'
    keymap.set('n', '<leader>xc', vim.lsp.buf.code_action, bufopts)

    bufopts.desc = 'Diagnostics lsp references'
    keymap.set('n', 'gr', builtin.lsp_references, bufopts)

    bufopts.desc = 'Diagnostics document symbols'
    keymap.set('n', '<leader>lS', '<cmd>Telescope lsp_document_symbols<CR>', bufopts)

    -- split definition
    -- bufopts.desc = "Diagnostics definition split"
    -- keymap.set("n", "<space>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", bufopts)

    -- if client.server_capabilities.documentHighlightProvider then
    if client and client.supports_method('textDocument/documentHighlight') then
      vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                " autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                " autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                  autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
                  autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
    end
  end,
})

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = cmp_nvim_lsp.default_capabilities()

local providers_path = 'core.lsp.providers.'
local lsps_table = {
  -- go_lsp = require(providers_path .. "go"),
  -- kotlin_lsp = require(providers_path .. "kotlin"),
  -- latex_lsp = require(providers_path .. "latex"),
  -- php_lsp = require(providers_path .. "php"),
  -- slint_lsp = require(providers_path .. "slint"),
  -- vue_lsp = require(providers_path .. "vue"),
  -- tailwind_lsp = require(providers_path .. "tailwind"),
  -- rust_lsp = require(providers_path .. "rust"),
  -- angular_lsp = require(providers_path .. "angular"),
  arduino_lsp = require(providers_path .. 'arduino'),
  clang_lsp = require(providers_path .. 'clang'),
  cssls_lsp = require(providers_path .. 'cssls'),
  -- dartls_lsp = require(providers_path .. "dartls"),
  -- emmet_lsp = require(providers_path .. "emmet"),
  eslint_lsp = require(providers_path .. 'eslint'),
  json_lsp = require(providers_path .. 'json'),
  lemminx = require(providers_path .. 'xml'),
  lua_lsp = require(providers_path .. 'lua'),
  python_lsp = require(providers_path .. 'python'),
  vtsls = require(providers_path .. 'vtsls'),
  java = require(providers_path .. 'java'),
  -- sql_lsp = require(providers_path .. "sql"),
}

for key, _ in next, lsps_table, nil do
  lsps_table[key].load({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
  })
end

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=NONE]])

local test = 'test'
vim.diagnostic.config({
  underline = true,
  signs = true,
  virtual_text = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = true,
    -- header = "",
    -- prefix = "",
  },
})
