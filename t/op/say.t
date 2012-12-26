#!perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/op/say.t - Testing the say pseudo-opcode

=head1 SYNOPSIS

    % prove t/op/say.t

=head1 DESCRIPTION

Tests various PMCs and registers with say.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a literal string' );
.sub main :main
    say "string literal"
.end
CODE
string literal
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a literal integer' );
.sub main :main
    say 42
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a literal number' );
.sub main :main
    say 3.14
.end
CODE
3.14
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a temporary string register' );
.sub main :main
    $S5 = "string register"
    say $S5
.end
CODE
string register
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a temporary integer register' );
.sub main :main
    $I4 = 10
    say $I4
.end
CODE
10
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a temporary number register' );
.sub main :main
    $N2 = 1.414
    say $N2
.end
CODE
1.414
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say and print with a number register' );
.sub main :main
    $N0 = 3.14159
    say $N0
    print $N0
    print "\n"
.end
CODE
3.14159
3.14159
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'say with PMCNULL argument' );
.sub main :main
    null $P0
    say $P0
.end
CODE
/Null PMC in say/
OUTPUT

# [GH #893] 80% of threaded say should print the \n immediately after the string.
my ($good, $fail) = (0,0);
for (0..9) {
    my $result = Parrot::Test::_pir_stdin_output_slurp('',<<'CODE');
.sub main :main
    $P0 = get_global 'task'
    $P1 = new 'Task', $P0
    schedule $P1
    $P2 = new 'Task', $P0
    schedule $P2
    $P3 = new 'Task', $P0
    schedule $P3
    $P4 = new 'Task', $P0
    schedule $P4
    wait $P1
    wait $P2
    wait $P3
    wait $P4
    sleep 0.1
.end
.sub task
    say "line"
.end
CODE

    if ($result =~ /lineline/) {
        $fail++;
    } else {
        $good++;
    }
}
ok($good >= 8, "threads: better atomic say. $good/10");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
