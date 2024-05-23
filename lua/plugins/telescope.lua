return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "top" },
        winblend = 0,
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          },
        },
      })
    end,
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Grep (root dir) with args",
      },
    },
    config = function(_, opts)
      local tele = require("telescope")
      tele.setup(opts)
      tele.load_extension("live_grep_args")
    end,
  },
}
