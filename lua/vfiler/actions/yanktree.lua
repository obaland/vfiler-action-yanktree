local vim = require('vfiler/libs/vim')
local clipboard = require('vfiler/clipboard')
local core = require('vfiler/libs/core')

local M = {}

-- Default configs
M.configs = {
  ignore_directories = {},
  options = '',
}

local function system(dirpath, directory_only)
  local commands = { 'tree' }
  if core.is_windows then
    if not directory_only then
      table.insert(commands, '/f')
    end
  else
    if directory_only then
      table.insert(commands, '-d')
    end
    -- TODO:
    if #M.configs.ignore_directories > 0 then
      local ignores = M.configs.ignore_directories
      table.insert(commands, ("-I '%s'"):format(table.concat(ignores, '|')))
    end
  end
  if #M.configs.options > 0 then
    table.insert(commands, M.configs.options)
  end
  table.insert(commands, ('"%s"'):format(dirpath))
  return core.system(table.concat(commands, ' '))
end

local function yank_tree_root(context, view, directory_only)
  if vim.fn.executable('tree') ~= 1 then
    core.message.warning("The 'tree' command is requrired to run this.")
    return
  end
  local path = context.root.path
  clipboard.yank(system(path, directory_only))
  core.message.info('Yanked "%s" tree', path)
end

local function yank_tree(context, view, directory_only)
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
  clipboard.yank(system(path, directory_only))
  core.message.info('Yanked "%s" tree', path)
end

function M.yank_tree_root(vfiler, context, view)
  yank_tree_root(context, view, false)
end

function M.yank_tree(vfiler, context, view)
  yank_tree(context, view, false)
end

function M.yank_directory_tree_root(vfiler, context, view)
  yank_tree_root(context, view, true)
end

function M.yank_directory_tree(vfiler, context, view)
  yank_tree(context, view, true)
end

--- Setup configs
---@param configs table
function M.setup(configs)
  core.table.merge(M.configs, configs)
  return M.configs
end

return M
