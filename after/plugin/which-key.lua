vim.opt.timeout = true;
vim.opt.timeoutlen = 400;

local whichkey = require("which-key");
whichkey.setup({});

whichkey.register({
    e = "Toggle file tree",
    f = {
        name = "find",
        f = "Live Grep",
        s = "Grep string",
        t = "Workspace symbols",
        b = "Fuzzy search buffer"
    },
    h = {
        name = "Git",
        p = "Goto previous hunk",
        n = "Goto next hunk",
        P = "Preview hunk",
        s = "Stage hunk",
        r = "Reset hunk",
        u = "Undo stage hunk",
        S = "Stage buffer",
        R = "Reset buffer",
        b = "Blame line",
        d = "Diff file",
    },
    o = "Flip C/C++ header and source",
    s = "Search/replace word",
    y = "Yank to global",
    p = "Paste from global",
}, { prefix = "<leader>" });

whichkey.register({
    D = "Goto declaration (LSP)",
    d = "Goto definition (LSP)",
    i = "Goto implementation (LSP)",
    r = "Goto references (LSP)"
}, { prefix = "g" });
