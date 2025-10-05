return {
    {
        "rhysd/accelerated-jk",
        event = 'VeryLazy',
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
        end,
    },
    {
        "folke/persistence.nvim",
        event = 'VeryLazy',
        config = function()
            require("persistence").setup()
            vim.keymap.set("n","<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
            vim.keymap.set("n","<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
            vim.keymap.set("n","<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
        end
    },
    {
        "ethanholz/nvim-lastplace",
        event = 'VeryLazy',
        config = true,
    },
    {
        "kamykn/spelunker.vim",
        event = 'VeryLazy',
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
      -- mark down plugins
        "ellisonleao/glow.nvim",
        event = 'VeryLazy',
        config = true,
    },
    -- {
    --     "folke/which-key.nvim",
    --     event = 'VeryLazy',
        
    --     config = true,
    -- },

    {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      ---@type false | "classic" | "modern" | "helix"
      preset = "helix",
      win = {
        -- no_overlap = true,
        title = false,
        width = 0.5,
      },
      -- stylua: ignore
      spec = {
        { "<leader>cc", group = "<CodeCompanion>", icon = "" },
        { "<leader>s",  group = "<Snacks>"                    },
        { "<leader>t",  group = "<Snacks> Toggle"             },
      },
      -- expand all nodes wighout a description
      expand = function(node)
        return not node.desc
      end,
    },
    keys = {
      -- stylua: ignore
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "[Which-key] Buffer Local Keymaps", },
    },
  },

    {
        'echasnovski/mini.ai',
        event = 'VeryLazy',
        config = true,
    },
    {
        "echasnovski/mini.comment",
        event = 'VeryLazy',
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = 'VeryLazy',
        config = true,
    },
  }
