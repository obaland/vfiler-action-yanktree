local vim = require('vfiler/libs/vim')
local clipboard = require('vfiler/clipboard')
local core = require('vfiler/libs/core')

local M = {}

-- Default configs
M.configs = {
  directories_only = false,
  options_extened = '',
}

local function system(dirpath)
  local commands = { 'tree' }
  if core.is_windows then
    if not M.configs.directories_only then
      table.insert(commands, '/f')
    end
  else
    if M.configs.directories_only then
      table.insert(commands, '-d')
    end
  end
  if #M.configs.options_extened > 0 then
    table.insert(commands, M.configs.options_extened)
  end
  table.insert(commands, ('"%s"'):format(dirpath))
  return core.system(table.concat(commands, ' '))
end

function M.yank_tree_root(vfiler, context, view)
  if vim.fn.executable('tree') ~= 1 then
    core.message.warning("The 'tree' command is requrired to run this.")
    return
  end
  local path = context.root.path
  clipboard.yank(system(path))
  core.message.info('Yanked "%s" tree', path)
end

function M.yank_tree(vfiler, context, view)
  if vim.fn.executable('tree') ~= 1 then
    core.message.warning("The 'tree' command is requrired to run this.")
    return
  end
  local item = view:get_item()
  if not item then
    return
  end
  local path = item.path
  if not core.path.is_directory(path) then
    path = item.parent.path
  end
  clipboard.yank(system(path))
  core.message.info('Yanked "%s" tree', path)
end

--- Setup configs
---@param configs table
function M.setup(configs)
  core.table.merge(M.configs, configs)
  return M.configs
end

return M
