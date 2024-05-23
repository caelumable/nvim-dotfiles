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

  -- vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
  nmap("<leader>pr",builtin.lsp_references,"[P]eek [R]efference")
  -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  nmap('<leader>ff', builtin.find_files, "[F]ind [F]iles")
  -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  nmap("<leader>fg", builtin.live_grep, "[F]ile [G]rep")
  -- vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
  nmap('<leader><space>', builtin.buffers, "[B]uffers" )
  -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  nmap('<leader>fh', builtin.help_tags, "[F]ind [H]elp")
  -- vim.keymap.set('n', '<leader>o', builtin.oldfiles, {})
  nmap('<leader>of', builtin.oldfiles, "[O]ld [F]iles")
  -- nmap('<leader>/', builtin.live_grep, "[/]grep")

  nmap("<leader>/",":lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_dropdown({}))<CR>","[/]live grep")

  --[[ vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown{
      winblend = 10,
      previewer = false,
    })
  end, {}) ]]

  --[[ nmap('<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown{
      -- winblend set the transparent of the window
      winblend = 0,
      previewer = false,
    })
  end,
  "[/]fuzzy find")
 ]]
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
}
