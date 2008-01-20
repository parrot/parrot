# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

tools/build/revision_c.pl

=head1 DESCRIPTION

Creates F<src/revision.c> with current rev number taken from
F<.svn/entries> or F<.svk/entries> and config rev number of last
Parrot configure run.

=head1 SEE ALSO

F<config/gen/revision.pl>,
F<lib/Parrot/Revision.pm>,
F<include/parrot/config.h>

=cut

use warnings;
use strict;
use lib qw{lib . ../lib ../../ lib};
use Parrot::Revision::Utils qw(
    get_revision_numbers
    print_src_revision_c
);

my ($current, $config) = get_revision_numbers();

print_src_revision_c($current, $config, $0);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
