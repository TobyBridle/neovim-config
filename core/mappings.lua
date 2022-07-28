local wk = require("which-key")
local map = function(mode, key, cmd, opts)
  vim.keymap.set(mode, key, cmd, opts or { noremap = true, silent = true })
end
--
-- Normal
map('n', 'Q', '<Nop>')
map('n', 'q:', '<Nop>') -- Stop annoying command history
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

wk.register({
    -- File Keybindings
    f = {
        name = "File",
        f = { "<CMD>Telescope find_files<CR>", "Find File"},
        b = { "<CMD>Telescope find_buffers<CR>", "Find Buffer"},
        h = { "<CMD>Telescope help_tags<CR>", "Find Help"},
        o = { "<CMD>Telescope old_files<CR>", "Find Oldfiles"},
        w = { "<CMD>Telescope live_grep<CR>", "Find Words"},
        p = { '<CMD>let @*=fnamemodify(expand("%"), ":~:.") | echo( \'"\' . (fnamemodify(expand("%"), ":~:.")) . \'" copied to clipboard\')<CR>', "Copy Relative Filepath"}
    },
    -- Buffer Keybindings
    b = {
        name = "Buffer",
        d = { "<CMD>BufferClose<CR>", "Close Buffer"}
    },
    -- Markdown Utilities Keybindings
    m = {
        name = "Markdown Utilities",
        p = { "<CMD>Glow<CR>", "Preview as Markdown"}
    },
    -- LSP Keybindings
    l = {
        g = { "<CMD>Neogen<CR>", "Generate Docstring under Cursor"},
    }
}, { prefix = "<Leader>"})

wk.register({["<Tab>"] = {"<CMD>BufferNext<CR>", "Go to next Buffer"}})
wk.register({["<S-Tab>"] = {"<CMD>BufferPrevious<CR>", "Go to previous Buffer"}})
wk.register({
    ["<C-h>"] = { "<CMD>wincmd h<CR>", "Go to left window"},
    ["<C-j>"] = { "<CMD>wincmd j<CR>", "Go to lower window"},
    ["<C-k>"] = { "<CMD>wincmd k<CR>", "Go to upper window"},
    ["<C-l>"] = { "<CMD>wincmd l<CR>", "Go to right window"},
    ["<C-p>"] = { "<CMD>BufferPin<CR>", "Pin a buffer on the bufferline"}
})

wk.register({ [","] = { "<CMD>NeoTreeShowToggle<CR>", "Show File Explorer"}})

-- Comments
wk.register({
    g = {
        c = {
            name = "Comment Utilities",
            c = { "<CMD>CommentToggle<CR>", "Toggle a comment"},
            i = { name = "Comment (in motion)"},
            a = { name = "Comment (around motion)"}
        },
        g = { "<CMD>LazyGit<CR>", "Lazygit UI"}
    }
})

wk.register({
    g = {
        c = { name = "Toggle a comment" }
    }
}, { mode = 'v' })

-- -- Treesitter Mappings
wk.register({
    ['<CR>'] = { name = "Initiate Inc Selection"}
}, { mode = 'n' })

wk.register({
    ['<CR>'] = { name = "Increment Scope Selection"},
    ['<S-CR>'] = { name = "Increment Node Selection"},
    [';'] = { name = "Decrement Node Selection"}
}, { mode = 'v' })

