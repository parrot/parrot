#! nqp
# Copyright (C) 2010, Parrot Foundation.

# language-specific runtime functions go here

{
    my sub array (*@args) { @args; }
    my sub hash (*%args) { %args; }

    Q:PIR {
        $P0 = find_lex 'array'
        set_global '!array', $P0
        $P0 = find_lex 'hash'
        set_global '!hash', $P0
    }
}

sub print(*@args) {
    pir::say(pir::join('', @args));
    pir::return();
}

our $STDIN;
INIT {
	$STDIN := pir::getinterp().stdin_handle();
}

sub read() {
	+$STDIN.readline();
}
