-- local function autosaveSetup()
--     local status_ok,autosave = pcall(require,"autosave")
--     if not status_ok then
--          print("there is something wrong with the autosave")
--          return
--     end

--     -- local opts = { noremap = true, silent = true }
--     -- vim.keymap.set("n","<C-s>","<cmd>ASToggle<cr>",opts)

--     autosave.setup(
--     {
--         enabled = true,
--         execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
--         events = {"InsertLeave", "TextChanged"},
--         --events = {"BufLeave"},
--         conditions = {
--             exists = true,
--             filename_is_not = {},
--             filetype_is_not = {},
--             modifiable = true
--         },
--         write_all_buffers = false,
--         on_off_commands = true,
--         clean_command_line_interval = 0,
--         debounce_delay = 135
--     }
-- )
-- end



-- return {
--   {
--       "Pocco81/AutoSave.nvim",
--       -- lazy = true,
--       event = "VeryLazy",
--       --[[ keys = {
--         {"<C-s>","<cmd>ASToggle<cr>",desc = "save"}
--       }, ]]
--       config = function()
--             autosaveSetup()
--       end,
--   }
-- }

return {}
