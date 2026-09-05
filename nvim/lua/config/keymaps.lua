-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set

-- 1. Cerrar Buffer instantáneo con Space + x
-- Eliminamos los prefijos de Trouble para que no haya espera
pcall(vim.keymap.del, "n", "<leader>xx")
pcall(vim.keymap.del, "n", "<leader>xX")
pcall(vim.keymap.del, "n", "<leader>xt")
pcall(vim.keymap.del, "n", "<leader>xT")
pcall(vim.keymap.del, "n", "<leader>xq")
pcall(vim.keymap.del, "n", "<leader>xl")

map("n", "<leader>x", function()
  if vim.g.vscode then
    require("vscode").call("workbench.action.closeActiveEditor")
  else
    require("snacks").bufdelete()
  end
end, { desc = "Close Buffer (Instant)", nowait = true })

map("n", "<leader>w", function()
  if vim.g.vscode then
    require("vscode").call("workbench.action.files.save")
  else
    vim.cmd("w")
  end
end, { desc = "Save File" })

map("n", "<leader>q", function()
  if vim.g.vscode then
    require("vscode").call("workbench.action.closeActiveEditor")
  else
    vim.cmd("q")
  end
end, { desc = "Quit / Close Editor" })

-- 2. Movimientos VS Code
map("i", "jk", "<Esc>", { desc = "Escape to Normal mode" })

-- Liberamos J y K
pcall(vim.keymap.del, "n", "J")
pcall(vim.keymap.del, "n", "K")

map("n", "J", "5j", { desc = "Move down 5 lines" })
map("v", "J", "5j", { desc = "Move down 5 lines" })
map("n", "K", "5k", { desc = "Move up 5 lines" })
map("v", "K", "5k", { desc = "Move up 5 lines" })

map("n", "<leader>l", "$", { desc = "Go to end of line" })
map("n", "<leader>h", "^", { desc = "Go to start of line" })
map("v", "<leader>l", "$", { desc = "Go to end of line" })
map("v", "<leader>h", "^", { desc = "Go to start of line" })

-- 3. Archivos y Navegación (Space + o / Space + g)
-- Movemos Git a Space + G para evitar conflicto con navegación
map("n", "<leader>G", "<leader>g", { remap = true, desc = "Git Menu (Moved)" })

map("n", "<leader>o", function()
  if vim.g.vscode then
    require("vscode").call("workbench.action.quickOpen")
  else
    require("snacks").picker.files()
  end
end, { desc = "Find Files" })

map("n", "<leader>gd", function()
  if vim.g.vscode then
    require("vscode").call("editor.action.revealDefinition")
  else
    if vim.bo.filetype == "cs" then
      local ok, omnisharp_extended = pcall(require, "omnisharp_extended")
      if ok then
        omnisharp_extended.lsp_definitions()
        return
      end
    end
    vim.lsp.buf.definition()
  end
end, { desc = "Go to Definition" })

map("n", "<leader>gr", function()
  if vim.g.vscode then
    require("vscode").call("editor.action.goToReferences")
  else
    if vim.bo.filetype == "cs" then
      local ok, omnisharp_extended = pcall(require, "omnisharp_extended")
      if ok then
        omnisharp_extended.lsp_references()
        return
      end
    end
    vim.lsp.buf.references()
  end
end, { desc = "Go to References" })

map("n", "<leader>gs", function()
  if vim.g.vscode then
    require("vscode").call("workbench.action.showAllSymbols")
  else
    require("snacks").picker.lsp_workspace_symbols()
  end
end, { desc = "Global Symbols" })

map("n", "<leader>gi", function()
  if vim.g.vscode then
    require("vscode").call("editor.action.goToImplementation")
  else
    if vim.bo.filetype == "cs" then
      local ok, omnisharp_extended = pcall(require, "omnisharp_extended")
      if ok then
        omnisharp_extended.lsp_implementation()
        return
      end
    end
    vim.lsp.buf.implementation()
  end
end, { desc = "Go to Implementation" })

map("n", "<leader>ss", function()
  if vim.g.vscode then
    require("vscode").call("workbench.action.gotoSymbol")
  else
    require("snacks").picker.lsp_symbols()
  end
end, { desc = "Document Symbols" })

-- 4. Otros atajos útiles
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
map("n", "<leader>a", function()
  if vim.g.vscode then
    require("vscode").call("editor.action.quickFix")
  else
    vim.lsp.buf.code_action()
  end
end, { desc = "Quick Fix / Code Action" })

-- Commenting with Space + c
map("n", "<leader>c", "gcc", { remap = true, desc = "Comment Line" })
map("v", "<leader>c", "gc", { remap = true, desc = "Comment Selection" })




map("n", "<leader>rn", function()
  if vim.g.vscode then
    require("vscode").call("editor.action.rename")
  else
    vim.lsp.buf.rename()
  end
end, { desc = "Rename" })

map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Visual extras
map("v", "<leader>v", "y'>p", { desc = "Duplicate selection" })
map("v", "<leader>u", "guw~", { desc = "Toggle case" })
map("v", "<leader>d", '"_d', { desc = "Delete to black hole register" })
