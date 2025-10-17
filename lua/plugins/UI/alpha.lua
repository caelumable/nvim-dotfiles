local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "chrisatmachine.com"
end


local function startup()
  local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      print("Something wrong with alpha plugins")
    end

  local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠖⠚⢉⣩⣭⡭⠛⠓⠲⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀  ]],
    [[    ⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⡀⠀⠀⠀⠀  ]],
    [[    ⠀⠀⠀⠀⢀⡴⠃⢀⡴⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀  ]],
    [[    ⠀⠀⠀⠀⡾⠁⣠⠋⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀  ]],
    [[    ⠀⠀⠀⣸⠁⢰⠃⠀⠀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀  ]],
    [[    ⠀⠀⠀⡇⠀⡾⡀⠀⠀⠀⠀⣀⣹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀  ]],
    [[    ⠀⠀⢸⠃⢀⣇⡈⠀⠀⠀⠀⠀⠀⢀⡑⢄⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ]],
    [[    ⠀⠀⢸⠀⢻⡟⡻⢶⡆⠀⠀⠀⠀⡼⠟⡳⢿⣦⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ]],
    [[    ⠀⠀⣸⠀⢸⠃⡇⢀⠇⠀⠀⠀⠀⠀⡼⠀⠀⠈⣿⡗⠂⠀⠀⠀⠀⠀⠀⠀⢸⠁  ]],
    [[    ⠀⠀⡏⠀⣼⠀⢳⠊⠀⠀⠀⠀⠀⠀⠱⣀⣀⠔⣸⠁⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀  ]],
    [[    ⠀⠀⡇⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀  ]],
    [[    ⠀⢸⠃⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⢀⠀⠀⠀⠀⠀⣾⠀⠀  ]],
    [[    ⠀⣸⠀⠀⠹⡄⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠸⠀⠀⠀⠀⠀⡇⠀⠀  ]],
    [[    ⠀⡏⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀⢰⡀⠀⠀⠀⠀⠀⡇⠀⠀  ]],
    [[    ⢰⠇⡄⠀⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣧⠀⠀  ]],
    [[    ⣸⠀⡇⠀⠀⠀⠀⠀⠀ ⠀  ⢹⠀⠀⢸⠀⠀⢀⣿⠇⠀⠀⠀ ⠀⢸⠀⠀  ]],
    [[    ⣿⠀⡇⠀⠀⠀⠀⠀⢀⡤⠤⠶⠶⠾⠤⠄⢸⠀⡀⠸⣿⣀⠀⠀⠀⠀⠀⠈⣇⠀  ]],
    [[    ⡇⠀⡇⠀⠀⡀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠸⡌⣵⡀⢳⡇⠀⠀⠀⠀⠀⠀⢹⡀  ]],
    [[    ⡇⠀⠇⠀⠀⡇⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠮⢧⣀⣻⢂⠀⠀⠀⠀⠀⠀⢧  ]],
    [[    ⣇⠀⢠⠀⠀⢳⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣆⠀⠀⠀⠀⠀⠘  ]],
}
  dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }


  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
  alpha.setup(dashboard.opts)
end


-- return {}


-- -- 创建自动命令组便于管理（避免重复创建自动命令）
-- local neotree_group = vim.api.nvim_create_augroup('NeoTreeWindowEvents', { clear = true })

-- -- 监听 neo_tree_window_before_open 事件
-- vim.api.nvim_create_autocmd('User', {
--   group = neotree_group,
--   pattern = 'neo_tree_window_before_open', -- 指定监听的事件模式
--   callback = function(args)
--     local event_data = args.data -- 事件参数保存在 args.data 中
--     -- 此处可添加你的自定义逻辑
--     -- 例如：打印事件参数以便调试
--     vim.notify(
--       string.format(
--         "Neo-tree 窗口即将打开。位置: %s, 数据源: %s, 窗口ID: %s, 标签页ID: %s",
--         event_data.position,
--         event_data.source,
--         event_data.winid,
--         event_data.tabid
--       ),
--       vim.log.levels.INFO
--     )
--   end,
--   desc = '在Neo-tree窗口打开前执行操作'
-- })



-- local neotree_group = vim.api.nvim_create_augroup('NeotreeMessages', { clear = true })

-- vim.api.nvim_create_autocmd('WinNew', {
--   group = neotree_group,
--   pattern = '*',
--   callback = function(args)
--     -- 获取当前窗口的缓冲区文件类型
--     local buf_ft = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(0), 'filetype')
--     -- 如果文件类型是neotree（Neotree窗口的缓冲区文件类型通常是'neo-tree'）
--     if buf_ft == 'neo-tree' then
--       -- 发送消息，这里使用vim.notify，你也可以使用print或者其他方式
--       vim.notify("NeoTree opened!", vim.log.levels.INFO)

--       -- 获取当前标签页的ID
--     local current_tabpage = vim.api.nvim_get_current_tabpage()
--     -- 获取当前标签页中的所有窗口ID列表
--     local windows = vim.api.nvim_tabpage_list_wins(current_tabpage)

--     --wind_id = math.max(windows[0], windows[1])
--     --vim.api.nvim_set_current_win(wind_id)
--     --vim.cmd("Alpha")

--     local target_wind=0

--     -- 遍历并打印窗口信息（可选）
--     for _, win_id in ipairs(windows) do
--         local buf_id = vim.api.nvim_win_get_buf(win_id)
--         if vim.api.nvim_buf_get_option(buf_id, 'filetype') ~= 'neo-tree' then
--          target_wind = win_id
--         -- vim.notify(string.format("targeet 窗口ID: %d", target_wind),vim.log.levels.INFO)
--         end
--         local buf_name = vim.api.nvim_buf_get_name(buf_id)
--         -- vim.notify(string.format("窗口ID: %d, 缓冲区: %s", win_id, buf_name),vim.log.levels.INFO)
--     end

--     -- vim.api.nvim_set_current_win(target_wind)
--     -- vim.cmd("Alpha")


--       -- 在这里可以执行其他操作，例如设置窗口本地的键映射等
--     end
--   end,
-- })

-- return {
--     {
--         'goolord/alpha-nvim',
--         -- event = "VeryLazy",
--         -- lazy = false,
--         event = "VimEnter",
--         dependencies = { 'nvim-tree/nvim-web-devicons' },
--         config = function ()
-- 	        startup()
--         end,
--     }
-- }
return {}
