" GDML files (process as xml)
au BufNewFile,BufRead *.gdml	set	filetype=xml

" Geant4 inline implementations (*.icc process as c++)
au BufNewFile,BufRead *.icc	set	filetype=cpp

" Arduino code files (*.ino process as c++)
au BufNewFile,BufRead *.ino	set	filetype=cpp
