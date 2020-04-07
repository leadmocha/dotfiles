"" First, ensure we have not already been loaded directly, without pathogen
"" (if so, then don't read this file again!)
if exists("g:JC2Loaded")
  finish
endif
let g:JC2Loaded=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Configure the this environment
"" Load the system files (useful if we are using just the basic vimrc file)
if !exists("g:JC2UseSystemFiles")
 let g:JC2UseSystemFiles=1
endif

"" Configure the location of this 'plugin'
if !exists('g:JC2Path')
  let g:JC2Path=fnamemodify(resolve(expand('<sfile>:p:h')),':h')
endif

"" Add a local path if one does not exist
if !exists('g:JC2Local')
  let g:JC2Local=g:JC2Path.'/local'
endif

"" Configure whether pathogen should be loaded or not
"" The default is to load pathogen unless explicitly disabled by the user
if !exists("g:JC2LoadPathogen")
  let g:JC2LoadPathogen=1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Finally, load the 'plugin'
exe "source " . g:JC2Path . "/jc2/vimrc"
