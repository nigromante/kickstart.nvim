return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself

    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_hidden = false,
            hide_ignored = false,
          },
        },
        window = {
          position = 'right',
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        keys = {
          { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
        },
      }
    end,
  },
}
