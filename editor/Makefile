all: imc.vim vim-install

imc.vim: imc.vim.in ../ops/*.ops
	cp -f imc.vim.in imc.vim
	perl ops2vim.pl ../ops/*.ops >> imc.vim

vim-install: 
	mkdir -p $(HOME)/.vim/syntax/
	cp imc.vim $(HOME)/.vim/syntax/
	cp pasm.vim $(HOME)/.vim/syntax/
	cp pmc.vim $(HOME)/.vim/syntax/
	mkdir -p $(HOME)/.vim/ftdetect/
	cp filetype_parrot.vim $(HOME)/.vim/ftdetect/parrot.vim
	mkdir -p $(HOME)/.vim/indent
	cp indent_imc.vim $(HOME)/.vim/indent/imc.vim

imc.kate:
	perl kate_syntax.pl '../' > imcc.xml
