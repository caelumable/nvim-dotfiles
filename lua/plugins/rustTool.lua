--[[ vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
) ]]

--[[ require'lspconfig'.rust_analyzer.setup({
    -- on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            inlayHint = {
              enable = true
            }
        }
    }
}) ]]



vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
      vim.lsp.inlay_hint.enable(bufnr)
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy",
        },
        -- the rustacenvim did not provide inlayHint, it uses the nvim buildin inlayHint
        -- but the problem is, the buildin inlayHint only exists in neovim nightly
        inlayHint = {
          enable = true
        },
        typeHints = {
          enable = true,
        },
        parameterHints = {
          enable = true,
        }
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}

local nmap = function (keys,func,desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n',keys,func,{desc = desc})
end


local function SetUp()
  local bufnr = vim.api.nvim_get_current_buf()

  --it is better to use lspsaga's code action
  --[[ vim.keymap.set(
    "n",
    "<leader>a",
    function()
      vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
      -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
  ) ]]

  --[[ vim.keymap.set(
    "n",
    "ee",
    "<cmd>RustLsp explainError<cr>",
    { noremap = true, silent = true }
  ) ]]

  --[[ vim.keymap.set(
    "n",
    "ee",
    "<cmd>RustLsp renderDiagnostic<cr>",
    { noremap = true, silent = true }
  ) ]]

  nmap(
    "<leader>si",
    "<cmd>RustLsp view mir<cr>",
    "[S]how [I]nplementation"
  )

  nmap(
    "<leader>od",
    "<cmd>RustLsp openDocs<cr>",
    "[O]pen [D]ocs"
  )

end


return{
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function ()
    SetUp()
  end
}
