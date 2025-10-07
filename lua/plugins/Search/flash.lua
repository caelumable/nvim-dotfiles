local function SetUp()
  vim.keymap.set({"n","x","o"},"f",
      function()
          require("flash").jump({
              search = {
                  mode = function(str)
                      return "\\<" .. str
                  end,
              },
          })
      end
  )
  vim.keymap.set({"n","x","o"},"S",
      function()
          require("flash").treesitter()
      end
  )
  vim.keymap.set({"o"},"r",
      function()
          require("flash").remote()
      end
  )
  vim.keymap.set({"o","x","n"},"R",
      function()
          require("flash").treesitter_search()
      end
  )

end


return {
  {
   "folke/flash.nvim",
    event = "BufReadPost",
    opts = {
      label = {
        rainbow = {
          enabled = true,
          shade = 1,
        },
      },
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      -- stylua: ignore
      { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "[Flash] Jump"              },
      -- stylua: ignore
      { "<leader>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "[Flash] Treesitter"        },
      -- stylua: ignore
      { "<leader>F", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "[Flash] Treesitter Search" },
      -- stylua: ignore
      { "<c-f>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "[Flash] Toggle Search"     },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 }, matches = false },
            jump = { pos = "end" },
            pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
          })
        end,
        desc = "[Flash] Line jump",
      },
      -- {
      --   "<leader>k",
      --   mode = { "n", "x", "o" },
      --   function()
      --     require("flash").jump({
      --       search = { mode = "search", max_length = 0 },
      --       label = { after = { 0, 0 }, matches = false },
      --       jump = { pos = "end" },
      --       pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
      --     })
      --   end,
      --   desc = "[Flash] Line jump",
      -- },
    },
    config = function(_,opts)
      require("flash").setup(opts)
      SetUp()
    end
  }
}
