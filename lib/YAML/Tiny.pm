#!nqp
class YAML::Tiny;

# The character class of all characters we need to escape
# NOTE: Inlined, since it's only used once
# my $RE_ESCAPE = '[\\x00-\\x08\\x0b-\\x0d\\x0e-\\x1f\"\n]';

# Printed form of the unprintable characters in the lowest range
# of ASCII characters, listed by ASCII ordinal position.
has @UNPRINTABLE := <
	z    x01  x02  x03  x04  x05  x06  a
	x08  t    n    v    f    r    x0e  x0f
	x10  x11  x12  x13  x14  x15  x16  x17
	x18  x19  x1a  e    x1c  x1d  x1e  x1f
>;

# Printable characters for escapes
has %UNESCAPES := hash(
	z => "\x00", a => "\x07", t    => "\x09",
	n => "\x0a", v => "\x0b", f    => "\x0c",
	r => "\x0d", e => "\x1b",
    #'\\' => '\\',
);

# Special magic boolean words
#has %QUOTE := map( -> $a { $a => 1; } <
#	null Null NULL
#	y Y yes Yes YES n N no No NO
#	true True TRUE false False FALSE
#	on On ON off Off OFF
#>);


method read_string($string) {
    list();
}

INIT {
    pir::load_bytecode("nqp-setting.pbc");
}

# vim: ft=perl6
