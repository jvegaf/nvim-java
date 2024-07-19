return {
  {
    "folke/persistence.nvim",
    lazy = false,
    enabled = false,
  },
  {
    "stevearc/resession.nvim",
    enabled = false,
    lazy = false,
    config = function()
      local resession = require("resession")
      resession.setup()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Only load the session if nvim was started with no args
          local is_java_project = vim.fn.glob('*.java') ~= ''
          if vim.fn.argc(-1) == 0 then
            -- Save these to a different directory, so our manual sessions don't get polluted
            if not is_java_project then
              resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end
        end,
      })
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
        end,
      })
    end,
  },
}
