all: imc.vim

imc.vim: imc.vim.in ../*.ops
	cp -f imc.vim.in imc.vim
	perl ops2vim.pl ../*.ops >> imc.vim

imc.kate:
	perl kate_syntax.pl '../' > imcc.xml
