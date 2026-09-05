return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false },
      { "<leader>gs", false },
      { "<leader>gi", false },
      { "<leader>ss", false },
      { "<leader>gI", false },
      { "<leader>gp", false },
      { "<leader>gP", false },

      { "<leader>Gd", function() require("snacks").picker.git_diff() end, desc = "Git Diff (hunks)" },
      { "<leader>GD", function() require("snacks").picker.git_diff({ base = "origin", group = true }) end, desc = "Git Diff (origin)" },
      { "<leader>Gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
      { "<leader>GS", function() require("snacks").picker.git_stash() end, desc = "Git Stash" },
      { "<leader>Gi", function() require("snacks").picker.gh_issue() end, desc = "GitHub Issues (open)" },
      { "<leader>GI", function() require("snacks").picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<leader>Gp", function() require("snacks").picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      { "<leader>GP", function() require("snacks").picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
    },
  },
}
