#!perl
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 11;

=head1 NAME

t/pmc/parrotobject.t - test the Object PMC


=head1 SYNOPSIS

    % prove t/pmc/parrotobject.t

=head1 DESCRIPTION

Tests the Object PMC.

=cut

pir_error_output_like( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, ['Object']
    print "ok 1\n"
.end
CODE
/Object must be created by a class./
OUT

# '

pir_output_is( <<'CODE', <<'OUT', ':vtable override' );
.sub main :main
   $P0 = newclass [ "Test" ]
   $P1 = new [ "Test" ]
   $I1 = $P1[11]
   print $I1
   print "\n"
.end

.namespace [ "Test" ]

.sub get_integer_keyed_int :method :vtable
   .param int key
   .return(42)
.end
CODE
42
OUT

# '

pir_output_is( <<'CODE', <<'OUT', ':vtable("...") override' );
.sub main :main
    $P0 = newclass [ "Test" ]
    $P1 = new [ "Test" ]
    $S1 = $P1[11]
    print $S1
    print "\n"
.end

.namespace [ "Test" ]

.sub monkey :method :vtable("get_string_keyed_int")
    .param int key
    .return("monkey")
.end
CODE
monkey
OUT

# '

pir_error_output_like( <<'CODE', <<'OUT', ':vtable with bad name' );
.namespace [ "Test" ]

.sub monkey :method :vtable("not_in_the_vtable")
    .param int key
    .return("monkey")
.end
CODE
/'not_in_the_vtable' is not a vtable, but was used with :vtable/
OUT

# '

pir_output_is( <<'CODE', <<'OUT', ':vtable and init' );
.sub main :main
   $P0 = newclass [ "Test" ]
   $P1 = new [ "Test" ]
   print "ok\n"
.end

.namespace [ "Test" ]

.sub init :method :vtable
   print "init\n"
.end
CODE
init
ok
OUT

# '

pir_output_is( <<'CODE', <<'OUT', ':vtable inheritance' );
.sub main :main
   $P0 = newclass [ "Test" ]
   $P1 = newclass [ "Test2" ]
   addparent $P1, $P0
   $P2 = new [ "Test2" ]
   $P3 = clone $P2
   print "ok\n"
.end

.namespace [ "Test" ]

.sub clone :method :vtable
   print "cloned\n"
.end

.namespace [ "Test2" ]
CODE
cloned
ok
OUT

# '

pir_output_is( <<'CODE', <<'OUT', ':vtable inheritance from core classes' );
.sub main :main
    $P0 = subclass 'Hash', 'Foo'
    $P0 = subclass 'Hash', 'Bar'

    $P1 = new ['Foo']
    $S1 = $P1
    say $S1

    $P1 = new ['Bar']
    $S1 = $P1
    say $S1
.end


.namespace [ 'Foo' ]

.sub 'get_string' :vtable :method
    .return('Foo::get_string')
.end


.namespace [ 'Bar' ]

.sub 'get_string' :vtable :method
    .return('Bar::get_string')
.end
CODE
Foo::get_string
Bar::get_string
OUT

# assign opcode in inherited classes
pir_output_is(
    <<'CODE', <<'OUT', 'assign opcode in inherited classes' );
.sub main :main
    $P1 = new ['ResizablePMCArray']
    push $P1, 3
    $P2 = new ['ResizablePMCArray']
    assign $P2, $P1
    $I0 = elements $P2
    print $I0
    print "\n"

    $P99 = subclass 'ResizablePMCArray', 'Perl6List'
    $P1 = new 'Perl6List'
    push $P1, 3
    $P2 = new 'Perl6List'
    assign $P2, $P1
    $I0 = elements $P2
    print $I0
    print "\n"
.end
CODE
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'Execution ends after returning from invoke' );
.namespace ['Foo']

.sub invoke :vtable
say "you invoked me!"
.return()
.end

.sub main :main
$P0 = newclass "Foo"
$P1 = new ['Foo']
$P1($P1)   # pass the object it"self"
say "got here"
.end
CODE
you invoked me!
got here
OUT

pir_output_is( <<'CODE', <<'OUT', 'params/returns from overridden invoke' );
.namespace ['Foo']

.sub invoke :vtable
  .param int a
  print a
  print "\n"
  inc a
  .return(a)
.end

.sub main :main
  $P0 = newclass "Foo"
  $P1 = new ['Foo']
  $I0 = $P1($P1, 2) # pass the object it"self"
  print $I0
  print "\n"
.end
CODE
2
3
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'handle too few positional arguments' );
.namespace ['Foo']

.sub invoke :vtable
  .param pmc a
  say 'hi'
.end

.sub main :main
    $P0 = newclass "Foo"
    $P1 = new ['Foo']
    $P1()
.end
CODE
/too few positional arguments/
OUT

# '

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
