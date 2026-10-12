-- Claude Code IDE integration. Claude runs in its own tmux pane (start it with
-- `claude --ide`, or run `/ide` inside an existing session) and sees the
-- current file/selection. It edits files directly (Claude /config: Diff tool =
-- terminal); changed buffers reload via the checktime autocmd.

-- Switch to the tmux pane (in any window of this session) that runs Claude
-- Code, preferring one started in nvim's cwd. The native install shows up as
-- its version number (e.g. "2.1.296").
local function focus_claude_pane()
  if not vim.env.TMUX then return end
  local panes = vim.fn.systemlist({
    "tmux", "list-panes", "-s", "-F", "#{pane_id} #{pane_current_command} #{pane_current_path}",
  })
  local target
  for _, line in ipairs(panes) do
    local id, cmd, path = line:match("^(%S+) (%S+) (.*)$")
    if cmd == "claude" or (cmd and cmd:match("^%d+%.%d+%.%d+$")) then
      if path == vim.fn.getcwd() then
        target = id
        break
      end
      target = target or id
    end
  end
  if target then
    vim.fn.system({ "tmux", "select-window", "-t", target })
    vim.fn.system({ "tmux", "select-pane", "-t", target })
  end
end

return {
  "coder/claudecode.nvim",
  -- Load at startup so the server is running before Claude looks for an IDE
  lazy = false,
  opts = {
    terminal = { provider = "none" },
  },
  config = function(_, opts)
    require("claudecode").setup(opts)
    vim.api.nvim_create_autocmd("User", {
      pattern = "ClaudeCodeSendComplete",
      callback = focus_claude_pane,
    })
  end,
  keys = {
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude - Send selection" },
    { "<leader>cs", "<cmd>ClaudeCodeTreeAdd<cr>", ft = "oil", desc = "Claude - Add file" },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude - Add current buffer" },
  },
}
