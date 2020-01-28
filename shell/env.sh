## Some of my most common environment settings and modifications
## Requires setting environment variable JC2_DOTFILES pointing
## to the base of this repository

## Aliases for using my VIM configuration
alias vic="vim --cmd 'let g:JC2UseCoding=1'"
alias gvic="vim --cmd 'let g:JC2UseCoding=1'"

## grep colors
export GREP_OPTIONS="--color=auto"

## My personal ROOT style sheet
export JC2ROOTSTYLE=${JC2_DOTFILES}/ROOT/jc2_style.cxx
