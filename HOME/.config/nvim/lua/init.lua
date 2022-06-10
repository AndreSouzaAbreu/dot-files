--------------------------------------------------------------------------------
-- PLUGINS

-- some plugins need no config
require("Comment").setup()
require("which-key").setup()
require("stabilize").setup()
require("virt-column").setup()
require("spellsitter").setup()
require("nvim-ts-autotag").setup()

-- fold preview
require('pretty-fold').setup()
require('pretty-fold.preview').setup()

-- visualize indentation
require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = true,
})

-- buffer line
require("bufferline").setup({
  auto_hide = true,
  icon_close_tab = 'x',
  maximum_padding = 1,
  insert_at_end = true,
})

-- tree sitter
require("nvim-treesitter.configs").setup({
  -- One of "all", "maintained" (parsers with maintainers), or list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for
    -- example if you want to disable highlighting for the `tex` filetype, you
    -- need to include `latex` in this list as this is the name of the parser)

    -- list of language that will be disabled
    disable = { "latex", "markdown", "shell", "vim", "commonlisp", "make"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same
    -- time. Set this to `true` if you depend on 'syntax' being enabled (like
    -- for indentation). Using this option may slow down your editor, and you
    -- may see some duplicate highlights. Instead of true it can also be a list
    -- of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
  }
})


-- orgmode
-- require('orgmode').setup_ts_grammar()
-- require('orgmode').setup({
--   org_agenda_files = {'~/documents/planning/*.org'},
--   org_default_notes_file = '~/documents/planning/goals.org',
-- })
