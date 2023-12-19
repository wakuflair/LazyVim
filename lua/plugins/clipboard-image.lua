return {
  "dfendr/clipboard-image.nvim",
  opts = { -- Default configuration for all filetype
    default = {
      img_dir = { "%:p:h", "img" },
      img_name = function()
        vim.fn.inputsave()
        local name = vim.fn.input("Name: ")
        vim.fn.inputrestore()

        if name == nil or name == "" then
          return os.date("%y-%m-%d-%H-%M-%S")
        end
        return name
      end,
      affix = "<\n  %s\n>", -- Multi lines affix
    },
    -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
    -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
    -- Missing options from `markdown` field will be replaced by options from `default` field
    markdown = {
      img_handler = function(img) -- New feature from PR #22
        local script = string.format('./image_compressor.sh "%s"', img.path)
        os.execute(script)

        -- set alt-text
        vim.cmd("normal! f[") -- go to [
        vim.cmd("normal! a" .. img.name) -- append text with image name,
      end,
    },
  },
  ft = { "tex", "markdown" },
  keys = {
    { "<leader>i", "<cmd>PasteImg<cr>", desc = "Paste image" },
  },
}
