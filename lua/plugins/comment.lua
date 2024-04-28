local function setKeymap()
   vim.api.nvim_set_keymap("n", "<Leader>;", "<Plug>kommentary_line_default", {})
   vim.api.nvim_set_keymap("v", "<Leader>;", "<Plug>kommentary_visual_default<C-c>", {})
   require('kommentary.config').configure_language("c++", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
   })
end

return {
  {
    "b3nj5m1n/kommentary",
    -- lazy = true,
    -- event = "BufReadPre",
    event = "VeryLazy",
    init = function()
      setKeymap()
    end
  }
}
