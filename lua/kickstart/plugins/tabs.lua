return {
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer tab' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer tab' },
      { '<leader>bx', '<cmd>bdelete<CR>', desc = 'Close current buffer' },
    },
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        separator_style = 'thin',
        always_show_bufferline = true,
        show_close_icon = false,
        show_buffer_close_icons = true,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
        },
      },
    },
  },
}
