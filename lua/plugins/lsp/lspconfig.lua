--this file config the 
-- mason : the installer for lsp server
-- mason-lspconfig : help with the lspconfig settings
-- lspconfig : the lsp client config, custormize your different lsp client(clangd,
-- rust,pyright and so on)


--the server name here, is required to the mason lsp server name,
-- "astro-language-server astro"
-- the first one is the full name of lsp server, we just need to fill in the second one
local servers = {
    "clangd",
    -- lua_ls is the lsp for lua script
    "lua_ls",
    -- "rust_analyzer",
    "cmake",
  }

local masonSettings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}



local function setupMasonAndLsp()
  local status_ok,neodev = pcall(require,"neodev")
  if not status_ok then
    print("there is something wrong with the neodev")
  else
    neodev.setup()
  end

  local fstatus_ok,fidget = pcall(require,"fidget")
  if not fstatus_ok then
    print("there is something wrong with the fidget")
  else
    fidget.setup()
  end

  require("plugins.lsp.config.handlers").setup()
  local mstatus_ok,mason = pcall(require,"mason")
  if not mstatus_ok then
    print("there is something wrong with mason")
    return
  end
  mason.setup(masonSettings)

  local mlstatus_ok,mason_lsp = pcall(require,"mason-lspconfig")
  if not mlstatus_ok then
    print("there is something wrong with mason-lspconfig")
    return
  end

  mason_lsp.setup({
    ensure_installed = servers,
    automatic_installation = true,
  })

  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    print("there is something wrong with lspconfig")
    return
  end

  local opts = {}

  for _, server in pairs(servers) do
    -- config for all of the lsp server
    opts = {
      on_attach = require("plugins.lsp.config.handlers").on_attach,
      capabilities = require("plugins.lsp.config.handlers").capabilities,
      -- the nvim inlay_hints only works on neovim nightly, version 0.10.0
      inlay_hints = {
        enabled = true,
      },
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "plugins.lsp.config." .. server)
    if not require_ok then
      print("there is something wrong with" .. "  plugins.lsp.config." .. server)
    end
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end
    -- the most important code is this one
    -- if we just use nvim-lspconfig
    -- we should write like this:
    -- require('lspconfig').pyright.setup()
    lspconfig[server].setup(opts)
  end
end


return
{
  {
    --这个配置文件是配置lspconfig的，其他的插件都是辅助使用的
    -- mason是为了装lsp server的，mason config是为了更好匹配lsp server和lsp config的
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      -- auto recognize lua vim
      "folke/neodev.nvim",
      -- 显示lsp分析的进度
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
      },
    },
    init = function()
    end,
    config = function()
        setupMasonAndLsp()
    end,
  }
}
