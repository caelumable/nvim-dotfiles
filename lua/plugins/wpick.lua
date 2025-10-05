return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    config = function()
        require("window-picker").setup({
            filter_rules = {
                include_current_win = true,
                bo = {
                    filetype = { "fidget", "neo-tree" }
                }
            }
        })
        vim.keymap.set("n",
            "<c-w>p",
            function()
                local window_number = require('window-picker').pick_window()
                if window_number then vim.api.nvim_set_current_win(window_number) end
            end
        )
    end,
  }
}
