#! perl
# Copyright (C) 2001-2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( lib );
use Parrot::Pmc2c::PMC::PrintTree;

my ( %action, %options, @pmc_include_paths );

my @args = @ARGV;

my $self = Parrot::Pmc2c::PMC::PrintTree->new(
    {
        include => [ qw( src/pmc src/dynpmc ) ],
        opt     => {},
        args    => \@args,
        bin     => q{},
    }
);

$self->print_tree();
exit;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
