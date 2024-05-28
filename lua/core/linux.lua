vim.opt.clipboard = "unnamedplus" --- Copy-paste between vim and everything else

-- local has_wsl = function()
-- local output = vim.fn.systemlist("uname -r")
-- return not not string.find(output[1] or "", "WSL")
-- end

-- local is_wsl = has_wsl
local is_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if is_wsl then
  -- Set a compatible clipboard manager
  vim.notify("You are on WSL")
  vim.notify(os.getenv('WSL_DISTRO_NAME'))
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function()
      vim.fn.system("clip.exe", vim.fn.getreg('"'))
    end,
  })
end
