-- Set leader key to space
-- vim.g.mapleader = ","

local keymap = vim.keymap
local NS = { noremap = true, silent = true }

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>q", ":q!<CR>") -- quit without saving
keymap.set("n", "W", ":w<CR>") -- save
keymap.set("n", "Q", ":bdelete<CR>") -- close buffer

-- Buffers
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "<Tab>", ":BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap.set("n", "<leader>bb", ":e #<cr>", { desc = "Switch to Other buffer" })

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger
keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- FileBrowser
keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":Telescope file_browser<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles, { desc = "Recent files" })
keymap.set("n", "<leader>fc", require("telescope.builtin").git_commits, { desc = "Git Commit" })
keymap.set("n", "<leader>fe", require("telescope.builtin").git_files, { desc = "Git files" })
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Find help" })
keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Search in buffer" })
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, { desc = "Document symbols" })
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, { desc = "Incoming calls" })
keymap.set("n", "<leader>fm", function()
  require("telescope.builtin").treesitter({ default_text = ":method:" })
end, { desc = "Find methods" })

-- Git-blame
-- keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function()
  require("harpoon.ui").nav_file(1)
end)
keymap.set("n", "<leader>h2", function()
  require("harpoon.ui").nav_file(2)
end)
keymap.set("n", "<leader>h3", function()
  require("harpoon.ui").nav_file(3)
end)
keymap.set("n", "<leader>h4", function()
  require("harpoon.ui").nav_file(4)
end)
keymap.set("n", "<leader>h5", function()
  require("harpoon.ui").nav_file(5)
end)
keymap.set("n", "<leader>h6", function()
  require("harpoon.ui").nav_file(6)
end)
keymap.set("n", "<leader>h7", function()
  require("harpoon.ui").nav_file(7)
end)
keymap.set("n", "<leader>h8", function()
  require("harpoon.ui").nav_file(8)
end)
keymap.set("n", "<leader>h9", function()
  require("harpoon.ui").nav_file(9)
end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
keymap.set("n", "<leader>lI", ":LspInfo<cr>", { desc = "LSP Info" })
-- keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- keymap.set('n', 'gd', function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { desc = "definition"})
-- keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = "Goto Declaration"})
-- keymap.set('n', 'gI', function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { desc = "Goto implementation"})
-- keymap.set('n', 'gy', function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { desc = "Goto type_definition"})
-- keymap.set('n', 'gr', '<cmd>:Telescope lsp_references<CR>', { desc = "References"})
keymap.set("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename Buffer" })
-- keymap.set('n', 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "format buffer"})
-- keymap.set({ 'n', 'v' }, 'gq', function() require("conform").format({ async = true, lsp_format = "fallback" }) end, { desc = "Format"})
-- keymap.set('n', '<leader>xc', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = "Code Action"})
-- keymap.set('n', '<leader>xx', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Open Float"})
keymap.set("n", "<leader>xo", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev diagnostic" })
keymap.set("n", "<leader>xp", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "Document Symbol" })
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "References" })

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", "<leader>lo", function()
  if vim.bo.filetype == "java" then
    require("jdtls").organize_imports()
  end
end)

keymap.set("n", "<leader>lu", function()
  if vim.bo.filetype == "java" then
    require("jdtls").update_projects_config()
  end
end)

keymap.set("n", "<leader>tc", function()
  if vim.bo.filetype == "java" then
    require("jdtls").test_class()
  end
end)

keymap.set("n", "<leader>tm", function()
  if vim.bo.filetype == "java" then
    require("jdtls").test_nearest_method()
  end
end)

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
keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)
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

keymap.set("n", "vv", "V", NS)

keymap.set("v", "<", "<gv", { desc = "Stay in indent mode" })
keymap.set("v", ">", ">gv", { desc = "Stay in indent mode" })

-- Move Lines
keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc>:m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc>:m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", NS)

-- System
keymap.set("n", "<leader>zc", ":e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })
keymap.set("n", "<leader>zn", ":Telescope notify<cr>", { noremap = true, silent = true, desc = "Notifications" })
keymap.set("n", "<leader>zh", ":checkhealth<cr>", { noremap = true, silent = true, desc = "Health" })
keymap.set("n", "<leader>zm", ":Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
keymap.set("n", "<leader>zl", ":Lazy<cr>", { noremap = true, silent = true, desc = "Lazy" })
keymap.set("n", "<leader>za", ":messages<cr>", { desc = "Messages" })

-- UI
keymap.set(
  "n",
  "<leader>ui",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>',
  { noremap = true, silent = true, desc = "Toggle Background" }
)
keymap.set("n", "<leader>uc", function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Colorschemes" })
