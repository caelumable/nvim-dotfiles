-- 第一次使用前，:Copilot auth 进行登录
-- 这个插件已经在blink进行了配置
-- 使用前需要打开vpn
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    lazy = true,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        cpp = true,
        lua = true,
        python = true,
        rust = true,
        java = true,
      },
    },
  },
}
