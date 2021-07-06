"" jc2_black - color scheme modeled after tir_black/ir_black and with
"" elements borrowed from Tomorrow-Night-Bright
""
"" True color only

"" Define two special variables. The first we can use to leave a color
"" unchanged. The second we use to specify that we want to remove
"" the color.
let s:UNCHANGE = ""
let s:NONE = "NONE"

"" Default GUI Colours
"" (generic GUI items)
let s:foreground = "f7f7f7"
"" Set background to nothing so that the transparent terminal works
let s:background = s:NONE
let s:selection = "4e4e4e"
let s:window = "4d5057"
let s:line = "121212"
let s:comment = "7c7c7c"
let s:comment = "9f9f9f"
"" Colors in wheel
"" Minus is darker Plus is lighter
let s:redm    = "8b0000"
let s:red     = "d54e53"
let s:redp    = "ce003c"
let s:orangem = "e78c45"
let s:orange  = "e78c45"
let s:orangep = "e78c45"
let s:yellowm = "daa520"
let s:yellow  = "ffffb6"
let s:yellowp = "ffffb6"
let s:greenm  = "afd75f"
let s:green   = "afd75f"
let s:greenp  = "9eee38"
let s:bluem   = "2679ad"
let s:blue    = "34a4ed"
let s:bluep   = "96cbee"
let s:purplem = "c397d8"
let s:purple  = "c397d8"
let s:purplep = "ebbbff"

let s:aqua = "70c0b1"

hi clear
syntax reset

let g:colors_name = "jc2_black"

"" Set colors and attributes for given work
if has("gui_running") || &t_Co == 88 || &t_Co == 256
  "" This function sets an element and appends a # as necessary to
  "" passed value if its a color
  fun <SID>XX(group,element,val,hex_val)
    if a:val == s:NONE
      let b:setVal = s:NONE
    elseif a:hex_val
      let b:setVal = "#" . a:val
    else
      let b:setVal = a:val
    endif
    if a:val != ""
      exec "hi " . a:group . " " . a:element . "=" . b:setVal
    endif
  endfun

  fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
      call <SID>XX(a:group, "guifg", a:fg, 1)
    endif
    if a:bg != ""
      call <SID>XX(a:group,"guibg",a:bg, 1)
    endif
    if a:attr != ""
      call <SID>XX(a:group,"gui", a:attr, 0)
    endif
  endfun

endif

"" For simplicity, also include a link to another group already defined
"" (so colors can be changed only once as needed)
fun <SID>L(from,to)
  if a:from != "" && a:to != ""
    exec "hi link " . a:from . " " .a:to
  endif
endfun

"" Configure highlights

call <SID>X("Type", s:yellow, s:background, "")

" Vim Highlighting
call <SID>X("Normal", s:foreground, s:background, "")
call <SID>X("NonText", s:selection, "", "")

call <SID>X("NonText", s:selection, "", "")

call <SID>X("LineNr", s:selection, "", "")
call <SID>X("SpecialKey", s:selection, "", "")
call <SID>X("Search", s:selection, s:yellow, "")
call <SID>X("TabLine", s:window, s:foreground, "reverse")
call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
call <SID>X("StatusLine", s:window, s:yellow, "reverse")
call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
call <SID>X("VertSplit", s:window, s:window, "none")
call <SID>X("Visual", "", s:selection, "")
call <SID>X("Directory", s:blue, "", "")
call <SID>X("ModeMsg", s:green, "", "")
call <SID>X("ErrorMsg", "", s:redm, "none")
call <SID>X("MoreMsg", s:green, "", "")
call <SID>X("Question", s:green, "", "")
call <SID>X("WarningMsg", s:red, "", "")
call <SID>X("MatchParen", "", s:selection, "")
call <SID>X("Folded", s:comment, s:background, "")
call <SID>X("FoldColumn", "", s:background, "")
if version >= 700
  call <SID>X("CursorLine", "", s:line, "none")
  call <SID>X("CursorColumn", "", s:line, "none")
  call <SID>X("PMenu", s:foreground, s:selection, "none")
  call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
  call <SID>X("SignColumn", "", s:background, "none")
