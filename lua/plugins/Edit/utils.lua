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
    {
        'echasnovski/mini.ai',
        event = 'VeryLazy',
        config = true,
    },
    -- heilight todo comments
    -- TODO: heilight
    {
      "folke/todo-comments.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/snacks.nvim",
      },
      event = "VeryLazy",
      -- stylua: ignore
      keys = {
        ---@diagnostic disable-next-line: undefined-field
        { "<leader>st", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "BUG", "FIXIT", "HACK", "WARN", "ISSUE"  } }) end, desc = "[TODO] Pick todos (without NOTE)", },
        ---@diagnostic disable-next-line: undefined-field
        { "<leader>sT", function() require("snacks").picker.todo_comments() end, desc = "[TODO] Pick todos (with NOTE)", },
      },
      config = true,
    },
}
