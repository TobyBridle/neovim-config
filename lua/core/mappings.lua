local wk = require "which-key"
local map = function(mode, key, cmd, opts)
  vim.keymap.set(mode, key, cmd, opts or { noremap = true, silent = true })
end
--
-- Normal
map("n", "Q", "<Nop>")
map("n", "q:", "<Nop>") -- Stop annoying command history
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Center screen on search and when scrolling
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map({ "n", "v", "i" }, "<C-d>", "<C-d>zz")
map({ "n", "v", "i" }, "<C-b>", "<C-b>zz")
-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

wk.register({
  -- File Keybindings
  f = {
    name = "File",
    f = { "<CMD>Telescope find_files<CR>", "Find File" },
    b = { "<CMD>Telescope find_buffers<CR>", "Find Buffer" },
    h = { "<CMD>Telescope help_tags<CR>", "Find Help" },
    o = { "<CMD>Telescope old_files<CR>", "Find Oldfiles" },
    w = { "<CMD>Telescope live_grep<CR>", "Find Words" },
    p = {
      '<CMD>let @*=fnamemodify(expand("%"), ":~:.") | echo( \'"\' . (fnamemodify(expand("%"), ":~:.")) . \'" copied to clipboard\')<CR>',
      "Copy Relative Filepath",
    },
  },
  -- Buffer Keybindings
  b = {
    name = "Buffer",
    d = { "<CMD>BufferLinePickClose<CR>", "Pick a Buffer to close" },
    l = { "<CMD>BufferLineMoveNext<CR>", "Move Buffer to Next Position" },
    h = { "<CMD>BufferLineMovePrev<CR>", "Move Buffer to Previous Position" },
  },
  -- Markdown Utilities Keybindings
  m = {
    name = "Markdown Utilities",
    p = { "<CMD>Glow<CR>", "Preview as Markdown" },
  },
  -- LSP Keybindings
  l = {
    g = { "<CMD>Neogen<CR>", "Generate Docstring under Cursor" },
  },
  -- Debugger Keybindings
  d = {
    d = {
      name = "Debugger",
      c = { "<CMD>lua require 'dap'.continue()<CR>", "Continue" },
      o = { "<CMD>lua require 'dap'.step_out()<CR>", "Step Out" },
      i = { "<CMD>lua require 'dap'.step_in()<CR>", "Step In" },
      b = { "<CMD>lua require 'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
      B = {
        "<CMD>lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>",
        "Set Breakpoint",
      },
      -- B = { "<CMD>lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", "Set Breakpoint"},
    },
  },
  -- Terminal Keybindings
  t = { "<CMD>lua require 'FTerm'.toggle()<CR>", "Toggle a Terminal" },
  -- Git Keybindings
  g = {
    name = "Git",
    l = { "<CMD>LazyGit<CR>", "Toggle the Lazygit UI" },
    d = { "<CMD>Gitsigns diffthis<CR>", "Show Diff using Gitsigns" },
    h = { "<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk using Gitsigns" },
    k = { "<CMD>Gitsigns prev_hunk<CR>", "Previous Hunk using Gitsigns" },
    j = { "<CMD>Gitsigns next_hunk<CR>", "Next Hunk using Gitsigns" },
    s = { "<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk using Gitsigns" },
    S = { "<CMD>Gitsigns stage_buffer<CR>", "Stage Buffer using Gitsigns" },
    u = { "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk using Gitsigns" },
    U = { "<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer using Gitsigns" },
    y = { "<CMD>Gitsigns select_hunk<CR>", "Select Hunk using Gitsigns" },
  },
}, { prefix = "<Leader>" })

wk.register { ["<Tab>"] = { "<CMD>BufferLineCycleNext<CR>", "Go to next Buffer" } }
wk.register { ["<S-Tab>"] = { "<CMD>BufferLineCyclePrev<CR>", "Go to previous Buffer" } }

wk.register { ["]t"] = { "<CMD>tabnext<CR>", "Go to next Tab" } }
wk.register { ["[t"] = { "<CMD>tabprevious<CR>", "Go to previous Tab" } }
wk.register {
  ["<C-p>"] = { "<CMD>BufferLineTogglePin<CR>", "Pin a buffer on the bufferline" },
}
wk.register { [","] = { "<CMD>NvimTreeToggle<CR>", "Show File Explorer" } }

-- Comments
wk.register {
  g = {
    c = {
      name = "Comment Utilities",
      c = { "<CMD>CommentToggle<CR>", "Toggle a comment" },
      i = { name = "Comment (in motion)" },
      a = { name = "Comment (around motion)" },
    },
  },
}

wk.register({
  g = {
    c = { name = "Toggle a comment" },
  },
}, { mode = "v" })

-- -- Treesitter Mappings
wk.register({
  ["<CR>"] = { name = "Initiate Inc Selection" },
}, { mode = "n" })

wk.register({
  ["<CR>"] = { name = "Increment Scope Selection" },
  ["<S-CR>"] = { name = "Increment Node Selection" },
  [";"] = { name = "Decrement Node Selection" },
}, { mode = "v" })

-- Todo List Keybindings
wk.register {
  ["<C-;>"] = {
    name = "Todo List",
    t = { "<CMD>TodoTrouble<CR>", "Display TODOs in Trouble" },
    s = { "<CMD>TodoTelescope<CR>", "Display TODOs in Telescope" },
  },
}

wk.register {
  [";"] = { "<CMD>nohl<CR>", "Turn off highlight" },
}

wk.register {
  ["<C-k>"] = {
    function()
      if require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      end
    end,
    "Expand Snippet / Jump to Next Item",
  },
}

wk.register({
  ["<C-k>"] = {
    function()
      if require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      end
    end,
    "Expand Snippet / Jump to Next Item",
  },
}, { mode = "s" })

wk.register {
  ["<C-l>"] = {
    function()
      if require("luasnip").choice_active() then
        require("luasnip").change_choice(1)
      end
    end,
    "Change Item Choice (Snippets)",
  },
}

wk.register {
  v = {
    x = { "<CMD>STSSelectMasterNode<CR>", "Select Master Node" },
    n = { "<CMD>STSSelectCurrentNode<CR>", "Select Current Node" },
    U = { "<CMD>STSSwapUpNormal<CR>", "Swap Up Normal" },
    D = { "<CMD>STSSwapDownNormal<CR>", "Swap Down Normal" },
    u = { "<CMD>STSSwapCurrentNodeNextNormal<CR>", "Swap Node with Next" },
    d = { "<CMD>STSSwapCurrentNodePrevNormal<CR>", "Swap Node with Previous" },
  },
}

wk.register({
  v = {
    J = { "<CMD>STSSelectNextSiblingNode<CR>", "Select Next Sibling Node" },
    K = { "<CMD>STSSelectPrevSiblingNode<CR>", "Select Previous Sibling Node" },
    H = { "<CMD>STSSelectParentNode<CR>", "Select Parent Node" },
    L = { "<CMD>STSSelectChildNode<CR>", "Select Child Node" },
  },
}, { mode = "v" })

-- Terminal Mode
wk.register({
  ["<C-h>"] = { "<CMD>lua require 'FTerm'.toggle()<CR>", "Toggle the Terminal" },
  ["<C-d>"] = { "<CMD>lua require 'FTerm'.exit()<CR>", "Close the Terminal" },
}, { mode = "t" })
