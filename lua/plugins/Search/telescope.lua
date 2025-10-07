local nmap = function (keys,func,desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n',keys,func,{desc = desc})
end

local function setup()
  require('telescope').setup({
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  })

  require('telescope').load_extension('fzf')
  require('telescope').load_extension("live_grep_args")

  local builtin = require('telescope.builtin')

  -- nmap('<leader><space>', builtin.buffers, "[B]uffers" )

  nmap("<leader>/",":lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_dropdown({}))<CR>","[/]live grep")

end

return {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      lazy = true,
      event = "VeryLazy",
      keys = {
        {"<leader>f","<cmd>Telescope<cr>"},
      },
      dependencies = {
        'nvim-lua/plenary.nvim',
        {"nvim-telescope/telescope-fzf-native.nvim",build='make'},
        {
          "nvim-telescope/telescope-live-grep-args.nvim",
          -- This will not install any breaking changes.
          -- For major updates, this must be adjusted manually.
          version = "^1.0.0",
        },
      },
      config = function()
        setup()
      end
    }
    ,
	{
	  'stevearc/aerial.nvim',
	  opts = {},
	  -- Optional dependencies
	  dependencies = {
	     "nvim-treesitter/nvim-treesitter",
	     "nvim-tree/nvim-web-devicons"
	  },
    config = function ()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
-- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end
	}
}

