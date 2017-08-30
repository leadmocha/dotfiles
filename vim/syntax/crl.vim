runtime! syntax/c.vim

"" Special CRL comments start with #
if exists("c_no_comment_fold")
  syn region  cCommentL start="#" skip="\\$" end="$" keepend contains=@cCommentGroup,cComment2String,cCharacter,cNumbersCom,cSpaceError,@Spell
else
  syn region    cCommentL       start="#" skip="\\$" end="$" keepend contains=@cCommentGroup,cSpaceError,@Spell
endif

