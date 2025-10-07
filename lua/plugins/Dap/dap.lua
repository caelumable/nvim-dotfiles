local function setKeymap()
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dapui').eval()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
end

local function Setup()

  require("plugins.Dap.config.dap-ui")
  require("plugins.Dap.config.dap-cpp")
  require("plugins.Dap.config.dap-python")


--   local status_ok,dap = pcall(require,"dap")
--    if not status_ok then
--       print("there is something wrong with dap")
--       return
--   end


--   dap.adapters.python ={
--   type = "executable",
--   command = "/usr/bin/python3",
--   args = {"-m","debugpy.adapter"},
-- }

-- dap.configurations.python = {
--   {
--     type="python",
--     request = "launch",
--     name = "debug file",
--     program = "${file}",
--     console = "integratedTerminal",
--     -- terminal = 'integrated',
--     -- console = "internalConsole",
--   },
-- }



-- 		local dapstatus_ok,dapui = pcall(require,"dapui")
--   if not dapstatus_ok then
--     print("there is something wrong with dapui")
--     return
--   end

--   require("dapui").setup()

--   dap.listeners.before.attach.dapui_config = function()
--     dapui.open()
--   end
--   dap.listeners.before.launch.dapui_config = function()
--     dapui.open()
--   end
--   dap.listeners.before.event_terminated.dapui_config = function()
--     dapui.close()
--   end
--   dap.listeners.before.event_exited.dapui_config = function()
--     dapui.close()
--   end



  -- require("plugins.Dap.config.dap-virtual-text")

  -- require("nvim-dap-virtual-text").setup({})
  -- local status_ok,dap = pcall(require,"dap")
  -- if not status_ok then
  --   print("there is something wrong with dap")
  --   return
  -- end

  -- local dapstatus_ok,dapui = pcall(require,"dapui")
  -- if not dapstatus_ok then
  --   print("there is something wrong with dapui")
  --   return
  -- end

  -- require("dapui").setup()


  -- dap.listeners.before.attach.dapui_config = function()
  --   dapui.open()
  -- end
  -- dap.listeners.before.launch.dapui_config = function()
  --   dapui.open()
  -- end
  -- dap.listeners.before.event_terminated.dapui_config = function()
  --   dapui.close()
  -- end
  -- dap.listeners.before.event_exited.dapui_config = function()
  --   dapui.close()
  -- end
end


return {
  {
    'mfussenegger/nvim-dap',
     dependencies = {
      -- 'nvim-treesitter/nvim-treesitter',
      'theHamsta/nvim-dap-virtual-text',
      -- "rcarriga/nvim-dap-ui"
      { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    },
    lazy = false,
    init = function()
      setKeymap()
    end,
    config = function()
      Setup()
    end
  }
}
