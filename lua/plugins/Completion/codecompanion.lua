return{
  -- 这个插件自动从环境变量中读取 API Key
  -- 命名规范就是adapter名称大写加 _API_KEY
  -- 比如 Deepseek 就是 DEEPSEEK_API_KEY
  {
  "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.diff",
      "j-hui/fidget.nvim",
    },
    init = function()
      -- 这个是在使用codecompanion时显示进度的插件
      -- 但是不知道为什么没有自动加载
      -- 文件中说fidget.process找不到
      -- 升级插件后就好了
      require("plugins.utils.codecompanion_fidget_spinner"):init()
    end,
    -- stylua: ignore
    keys = {
      {"<leader>cca", "<CMD>CodeCompanionActions<CR>",     mode = {"n", "v"}, noremap = true, silent = true, desc = "CodeCompanion actions"      },
      {"<leader>cci", "<CMD>CodeCompanion<CR>",            mode = {"n", "v"}, noremap = true, silent = true, desc = "CodeCompanion inline"       },
      {"<leader>ccc", "<CMD>CodeCompanionChat Toggle<CR>", mode = {"n", "v"}, noremap = true, silent = true, desc = "CodeCompanion chat (toggle)"},
      {"<leader>ccp", "<CMD>CodeCompanionChat Add<CR>",    mode = {"v"}     , noremap = true, silent = true, desc = "CodeCompanion chat add code"},
    },

    opts = {
      display = {
        diff = {
          enabled = true,
          provider = "mini_diff",
        },
      },
      strategies = {
        chat = { adapter = "deepseek" },
        inline = { adapter = "deepseek" },
        cmd = { adapter = "deepseek" },
      },
      opts = {
        language = "Chinese", -- "English"|"Chinese"
      },
    },
  },
}
