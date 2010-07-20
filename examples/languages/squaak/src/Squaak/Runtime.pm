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
    pir::print(pir::join('', @args));
    1;
}

sub say(*@args) {
    pir::say(pir::join('', @args));
    1;
}
