vim.g.mapleader= " ";

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");

vim.keymap.set("n", "<leader>p", "\"+p<cr>");
vim.keymap.set("n", "<leader>y", "\"+y<cr>");

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]);

local nvimtree = require("nvim-tree");
vim.keymap.set("n", "<leader>e", nvimtree.toggle);

local tmux = require("tmux");
vim.keymap.set("n", "<C-h>", tmux.move_left);
vim.keymap.set("n", "<C-j>", tmux.move_bottom);
vim.keymap.set("n", "<C-k>", tmux.move_top);
vim.keymap.set("n", "<C-l>", tmux.move_right);
vim.keymap.set("n", "<C-left>", tmux.resize_left);
vim.keymap.set("n", "<C-down>", tmux.resize_bottom);
vim.keymap.set("n", "<C-up>", tmux.resize_top);
vim.keymap.set("n", "<C-right>", tmux.resize_right);

local telescope = require("telescope.builtin");
vim.keymap.set("n", "<C-p>", telescope.find_files);
vim.keymap.set("n", "<C-b>", telescope.buffers);
vim.keymap.set("n", "<C-t>", telescope.lsp_document_symbols);
vim.keymap.set("n", "<leader>ff", telescope.live_grep);
vim.keymap.set("n", "<leader>fs", telescope.grep_string);
vim.keymap.set("n", "<leader>fb", telescope.current_buffer_fuzzy_find);
vim.keymap.set("n", "<leader>ft", telescope.lsp_dynamic_workspace_symbols);

vim.keymap.set("n", "<leader>o", ":ClangdSwitchSourceHeader<cr>");
