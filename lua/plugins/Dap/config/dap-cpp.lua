local status_ok,dap = pcall(require,'dap')
if not status_ok then
  print("there is something wrong with the dap")
  return
end


-- dap.defaults.fallback.terminal_win_cmd = "10vsplit new"

local on_windows = vim.loop.os_uname().version:match 'Windows'
local suffix = on_windows and '.exe' or ''

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!

    command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb' .. suffix,
    -- command = vim.fn.stdpath('data') .. '//mason//packages//cpptools//extension//debugAdapters//bin//OpenDebugAD7' .. suffix,
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
    -- detached = true,
  }
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7' .. suffix,
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    -- type = 'cppdbg',
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
