local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "<leader>C", group = "TypescriptReact" },
  { "<leader>Ci", "<cmd>TSToolsAddMissingImports<Cr>", "AddMissingImports" },
  { "<leader>Co", "<cmd>TSToolsOrganizeImports<Cr>", "OrganizeImports" },
  { "<leader>Cu", "<cmd>TSToolsRemoveUnused<Cr>", "RemoveUnused" },
  { "<leader>Cr", "<cmd>TSToolsRenameFile<Cr>", "RenameFile" },
  { "<leader>Cf", "<cmd>TSToolsFixAll<Cr>", "FixAll" },
  { "<leader>Cg", "<cmd>TSToolsGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
  { "<leader>CR", "<cmd>TSToolsFileReferences<Cr>", "Find File References" },
})
