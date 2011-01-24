#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/op/push_cached_eh.t - Test .annotate directive

=head1 SYNOPSIS

    % prove t/op/push_cached_eh.t

=head1 DESCRIPTION

Test various use cases of the push_cached_eh opcode.

=cut

.sub main :main
    .include 'test_more.pir'

    'done_testing'()
.end




# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
