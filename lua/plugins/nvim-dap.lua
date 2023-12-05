return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F5>", require("dap").continue },
    { "<F9>", require("dap").toggle_breakpoint },
    { "<F10>", require("dap").step_over },
    { "<F11>", require("dap").step_into },
    { "<F12>", require("dap").step_out },
  },
  opts = {
    require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } }),
  },
}
