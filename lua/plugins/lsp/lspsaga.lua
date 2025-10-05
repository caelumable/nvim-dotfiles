-- 这个文件没有用了
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
  nmap('<leader>w','<cmd>Lspsaga peek_definition<cr>','[W]atch')
  -- nmap('<leader>pr',require('telescope.builtin').lsp_references,'[L]sp [R]eference')
  nmap("se","<cmd>Lspsaga show_line_diagnostics<cr>","[S]how [E]rror")
  nmap("gd","<cmd>Lspsaga goto_definition<cr>","[G]oto [D]efinition")

end

return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
    "neovim/nvim-lspconfig",
    },
    lazy = true,
    event = "BufReadPre",
    config = function ()
      keymap()
      require('lspsaga').setup()
    end
}
