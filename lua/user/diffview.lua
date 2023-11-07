local Diffview = {}

Diffview.config = function()
  local status_ok, diff_view = pcall(require, "diffview")
  if not status_ok then
    return
  end

  diff_view.setup {
    default_args = {
      DiffviewFileHistory = { "%" },
    },
    hooks = {
      diff_buf_read = function()
        vim.wo.wrap = false
        vim.wo.list = false
        vim.wo.colorcolumn = ""
      end,
    },
    enhanced_diff_hl = true,
    keymaps = {
      view = { q = "<cmd>DiffviewClose<CR>" },
      file_panel = { q = "<cmd>DiffviewClose<CR>" },
      file_history_panel = { q = "<cmd>DiffviewClose<CR>" },
    },
  }
end

return Diffview
