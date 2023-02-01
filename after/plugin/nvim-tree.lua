vim.g.loaded_netrw = 1;
vim.g.loaded_netrwPlugin = 1;

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    actions = {
        open_file = {
            resize_window = false
        }
    }
});

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>");