end
if version >= 703
  call <SID>X("ColorColumn", "", s:selection, "reverse")
  "" This should be moved out of the theme
  ""set colorcolumn=80
end

" Standard Highlighting
call <SID>X("Comment", s:comment, s:background, "")
call <SID>X("String", s:green, s:background, "")
call <SID>X("Todo", s:comment, s:background, "")
call <SID>X("Title", s:comment, "", "")
call <SID>X("Identifier", s:blue, "", "none")
call <SID>X("Statement", s:blue, "", "")
call <SID>X("Conditional", s:redp, "", "")
call <SID>X("Repeat", s:foreground, "", "")
call <SID>X("Structure", s:purple, "", "")
call <SID>X("Function", s:blue, "", "")
call <SID>X("Constant", s:purplep, "", "")
call <SID>X("Boolean", s:redp, "", "")
call <SID>X("Keyword", s:bluep, "", "")
call <SID>X("Special", s:redp, "", "")
call <SID>X("PreProc", s:purple, "", "")
call <SID>X("Operator", s:aqua, "", "none")
call <SID>X("Type", s:blue, "", "none")
call <SID>X("Define", s:purple, "", "none")
call <SID>X("Include", s:bluep, "", "")
"call <SID>X("Ignore", "666666", "", "")

" Vim Highlighting
call <SID>X("vimCommand", s:yellowm, "", "none")

" C Highlighting
call <SID>X("cType", s:yellow, "", "")
call <SID>X("cStorageClass", s:purple, "", "")
call <SID>X("cConditional", s:blue, "", "")
call <SID>X("cRepeat", s:blue, "", "")

" PHP Highlighting
call <SID>X("phpVarSelector", s:red, "", "")
call <SID>X("phpKeyword", s:purple, "", "")
call <SID>X("phpRepeat", s:purple, "", "")
call <SID>X("phpConditional", s:purple, "", "")
call <SID>X("phpStatement", s:purple, "", "")
call <SID>X("phpMemberSelector", s:foreground, "", "")

" Ruby Highlighting
call <SID>X("rubySymbol", s:green, "", "")
call <SID>X("rubyConstant", s:yellow, "", "")
call <SID>X("rubyAccess", s:yellow, "", "")
call <SID>X("rubyAttribute", s:blue, "", "")
call <SID>X("rubyInclude", s:bluep, "", "")
call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
call <SID>X("rubyCurlyBlock", s:orange, "", "")
call <SID>X("rubyStringDelimiter", s:green, "", "")
call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
call <SID>X("rubyConditional", s:purple, "", "")
call <SID>X("rubyRepeat", s:purple, "", "")
call <SID>X("rubyControl", s:purple, "", "")
call <SID>X("rubyException", s:purple, "", "")

" Crystal Highlighting
call <SID>X("crystalSymbol", s:green, "", "")
call <SID>X("crystalConstant", s:yellow, "", "")
call <SID>X("crystalAccess", s:yellow, "", "")
call <SID>X("crystalAttribute", s:blue, "", "")
call <SID>X("crystalInclude", s:bluep, "", "")
call <SID>X("crystalLocalVariableOrMethod", s:orange, "", "")
call <SID>X("crystalCurlyBlock", s:orange, "", "")
call <SID>X("crystalStringDelimiter", s:green, "", "")
call <SID>X("crystalInterpolationDelimiter", s:orange, "", "")
call <SID>X("crystalConditional", s:purple, "", "")
call <SID>X("crystalRepeat", s:purple, "", "")
call <SID>X("crystalControl", s:purple, "", "")
call <SID>X("crystalException", s:purple, "", "")

" Python Highlighting
call <SID>X("pythonInclude", s:purple, "", "")
call <SID>X("pythonStatement", s:purple, "", "")
call <SID>X("pythonConditional", s:purple, "", "")
call <SID>X("pythonRepeat", s:purple, "", "")
call <SID>X("pythonException", s:purple, "", "")
call <SID>X("pythonFunction", s:blue, "", "")
call <SID>X("pythonPreCondit", s:purple, "", "")
call <SID>X("pythonRepeat", s:aqua, "", "")
call <SID>X("pythonExClass", s:orange, "", "")

