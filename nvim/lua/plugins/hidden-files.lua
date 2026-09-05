return {
  -- Configure Neo-tree to show hidden files by default
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- Nest dot-named child files (e.g. Foo.Bar.cs) under their parent (Foo.cs)
      nesting_rules = {
        ["cs"] = {
          pattern = "(.+)%.cs$", -- capture the base name of any .cs file
          files = { "%1.*.cs" }, -- nest Foo.<anything>.cs under Foo.cs
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- Set to true to override filters, false to respect filters below
          hide_dotfiles = false, -- Do not hide hidden files (starting with .)
          hide_gitignored = false, -- Do not hide gitignored files
        },
      },
      window = {
        mappings = {
          -- LazyVim unmaps <space> (leader key); use <tab> to expand/collapse nested files
          ["<tab>"] = "toggle_node",
        },
      },
    },
  },
  -- Configure Snacks picker to search hidden files by default
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true, -- Search hidden files (dotfiles)
          },
        },
      },
    },
  },
}
