local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
    return
end

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    return
end

dapui.setup()

dap.listeners.after['event_initialized']["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before['event_terminated']["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before['event_exited']["dapui_config"] = function()
    dapui.close()
end
