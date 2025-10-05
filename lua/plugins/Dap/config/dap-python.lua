local status_ok,dap = pcall(require,'dap')
if not status_ok then
  print("there is something wrong with the dap")
  return
end


-- dap.defaults.fallback.terminal_win_cmd = '10vsplit new'


dap.adapters.debugpy= {
  type = 'executable',
  command = 'python3.8',
  args = {'-m','debugpy.adapter'}
}

dap.configurations.python= {
  {
    type = 'debugpy',
    request = 'launch',
    name = "launch file",
    program = "${file}",
    pythonPath = function ()
      return '/usr/bin/python3.8'
    end,
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
  }
}



