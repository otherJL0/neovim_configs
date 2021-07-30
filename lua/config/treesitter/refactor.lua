return {
  -- Highlights definition and usage of the current symbol under the cursor
  highlight_definitions = { enable = true },

  -- Highlights the block from the current scope where the cursor is
  highlight_current_scope = { enable = true },

  -- Renames the symbol under the cursor within the current scope
  smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },

  -- Provides "go to definition" for the symbol under the cursor,
  -- and lists the definitions from the current file.
  -- If you use goto_definition_lsp_fallback instead of goto_definition
  -- in the config below, vim.lsp.buf.definition is used if
  -- nvim-treesitter can not resolve the variable.
  navigation = {
    enable = true,
    keymaps = {
      goto_definition = 'gnd',
      list_definitions = 'gnD',
      list_definitions_toc = 'g0',
      -- go to the next/previous usage of the identifier under the cursor.
      goto_next_usage = '<a-*>',
      goto_previous_usage = '<a-#>',
    },
  },
}
