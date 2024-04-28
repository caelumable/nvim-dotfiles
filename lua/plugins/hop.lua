local function setKeymap()
  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap.set
  keymap('n','fw',':HopWord<cr>',opts)
  keymap('n','fl',':HopLine<cr>',opts)
  keymap('n','fc',':HopChar1<cr>',opts)


  --[[ local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, {remap=true})
  vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, {remap=true})
  vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, {remap=true})
  vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, {remap=true}) ]]
end

return {
  {
    'phaazon/hop.nvim',
    -- lazy = false,
    event = "VeryLazy",
    init = function()
      setKeymap()
    end,
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
}
