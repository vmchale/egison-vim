scriptencoding utf-8

if !exists('main_syntax')
  if exists('b:current_syntax')
      finish
  endif
  let main_syntax = 'egison'
endif

syn match egiComment "\v;.*$" contains=atsTodo,@Spell
syn keyword egiTodo TODO FIXME contained
syn match egiIdentifier "\v[a-zα-ω][a-zA-Z_0-9α-ωΑ-Ω]*"
syn match egiBoolean "#t"
syn match egiBoolean "#f"

syn match egiInt "\v[0-9]+"

syn keyword egiKeyword define lambda

syn match egiSpecial +\v\\["n\\]+
syn region egiString start=+"+ end=+"+ contains=atsSpecial
syn match egiChar "\v'.'"
syn match egiChar "\v'.*'" contains=atsSpecial

highlight link egiKeyword Keyword
highlight link egiIdentifier Identifier
highlight link egiInt Number
highlight link egiComment Comment
highlight link egiBoolean Boolean
highlight link egiChar Character
highlight link egiString String

let b:current_syntax = 'egison'

if main_syntax ==# 'egison'
    unlet main_syntax
endif

