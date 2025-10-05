local nmap = function (keys,func,desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n',keys,func,{desc = desc})
end

return {
  {
    "akinsho/bufferline.nvim",
    -- lazy = true,
    -- https://github.com/akinsho/bufferline.nvim/issues/786
    -- solving this problem
    -- event = "BufReadPre",
    event = "VeryLazy",
    config = function()
      nmap("<leader>bd","<cmd>BufferLinePickClose<cr>","[B]uffer [D]elete")
      require('bufferline').setup()
    end
  }
}
