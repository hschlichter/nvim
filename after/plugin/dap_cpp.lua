local dap = require("dap");

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
        args = {
            "--port",
            "${port}"
        }
    }
};

dap.configurations.cpp = {
    {
        name = "Launch Unity(Debug)",
        type = "codelldb",
        request = "launch",
        expressions = "native",
        program = "./build/MacEditor/arm64/Debug/Unity.app/Contents/MacOS/Unity",
        args = function ()
            local projectPath = vim.fn.input("Enter project path: ", "", "file");
            return {
                "-projectPath",
                projectPath
            };
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
    {
        name = "Launch Unity(Release)",
        type = "codelldb",
        request = "launch",
        expressions = "native",
        program = "./build/MacEditor/arm64/Release/Unity.app/Contents/MacOS/Unity",
        args = function ()
            local projectPath = vim.fn.input("Enter project path: ", "", "file");
            return {
                "-projectPath",
                projectPath
            };
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
    {
        name = "Launch Unity Nativetests",
        type = "codelldb",
        request = "launch",
        expressions = "native",
        program = "./build/MacEditor/arm64/Debug/Unity.app/Contents/MacOS/Unity",
        args = function ()
            local testname = vim.fn.input("Enter native test name: ");
            return {
                 "-runNativeTests",
                 testname,
            };
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        stdio = nil,
    },
    {
        name = "Launch Executable C/C++",
        type = "codelldb",
        request = "launch",
        expressions = "native",
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
        name = "Attach C/C++",
        type = "codelldb",
        request = "attach",
        args = {},
        pid = require("dap.utils").pick_process,
    },
};
dap.configurations.c = dap.configurations.cpp;
