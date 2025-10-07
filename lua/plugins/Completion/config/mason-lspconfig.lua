local M = {}

function M.setup()
  -- blink可以实现lsp补全的关键代码
  local capabilities = require("blink.cmp").get_lsp_capabilities()

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. Available keys are:
  --  - cmd (table): Override the default command used to start the server
  --  - filetypes (table): Override the default list of associated filetypes for the server
  --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
  --  - settings (table): Override the default settings passed when initializing the server.
  --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

  -- 根据/lsp中的lua文件自动获取server名字，进行配置
  -- lua中，有{ x="a",y="b"}和{"x","y"}两种形式，前一种看作键值对表，后一种看作数组表
  -- 这里的servers={}既可以看作字典，也可以看作数组，取决与怎么使用
  -- 我们下面的写法，使得server成为了键值对表
  local servers = {}
  local dir = vim.fn.stdpath("config") .. "/lsp"
  local files_string = vim.fn.globpath(dir, '*')
  local files = vim.split(files_string, '\n')

  for _, config_file in ipairs(files) do
    local module_name = vim.fn.fnamemodify(config_file, ':t:r')
    -- server成为了键值对表
    -- table.insert(servers,module_name)
    servers[module_name] = {}
  end

  local formatting_tools = {
    "stylua",
    "prettier",
    "prettierd",
  }
  local dap = {
    "codelldb",
  }
  local ensure_installed = vim.list_extend(vim.tbl_keys(servers), formatting_tools)
  ensure_installed = vim.list_extend(ensure_installed, dap)
  require("mason").setup {}
  require("mason-lspconfig").setup {
    automatic_installation = false,
    -- automatic_enbale需要数组表，使用vim.tbl_keys获取key,组成数组表
    automatic_enable = vim.tbl_keys(servers),
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for ts_ls)
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        vim.lsp.config(server_name, server)
      end,
    },
  }
  require("mason-tool-installer").setup {
    ensure_installed = ensure_installed,
    run_on_start = false,
    start_delay = 0,
  }
  vim.cmd "MasonToolsUpdate"
end


return M
