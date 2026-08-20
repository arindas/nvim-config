return {
    -- DAP
    "mfussenegger/nvim-dap",
    { "jay-babu/mason-nvim-dap.nvim", dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    { "leoluz/nvim-dap-go", ft = "go" },
}
