-- remap the key, the details are in 
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- copy default mappings here from defaults in next section
  --vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  --vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  ---
  -- OR use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- remove a default
  --vim.keymap.del('n', '<C-]>', { buffer = bufnr })

  -- override a default
  vim.keymap.set('n', 'l', api.node.open.edit,  opts('open'))

  -- add your mappings
  --vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  ---
end



local function ntSetup()
 local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    print("there is something wrong with nvim-tree")
    return
  end

  nvim_tree.setup {
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      root_folder_modifier = ":t",
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    on_attach = my_on_attach,
    view = {
      width = 30,
      side = "left",
    },
  }
end


return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = true,
        --keys = {
         -- {"<leader>e","<cmd>NvimTreeOpen<cr>",decs = 'open nvim tree'},
        --},
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
        -- init function will be execute when nvim start
        -- but if the lazy value is true, 
        -- the plugin won't be loaded
        -- so it's the good way to set keymaps
        init = function()
          vim.keymap.set("n","<leader>e",":NvimTreeToggle<cr>")
        end,
        config = function()
            --require("nvim-tree").setup {}
            ntSetup()
        end
    }
}
