package Regex::RegexOps;
use base 'Exporter';
use strict;

use vars qw(@RegexOps @EXPORT);

@RegexOps =
  ( [ "atend()" => "return whether at end of input string" ],
    [ "advance(n)" => "advance input <n> chars" ],
    [ "try(R)" ],
    [ "onfail(R)" ],
    [ "bytematch(b)" => "return if start of input is b, advance 1 char" ],
    [ "classmatch(charclass)" => "return if start of input is charclass, advance 1" ],
    [ "start(n)" => "mark start of n-th paren match" ],
    [ "end(n)" => "mark end of n-th paren match" ],
    [ "goto(label)" => "unconditional jump to label" ],
    [ "label(name)" => "declare a label" ],
    [ "incr(name)" => "???" ],
    [ "assign(name, val)" => "???" ],
    [ "test(a, condition, b, label)" => "if (A) CONDITION (B) goto LABEL" ],
    [ "accept(R)" => "try R, accept immediately if it matches" ],
    [ "fail()" ],
    [ "nop()" ],
);

foreach (@RegexOps) {
    my ($proto, $desc) = @$_;
    my ($name) = $proto =~ /^(\w+)/;
    eval "sub rop_$name { Regex::Grammar::register(\"$name\", \@_) }";
    push @EXPORT, "\&rop_$name";
}

sub rop_seq {
    return Regex::Grammar::register('nop')      if @_ == 0;
    return $_[0]                         if @_ == 1;
    return Regex::Grammar::register('seq', @_);
}

push @EXPORT, '&rop_seq';

use vars qw(%MARKERS);
sub mark {
    my $name = shift || '';
    my $number = ++$MARKERS{$name};
    $number = '' if ($number == 1) && ($name ne '');
    return bless([ 'label', "\@$name$number" ], 'asm_op');
}

1;
