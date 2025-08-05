return {
  {
    "mfussenegger/nvim-dap",
    keys = {
          { "<leader>db", mode = "n" },
          { "<leader>dc", mode = "n" },
          { "<leader>do", mode = "n" },
          { "<leader>di", mode = "n" },
          { "<leader>dO", mode = "n" },
          { "<leader>dq", mode = "n" },
          { "<leader>du", mode = "n" },
    },
    dependencies = {
      { "nvim-neotest/nvim-nio", 
        lazy = true,
      },
      { "rcarriga/nvim-dap-ui",
        lazy = true,
      },
      { "mfussenegger/nvim-dap-python", 
        lazy = true,
      },
      { "theHamsta/nvim-dap-virtual-text", 
        lazy = true,
      },
    },
    config = function()
      local dap        = require("dap")
      local dapui      = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local opts = { noremap = true, silent = true }

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs,
          vim.tbl_extend("force", opts, { desc = desc })
        )
      end

      map("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, "Debug: Toggle Breakpoint")

      map("n", "<leader>dc", function()
        dap.continue()
      end, "Debug: Continue/Start")

      map("n", "<leader>do", function()
        dap.step_over()
      end, "Debug: Step Over")

      map("n", "<leader>di", function()
        dap.step_into()
      end, "Debug: Step Into")

      map("n", "<leader>dO", function()
        dap.step_out()
      end, "Debug: Step Out")

      map("n", "<leader>dq", function()
        dap.terminate()
      end, "Debug: Terminate Debugging")

      map("n", "<leader>du", function()
        dapui.toggle()
      end, "Debug: Toggle UI")
    end,
  },
}
