package Regex::AsmOps;
use Regex::Grammar;
use base 'Exporter';
use strict;

use vars qw(@AsmOps @EXPORT);

@AsmOps =
  ( [ "scan(R)" => "scan for R at every position" ],
    [ "terminate()" ],
    [ "atend()" => "return whether at end of input string" ],
    [ "advance(n)" => "advance input <n> chars" ],
    [ "onfail(R)" ],
    [ "bytematch(b)" => "return if start of input is b, advance 1 char" ],
    [ "classmatch(charclass)" => "return if start of input is charclass, advance 1" ],
    [ "start(n)" => "mark start of n-th paren match" ],
    [ "end(n)" => "mark end of n-th paren match" ],
    [ "goto(label)" => "unconditional jump to label" ],
    [ "label(name)" => "declare a label" ],
    [ "incr(name)" => "???" ],
    [ "assign(name, val)" => "???" ],
    [ "if(a, condition, b, label)" => "if (A) CONDITION (B) goto LABEL" ],
    [ "accept(R)" => "try R, accept immediately if it matches" ],
    [ "fail()" ],
    [ "nop()" ],

    [ "push_reg(r)" ],
    [ "pop_reg(r)" ],

    [ "pushmark()" ],
    [ "popmark()" ],
    [ "pushindex()" ],
    [ "popindex()" ],

    [ "preamble()" ],
    [ "match_succeeded()" ],
    [ "match_failed()" ],
  );

foreach (@AsmOps) {
    my ($proto, $desc) = @$_;
    my ($name) = $proto =~ /^(\w+)/;
    eval "sub aop_$name { bless Regex::Grammar::register(\"$name\", \@_), 'asm_op' }";
    push @EXPORT, "\&aop_$name";
}

1;
