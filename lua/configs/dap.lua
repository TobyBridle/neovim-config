local ok, dap = pcall(require, "dap")
if not ok then
  print "Plugin 'dap' not found!"
  return
end

local ok, wk = pcall(require, "which-key")
if not ok then
  print "Plugin 'which-key' not found!"
  return
end

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local dap, dapui = require "dap", require "dapui"
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- We can start the debugging setup :)

-- Used by C, C++ and Rust
-- dap.adapters.codelldb = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = os.getenv "HOME" .. "/.codelldb/extension/adapter/codelldb",
--     args = { "--port", "${port}" },
--   },
-- }
--
-- dap.configurations.c = {
--   {
--     name = "C Debugger",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--   },
-- }
--
-- -- They have the same config
dap.configurations.rust = dap.configurations.c
dap.configurations.cpp = dap.configurations.c
--
-- dap.adapters.coreclr = {
--   type = "executable",
--   command = os.getenv "HOME" .. "/.local/share/nvim/mason/bin/netcoredbg",
--   args = { "--interpreter=vscode" },
-- }
--
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
}
--
-- dap.adapters.node2 = {
--   type = "executable",
--   command = "node-debug2-adapter",
--   args = {
--     vim.fn.stdpath "data" .. "/mason/bin" .. "node-debug2-adapter",
--   },
-- }
--
-- dap.configurations.javascript = {
--   {
--     type = "node2",
--     request = "launch",
--     program = "${workspaceFolder}/${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     console = "integratedTerminal",
--   },
-- }
--
-- -- We want cool sign column things for the breakpoints
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🔵", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⭕️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
