all: imc.vim

imc.vim: imc.vim.in ../ops/*.ops
	cp -f imc.vim.in imc.vim
	perl ops2vim.pl ../ops/*.ops >> imc.vim
	cp imc.vim ~/.vim/syntax/

imc.kate:
	perl kate_syntax.pl '../' > imcc.xml