" JavaScript Highlighting
call <SID>X("javaScriptBraces", s:foreground, "", "")
call <SID>X("javaScriptFunction", s:purple, "", "")
call <SID>X("javaScriptConditional", s:purple, "", "")
call <SID>X("javaScriptRepeat", s:purple, "", "")
call <SID>X("javaScriptNumber", s:orange, "", "")
call <SID>X("javaScriptMember", s:orange, "", "")
call <SID>X("javascriptNull", s:orange, "", "")
call <SID>X("javascriptGlobal", s:blue, "", "")
call <SID>X("javascriptStatement", s:red, "", "")

" CoffeeScript Highlighting
call <SID>X("coffeeRepeat", s:purple, "", "")
call <SID>X("coffeeConditional", s:purple, "", "")
call <SID>X("coffeeKeyword", s:purple, "", "")
call <SID>X("coffeeObject", s:yellow, "", "")

" HTML Highlighting
call <SID>X("htmlTag", s:red, "", "")
call <SID>X("htmlTagName", s:red, "", "")
call <SID>X("htmlArg", s:red, "", "")
call <SID>X("htmlScriptTag", s:red, "", "")

" Diff Highlighting
call <SID>X("diffAdd", s:line, s:yellowm, "")
call <SID>X("diffDelete", s:background, s:redm, "")
call <SID>X("diffChange", "", "2B5B77", "")
call <SID>X("diffChange", s:background,s:bluem, "")
call <SID>X("diffText", s:foreground, s:blue, "")

" ShowMarks Highlighting
call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

" Lua Highlighting
call <SID>X("luaStatement", s:purple, "", "")
call <SID>X("luaRepeat", s:purple, "", "")
call <SID>X("luaCondStart", s:purple, "", "")
call <SID>X("luaCondElseif", s:purple, "", "")
call <SID>X("luaCond", s:purple, "", "")
call <SID>X("luaCondEnd", s:purple, "", "")

" Cucumber Highlighting
call <SID>X("cucumberGiven", s:blue, "", "")
call <SID>X("cucumberGivenAnd", s:blue, "", "")

" Go Highlighting
call <SID>X("goDirective", s:purple, "", "")
call <SID>X("goDeclaration", s:purple, "", "")
call <SID>X("goStatement", s:purple, "", "")
call <SID>X("goConditional", s:purple, "", "")
call <SID>X("goConstants", s:orange, "", "")
call <SID>X("goTodo", s:yellow, "", "")
call <SID>X("goDeclType", s:blue, "", "")
call <SID>X("goBuiltins", s:purple, "", "")
call <SID>X("goRepeat", s:purple, "", "")
call <SID>X("goLabel", s:purple, "", "")

" Clojure Highlighting
call <SID>X("clojureConstant", s:orange, "", "")
call <SID>X("clojureBoolean", s:orange, "", "")
call <SID>X("clojureCharacter", s:orange, "", "")
call <SID>X("clojureKeyword", s:green, "", "")
call <SID>X("clojureNumber", s:orange, "", "")
call <SID>X("clojureString", s:green, "", "")
call <SID>X("clojureRegexp", s:green, "", "")
call <SID>X("clojureParen", s:aqua, "", "")
call <SID>X("clojureVariable", s:yellow, "", "")
call <SID>X("clojureCond", s:blue, "", "")
call <SID>X("clojureDefine", s:purple, "", "")
call <SID>X("clojureException", s:red, "", "")
call <SID>X("clojureFunc", s:blue, "", "")
call <SID>X("clojureMacro", s:blue, "", "")
call <SID>X("clojureRepeat", s:blue, "", "")
call <SID>X("clojureSpecial", s:purple, "", "")
call <SID>X("clojureQuote", s:blue, "", "")
call <SID>X("clojureUnquote", s:blue, "", "")
call <SID>X("clojureMeta", s:blue, "", "")
call <SID>X("clojureDeref", s:blue, "", "")
call <SID>X("clojureAnonArg", s:blue, "", "")
call <SID>X("clojureRepeat", s:blue, "", "")
call <SID>X("clojureDispatch", s:blue, "", "")

