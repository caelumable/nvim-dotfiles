local function setColorScheme()
  local status_ok,tokyonight = pcall(require,"tokyonight")
  if not status_ok then
    print("there is something wrong with the tokyonight")
  end

  local configs = {}
  configs.style = 'moon'
  configs.transparent = true
  configs.styles = {
    sidebars = 'transparent',
    floats = 'transparent'
  }
  tokyonight.setup(configs)
end




return {
  {
     "folke/tokyonight.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
      lazy = false,
      priority = 1000,
      init = function()
        vim.cmd[[colorscheme tokyonight-moon]]
      end,
      config = function()
        setColorScheme()
      end,
      opts = {},
  },
}
