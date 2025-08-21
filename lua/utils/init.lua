local fn = vim.fn
local M = {}

function M.fg(name)
  ---@type {foreground?:number}?
  local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or vim.api.nvim_get_hl(name, true)
  local fg = hl and hl.fg or hl.foreground
  return fg and { fg = string.format('#%06x', fg) }
end

--- Get highlight properties for a given highlight name
---@param name string The highlight group name
---@param fallback? table The fallback highlight properties
---@return table properties # the highlight group properties
function M.get_hlgroup(name, fallback)
  if vim.fn.hlexists(name) == 1 then
    local hl
    hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    if not hl.fg then
      hl.fg = 'NONE'
    end
    if not hl.bg then
      hl.bg = 'NONE'
    end
    return hl
  end
  return fallback or {}
end

function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

function M.list_insert_unique(dst, src)
  if not dst then
    dst = {}
  end
  assert(vim.islist(dst), 'Provided table is not a list like table')
  local added = {}
  for _, val in ipairs(dst) do
    added[val] = true
  end
  for _, val in ipairs(src) do
    if not added[val] then
      table.insert(dst, val)
      added[val] = true
    end
  end
  return dst
end

return M
