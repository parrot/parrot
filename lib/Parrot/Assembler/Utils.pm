package Parrot::Assembler::Utils;
use POSIX;
use Text::Balanced qw(extract_bracketed);
use strict;

my $bin_re = qr/([-+]?(0b[01]+))/;
my $dec_re = qr/([-+]?(\d+))/;
my $hex_re = qr/([-+]?(0x[0-9a-fA-F]+))/;
my $num_re = '([-+]?\d+\.\d+([eE][+-]?\d+)?)';
my $reg_re = '([PSNI]\d+)';
my $str_re =
qr/(\"(?:[^\\\"]*(?:\\.[^\\\"]*)*)\" |
    \'(?:[^\\\']*(?:\\.[^\\\']*)*)\')/x;

sub ex_arg { # Extract an argument.
    1 while $_[0]=~ s/^\s+//;
    if($_[0] =~ s/^$num_re\s*,?//) {
        return ("nc", $1);
    } elsif ($_[0] =~ s/^$bin_re\s*,?//) {
        return ("ic",(strtol(substr($1,2),2))[0]);
    } elsif ($_[0] =~ s/^$hex_re\s*,?//) {
        return ("ic",(strtol(substr($1,2),16))[0]);
    } elsif ($_[0] =~ s/^$dec_re\s*,?//) {
        return ("ic", 0+$1);
    } elsif($_[0] =~ s/^$str_re\s*,?//) {
        return ("sc", $1);
    } elsif($_[0] =~ s/^$reg_re(?=\[)//) {
        my $reg = $1;
        my ($left, $right) = extract_bracketed($_[0],q/["]/);
        $_[0] = $right;
        $_[0] =~ s/^,//;
        return ("key",$reg,$left);
    } elsif($_[0] =~ s/^$reg_re\s*,?//) {
        return (lc (substr($1,0,1)), $1);
    } elsif($_[0] =~ s/^(\[k:$reg_re\])\s*,?//) {
        return ("r", $1);
    } elsif($_[0] =~
        s/^(\[k:($num_re|$bin_re|$dec_re|$hex_re|$str_re)\])\s*,?//) {
        return ("kc", $1);
    } elsif($_[0] =~ s/^(\w+)\s*,?//) {
        return ("label", $1);
    } elsif($_[0] =~ s/^#.*//) {
        return ();
    } else {
        die "Unparsable argument, starting from $_[0]\n";
    }
}

sub map_args (&$) { 
    my $cb = shift;
    my $thing = shift;
    while (length $thing) {
         $cb->(Parrot::Assembler::Utils::ex_arg($thing));
    }
}
