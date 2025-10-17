local header =
[[
         ⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠖⠚⢉⣩⣭⡭⠛⠓⠲⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⡀⠀⠀⠀⠀
        ⠀⠀⠀⠀⢀⡴⠃⢀⡴⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀
        ⠀⠀⠀⠀⡾⠁⣠⠋⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀
        ⠀⠀⠀⣸⠁⢰⠃⠀⠀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀
        ⠀⠀⠀⡇⠀⡾⡀⠀⠀⠀⠀⣀⣹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀
        ⠀⠀⢸⠃⢀⣇⡈⠀⠀⠀⠀⠀⠀⢀⡑⢄⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇
        ⠀⠀⢸⠀⢻⡟⡻⢶⡆⠀⠀⠀⠀⡼⠟⡳⢿⣦⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇
        ⠀⠀⣸⠀⢸⠃⡇⢀⠇⠀⠀⠀⠀⠀⡼⠀⠀⠈⣿⡗⠂⠀⠀⠀⠀⠀⠀⠀⢸⠁
        ⠀⠀⡏⠀⣼⠀⢳⠊⠀⠀⠀⠀⠀⠀⠱⣀⣀⠔⣸⠁⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀
        ⠀⠀⡇⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀
        ⠀⢸⠃⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⢀⠀⠀⠀⠀⠀⣾⠀⠀
        ⠀⣸⠀⠀⠹⡄⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠸⠀⠀⠀⠀⠀⡇⠀⠀
        ⠀⡏⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀⢰⡀⠀⠀⠀⠀⠀⡇⠀⠀
        ⢰⠇⡄⠀⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣧⠀⠀
        ⣸⠀⡇⠀⠀⠀⠀⠀⠀ ⠀  ⢹⠀⠀⢸⠀⠀⢀⣿⠇⠀⠀⠀ ⠀⢸⠀⠀
        ⣿⠀⡇⠀⠀⠀⠀⠀⢀⡤⠤⠶⠶⠾⠤⠄⢸⠀⡀⠸⣿⣀⠀⠀⠀⠀⠀⠈⣇⠀
        ⡇⠀⡇⠀⠀⡀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠸⡌⣵⡀⢳⡇⠀⠀⠀⠀⠀⠀⢹⡀
        ⡇⠀⠇⠀⠀⡇⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠮⢧⣀⣻⢂⠀⠀⠀⠀⠀⠀⢧
        ⣇⠀⢠⠀⠀⢳⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣆⠀⠀⠀⠀⠀⠘  ]]

local lopts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  bigfile = { enabled = true },
  -- dashboard = { enabled = false},
  dashboard = {
    preset = {
      keys = {
        { icon = '󰈞 ', key = 'f', desc = 'Find files', action = ':lua Snacks.picker.smart()' },
        { icon = ' ', key = 'o', desc = 'Find history', action = 'lua Snacks.picker.recent()' },
        { icon = ' ', key = 'e', desc = 'New file', action = ':enew' },
        { icon = ' ', key = 'o', desc = 'Recent files', action = ':lua Snacks.picker.recent()' },
        { icon = '󱎸 ', key = 't', desc = 'Find text', action = ':lua Snacks.picker.grep()', enabled = package.loaded.lazy ~= nil },
        { icon = ' ', key = 'c', desc = 'Configuration', action = ':e $MYVIMRC', enabled = package.loaded.lazy ~= nil },
        { icon = ' ', key = 'p', desc = 'Find Project', action = ':lua Snacks.picker.projects()', enabled = package.loaded.lazy ~= nil },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
      header = header,
    },
    sections = {
      { section = 'header' },
      { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
    },
  },

  explorer = { enabled = false },
  image = {
    enabled = true,
    doc = { inline = false, float = false, max_width = 80, max_height = 40 },
    math = { latex = { font_size = "small" } },
  },
  indent = {
    enabled = true,
    animate = {
      enabled = false,
    },
    indent = {
      only_scope = true,
    },
    scope = {
      enabled = true, -- enable highlighting the current scope
      underline = true, -- underline the start of the scope
    },
    chunk = {
      -- when enabled, scopes will be rendered as chunks, except for the top-level scope which will be rendered as a scope.
      enabled = true,
    },
  },
  input = { enabled = true },
  lazygit = {
    enabled = true,
    configure = false,
  },
  notifier = {
    enabled = true,
    style = "notification",
  },
  picker = {
    enabled = true,
    previewers = {
      diff = {
        builtin = false, -- use Neovim for previewing diffs (true) or use an external tool (false)
        cmd = { "delta" }, -- example to show a diff with delta
      },
      git = {
        builtin = false, -- use Neovim for previewing git output (true) or use git (false)
        args = {}, -- additional arguments passed to the git command. Useful to set pager options using `-c ...`
      },
    },
    sources = {
      spelling = {
        layout = { preset = "select" },
      },
    },
    win = {
      input = {
        keys = {
          ["<Tab>"] = { "select_and_prev", mode = { "i", "n" } },
          ["<S-Tab>"] = { "select_and_next", mode = { "i", "n" } },
          ["<A-Up>"] = { "history_back", mode = { "n", "i" } },
          ["<A-Down>"] = { "history_forward", mode = { "n", "i" } },
          ["<A-j>"] = { "list_down", mode = { "n", "i" } },
          ["<A-k>"] = { "list_up", mode = { "n", "i" } },
          ["<C-u>"] = { "preview_scroll_up", mode = { "n", "i" } },
          ["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
          ["<A-u>"] = { "list_scroll_up", mode = { "n", "i" } },
          ["<A-d>"] = { "list_scroll_down", mode = { "n", "i" } },
          ["<c-j>"] = {},
          ["<c-k>"] = {},
        },
      },
    },
    layout = {
      preset = "telescope",
    },
  },
  quickfile = { enabled = true },
  scroll = { enabled = false },
  -- Create keymappings of `ii` and `ai` for textobjects (in visual mode), and `[i` and `]i` for jumps
  scope = {
    enabled = true,
    cursor = false,
  },

  statuscolumn = {
    enabled = true,
    left = { "mark", "sign" }, -- priority of signs on the left (high to low)
    right = { "fold", "git" }, -- priority of signs on the right (high to low)
    folds = {
      open = true, -- show open fold icons
      git_hl = false, -- use Git Signs hl for fold icons
    },
    refresh = 50, -- refresh at most every 50ms
  },

  terminal = {
    enabled = true,
  },
  words = { enabled = true },
  styles = {
    terminal = {
      relative = "editor",
      border = "rounded",
      position = "float",
      backdrop = 60,
      height = 0.9,
      width = 0.9,
      zindex = 50,
    },
  },
}

require("snacks").setup(lopts)
