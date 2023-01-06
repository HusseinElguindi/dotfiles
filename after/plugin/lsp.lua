local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    -- 'tsserver',
    -- 'eslint',
    'sumneko_lua',
    'rust_analyzer',
    'gopls',
    'pyright',
})

-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Insert}
-- local ultisnipsJumpForwards = function(fallback)
--     if cmp.visible() then
--         cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
--     elseif vim.fn['UltiSnips#CanJumpForwards']() == 1 then
--         vim.api.nvim_feedkeys(t('<Plug>(ultisnips_jump_forward)'), 'm', true)
--     else
--         fallback()
--     end
-- end
-- local ultisnipsJumpBackwards = function(fallback)
--     if vim.fn['UltiSnips#CanJumpBackwards']() == 1 then
--         return vim.api.nvim_feedkeys(t('<Plug>(ultisnips_jump_backward)'), 'm', true)
--     else
--         fallback()
--     end
-- end
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    -- ['<Tab>'] = cmp.mapping({
    --     c = function()
    --         if cmp.visible() then
    --             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
    --         else
    --             cmp.complete()
    --         end
    --     end,
    --     i = ultisnipsJumpForwards,
    --     s = ultisnipsJumpForwards
    -- }),
    -- ['<S-Tab>'] = cmp.mapping({
    --     i = ultisnipsJumpBackwards,
    --     s = ultisnipsJumpBackwards
    -- }),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.config.disable,
    ["<C-Space>"] = cmp.mapping.complete(),
})
local cmp_sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'ultisnips', keyword_length = 2},
    {name = 'luasnip', keyword_length = 2},
}

lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = { completeopt = 'menu,menuone,noinsert,noselect' },
    mapping = cmp_mappings,
    sources = cmp_sources,
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }), -- Enable C-n and C-p 
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline', keyword_length = 3}
    })
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- Go format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]

lsp.configure('ccls', {force_setup = true})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
