-- user/plugins/dap.lua

return {
  -- DAP stands for Debug Adapter Protocol
  -- Debugger configs
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      -- require("user.keymaps").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local path = "~/.virtualenv/bin/python"
      require("dap-python").setup(path)
      -- require("user.keymaps").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      -- Dap UI setup
      dapui.setup({
        -- Set icons to characters that are more likely to work in every terminal.
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })
      -- Debugging keymaps
      vim.keymap.set("n", "<leader>dc", dap.continue)
      vim.keymap.set("n", "<leader>di", dap.step_into)
      vim.keymap.set("n", "<leader>do", dap.step_over)
      vim.keymap.set("n", "<leader>du", dap.step_out)
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)
      -- toggle to see last session result. Without this ,you can't see session output in case of unhandled exception.
      vim.keymap.set("n", "<F7>", dapui.toggle)

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
}

