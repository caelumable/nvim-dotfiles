local dap = require('dap')


-- open terminal on left, this terminal will lose focus
-- when the input event is satisfied
-- dap.defaults.fallback.terminal_win_cmd = "10vsplit new"



dap.adapters.python= {
    type = 'executable',
    command = "/usr/bin/python3",
    args = { '-m', 'debugpy.adapter' },
  }

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}", -- debug current file
    -- pythonPath = function()
    --   return '/usr/bin/python3.10'
    -- end,
    console = "integratedTerminal", -- give a terminal for debuger, enbale input situation
  },
}
