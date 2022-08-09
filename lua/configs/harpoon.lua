local has_harpoon, harpoon = pcall(require, "harpoon")
if not has_harpoon then
  return
end

-- Add Harpoon as a Telescope Extension (if telescope is installed)
local has_telescope, telescope = pcall(require, "telescope")
if has_telescope then
  telescope.load_extension "harpoon" -- :Telescope harpoon marks
end

local has_wk, wk = pcall(require, "which-key")

if has_wk then
  for _, mode in ipairs { "n", "v" } do
    wk.register({
      h = {
        name = "Harpoon",
        s = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Add position to Harpoon" },
        i = { "<CMD>lua require 'harpoon.ui'.toggle_quick_menu()<CR>", "View Harpoon UI" },
      },
    }, { mode = mode, prefix = "<Leader>" })
    for j = 1, 9 do
      wk.register({
        h = {
          ["" .. j .. ""] = {
            "<CMD>lua require('harpoon.ui').nav_file(" .. j .. ")<CR>",
            "Jump to mark " .. j .. "",
          },
        },
      }, { mode = mode, prefix = "<Leader>" })
    end
  end
else
  vim.keymap.set({ "n", "v" }, "<Leader>hs", "<CMD>lua require('harpoon.mark').add_file()<CR>")
  vim.keymap.set({ "n", "v" }, "<Leader>hi", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>")
end
