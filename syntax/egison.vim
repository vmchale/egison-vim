scriptencoding utf-8

if !exists('main_syntax')
  if exists('b:current_syntax')
      finish
  endif
  let main_syntax = 'egison'
endif

syn match egiComment "\v;.*$" contains=egiTodo,@Spell
syn match egiComment "\v--.*$" contains=egiTodo,@Spell
syn keyword egiTodo TODO FIXME contained
syn match egiType "\v[A-Z_0-9Α-Ω][a-zA-Z_0-9α-ωΑ-Ω]*"
" TODO: include ?
syn match egiIdentifier "\v[a-zα-ω][a-zA-Z_∂\-0-9α-ωΑ-Ω]*"
syn match egiBoolean "#t"
syn match egiBoolean "#f"
syn match egiSpecial "[{}()\[\]|<>@$%]!"
syn match egiOperator "[+-/*]"
syn match egiBind ":="

syn match egiInt "\v[0-9]+"

" TODO: match-all keyword
" generate-tensor
" also let*
" is 'something' a keyword?
syn keyword egiKeyword define lambda cambda let if match letrec apply do

syn match egiSpecial +\v\\["n\\]+
syn region egiString start=+"+ end=+"+ contains=egiSpecial
syn match egiChar "\v'.'"
syn match egiChar "\v'.*'" contains=egiSpecial

highlight link egiIdentifier Identifier
highlight link egiInt Number
highlight link egiComment Comment
highlight link egiBoolean Boolean
highlight link egiChar Character
highlight link egiString String
highlight link egiType Type
highlight link egiSpecial Special
highlight link egiOperator Operator
highlight link egiKeyword Keyword
highlight link egiBind Operator

let b:current_syntax = 'egison'

if main_syntax ==# 'egison'
    unlet main_syntax
endif

