" Why does it not match various operators? + * etc...
" syn match cppMyOperatorTypedef "*"
" hi def link cppMyOperatorTypedef      Operator
" ROOT data types
syn match cppRootTypedef "\<[U|S]\{0,1}[A-Z][a-z|0-9]*_t\>"
hi def link cppRootTypedef      cType
syn match cppThreadTypedef "\<pthread_[a-z0-9]*_t\>"
hi def link cppThreadTypedef  cType
"" Match kTRUE and kFALSE as c++ booleans
syn keyword cppBoolean kTRUE kFALSE
" Geant4 data types (from G4Types.hh)
syn match cppGeant4Typedef "\<G4\(int\|double\|bool\|long\|float\|complex\)\>"
hi def link cppGeant4Typedef      cType
