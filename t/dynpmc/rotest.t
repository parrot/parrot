#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/dynpmc/rotest.t -- tests read-only value support through the ROTest dynpmc

=head1 SYNOPSIS

    % prove t/dynpmc/rotest.t

=head1 DESCRIPTION

Tests automatically generated read-only PMC support.

=cut

my $library = <<'CODE';
.include "except_types.pasm"
.sub make_readonly
    .param pmc arg
    .local pmc one
    one = new 'Integer'
    one = 1
    setprop arg, '_ro', one
.end

.sub make_writable
    .param pmc arg
    .local pmc zero
    zero = new 'Integer'
    zero = 0
    setprop arg, '_ro', zero
.end
CODE

{

    # The ROTest dynpmc has opposite of normal logic for set/get integer
    # and 'reader' and 'writer' NCI methods.
    # The values are [should work with read-only, is todo test].
    my %tests = (

        # these first two tests would test overriding of the default
        # read-onlyness notion of vtables
        q{value = 42}  => [ 1, 0 ],
        q{$I0 = value} => [ 0, 0 ],

        # these make sure NCI methods check does-write flags
        # 'writer' is marked as writing; 'reader' is not.
        q{$I0 = value.'reader'()} => [ 1, 0 ],
        q{$I0 = value.'writer'(42)} => [ 0, 0 ],
    );
    for my $test ( keys %tests ) {
        my $code = $library . <<"CODE";
.loadlib 'rotest'
.sub main :main
    .local pmc value, eh
    value = new 'ROTest'
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS, .EXCEPTION_METHOD_NOT_FOUND)
    set_addr eh, eh_label

    #READONLYTEST
    push_eh eh
    $test
    pop_eh
    say "reached end"
    end

eh_label:
    .get_results(\$P0)
    say "RO or method not found exception caught"
    end
.end
CODE
        {
            my ( $readonly, $todo ) = @{ $tests{$test} };

            # first make sure it works without the make_readonly
            pir_output_is( $code, "reached end\n", "ROTest (dry run) ($test)" );
            local $TODO = $todo;
            $code =~ s/#READONLYTEST/make_readonly(value)/;
            if ($readonly) {
                pir_output_is( $code, "reached end\n", "ROTest (read-only/okay) ($test)" );
            }
            else {
                pir_output_is( $code, "RO or method not found exception caught\n", "ROTest (read-only/fail) ($test)" );
            }
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
