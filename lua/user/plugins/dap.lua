-- user/plugins/dap.lua

return {
  -- DAP stands for Debug Adapter Protocol
  -- Debugger configs
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("user.keymaps").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local path = "~/.home-venv/bin/python"
      require("dap-python").setup(path)
      require("user.keymaps").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dap-ui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  }
}

