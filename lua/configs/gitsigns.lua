local gs_ok, gs = pcall(require, "gitsigns")
if not gs_ok then
  print "Something went wrong with Gitsigns!"
  return
end

local custom_ok, custom = pcall(require, "core.custom")
if not custom_ok then
  print "Something went wrong when loading core.custom!"
  return
end

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  print "Something went wrong with Which-Key!"
  return
end

local M = {}

if custom.line_blame == true then
  M.current_line_blame = custom.line_blame
end

M.on_attach = function(bufnr)
  wk.register({
    g = {
      name = "Git",
      d = { "<CMD>Gitsigns diffthis<CR><C-w>x", "Show Diff using Gitsigns" },
      h = { "<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk using Gitsigns" },
      k = { "<CMD>Gitsigns prev_hunk<CR>", "Previous Hunk using Gitsigns" },
      j = { "<CMD>Gitsigns next_hunk<CR>", "Next Hunk using Gitsigns" },
      s = { "<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk using Gitsigns" },
      S = { "<CMD>Gitsigns stage_buffer<CR>", "Stage Buffer using Gitsigns" },
      u = { "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk using Gitsigns" },
      U = { "<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer using Gitsigns" },
      y = { "<CMD>Gitsigns select_hunk<CR>", "Select Hunk using Gitsigns" },
      b = {
        "<CMD>Gitsigns toggle_current_line_blame<CR>",
        "Toggle Blame Line",
      },
    },
  }, { prefix = "<Leader>" })
  -- Add text-objects
  vim.keymap.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
  vim.keymap.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
end
gs.setup(M)
