#!perl
# Copyright (C) 2009-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/op/exit.t - Testing the exit pseudo-opcode

=head1 SYNOPSIS

    % prove t/op/exit.t

=head1 DESCRIPTION

Test both success and failure exit status.

=cut

pir_exit_code_is( <<'CODE', 0, 'pir exit with success' );
.sub main :main
    exit 0
.end
CODE

pir_exit_code_is( <<'CODE', 1, 'pir exit with failure' );
.sub main :main
    exit 1
.end
CODE

pasm_exit_code_is( <<'CODE', 1, 'pasm exit with failure' );
.pcc_sub :main main:
    exit 1
CODE

pasm_exit_code_is( <<'CODE', 0, 'pasm exit without failure' );
.pcc_sub :main main:
    exit 0
CODE

# If you know of a better place to put these tests, please put them there

pir_exit_code_is( <<'CODE', 0, 'pir exits with success by default' );
.sub main :main
    $S0 = "cheese"
.end
CODE

TODO: {
    local $TODO = 'pasm exits with 1 by default';
    pasm_exit_code_is( <<'CODE', 0, 'exit with success by default' );
        set I0, 0
        end
CODE

}

pir_exit_code_is( <<'CODE', 2, "pir exit code isn't exception type" );
.sub main :main
    $P0 = new ['ExceptionHandler']
    set_label $P0, catcher
    $P0.'handle_types'(2)
    push_eh $P0
    exit 2
  catcher:
    # we shouldn't arrive here
    pop_eh
    exit 10
.end
CODE

my $exit_3_snippet = <<'CODE';
.sub main :main
    exit 3
.end
CODE

pir_exit_code_is($exit_3_snippet, 3, "exit 3 causes exit code 3");
pir_error_output_like($exit_3_snippet, '/^\s*$/', "exit opcode causes no error message to print");


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
