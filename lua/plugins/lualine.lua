-- side bar
--


return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = "ColorScheme",
    config = function()
      require('lualine').setup({
        options = {
          theme = "tokyonight",
        },
      })
    end
  }
}
