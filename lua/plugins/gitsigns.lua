return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  keys = {
    {
      "<leader>gd",
      function()
        -- Close the diff split if one is open, otherwise open it
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
          if name:match('^gitsigns://') then
            vim.api.nvim_win_close(win, true)
            vim.cmd('diffoff!')
            return
          end
        end
        require('gitsigns').diffthis()
      end,
      desc = "Gitsigns - Toggle side-by-side diff of current file",
    },
  },
}
