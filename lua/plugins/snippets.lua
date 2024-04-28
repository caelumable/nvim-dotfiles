--[[ local function setupCmp()

end ]]

return{
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    -- event = "BufReadPre",
    event = "VeryLazy",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    init = function()
    end,
    config = function()
    end,
  }
}
