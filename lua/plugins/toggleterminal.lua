function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local nmap = function (keys,func,desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n',keys,func,{desc = desc})
end



local function Setup()
  require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    open_mapping = [[<A-o>]],
    -- direction = 'float',
  })

  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap.set

  nmap("<leader>ta","<cmd>ToggleTermToggleAll<cr>","[T]oggle [A]ll terminals")
  nmap("<leader>ts","<cmd>TermSelect<cr>","[T]erm [S]elect")
  -- nmap("<leader>tn","<cmd>ToggleTerm"..tostring(vim.g['terminal_index']).." and lua vim.g['terminal_index']  = vim.g['terminal_index'] +1 <cr>","[T]erm [S]elect")

  vim.g['terminal_index']= 1
  nmap([[<A-;>]],function ()
    vim.cmd("ToggleTerm"..tostring(vim.g['terminal_index']))
    vim.g['terminal_index'] = vim.g['terminal_index'] + 1
  end,"[T]erminal [N]ew")


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
