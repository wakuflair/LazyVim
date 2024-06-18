return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<C-F5>",
      function()
        vim.cmd.RustLsp({ "run" })
      end,
    },
    {
      "<F5>",
      function()
        local dap = require("dap")
        if dap.session() == nil then
          vim.cmd.RustLsp({ "debuggables", bang = true })
        else
          dap.continue()
        end
      end,
    },
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
    },
  },
}
