local wk = require 'which-key'
require 'syntax-tree-surfer'.setup {}

-- Normal Mode Mappings
wk.register {
    v = {
        x = { "<CMD>STSSelectMasterNode<CR>", "Select Master Node" },
        n = { "<CMD>STSSelectCurrentNode<CR>", "Select Current Node" },
        U = { "<CMD>STSSwapUpNormal<CR>", "Swap Up Normal" },
        D = { "<CMD>STSSwapDownNormal<CR>", "Swap Down Normal" },
        u = { "<CMD>STSSwapCurrentNodeNextNormal<CR>", "Swap Node with Next" },
        d = { "<CMD>STSSwapCurrentNodePrevNormal<CR>", "Swap Node with Previous" },
    }
}

-- Visual Mode Mappings
wk.register({
    v = {
        J = { "<CMD>STSSelectNextSiblingNode<CR>", "Select Next Sibling Node" },
        K = { "<CMD>STSSelectPrevSiblingNode<CR>", "Select Previous Sibling Node" },
        H = { "<CMD>STSSelectParentNode<CR>", "Select Parent Node" },
        L = { "<CMD>STSSelectChildNode<CR>", "Select Child Node" },
    },
}, { mode = 'v' })
