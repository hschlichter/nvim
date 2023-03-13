local dap = require("dap");

dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
        args = {
            "dap",
            "-l",
            "127.0.0.1:${port}"
        }
    }
};

dap.configurations.go = {
    {
        name = "Launch Executable",
        type = "delve",
        mode = "exec",
        request = "launch",
        program = function ()
            return vim.fn.input("Exe: ", "", "file");
        end,
        args = function ()
            local argv = vim.fn.input("Args: ");
            local out = {};
            for w in string.gmatch(argv, "%S+") do
                table.insert(out, w);
            end
            return out;
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        name = "Attach",
        type = "delve",
        request = "attach",
        args = {},
        processId = require("dap.utils").pick_process,
    },
    {
        name = "Launch Accelerator",
        type = "delve",
        request = "launch",
        mode = "exec",
        program ="./build/unity-accelerator-v1.0.953+g918d56f-dirty-macos",
        args = {
            "tool",
            "wrun",
            "--debug",
            "--log-stdout-also",
            "-no-auto-updates",
            "-persist",
            "."
        },
        cwd = "${workspaceFolder}/build",
        stopOnEntry = false,
    }
}
