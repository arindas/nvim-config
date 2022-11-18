local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

lsp_installer.setup({
    ui = { border = "rounded" },
})

local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
}

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local jsonls_opts = require("user.lsp.settings.jsonls")
jsonls_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig.jsonls.setup(jsonls_opts)

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
sumneko_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
lspconfig.sumneko_lua.setup(sumneko_opts)

local pyright_opts = require("user.lsp.settings.pyright")
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup(pyright_opts)

local clangd_opts = require("user.lsp.settings.clangd")
clangd_opts = vim.tbl_deep_extend("force", clangd_opts, opts)
lspconfig.clangd.setup(clangd_opts)

lspconfig.gopls.setup(opts)

lspconfig.zls.setup(opts)

local syntax_ok, rust_tools = pcall(require, "rust-tools")
if not syntax_ok then
    return
end

local function rust_tools_keymaps(bufnr)
    local keymap_custom_opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(
        bufnr,
        "n",
        "<leader>rc",
        "<cmd>lua pcall(require('rust-tools.open_cargo_toml').open_cargo_toml)<CR>",
        keymap_custom_opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>rr",
        "<cmd>lua pcall(require('rust-tools.runnables').runnables)<CR>",
        keymap_custom_opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>rd",
        "<cmd>lua pcall(require('rust-tools.debuggables').debuggables)<CR>",
        keymap_custom_opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>re",
        "<cmd>lua pcall(require('rust-tools.expand_macro').expand_macro)<CR>",
        keymap_custom_opts
    )
end

local function rust_tools_on_attach(client, bufnr)
    opts.on_attach(client, bufnr)
    rust_tools_keymaps(bufnr)
end

local codelldb_home = vim.env.HOME .. "/applications/codelldb/extension/"
local codelldb_path = codelldb_home .. 'adapter/codelldb'
local liblldb_path = codelldb_home .. 'lldb/lib/liblldb.so'

rust_tools.setup({
    server = {
        on_attach = rust_tools_on_attach,
        capabilities = opts.capabilities,
    },

    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
})

-- configure LspInfo window border
local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
    local lspinfoconfig = _default_opts(options)
    lspinfoconfig.border = "rounded"
    return lspinfoconfig
end
