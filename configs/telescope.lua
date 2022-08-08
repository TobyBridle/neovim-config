local present, telescope = pcall(require, "telescope")

if not present then
  return
end

--  Used for custom mappings dependant on having Trouble
local trouble_found, trouble = pcall(require, "trouble.providers.telescope")

vim.g.theme_switcher_loaded = true

options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.65,
        results_width = 1,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.8,
      preview_cutoff = 120,
    },
    prompt_title = true,
    results_title = false,
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = false,
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["<C-q>"] = trouble_found and trouble.open_with_trouble,
      },
      i = { ["<C-q>"] = trouble_found and trouble.open_with_trouble },
    },
  },

  extensions_list = { "themes", "terms" },
}

-- check for any override
telescope.setup(options)

-- load extensions
pcall(function()
  for _, ext in ipairs(options.extensions_list) do
    telescope.load_extension(ext)
  end
end)
