-- 这是一个自动命令，在发送event的时候，自动执行下面的命令
-- 这里的event是LspAttatch
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    map("<leader>rn", vim.lsp.buf.rename, "[R]ename")
    map("<leader>rs", require("telescope").extensions.aerial.aerial, "LSP Symbols")
    map("<leader>ra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
    map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
    map("grw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
    map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
    map("grh", vim.lsp.buf.hover, "Hover")
    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
    ---@param client vim.lsp.Client
    ---@param method vim.lsp.protocol.Method
    ---@param bufnr? integer some lsp support methods only in specific files
    ---@return boolean
    local function client_supports_method(client, method, bufnr) return client:supports_method(method, bufnr) end

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if
      client
      and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
    then
      local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds {
            group = "kickstart-lsp-highlight",
            buffer = event2.buf,
          }
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      vim.lsp.inlay_hint.enable(true) -- Default is enabled
      vim.keymap.set("n", "<leader>uh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        if vim.lsp.inlay_hint.is_enabled { bufnr = event.buf } then
          vim.notify("Inlay hints: " .. "ON")
        else
          vim.notify("Inlay hints: " .. "OFF")
        end
      end, { desc = "Toggle Inlay Hints" })
    end
  end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  -- underline = { severity = vim.diagnostic.severity.ERROR },
  underline = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

vim.keymap.set(
  "n",
  "[h",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.HINT, count = -1 } end,
  { desc = "Previous hint" }
)
vim.keymap.set(
  "n",
  "]h",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.HINT, count = 1 } end,
  { desc = "Next hint" }
)
vim.keymap.set(
  "n",
  "[i",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.INFO, count = -1 } end,
  { desc = "Previous info" }
)
vim.keymap.set(
  "n",
  "]i",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.INFO, count = 1 } end,
  { desc = "Next info" }
)
vim.keymap.set(
  "n",
  "[w",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.WARN, count = -1 } end,
  { desc = "Previous warning" }
)
vim.keymap.set(
  "n",
  "]w",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.WARN, count = 1 } end,
  { desc = "Next warning" }
)
vim.keymap.set(
  "n",
  "[e",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, count = -1 } end,
  { desc = "Previous error" }
)
vim.keymap.set(
  "n",
  "]e",
  function() vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, count = 1 } end,
  { desc = "Next error" }
)

-- 光标移动到这里时，自动显示diagnostic
-- vim.api.nvim_create_autocmd("CursorHold", {
--   pattern = "*",
--   callback = function()
--     vim.diagnostic.open_float(nil, {
--       focusable = false,
--       close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
--       border = "rounded",
--       scope = "cursor",
--     })
--   end,
-- })

return {
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      notification = {
        window = {
          border = "rounded",
        },
      },
    },
  },
  {
    
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
    config = function()
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
    end,
  },
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
  -- {
  --   -- Default LSP config
  --   "neovim/nvim-lspconfig",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "mason-org/mason.nvim",
  --     -- auto include vim in lua
  --     "folke/neodev.nvim",
  --   },
  --   config = function()
  --   end,
  -- },
}
