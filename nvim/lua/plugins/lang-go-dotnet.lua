return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          enable_roslyn_analyzers = true,
          organize_imports_on_save = true,
          enable_import_completion = true,
          -- Disabling inlay hints to prevent 'out of range' errors without breaking semantic tokens
          enable_inlay_hints = false,
        },
      },
    },
  },
}
