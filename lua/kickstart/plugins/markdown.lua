return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)

      local function set_render_markdown_highlights()
        local set_hl = vim.api.nvim_set_hl
        local function link(group, target) set_hl(0, group, { link = target }) end

        -- Use calmer, colorscheme-native groups instead of loud Diff* defaults.
        link('RenderMarkdownH1Bg', 'Normal')
        link('RenderMarkdownH2Bg', 'Normal')
        link('RenderMarkdownH3Bg', 'Normal')
        link('RenderMarkdownH4Bg', 'Normal')
        link('RenderMarkdownH5Bg', 'Normal')
        link('RenderMarkdownH6Bg', 'Normal')

        link('RenderMarkdownCode', 'NormalFloat')
        link('RenderMarkdownCodeBorder', 'NormalFloat')
        link('RenderMarkdownCodeInline', 'CursorLine')
        link('RenderMarkdownCodeInfo', 'Comment')

        link('RenderMarkdownBullet', 'Special')
        link('RenderMarkdownDash', 'Comment')
        link('RenderMarkdownQuote', 'Comment')
      end

      set_render_markdown_highlights()
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = set_render_markdown_highlights,
      })
    end,
    opts = {
      render_modes = { 'n', 'c' },
      heading = {
        -- Nerd Font (Material) header level icons.
        icons = { ' 󰉫 ', ' 󰉬 ', ' 󰉭 ', ' 󰉮 ', ' 󰉯 ', ' 󰉰 ' },
        position = 'inline',
      },
    },
  },
}
