#!perl
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/op/exit.t - Testing the exit pseudo-opcode

=head1 SYNOPSIS

    % prove t/op/exit.t

=head1 DESCRIPTION

Test both success and failure exit status.

=cut

pir_exit_code_is( <<'CODE', 0, 'pir exit with success' );
.sub main
    exit 0
.end
CODE

pir_exit_code_is( <<'CODE', 1, 'pir exit with failure' );
.sub main
    exit 1
.end
CODE

pasm_exit_code_is( <<'CODE', 1, 'pasm exit with failure' );
    exit 1
CODE

pasm_exit_code_is( <<'CODE', 0, 'pasm exit without failure' );
    exit 0
CODE

# If you know of a better place to put these tests, please put them there

pir_exit_code_is( <<'CODE', 0, 'pir exits with success by default' );
.sub main
    $S0 = "cheese"
.end
CODE

TODO: {
    local $TODO = 'pasm exits with 1 by default';
    pasm_exit_code_is( <<'CODE', 0, 'exit with success by default' );
        set I0, 0
CODE

}
TODO: {
    local $TODO = 'pbc exits with 1 by default';
    # Should we be using this file?
    my $pbc = File::Spec->catfile(qw/ t native_pbc integer_1.pbc /);
    pbc_exit_code_is($pbc, 0, 'pbc exits with 0 by default');
}

pir_exit_code_is( <<'CODE', 2, "pir exit code isn't exception type" );
.sub main
    $P0 = new ['ExceptionHandler']
    set_addr $P0, catcher
    $P0.'handle_types'(2)
    push_eh $P0
    exit 2
  catcher:
    # we shouldn't arrive here
    pop_eh
    exit 10
.end
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
