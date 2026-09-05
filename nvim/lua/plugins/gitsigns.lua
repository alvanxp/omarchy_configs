return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text = true,
        virt_text_pos = "eol",
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    },
    keys = {
      {
        "<leader>uB",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle Git Blame",
      },
    },
  },
}
