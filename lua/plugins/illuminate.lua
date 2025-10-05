-- 显示光标放置的地方的相同的单词
return {
  {
    "RRethy/vim-illuminate",
    -- lazy = true,
    -- event = "BufReadPre",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure()
    end
  }
}
