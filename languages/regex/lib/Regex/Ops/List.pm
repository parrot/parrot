package Regex::Ops::List;
use Regex::Grammar;
use base 'Exporter';
use strict;

use vars qw(@AsmOps @EXPORT);

#  advance
#  delete
#  end
#  goto
#  if
#  match_failed
#  match_succeeded
#  nop
#  op
#  pop_reg
#  popindex
#  preamble
#  push_reg
#  pushindex
#  pushmark
#  seq
#  start
#  terminate
#  test

@AsmOps =
  ( [ "scan(R)" => "scan for R at every position" ],
    [ "terminate()" ],
    [ "atend()" => "return whether at end of input string" ],
    [ "advance(n)" => "advance input <n> chars" ],
    [ "onfail(R)" ],
    [ "match(b)" => "return if start of input is b, advance 1 char" ],
    [ "classmatch(charclass)" => "return if start of input is charclass, advance 1" ],

    [ "start(n)" => "mark start of n-th paren match" ],
    [ "end(n)" => "mark end of n-th paren match" ],
    [ "delete(n)" => "delete record of n-th paren match" ],

    [ "goto(label)" => "unconditional jump to label" ],
    [ "label(name)" => "declare a label" ],
    [ "incr(name)" => "???" ],
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

foreach (@AsmOps) {
    my ($proto, $desc) = @$_;
    my ($name) = $proto =~ /^(\w+)/;
    eval "sub aop_$name { bless Regex::Grammar::register(\"$name\", \@_), 'asm_op' }";
    push @EXPORT, "\&aop_$name";
}

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

sub mark {
    my ($class, $name) = @_;
    return bless { name => 'LABEL', label => $name }, (ref($class)||$class);
}

1;
