-- 在你的 cmp.lua 文件中
local status, cmp = pcall(require, "cmp")
if not status then
    return
end

local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- 替换 with_text
            maxwidth = 50, -- 显示项的最大宽度
            preset = 'default',
            menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
            }),
        }),
    },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
]])
