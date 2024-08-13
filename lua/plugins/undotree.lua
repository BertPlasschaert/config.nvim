return {
  "mbbill/undotree",
  config = function()
    -- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    vim.keymap.set('n', '<leader>u', "<cmd> UndotreeToggle <CR> <cmd> UndotreeFocus <CR>", {})
  end,
}
