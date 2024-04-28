local function Setup()
require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<A-o>]],
  -- direction = 'float',
})
end

return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "VeryLazy",
    config = function ()
      require("toggleterm").setup()
      Setup()
      -- vim.keymap.set("n","<leader>t",[[<Cmd>exe v:count1 . "ToggleTerm"<CR>]])
      -- vim.keymap.set("i","<leader>t",[[<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])
    end
}
