return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>r", group = "code/refactor" }, -- Register space + r as code/refactor
        { "<leader>c", group = "comment" },       -- Re-label space + c as comment
      },
    },
  },
}
