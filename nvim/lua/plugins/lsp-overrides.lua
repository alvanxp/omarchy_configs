return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].keys = opts.servers["*"].keys or {}
      
      table.insert(opts.servers["*"].keys, { "K", false })
      table.insert(opts.servers["*"].keys, { "gh", vim.lsp.buf.hover, desc = "LSP Hover Documentation" })

      -- Dynamically change all LSP mappings from `<leader>c` to `<leader>r`
      for _, key in ipairs(opts.keys or {}) do
        if type(key) == "table" and key[1] and key[1]:find("^<leader>c") then
          key[1] = key[1]:gsub("^<leader>c", "<leader>r")
        end
      end
    end,
  },
}

