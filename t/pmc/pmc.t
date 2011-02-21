#!perl
# Copyright (C) 2001-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 15;
use Parrot::PMC '%pmc_types';

=head1 NAME

t/pmc/pmc.t - PMCs

=head1 SYNOPSIS

    % prove t/pmc/pmc.t

=head1 DESCRIPTION

Contains a lot of PMC related tests.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', "newpmc" );
.sub main :main
    say "starting"
    new $P0, ['Integer']
    say "ending"
.end
CODE
starting
ending
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'typeof' );
.sub main :main
    new $P0, ['Integer']
    typeof $S0, $P0
    eq     $S0, "Integer", OK_1
    print  "not "
OK_1:
    print  "ok 1\n"
.end
CODE
ok 1
OUTPUT

my $checkTypes;
my %types_we_cant_test
    = map { $_ => 1; } (    # These require initializers.
    qw(default Null Iterator ArrayIterator HashIterator StringIterator
        OrderedHashIterator Enumerate ParrotObject ParrotThread BigInt LexInfo
        LexPad Object Handle Opcode OpLib StructView),

    # Instances of these appear to have other types.
    qw(PMCProxy Class) );
while ( my ( $type, $id ) = each %pmc_types ) {
    next
        if $types_we_cant_test{$type};
    my $set_ro = ( $type =~ /^Const\w+/ ) ? <<'PIR' : '';
    new $P10, ['Integer']
    set $P10, 1
    setprop $P0, "_ro", $P10
PIR
    $checkTypes .= qq{ new \$P0, '$type'\n$set_ro\n};
    $checkTypes .= qq{ set \$S1, "$type"\n};
    $checkTypes .= <<'CHECK';
    typeof $S0, $P0
    ne $S0, $S1, L_BadName
CHECK
}

pir_output_like( <<"CODE", qr/All names ok/, "PMC type check" );
.sub main :main
    new \$P10, ['Hash']
    new \$P11, ['Hash']
$checkTypes
    say "All names ok."
    end
L_BadName:
    print \$S1
    print " PMCs have incorrect name \\""
    print \$S0
    print "\\"\\n"
.end
CODE

pir_error_output_like( <<'CODE', <<'OUTPUT', 'find_method' );
.sub main :main
    new $P1, ['Integer']
    find_method $P0, $P1, "no_such_meth"
.end
CODE
/Method 'no_such_meth' not found for invocant of class 'Integer'/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "eq_addr same" );
.sub main :main
      new $P0, ['Integer']
      set $P1, $P0
      eq_addr $P0, $P1, OK1
      print "not "
OK1:  print "ok 1\n"
      ne_addr $P0, $P1, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "eq_addr diff" );
.sub main :main
      new $P0, ['Integer']
      new $P1, ['Integer']
      ne_addr $P0, $P1, OK1
      print "not "
OK1:  print "ok 1\n"
      eq_addr $P0, $P1, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "if_null" );
.sub main :main
      null $P0
      if_null $P0, OK1
      print "not "
OK1:  print "ok 1\n"
      new $P0, ['Integer']
      if_null $P0, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Env PMCs are singletons" );
.sub main :main
    new $P0, ['Env']
    new $P1, ['Env']
    eq_addr $P0, $P1, ok
    print "not the same "
ok: print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "issame" );
.sub main :main
    new $P0, ['Undef']
    new $P1, ['Undef']
    set $P1, $P0
    issame $I0, $P0, $P1
    print $I0
    isntsame $I0, $P0, $P1
    print $I0
    new $P2, ['Undef']
    issame $I0, $P0, $P2
    print $I0
    isntsame $I0, $P0, $P2
    say $I0
.end
CODE
1001
OUTPUT

pir_output_is( <<'CODE', <<'OUT', ".const - Sub constant" );
.sub main :main
    print "ok 1\n"
    .const 'Sub' $P0 = "foo"
    invokecc $P0
    print "ok 3\n"
.end
.sub foo
    print "ok 2\n"
    returncc
.end
CODE
ok 1
ok 2
ok 3
OUT

pir_output_is( <<'CODE', <<'OUT', "Integer pmc constant " );
.sub main :main
    .const 'Integer' i = "42"
    say i
.end
CODE
42
OUT

pir_output_is( <<'CODE', <<'OUT', "Float pmc constant " );
.sub main :main
    .const 'Float' j = "4.2"
    say j
.end
CODE
4.2
OUT

pir_output_is( <<'CODE', <<'OUT', "pmc constant" );
.sub main :main
    .const 'Integer' $P0 = "42"
    say $P0
.end
CODE
42
OUT

pir_output_is( <<'CODE', <<'OUT', "logical or, and, xor" );
.sub main :main
    new $P0, ['Integer']
    set $P0, 2
    new $P1, ['Undef']
    or $P2, $P0, $P1
    eq_addr $P2, $P0, ok1
    print "not "
ok1:
    print "ok 1\n"
    and $P2, $P0, $P1
    eq_addr $P2, $P1, ok2
    print "not "
ok2:
    print "ok 2\n"
    xor $P2, $P0, $P1
    eq_addr $P2, $P0, ok3
    print "not "
ok3:
    print "ok 3\n"
.end
CODE
ok 1
ok 2
ok 3
OUT

pir_output_is( <<'CODE', <<'OUTPUT', "new_p_s" );
.sub main :main
    new $P3, ['Integer']
    set $P3, "42"
    typeof $S0, $P3
    print $S0
    print "\n"
    set $I0, $P3
    print $I0
    print "\n"
.end
CODE
String
42
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
