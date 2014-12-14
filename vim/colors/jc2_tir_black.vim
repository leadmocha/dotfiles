" tir_black color scheme
" Based on ir_black from: http://blog.infinitered.com/entries/show/8
" adds 256 color console support
" changed WildMenu color to be the same as PMenuSel

set background=dark
hi clear

if exists("syntax_on")
 syntax reset
endif

let colors_name = "jc2_tir_black"

" General colors
hi Normal guifg=#FFFFFF guibg=black
hi NonText guifg=#262626 guibg=black

hi Cursor guifg=black guibg=white
hi LineNr guifg=#4e4e4e guibg=black

hi VertSplit guifg=#202020 guibg=#202020
hi StatusLine guifg=#CCCCCC guibg=#202020 gui=italic
hi StatusLineNC guifg=black guibg=#202020

hi Folded guifg=#a0a8b0 guibg=#384048
hi Title guifg=#f6f3e8 gui=bold
hi Visual guibg=#262D51

hi SpecialKey guifg=#808080 guibg=#343434

hi WildMenu guifg=black guibg=#cae682
hi PmenuSbar guifg=black guibg=white

hi Error gui=undercurl  guibg=#FF6C60
hi ErrorMsg guifg=white guibg=#FF6C60 gui=bold
hi WarningMsg guifg=white guibg=#FF6C60 gui=bold

hi ModeMsg guifg=black guibg=#C6C5FE gui=bold

if version >= 700 " Vim 7.x specific colors
 hi CursorLine guibg=#121212 gui=none
 hi CursorColumn guibg=#121212 gui=none
 hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
 hi Pmenu guifg=#f6f3e8 guibg=#444444
 hi PmenuSel guifg=#000000 guibg=#cae682
 hi Search guifg=#000000 guibg=#cae682
endif

" Syntax highlighting
hi Comment guifg=#7C7C7C
hi String guifg=#afd75f
hi Number guifg=#F583FF

hi Keyword guifg=#96CBFE
hi PreProc guifg=#96CBFE
hi Conditional guifg=#34A4ED

hi Todo guifg=#000000 guibg=#cae682
hi Constant guifg=#99CC99

hi Identifier guifg=#34A4ED
hi Function guifg=#FFD2A7
hi Type guifg=#FFFFB6
hi Statement guifg=#6699CC

hi Special guifg=#E18964
hi Delimiter guifg=#00A0A0
hi Operator guifg=white

hi link Character Constant
hi link Boolean Constant
hi link Float Number
hi link Repeat Statement
hi link Label Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi link SpecialComment Special
hi link Debug Special

" Special for Ruby
hi rubyRegexp guifg=#B18A3D
hi rubyRegexpDelimiter guifg=#FF8000
hi rubyEscape guifg=white
hi rubyInterpolationDelimiter guifg=#00A0A0
hi rubyControl guifg=#6699CC "and break, etc
hi rubyStringDelimiter guifg=#336633
hi link rubyClass Keyword
hi link rubyModule Keyword
hi link rubyKeyword Keyword
hi link rubyOperator Operator
hi link rubyIdentifier Identifier
hi link rubyInstanceVariable Identifier
hi link rubyGlobalVariable Identifier
hi link rubyClassVariable Identifier
hi link rubyConstant Type

" Special for Java
hi link javaScopeDecl Identifier
hi link javaCommentTitle javaDocSeeTag
hi link javaDocTags javaDocSeeTag
hi link javaDocParam javaDocSeeTag
hi link javaDocSeeTagParam javaDocSeeTag

hi javaDocSeeTag guifg=#CCCCCC
hi javaDocSeeTag guifg=#CCCCCC

" Special for XML
hi link xmlTag Keyword
hi link xmlTagName Conditional
hi link xmlEndTag Identifier

" Special for HTML
hi link htmlTag Keyword
hi link htmlTagName Conditional
hi link htmlEndTag Identifier

" Special for Javascript
hi link javaScriptNumber Number

" Special for CSharp
hi link csXmlTag Keyword

" Diff stuff
hi DiffAdd cterm=NONE
hi DiffAdd cterm=NONE
hi DiffAdd cterm=NONE
hi DiffAdd cterm=NONE

"" Sign line
hi SignColumn guifg=#202020 guibg=#202020

"" Highlight characters that are over the default length of a line
"if !exists('g:OverLengthNoHighlight')
"  highlight OverLength guibg=#592929
"  match OverLength /\%81v.\+/
"endif
set colorcolumn=80
