return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "williamboman/mason.nvim",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require("nvim-dap-virtual-text").setup()
    require("dapui").setup()
    require("mason-nvim-dap").setup({ automatic_setup = true })
    require("mason-nvim-dap").setup_handlers()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Breakpoint Signs
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "🔵", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "⭕️", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
  end,
  keys = {
    { "<Leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", "Toggle a Breakpoint" },
    { "<F3>", "<CMD>lua require'dap'.continue()<CR>", desc = "Continue the Debugger" },
    { "<F5>", "<CMD>lua require'dap'.step_over()<CR>", desc = "Step Over" },
    { "<F7>", "<CMD>lua require'dap'.step_into()<CR>", desc = "Step Into" },
    { "<F9>", "<CMD>lua require'dap'.step_out()<CR>", desc = "Step Out" },
  },
}
