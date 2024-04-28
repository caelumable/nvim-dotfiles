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
    {
        "folke/which-key.nvim",
        event = 'VeryLazy',
        config = true,
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
