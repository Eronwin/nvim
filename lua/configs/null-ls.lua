do 
    local ok, proto_map = pcall(function() return vim.lsp.protocol._request_name_to_capability end)
    if ok and proto_map then
        vim.lsp._request_name_to_capability = proto_map
    end 
end





local status, nls = pcall(require, "null-ls")


if not status then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

nls.setup({
    sources = {

        -- Formatting
        fmt.prettierd,
        fmt.eslint_d,
        fmt.prettier.with({
            filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
        }),
        fmt.stylua,
        fmt.rustfmt,
        fmt.black.with({
            extra_args = { "--line-length", "88" },
        }),

        -- Diagnostics
        dgn.eslint_d,
        dgn.shellcheck,
        dgn.pylint.with({
            method = nls.methods.DIAGNOSTICS_ON_SAVE,
        }),

        -- Code Actions
        cda.eslint_d,
        cda.shellcheck,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
