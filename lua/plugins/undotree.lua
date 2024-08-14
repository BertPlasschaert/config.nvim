return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set('n', "<C-u>", "<cmd>UndotreeToggle<CR> <cmd>UndotreeFocus<CR>", {})
    vim.g.undotree_WindowLayout = 4
  end,
}
