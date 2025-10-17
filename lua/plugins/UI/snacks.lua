return{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    -- stylua: ignore
    keys = {
      { "<A-w>", function() require("snacks").bufdelete() end, desc = "[Snacks] Delete buffer" },
      { "<leader>si", function() require("snacks").image.hover() end, desc = "[Snacks] Display image" },
      { "<A-i>", function() require("snacks").terminal() end, desc = "[Snacks] Toggle terminal", mode = {"n",  "t"} },
      -- Notification
      { "<leader>sn", function() require("snacks").picker.notifications() end, desc = "[Snacks] [N]otification [h]istory" },
      { "<leader>snh", function() require("snacks").notifier.show_history() end, desc = "[Snacks] [N]otification" },
      { "<leader>un", function() require("snacks").notifier.hide() end, desc = "[Snacks] Dismiss all notifications" },
      -- Top Pickers & Explorer
      { "<leader><space>", function() require("snacks").picker.smart() end, desc = "[Snacks] Smart find files" },
      { "<leader>,", function() require("snacks").picker.buffers() end, desc = "[Snacks] Buffers" },
      { "<leader>sn", function() require("snacks").picker.notifications() end, desc = "[Snacks] Notification history" },
      -- find
      { "<leader>sb", function() require("snacks").picker.buffers() end, desc = "[Snacks] Buffers" },
      { "<leader>sf", function() require("snacks").picker.files() end, desc = "[Snacks] Find files" },
      { "<leader>sp", function() require("snacks").picker.projects() end, desc = "[Snacks] Projects" },
      { "<leader>sr", function() require("snacks").picker.recent() end, desc = "[Snacks] Recent" },
      -- git
      { "<C-g>", function() require("snacks").lazygit() end, desc = "[Snacks] Lazygit" },
      { "<leader>ggl", function() require("snacks").picker.git_log() end, desc = "[Snacks] Git log" },
      { "<leader>ggd", function() require("snacks").picker.git_diff() end, desc = "[Snacks] Git diff" },
      { "<leader>ggb", function() require("snacks").git.blame_line() end, desc = "[Snacks] Git blame line" },
      { "<leader>ggB", function() require("snacks").gitbrowse() end, desc = "[Snacks] Git browse" },
      -- Grep
      -- { "<leader>sb", function() require("snacks").picker.lines() end, desc = "[Snacks] Buffer lines" },
      -- { "<leader>sB", function() require("snacks").picker.grep_buffers() end, desc = "[Snacks] Grep open buffers" },
      { "<leader>sg", function() require("snacks").picker.grep() end, desc = "[Snacks] Grep" },
      -- { "<leader>sw", function() require("snacks").picker.grep_word() end, desc = "[Snacks] Visual selection or word", mode = { "n", "x" } },
      -- search
      { '<leader>s"', function() require("snacks").picker.registers() end, desc = "[Snacks] Registers" },
      { '<leader>s/', function() require("snacks").picker.search_history() end, desc = "[Snacks] Search history" },
      { "<leader>sa", function() require("snacks").picker.spelling() end, desc = "[Snacks] Spelling" },
      { "<leader>sA", function() require("snacks").picker.autocmds() end, desc = "[Snacks] Autocmds" },
      { "<leader>s:", function() require("snacks").picker.command_history() end, desc = "[Snacks] Command history" },
      { "<leader>sc", function() require("snacks").picker.commands() end, desc = "[Snacks] Commands" },
      { "<leader>sd", function() require("snacks").picker.diagnostics() end, desc = "[Snacks] Diagnostics" },
      { "<leader>sD", function() require("snacks").picker.diagnostics_buffer() end, desc = "[Snacks] Diagnostics buffer" },
      { "<leader>sH", function() require("snacks").picker.help() end, desc = "[Snacks] Help pages" },
      { "<leader>sh", function() require("snacks").picker.highlights() end, desc = "[Snacks] Highlights" },
      { "<leader>sI", function() require("snacks").picker.icons() end, desc = "[Snacks] Icons" },
      { "<leader>sj", function() require("snacks").picker.jumps() end, desc = "[Snacks] Jumps" },
      { "<leader>sk", function() require("snacks").picker.keymaps() end, desc = "[Snacks] Keymaps" },
      { "<leader>sl", function() require("snacks").picker.loclist() end, desc = "[Snacks] Location list" },
      { "<leader>sm", function() require("snacks").picker.marks() end, desc = "[Snacks] Marks" },
      { "<leader>sM", function() require("snacks").picker.man() end, desc = "[Snacks] Man pages" },
      { "<leader>sp", function() require("snacks").picker.lazy() end, desc = "[Snacks] Search for plugin spec" },
      { "<leader>sq", function() require("snacks").picker.qflist() end, desc = "[Snacks] Quickfix list" },
      { "<leader>sr", function() require("snacks").picker.resume() end, desc = "[Snacks] Resume" },
      { "<leader>su", function() require("snacks").picker.undo() end, desc = "[Snacks] Undo history" },
      -- Zen mode
      { "<leader>z", function() require("snacks").zen() end, desc = "[Snacks] Toggle Zen Mode" },
      { "<leader>Z", function() require("snacks").zen.zoom() end, desc = "[Snacks] Toggle Zoom" },
    },

    init = function()
      local Snacks = require("snacks")
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          Snacks.toggle
            .new({
              id = "Animation",
              name = "Animation",
              get = function()
                return Snacks.animate.enabled()
              end,
              set = function(state)
                vim.g.snacks_animate = state
              end,
            })
            :map("<leader>ta")

          Snacks.toggle
            .new({
              id = "scroll_anima",
              name = "Scroll animation",
              get = function()
                return Snacks.scroll.enabled
              end,
              set = function(state)
                if state then
                  Snacks.scroll.enable()
                else
                  Snacks.scroll.disable()
                end
              end,
            })
            :map("<leader>tS")

          -- Create some toggle mappings
          Snacks.toggle.dim():map("<leader>tD")

          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
          Snacks.toggle.diagnostics():map("<leader>td")
          Snacks.toggle.line_number():map("<leader>tl")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>tc")
          Snacks.toggle.treesitter():map("<leader>tT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
          Snacks.toggle.inlay_hints():map("<leader>th")
          Snacks.toggle.indent():map("<leader>tg")
          Snacks.toggle.dim():map("<leader>tD")
          -- Toggle the profiler
          Snacks.toggle.profiler():map("<leader>tpp")
          -- Toggle the profiler highlights
          Snacks.toggle.profiler_highlights():map("<leader>tph")

          vim.keymap.del("n", "grn")
          vim.keymap.del("n", "gra")
          vim.keymap.del("n", "grr")
          vim.keymap.del("n", "gri")

          vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#313244" })
        end,
      })
    end,

  config = function ()
   require("plugins.UI.config.snacks")
  end
}
