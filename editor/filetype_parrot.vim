au BufNewFile,BufRead *.pmc set ft=pmc cindent
au BufNewFile,BufRead *.pasm set ft=pasm ai sw=4
au BufNewFile,BufRead *.imc,*.imcc,*.pir set ft=pir ai sw=4
au BufNewFile         *.imc,*.imcc,*.pir 0r ~/.vim/skeleton.pir
