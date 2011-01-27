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
#   null Null NULL
#   y Y yes Yes YES n N no No NO
#   true True TRUE false False FALSE
#   on On ON off Off OFF
#>);


method read_string($string) {
### my $self   = bless [], $class;
    my @result;

### eval {
###     unless ( defined $string ) {
###         die \"Did not provide a string to load";
###     }
###
###     # Byte order marks
###     # NOTE: Keeping this here to educate maintainers
###     # my %BOM = (
###     #     "\357\273\277" => 'UTF-8',
###     #     "\376\377"     => 'UTF-16BE',
###     #     "\377\376"     => 'UTF-16LE',
###     #     "\377\376\0\0" => 'UTF-32LE'
###     #     "\0\0\376\377" => 'UTF-32BE',
###     # );
###     if ( $string =~ /^(?:\376\377|\377\376|\377\376\0\0|\0\0\376\377)/ ) {
###         die \"Stream has a non UTF-8 BOM";
###     } else {
###         # Strip UTF-8 bom if found, we'll just ignore it
###         $string =~ s/^\357\273\277//;
###     }
###
###     # Try to decode as utf8
###     utf8::decode($string) if HAVE_UTF8;
###
###     # Check for some special cases
###     return $self unless length $string;
###     unless ( $string =~ /[\012\015]+\z/ ) {
###         die \"Stream does not end with newline character";
###     }
###
###     # Split the file into lines
###     my @lines = grep { ! /^\s*(?:\#.*)?\z/ }
###             split /(?:\015{1,2}\012|\015|\012)/, $string;
###
###     # Strip the initial YAML header
###     @lines and $lines[0] =~ /^\%YAML[: ][\d\.]+.*\z/ and shift @lines;
###
###     # A nibbling parser
###     while ( @lines ) {
###         # Do we have a document header?
###         if ( $lines[0] =~ /^---\s*(?:(.+)\s*)?\z/ ) {
###             # Handle scalar documents
###             shift @lines;
###             if ( defined $1 and $1 !~ /^(?:\#.+|\%YAML[: ][\d\.]+)\z/ ) {
###                 push @$self, $self->_read_scalar( "$1", [ undef ], \@lines );
###                 next;
###             }
###         }
###
###         if ( ! @lines or $lines[0] =~ /^(?:---|\.\.\.)/ ) {
###             # A naked document
###             push @$self, undef;
###             while ( @lines and $lines[0] !~ /^---/ ) {
###                 shift @lines;
###             }
###
###         } elsif ( $lines[0] =~ /^\s*\-/ ) {
###             # An array at the root
###             my $document = [ ];
###             push @$self, $document;
###             $self->_read_array( $document, [ 0 ], \@lines );
###
###         } elsif ( $lines[0] =~ /^(\s*)\S/ ) {
###             # A hash at the root
###             my $document = { };
###             push @$self, $document;
###             $self->_read_hash( $document, [ length($1) ], \@lines );
###
###         } else {
###             die \"YAML::Tiny failed to classify the line '$lines[0]'";
###         }
###     }
### };
### if ( ref $@ eq 'SCALAR' ) {
###     return $self->_error(${$@});
### } elsif ( $@ ) {
###     require Carp;
###     Carp::croak($@);
### }
###
### return $self;
    @result;
}



INIT {
    pir::load_bytecode("nqp-setting.pbc");
}

# vim: ft=perl6
