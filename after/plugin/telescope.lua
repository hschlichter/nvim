require("telescope").setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.8 }
        }
    },
    pickers = {
        find_files = {
            find_command = {"rg", "--files"},
            previewer = false,
            theme = "ivy"
        },
        buffers = {
            previewer = false,
            theme = "ivy"
        },
        live_grep = {
            theme = "ivy"
        },
        grep_string = {
            theme = "ivy"
        },
        lsp_dynamic_workspace_symbols = {
            fname_width = 50,
            theme = "ivy"
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

require("telescope").load_extension("fzf");

local builtin = require("telescope.builtin");
vim.keymap.set("n", "<C-p>", builtin.find_files, {});
vim.keymap.set("n", "<C-b>", builtin.buffers, {});
vim.keymap.set("n", "<C-t>", builtin.lsp_dynamic_workspace_symbols, {});
vim.keymap.set("n", "<leader>ff", builtin.live_grep, {});
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {});
