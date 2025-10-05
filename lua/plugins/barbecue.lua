--设置buffer上面的路径
return {
  {
    "utilyre/barbecue.nvim",
    -- lazy = true,
    -- event = "BufReadPre",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "SmiteshP/nvim-navic",
    },
    config = function()
      require('barbecue').setup({
        theme = 'tokyonight'
      })

    end
  }
}
