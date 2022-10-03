-- fix ui issues here
--
-- current bg=#0c0c0c

vim.cmd([[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignHint text=ﴞ texthl=DiagnosticSignHint linehl= numhl=

  " General UI
  "hi Pmenu guibg=#0c0c0c
  hi PmenuSel gui=bold
  hi NormalFloat guibg=#0c0c0c
  hi FloatBorder guifg=#0c0c0c guibg=#0c0c0c

  " Telescope
  hi TelescopeNormal guibg=#0c0c0c
  hi TelescopeBorder guifg=#0c0c0c guibg=#0c0c0c
  hi TelescopeMatching guifg=#82aaFF gui=bold

  " LspSaga
  hi LspSagaHoverBorder guifg=#0c0c0c guibg=#0c0c0c
  hi LspSagaPreviewBorder guifg=#0c0c0c guibg=#0c0c0c
  hi LspSagaCodeActionBorder guifg=#0c0c0c guibg=#0c0c0c
  hi LspSagaDiagnosticBorder guifg=#0c0c0c guibg=#0c0c0c
  hi LspSagaLspFinderBorder guifg=#0c0c0c guibg=#0c0c0c

  " Illuminate
  hi IlluminatedWordText gui=NONE
  hi IlluminatedWordRead gui=bold 
  hi IlluminatedWordWrite gui=bold

  " Cmp
  hi CmpItemAbbrDeprecated guifg=#7E8294 guibg=NONE gui=strikethrough
  hi CmpItemAbbrMatch guifg=#82AAFF guibg=NONE gui=bold
  hi CmpItemAbbrMatchFuzzy guifg=#82AAFF guibg=NONE gui=bold
  hi CmpItemMenu guifg=#C792EA guibg=NONE gui=italic

  hi CmpItemKindField guifg=#EED8DA guibg=NONE
  hi CmpItemKindProperty guifg=#EED8DA guibg=NONE
  hi CmpItemKindEvent guifg=#EED8DA guibg=NONE

  hi CmpItemKindText guifg=#C3E88D guibg=NONE
  hi CmpItemKindEnum guifg=#C3E88D guibg=NONE
  hi CmpItemKindKeyword guifg=#C3E88D guibg=NONE

  hi CmpItemKindConstant guifg=#FFE082 guibg=NONE,
  hi CmpItemKindConstructor guifg=#FFE082 guibg=NONE
  hi CmpItemKindReference guifg=#FFE082 guibg=NONE

  hi! CmpItemKindFunction guifg=#EADFF0 guibg=NONE
  hi CmpItemKindStruct guifg=#EADFF0 guibg=NONE
  hi CmpItemKindClass guifg=#EADFF0 guibg=NONE
  hi CmpItemKindModule guifg=#EADFF0 guibg=NONE
  hi CmpItemKindOperator guifg=#EADFF0 guibg=NONE

  hi CmpItemKindVariable guifg=#C5CDD9 guibg=NONE
  hi CmpItemKindFile guifg=#C5CDD9 guibg=NONE

  hi CmpItemKindUnit guifg=#F5EBD9 guibg=NONE
  hi CmpItemKindSnippet guifg=#F5EBD9 guibg=NONE
  hi CmpItemKindFolder guifg=#F5EBD9 guibg=NONE

  hi CmpItemKindMethod guifg=#DDE5F5 guibg=NONE
  hi CmpItemKindValue guifg=#DDE5F5 guibg=NONE
  hi CmpItemKindEnumMember guifg=#DDE5F5 guibg=NONE

  hi CmpItemKindInterface  guifg=#D8EEEB guibg=NONE
  hi CmpItemKindColor guifg=#D8EEEB guibg=NONE
  hi CmpItemKindTypeParameter guifg=#D8EEEB guibg=NONE

  " xunit
  hi XVirtNormal guifg=#dde5f5 gui=italic,bold
  hi XVirtPassed guifg=#5fe268 gui=bold
  hi XVirtFailed guifg=#de5d68 gui=bold

]])
