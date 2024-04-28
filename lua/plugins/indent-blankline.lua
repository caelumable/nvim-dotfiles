
return {
  {
    -- 括号竖线
      "lukas-reineke/indent-blankline.nvim",
    --默认配置
      -- lazy = true,
      -- event = "BufReadPre",
      event = "VeryLazy",
      main = "ibl",
      opts = {},
      config = function()
        require("ibl").setup()
      end
  }
}
