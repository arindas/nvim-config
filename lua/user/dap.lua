local status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")

if not status_ok then
    return
end

mason_nvim_dap.setup({
    ensure_installed = { "python", "delve", "codelldb" },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

local dap_go_status_ok, dap_go = pcall(require, "dap-go")
if not dap_go_status_ok then
    return
end

dap_go.setup()

keymap("n", "<Leader>dc", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<Leader>dt", "<Cmd>lua require'dap'.terminate()<CR>", opts)
keymap("n", "<Leader>dso", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<Leader>dsi", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<Leader>dsx", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>dbc", "<Cmd>lua require'dap'.clear_breakpoints()<CR>", opts)
keymap("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
keymap("n", "<Leader>dut", "<Cmd>lua require'dapui'.toggle()<CR>", opts)
