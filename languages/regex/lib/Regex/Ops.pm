package Regex::Ops;

use vars qw(%MARKERS);
sub mark {
    my $name = shift || '';
    my $number = ++$MARKERS{$name};
    $number = '' if ($number == 1) && ($name ne '');
    return bless([ 'label', "\@$name$number" ], 'asm_op');
}

1;
