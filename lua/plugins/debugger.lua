local input = vim.fn.input

return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = {
        "dart",
        "js-debug-adapter",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    keys = {
      {
        "<localleader>dbp",
        -- function() require('dap').toggle_breakpoint() end,
        function()
          require("persistent-breakpoints.api").toggle_breakpoint()
        end,
        desc = "dap: toggle breakpoint",
      },
      {
        "<localleader>dbc",
        -- function() require('dap').set_breakpoint(input('Breakpoint condition: ')) end,
        function()
          require("persistent-breakpoints.api").set_breakpoint("Breakpoint condition: ")
        end,
        desc = "dap: set conditional breakpoint",
      },
      {
        "<localleader>dbm",
        function()
          require("dap").set_breakpoint(nil, nil, input("Log point message: "))
        end,
        desc = "dap: log breakpoint",
      },
      {
        "<localleader>dbx",
        -- function() require('dap').clear_breakpoints() end,
        function()
          require("persistent-breakpoints.api").clear_all_breakpoints()
        end,
        desc = "dap: clear breakpoint",
      },
      {
        "<localleader>dc",
        function()
          require("dap").continue()
        end,
        desc = "dap: continue or start debugging",
      },
      {
        "<localleader>dh",
        function()
          require("dap").step_back()
        end,
        desc = "dap: step back",
      },
      {
        "<localleader>di",
        function()
          require("dap").step_into()
        end,
        desc = "dap: step into",
      },
      {
        "<localleader>do",
        function()
          require("dap").step_over()
        end,
        desc = "dap: step over",
      },
      {
        "<localleader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "dap: step out",
      },
      {
        "<localleader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "dap: toggle repl",
      },
      {
        "<localleader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "dap: hover",
      },
      {
        "<localleader>dx",
        function()
          require("dap").terminate()
        end,
        desc = "dap: terminate",
      },
      {
        "<localleader>du",
        function()
          require("dapui").toggle({ reset = true })
        end,
        desc = "dap-ui: toggle",
      },
    },
    config = function()
      local fn = vim.fn
      local dap = require("dap")

      -- DON'T automatically stop at exceptions
      dap.defaults.fallback.exception_breakpoints = {}

      fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
      })

      fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DapBreakpointRejected",
        linehl = "",
        numhl = "",
      })

      fn.sign_define("DapStopped", {
        text = "󱉌",
        texthl = "DapStopped",
        linehl = "",
        numhl = "",
      })

      fn.sign_define("DapBreakpointCondition", {
        text = "󰙧",
        texthl = "DapStopped",
        linehl = "",
        numhl = "",
      })

      fn.sign_define("DapLogPoint", {
        text = "󰃷",
        texthl = "DapStopped",
        linehl = "",
        numhl = "",
      })

      local ui_ok, dapui = pcall(require, "dapui")
      if not ui_ok then
        return
      end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.nlua = function(callback, config)
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or 8086,
        })
      end

      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
          host = function()
            local value = vim.fn.input("Host [127.0.0.1]: ")
            return value ~= "" and value or "127.0.0.1"
          end,
          port = function()
            local val = tonumber(vim.fn.input("Port: "))
            assert(val, "Please provide a port number")
            return val
          end,
        },
      }

      dap.configurations.java = {
        {
          name = "Debug Launch (2GB)",
          type = "java",
          request = "launch",
          vmArgs = "" .. "-Xmx2g ",
        },
        {
          name = "Debug Attach (8000)",
          type = "java",
          request = "attach",
          hostName = "127.0.0.1",
          port = 8000,
        },
        {
          name = "Debug Attach (5005)",
          type = "java",
          request = "attach",
          hostName = "127.0.0.1",
          port = 5005,
        },
        {
          name = "My Custom Java Run Configuration",
          type = "java",
          request = "launch",
          -- You need to extend the classPath to list your dependencies.
          -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
          -- classPaths = {},

          -- If using multi-module projects, remove otherwise.
          -- projectName = "yourProjectName",

          -- javaExec = "java",
          mainClass = "replace.with.your.fully.qualified.MainClass",

          -- If using the JDK9+ module system, this needs to be extended
          -- `nvim-jdtls` would automatically populate this property
          -- modulePaths = {},
          vmArgs = "" .. "-Xmx2g ",
        },
      }

      local js_debug = require("mason-registry").get_package("js-debug-adapter")
      local debug_server_path = js_debug:get_install_path() .. "/js-debug/src/dapDebugServer.js"

      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { debug_server_path, "${port}" },
        },
      }

      for _, language in ipairs({
        "typescript",
        "typescriptreact",
        "javascript",
        "svelte",
      }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file (pwa-node)",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach program (pwa-node, select pid)",
            cwd = "${workspaceFolder}/src",
            processId = require("dap.utils").pick_process,
            sourceMaps = true,
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
            skipFiles = {
              "<node_internals>/**",
              "${workspaceFolder}/node_modules/**/*.js",
            },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file (pwa-node with ts-node)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "--loader", "ts-node/esm" },
            runtimeExecutable = "node",
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file (pwa-node with deno)",
            runtimeExecutable = "deno",
            runtimeArgs = {
              "run",
              "--inspect-wait",
              "--allow-all",
            },
            program = "${file}",
            cwd = "${workspaceFolder}",
            attachSimplePort = 9229,
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch test current file (pwa-node with jest)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = {
              -- '${workspaceFolder}/node_modules/.bin/jest',
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            runtimeExecutable = "node",
            args = { "${file}", "--coverage", "false" },
            rootPath = "${workspaceFolder}",
            sourceMaps = true,
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch test current file (pwa-node with vitest)",
            cwd = vim.fn.getcwd(),
            program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
            args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
            autoAttachChildProcesses = true,
            smartStep = true,
            console = "integratedTerminal",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch test current file (pwa-node with deno)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "test", "--inspect-brk", "--allow-all", "${file}" },
            runtimeExecutable = "deno",
            attachSimplePort = 9229,
          },
          {
            type = "pwa-chrome",
            name = "Launch Chrome to debug client",
            request = "launch",
            url = "http://localhost:5173",
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}/src",
            -- skip files from vite's hmr
            skipFiles = {
              "**/node_modules/**/*",
              "**/@vite/*",
              "**/src/client/*",
              "**/src/*",
            },
          },
          -- Debug web applications (client side)
          {
            type = "pwa-chrome",
            name = "Launch & Debug Chrome",
            request = "launch",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:3000" }, function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            sourceMaps = true,
            protocol = "inspector",
            webRoot = vim.fn.getcwd(),
            userDataDir = false,
          },
        }
      end
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        opts = {
          windows = { indent = 2 },
        },
        dependencies = {
          { "nvim-neotest/nvim-nio" },
        },
      },
      { "theHamsta/nvim-dap-virtual-text", opts = { all_frames = true } },
      {
        "Weissle/persistent-breakpoints.nvim",
        opts = { load_breakpoints_event = { "BufReadPost" } },
      },
    },
  },
}