" Scala Highlighting
call <SID>X("scalaKeyword", s:purple, "", "")
call <SID>X("scalaKeywordModifier", s:purple, "", "")
call <SID>X("scalaOperator", s:blue, "", "")
call <SID>X("scalaPackage", s:red, "", "")
call <SID>X("scalaFqn", s:foreground, "", "")
call <SID>X("scalaFqnSet", s:foreground, "", "")
call <SID>X("scalaImport", s:purple, "", "")
call <SID>X("scalaBoolean", s:orange, "", "")
call <SID>X("scalaDef", s:purple, "", "")
call <SID>X("scalaVal", s:purple, "", "")
call <SID>X("scalaVar", s:aqua, "", "")
call <SID>X("scalaClass", s:purple, "", "")
call <SID>X("scalaObject", s:purple, "", "")
call <SID>X("scalaTrait", s:purple, "", "")
call <SID>X("scalaDefName", s:blue, "", "")
call <SID>X("scalaValName", s:foreground, "", "")
call <SID>X("scalaVarName", s:foreground, "", "")
call <SID>X("scalaClassName", s:foreground, "", "")
call <SID>X("scalaType", s:yellow, "", "")
call <SID>X("scalaTypeSpecializer", s:yellow, "", "")
call <SID>X("scalaAnnotation", s:orange, "", "")
call <SID>X("scalaNumber", s:orange, "", "")
call <SID>X("scalaDefSpecializer", s:yellow, "", "")
call <SID>X("scalaClassSpecializer", s:yellow, "", "")
call <SID>X("scalaBackTick", s:green, "", "")
call <SID>X("scalaRoot", s:foreground, "", "")
call <SID>X("scalaMethodCall", s:blue, "", "")
call <SID>X("scalaCaseType", s:yellow, "", "")
call <SID>X("scalaLineComment", s:comment, "", "")
call <SID>X("scalaComment", s:comment, "", "")
call <SID>X("scalaDocComment", s:comment, "", "")
call <SID>X("scalaDocTags", s:comment, "", "")
call <SID>X("scalaEmptyString", s:green, "", "")
call <SID>X("scalaMultiLineString", s:green, "", "")
call <SID>X("scalaUnicode", s:orange, "", "")
call <SID>X("scalaString", s:green, "", "")
call <SID>X("scalaStringEscape", s:green, "", "")
call <SID>X("scalaSymbol", s:orange, "", "")
call <SID>X("scalaChar", s:orange, "", "")
call <SID>X("scalaXml", s:green, "", "")
call <SID>X("scalaConstructorSpecializer", s:yellow, "", "")
call <SID>X("scalaBackTick", s:blue, "", "")

" Git
"" I forget what needed these two that are somehow different than the
"" diffAdd and diffDelete
call <SID>X("diffAdded", s:green, "", "")
call <SID>X("diffRemoved", s:red, "", "")
"" ???
call <SID>L("gitcommitSummary",s:NONE)
call <SID>X("gitcommitSummary", s:yellowm, "", "bold")
"call <SID>X("gitcommitSummary", "", "", "")
"" These vim-gitgutter variables can just be mapped to standard VIM diff colors
call <SID>L("GitGutterAdd", "diffAdd")
call <SID>L("GitGutterDelete", "diffDelete")
call <SID>L("GitGutterChange", "diffChange")
call <SID>L("GitGutterChangeDelete", "diffChange")

"call <SID>X("gitcommitBlank", "", "", "")
"call <SID>X("gitcommitBranch", "", "", "")
"call <SID>X("gitcommitOverflow", s:blue, "", "")


"" Cleanup our functions
delf <SID>XX
delf <SID>X
delf <SID>L
