all: imc.vim

imc.vim: imc.vim.in ../*.ops
	cp -f imc.vim.in imc.vim
	perl ops2vim.pl ../*.ops >> imc.vim
