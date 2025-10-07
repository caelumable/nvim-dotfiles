-- 这是一个自动命令，在发送event的时候，自动执行下面的命令
-- 这里的event是LspAttatch
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    map("<leader>ln", vim.lsp.buf.rename, "[L]sp Re[n]ame")
    map("<leader>ls", require("telescope").extensions.aerial.aerial, "[L]SP [S]ymbols")
    map("<leader>la", vim.lsp.buf.code_action, "[L]sp Code [A]ction", { "n", "x" })
    map("<leader>lr", require("telescope.builtin").lsp_references, "[L]sp [R]eferences")
    map("<leader>ld", require("telescope.builtin").diagnostics, "[L]sp [D]iagnostics")
    map("<leader>li", require("telescope.builtin").lsp_implementations, "[L]sp [I]mplementation")
    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L] Document [S]ymbols")
    map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[L]sp [W]orkspace [S]ymbols")
    map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "[L]sp [T]ype Definition")
    map("<leader>lh", vim.lsp.buf.hover, "[L]sp [H]over")
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

    -- folding
    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- if client and client.supports_method 'textDocument/foldingRange' then
    --   local win = vim.api.nvim_get_current_win()
    --   vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    -- end


    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
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

local api, lsp = vim.api, vim.lsp
--lsp info
api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })
-- lsp log
api.nvim_create_user_command('LspLog', function()
  vim.cmd(string.format('tabnew %s', lsp.get_log_path()))
end, {
  desc = 'Opens the Nvim LSP client log.',
})


local complete_client = function(arg)
  return vim
    .iter(vim.lsp.get_clients())
    :map(function(client)
      return client.name
    end)
    :filter(function(name)
      return name:sub(1, #arg) == arg
    end)
    :totable()
end
api.nvim_create_user_command('LspRestart', function(info)
  for _, name in ipairs(info.fargs) do
    if vim.lsp.config[name] == nil then
      vim.notify(("Invalid server name '%s'"):format(info.args))
    else
      vim.lsp.enable(name, false)
    end
  end

  local timer = assert(vim.uv.new_timer())
  timer:start(500, 0, function()
    for _, name in ipairs(info.fargs) do
      vim.schedule_wrap(function(x)
        vim.lsp.enable(x)
      end)(name)
    end
  end)
end, {
  desc = 'Restart the given client(s)',
  nargs = '+',
  complete = complete_client,
})

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


