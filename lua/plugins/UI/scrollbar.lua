return{
{
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        copilot = {
          icon = "",
          color = "#cba6f7", -- Catppuccin.mocha.mauve
          name = "Copilot",
        },
      },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function(_, _)
      require("colorizer").setup()
    end,
  },
  {
      "petertriho/nvim-scrollbar",
      opts = {
        handelers = {
          gitsigns = true, -- Requires gitsigns
          search = true, -- Requires hlslens
        },
        marks = {
          Search = {
            color = "#CBA6F7",
          },
          GitAdd = { text = "┃" },
          GitChange = { text = "┃" },
          GitDelete = { text = "_" },
        },
      },
  },
}
