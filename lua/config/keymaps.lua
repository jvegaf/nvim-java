--stylua: ignore start

local status, builtin = pcall(require, "telescope.builtin")
if not status then
  return
end

local keymap = vim.keymap
local NS = { noremap = true, silent = true }

-- General keymaps
keymap.set("i", "jk", "<ESC>", NS)           -- exit insert mode with jk
keymap.set("n", "vv", "V", NS)
keymap.set("n", "<leader>q", ":q!<CR>", NS)  -- quit without saving
-- keymap.set("n", "<localleader>w", ":w<CR>", NS)           -- save
-- keymap.set("n", "<localleader>q", ":Bdelete<CR>", NS)     -- close buffer
keymap.set("n", "W", ":w<CR>", NS)           -- save
keymap.set("n", "Q", ":Bdelete<CR>", NS)     -- close buffer
keymap.set("v", "y", "myy`y", NS)     -- close buffer


-- Buffers
keymap.set("n", "H", ":BufferLineCyclePrev<cr>", NS)
keymap.set("n", "L", ":BufferLineCycleNext<cr>", NS)
keymap.set("n", "<leader>bb", ":e #<cr>", NS)
keymap.set("n", "<localleader><Space>", ":Telescope buffers<cr>", NS)


-- Split window management
-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
-- keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
-- keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
-- keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
-- keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger
-- keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap.set("n", "<localleader>to", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<localleader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<localleader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<localleader>tp", ":tabp<CR>")     -- previous tab
keymap.set("n", "<localleader>,", ":tabNext<CR>")

-- Diff keymaps
-- keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
-- keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
-- keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
-- keymap.set("n", "<leader>cn", "]c") -- next diff hunk
-- keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<localleader>qo", ":copen<CR>")  -- open quickfix list
keymap.set("n", "<localleader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<localleader>qn", ":cnext<CR>")  -- jump to next quickfix list item
keymap.set("n", "<localleader>qp", ":cprev<CR>")  -- jump to prev quickfix list item
keymap.set("n", "<localleader>ql", ":clast<CR>")  -- jump to last quickfix list item
keymap.set("n", "<localleader>qc", ":cclose<CR>") -- close quickfix list

-- Vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- FileBrowser
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", NS)          -- toggle file explorer
keymap.set("n", "<leader>E", ":Telescope file_browser<CR>", NS) -- toggle focus to file explorer

-- Telescope
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Git Commit" })
keymap.set("n", "<leader>fe", builtin.git_files, { desc = "Git files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymap" })
keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Search in buffer" })
keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "Document symbols" })
keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, { desc = "Incoming calls" })
keymap.set("n", "<leader>fm", function() builtin.treesitter({ default_text = ":method:" }) end, { desc = "Find methods" })

-- Git-blame
-- keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- LSP
keymap.set("n", "<leader>li", ":LspInfo<cr>", { desc = "LSP Info" })
keymap.set("n", "<leader>lr", ":LspReset<cr>", { desc = "LSP Reset" })
-- keymap.set("n", "K", function() vim.lsp.buf.hover() end, NS)
-- keymap.set({ "v", "n" }, "<leader>xc", require("actions-preview").code_actions, { desc = "Code Actions" })
-- keymap.set("n", "gd", function() builtin.lsp_definitions({ reuse_win = true }) end, { desc = "definition" })
-- keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Goto Declaration" })
-- keymap.set("n", "gI", function() builtin.lsp_implementations({ reuse_win = true }) end, { desc = "Goto implementation" })
-- keymap.set("n", "gy", function() builtin.lsp_type_definitions({ reuse_win = true }) end,
--   { desc = "Goto type_definition" })
-- keymap.set("n", "<leader>xx", function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "Buffer diagnostics" })
-- keymap.set("n", "<leader>xX", function() builtin.diagnostics({ root_dir = true }) end, { desc = "cwd diagnostics" })
-- keymap.set("n", "gr", function() builtin.lsp_references({ reuse_win = true }) end, { desc = "References" })
-- keymap.set("n", "gK", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
-- keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename Buffer" })
-- keymap.set('n', 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "format buffer"})
-- keymap.set({ 'n', 'v' }, 'gq', function() require("conform").format({ async = true, lsp_format = "fallback" }) end, { desc = "Format"})
-- keymap.set('n', '<leader>xc', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = "Code Action"})
-- keymap.set('n', '<leader>xx', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Open Float"})
-- keymap.set("n", "gk", function() vim.diagnostic.goto_prev() end, { desc = "Previous Diagnostic" })
-- keymap.set("n", "gj", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
-- keymap.set("n", "gS", function() vim.lsp.buf.document_symbol() end, { desc = "Document Symbol" })
-- keymap.set("i", "<C-Space>", function() vim.lsp.buf.completion({ bufnr = 0 }) end, { desc = "References" })

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)

-- Debugging
keymap.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>dL", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>dR", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>da", "<cmd>Telescope dap list_breakpoints<cr>")
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end)
keymap.set("n", "<leader>de", function() builtin.diagnostics({ default_text = ":E:" }) end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
keymap.set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end)

-- dont yank on visual paste
keymap.set("v", "p", '"_dP', NS)

-- Cancel search highlighting with ESC
keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", NS)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", NS)

keymap.set("v", "<", "<gv", { desc = "Stay in indent mode" })
keymap.set("v", ">", ">gv", { desc = "Stay in indent mode" })

-- Move Lines
keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move up" })
keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", NS)

-- Treesj
keymap.set("n", "<leader>j", function()
  require('treesj').toggle({ split = { recusive = true } })
end, { noremap = true, silent = true, desc = "Toggle Split Join" })

-- System
keymap.set("n", "<leader>zc", ":e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })
keymap.set("n", "<leader>zn", ":Telescope notify<cr>", { noremap = true, silent = true, desc = "Notifications" })
keymap.set("n", "<leader>zh", ":checkhealth<cr>", { noremap = true, silent = true, desc = "Health" })
keymap.set("n", "<leader>zm", ":Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
keymap.set("n", "<leader>zl", ":Lazy<cr>", { noremap = true, silent = true, desc = "Lazy" })
keymap.set("n", "<leader>za", ":messages<cr>", { desc = "Messages" })

-- UI
keymap.set("n", "<leader>ui", ':exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>',
  { noremap = true, silent = true, desc = "Toggle Background" })
keymap.set("n", "<leader>uc", function() builtin.colorscheme({ enable_preview = true }) end, { desc = "Colorschemes" })
keymap.set("n", "<leader>ut", function() require('onedark').load() end, { desc = "transparent" })

--stylua: ignore end
