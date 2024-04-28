return {
  {
    "akinsho/bufferline.nvim",
    -- lazy = true,
    -- https://github.com/akinsho/bufferline.nvim/issues/786
    -- solving this problem
    -- event = "BufReadPre",
    event = "VeryLazy",
    config = function()
      require('bufferline').setup()
    end
  }
}
