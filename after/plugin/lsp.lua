local lsp = require("lsp-zero");
lsp.preset("recommended");
lsp.ensure_installed({
    "tsserver",
    "eslint",
    "clangd",
    "gopls",
    "pyright",
    "rust_analyzer",
    "omnisharp"
});

local cmp = require("cmp");
local cmp_select = { behavior = cmp.SelectBehavior.Select };
lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true })
    })
});

lsp.set_preferences({
    suggest_lsp_servers = false
});
lsp.configure("clangd", {});
lsp.configure("gopls", {});
lsp.configure("pyright", {});
lsp.configure("rust_analyzer", {});
lsp.configure("tsserver", {});
lsp.configure("omnisharp", {});
lsp.on_attach(function(_, bufnr)
    local bufopts = { noremap = false, silent = true, buffer = bufnr };
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts);
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts);
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts);
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts);
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts);
end);
lsp.nvim_workspace();
lsp.setup();

vim.diagnostic.config({
    virtual_text = true,
});
