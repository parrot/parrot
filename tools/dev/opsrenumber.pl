#! perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib 'lib';
use Parrot::OpsRenumber;

my $self = Parrot::OpsRenumber->new(
    {
        argv    => [@ARGV],
        moddir  => "lib/Parrot/OpLib",
        module  => "core.pm",
        inc_dir => "include/parrot/oplib",
        inc_f   => "ops.h",
        script  => "tools/dev/opsrenumber.pl",
    }
);

$self->prepare_ops();
$self->renum_op_map_file();

exit 0;

################### DOCUMENTATION ####################

=head1 NAME

tools/dev/opsrenumber.pl - Renumber F<src/ops/ops.num>.

=head1 SYNOPSIS

    $ perl tools/dev/opsrenumber.pl input.ops [input2.ops ...]

=head1 DESCRIPTION

This program should be used when adding or removing opcodes.

All opcodes except the first seven are potentially deletable and the opcodes'
order may be rearranged.  However, in and after Parrot 1.0.0, deletion of
opcodes should be a rare event.  The program will automatically detect which
opcodes have been deleted and will renumber the remaining codes appropriately.

The program, however, will B<not> automatically detect new opcodes.   This is
a feature, not a bug, as it is intended to require someone to think about why
new opcodes should be added.  Once a decision to add new opcodes has been
made, those opcodes should be entered manually at the endc of
F<src/ops/ops.num>, then F<tools/dev/opsrenumber.pl> (or F<make opsrenumber>)
should be run.

=head1 SEE ALSO

=over 4

=item F<lib/Parrot/Ops2pm/Base.pm>.

=item F<lib/Parrot/OpsRenumber.pm>.

=back

=head1 AUTHOR

This code was refactored out of F<tools/build/ops2pm.pl>.  That file contains
a list of the contributors to this code over the years.

The refactoring of this file was done by James E Keenan.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
