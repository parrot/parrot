# This file is rotting and needs a cleanup desperately.

package Regex::Ops::List;
use Regex::Grammar;
use base 'Exporter';
use strict;

use vars qw(@AsmOps @EXPORT);

@Regex::Ops::Label::ISA = qw(Regex::Ops::List);

@AsmOps =
  ( [ "scan(R)" => "scan for R at every position" ],
    [ "terminate()" ],
    [ "atend()" => "return whether at end of input string" ],
    [ "advance(n)" => "advance input <n> chars" ],
    [ "increment(var,[amount])" => "advance input <n> chars" ],
    [ "check(n)" => "require at least <n> chars remaining" ],
    [ "onfail(R)" ],
    [ "match(b)" => "return if start of input is b, advance 1 char" ],
    [ "classmatch(charclass)" => "return if start of input is charclass, advance 1" ],

    [ "start(n)" => "mark start of n-th paren match" ],
    [ "end(n)" => "mark end of n-th paren match" ],
    [ "delete(n)" => "delete record of n-th paren match" ],

    [ "goto(label)" => "unconditional jump to label" ],
    [ "label(name)" => "declare a label" ],
    [ "assign(name, val)" => "???" ],
    [ "if(a, condition, b, label)" => "if (A) CONDITION (B) goto LABEL" ],
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

sub op {
    my ($class, $name, $args, %opts) = @_;

    $DB::single = 1 if ref $name;
    my $self = bless { name => $name,
                       args => $args || [],
                       %opts }, (ref($class) || $class);

    $self->init();
    return $self;
}

sub init {
    # Nothing to do
}

1;
