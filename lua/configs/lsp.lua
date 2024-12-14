-- 尝试加载 lspconfig 插件，如果加载失败则直接返回
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

-- 加载 Neovim 内置的 LSP 协议模块
local protocol = require("vim.lsp.protocol")

-- 在 LSP 附加到缓冲区时调用的函数
local on_attach = function(client, bufnr)
    -- 如果 LSP 服务器支持格式化功能，则在保存时自动格式化
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.formatting_seq_sync()  -- 调用 LSP 格式化功能
            end,
        })
    end
end

-- 设置 LSP 客户端的能力，例如补全功能
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- TypeScript 的 LSP 配置
nvim_lsp.ts_ls.setup({
    on_attach = on_attach,  -- 当 LSP 服务器连接到缓冲区时调用 on_attach 函数
    capabilities = capabilities,  -- 设置 LSP 客户端的能力
})

-- Python 的 LSP 配置
nvim_lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Go 的 LSP 配置
nvim_lsp.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- -- CSS 的 LSP 配置
-- nvim_lsp.cssls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

-- -- Tailwind CSS 的 LSP 配置
-- nvim_lsp.tailwindcss.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

-- Clangd (C/C++ language server)
nvim_lsp.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})