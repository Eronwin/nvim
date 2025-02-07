-- 初始化 mason.nvim
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end
mason.setup()

-- 初始化 mason-lspconfig
local masonlsp_status, masonlsp = pcall(require, "mason-lspconfig")
if not masonlsp_status then
    return
end

masonlsp.setup({
    automatic_installation = true,
    ensure_installed = {
--        "cssls",
--        "eslint",
--        "html",
--        "jsonls",
--        "ts_ls",  -- 替换 tsserver 为 ts_ls
--        "pyright",
--        "gopls",    -- Go 语言服务器
--        "tailwindcss",
--        "clangd", -- 添加 clangd
    },
})
