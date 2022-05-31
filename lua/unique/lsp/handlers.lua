local M = {}

M.setup = function()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

-- This function can be used with NVIM 0.8
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == 'null-ls'
        end,
        bufnr = bufnr
    })
end

local function lsp_highlight_document(client)
    if client.server_capabilities.document_highlight then
        local status_ok, illuminate = pcall(require, "illuminate")
        if not status_ok then
            return
        end
        illuminate.on_attach(client)
    end
end

local function lsp_signature_help(bufnr)
    require "lsp_signature".on_attach({
        bind = true,
        handler_opts = {
            border = "single",
        }
    }, bufnr)
end

M.on_attach = function(client, bufnr, attach_opts)
    require('unique.mappings').lsp_keymaps(bufnr)
    lsp_highlight_document(client)
    lsp_signature_help(bufnr)
    -- if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            lsp_formatting(bufnr)
        end
    })
    -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
