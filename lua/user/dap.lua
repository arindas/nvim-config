local dap = require('dap')
dap.configurations.cpp = {
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
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
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
