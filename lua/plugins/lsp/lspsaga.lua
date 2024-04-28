local nmap = function (keys,func,desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n',keys,func,{desc = desc})
end

local function keymap()
  nmap('<leader>rn','<cmd>Lspsaga rename ++project<cr>','[R]e[n]ame')
  nmap('<leader>h','<cmd>Lspsaga hover_doc<cr>','Hover Documentation')
  nmap('<leader>ca',"<cmd>Lspsaga code_action<cr>",'[C]ode [A]ction')
  nmap('<leader>da',require('telescope.builtin').diagnostics,'[D]i[A]gnostics')
  nmap('<leader>p','<cmd>Lspsaga peek_definition<cr>','[P]eek')
  nmap('<leader>gr',require('telescope.builtin').lsp_references,'[G]o[R]eference')
end

return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
    "neovim/nvim-lspconfig",
    },
    event = "BufReadPre",
    config = function ()
      keymap()
      require('lspsaga').setup()
    end
}
