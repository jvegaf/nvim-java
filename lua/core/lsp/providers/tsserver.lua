local M = {}

function M.load(args)
  require("typescript-tools").setup({
    -- on_attach = args.on_attach,
    capabilities = args.capabilities,
    -- on_attach = function() ... end,
    -- handlers = { ... },
    -- ...
    settings = {
      -- spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      -- "change"|"insert_leave" determine when the client asks the server about diagnostic
      publish_diagnostic_on = "insert_leave",
      -- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
      -- specify commands exposed as code_actions
      expose_as_code_action = "all",
      -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
      -- not exists then standard path resolution strategy is applied
      tsserver_path = nil,
      -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
      -- (see 💅 `styled-components` support section)
      tsserver_plugins = {},
      -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
      -- memory limit in megabytes or "auto"(basically no limit)
      tsserver_max_memory = "auto",
      -- described below
      tsserver_format_options = {},
      -- tsserver_file_preferences = {},
      tsserver_file_preferences = {
        quotePreference = "single",
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsForImportStatements = true,
        includeCompletionsWithSnippetText = true,
        includeCompletionsForClassConstructorCalls = true,
        includeCompletionsWithoutInsertText = true,
        includeCompletionsForEmptyImports = true,
        includeCompletionsForModuleImports = true,
        includeCompletionsForImportsWithMissingImports = true,
        includeCompletionsForNonImportableModules = true,
        includeCompletionsForEmptyStrings = true,
        includeCompletionsForEnumMembers = true,
        includeCompletionsForEnums = true,
        includeCompletionsForTypeLiteralMembers = true,
        includeCompletionsForObjectLiteralMethods = true,
        includeCompletionsForInterfaces = true,
        includeCompletionsForPropertiesOfObjectLiterals = true,
        includeCompletionsForNonInterfaces = true,
        includeCompletionsForFunctions = true,
        includeCompletionsForMembersOfStructuredTypes = true,
        includeCompletionsForStructuredTypes = true,
        includeCompletionsForTypeParameters = true,
        includeCompletionsForParameters = true,
        includeInlayParameterNameHints = "all",
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        importModuleSpecifierPreference = "relative",
        importModuleSpecifierEnding = "minimal",
        importModuleSpecifierEndingStyle = "auto",
        providePrefixAndSuffixTextForRename = true,
        allowTextChangesInNewFiles = true,
        isOgonekCaseSensitive = false,
        isUpperCaseCaseSensitive = false,
        isCamelCaseSensitive = false,
        isPascalCaseSensitive = false,
      },
      code_lens = "all",
      -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
      complete_function_calls = false,
      disable_member_code_lens = false,
      jsx_close_tag = {
        enable = true,
      },
    },
  })
end

return M
