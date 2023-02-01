local tmux = require("tmux");

tmux.setup({
    copy_sync = {
        enable = true,
        ignore_buffers = { empty = false },
        redirect_to_clipboard = false,
        register_offset = 0,
        sync_clipboard = true,
        sync_registers = true,
        sync_deletes = true,
        sync_unnamed = true,
    },
    navigation = {
        cycle_navigation = false,
        enable_default_keybindings = true,
        persist_zoom = false,
    },
    resize = {
        enable_default_keybindings = false,
        resize_step_x = 5,
        resize_step_y = 5,
    }
});

vim.keymap.set("n", "<C-left>", tmux.resize_left);
vim.keymap.set("n", "<C-down>", tmux.resize_bottom);
vim.keymap.set("n", "<C-up>", tmux.resize_top);
vim.keymap.set("n", "<C-right>", tmux.resize_right);
