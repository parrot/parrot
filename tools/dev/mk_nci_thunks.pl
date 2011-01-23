#! perl
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

tools/dev/mk_nci_thunks.pl - (re)generate core NCI thunk files

=head1 SYNOPSIS

  > perl tools/dev/mk_nci_thunks.pl

=head1 DESCRIPTION

This script generates the core NCI thunk C files from lists of signatures
provided in accompanying C<.nci> files.

=cut

use strict;
use warnings;

foreach (qw( core_thunks extra_thunks )) {
    my $c_file   = "src/nci/$_.c";
    my $nci_file = "src/nci/$_.nci";
    my $loader_name = "Parrot_nci_load_$_";
    print "$nci_file > $c_file\n";
    system("./parrot tools/dev/nci_thunk_gen.pir " .
            "--core " .
            "--loader-name=$loader_name " .
            "--output=$c_file " .
            "--no-warn-dups " .
            "<$nci_file "
    );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
