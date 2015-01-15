#! perl
# Copyright (C) 2010-2015, Parrot Foundation.

=head1 NAME

tools/dev/mk_nci_thunks.pl - (re)generate core NCI thunk files

=head1 SYNOPSIS

  > perl tools/dev/mk_nci_thunks.pl

=head1 DESCRIPTION

This script generates the core NCI thunk C files from lists of signatures
provided in accompanying C<.nci> files.
These are needed for static signatures without libffi.

=cut

use strict;
use warnings;
use File::Spec;

my $nci_thunk_gen = File::Spec->catfile(qw(tools dev nci_thunk_gen.pir));
my $parrot = $^O eq 'MSWin32' ? "parrot" : "./parrot";

foreach (qw( core_thunks extra_thunks )) {
    my $c_file   = File::Spec->catfile("src", "nci", "$_.c");
    my $nci_file = File::Spec->catfile("src", "nci", "$_.nci");
    my $loader_name = "Parrot_nci_load_$_";
    my $cmd = "$parrot $nci_thunk_gen " .
            "--core " .
            "--loader-name=$loader_name " .
            "--output=$c_file " .
            "--no-warn-dups " .
            "<$nci_file";
    print $cmd,"\n";
    system($cmd);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
