" store and remove current syntax value
let old_syntax = b:current_syntax
unlet b:current_syntax

syn include @egison syntax/egison.vim
unlet b:current_syntax

syn region egiBlock matchgroup=quasiQuote start=/\[\$\?egison|/       end=/|\]/ contains=@egison

hi def link quasiQuote Underlined

" restore current syntax value
let b:current_syntax = old_syntax
