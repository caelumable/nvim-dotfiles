-- This is a lua config for minuet-ai.nvim
-- 已经在blink中进行了配置
-- 使用前需要打开vpn
return {
    {
        'milanglacier/minuet-ai.nvim',
        dependencies = {
          { 'nvim-lua/plenary.nvim' },
          { 'Saghen/blink.cmp' },
        },
        event = 'VeryLazy',
        config = function()
        require('minuet').setup {
            provider = 'openai_fim_compatible',
            provider_options = {
                  openai_compatible = {
                      -- 这个model一定要写，不能省略
                      model = "deepseek-chat",
                      end_point = 'https://api.deepseek.com/chat/completions',
                      api_key = 'DEEPSEEK_API_KEY',
                      name = 'deepseek',
                      optional = {
                          max_tokens = 256,
                          top_p = 0.9,
                      },
                  },
            },
            virtualtext = {
                auto_trigger_ft = {"lua","go", "c", "cpp", "python", "rust", "sql"},
                keymap = {
                    accept = '<A-y>',
                    -- accept_line = '<A-a>',
                    -- accept_n_lines = '<A-z>',
                    next = '<A-]>',
                    prev = '<A-[>',
                    dismiss = '<A-e>'
                }
            },
            -- Whether show virtual text suggestion when the completion menu
            -- (nvim-cmp or blink-cmp) is visible.
            show_on_completion_menu = false

      }
        end,
    },
}
