require("plugins.Completion.config.lsp-keymapping")
return {
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
  },
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>M",
        "<cmd>Mason<cr>",
        desc = "Open Mason",
      },
    },
    opts = {
      ui = {
        icons = {
          package_installed = "●",
          package_pending = "○",
          package_uninstalled = "○",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    -- mason会在用户交互之前调用config
    -- config中会进行vim.lsp.config操作
    -- vim.lsp.config会从runtimepath中获取lsp/*.lua配置文件,或者从用户自定义的opts中获取配置
    -- https://neovim.io/doc/user/lsp.html#_config
    -- lsp-config-merge
    -- 所以我们在runtimepath(vim.fn.stdpath("config") .. lsp) 中加入了各个lsp的配置文件，nvim就会自动读取，调用，并配置
    event = "VeryLazy",
    config = function ()
      require("plugins.Completion.config.mason-lspconfig").setup()
    end,
  },
  -- 这个插件也调用了fidget,所以上面的widget不能配置border=“rounder”
  {
    "folke/lazydev.nvim",
    lazy = false,
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  -- 虽然nvim已经内置了lspconfig，但是我们这里还是单独安装一下
  -- 方便查看lspconfig的文档
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
    end,
  },
}
