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
        local wins = vim.api.nvim_tabpage_list_wins(0)
        for _, win in ipairs(wins) do
          local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
          if name:match('^gitsigns://') then
            if #wins > 1 then
              vim.api.nvim_win_close(win, true)
            else
              -- The file window was closed (:q), leaving only the diff side:
              -- show the file again in it (the window's alternate buffer)
              vim.api.nvim_win_call(win, function()
                local alt = vim.fn.bufnr('#')
                if alt > 0 and not vim.api.nvim_buf_get_name(alt):match('^gitsigns://') then
                  vim.cmd('buffer #')
                else
                  vim.cmd('enew')
                end
              end)
            end
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
