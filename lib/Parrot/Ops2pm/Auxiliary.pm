# Copyright (C) 2007, Parrot Foundation.
# $Id$
package Parrot::Ops2pm::Auxiliary;
use strict;
use warnings;
use vars qw(@ISA @EXPORT_OK);
@ISA       = qw( Exporter );
@EXPORT_OK = qw( Usage getoptions );
use Getopt::Long;

sub Usage {
    print STDERR <<_EOF_;
usage: tools/build/ops2pm.pl [--help] [--no-lines] input.ops [input2.ops ...]
_EOF_
    return 1;
}

sub getoptions {
    my %flags;
    GetOptions(
        "no-lines" => \$flags{nolines},
        "help"     => \$flags{help},
        "renum"    => \$flags{renum},
    );
    return \%flags;
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Ops2pm::Auxiliary - Non-method subroutines holding functionality for F<tools/build/ops2pm.pl>.

=head1 SYNOPSIS

    use Parrot::Ops2pm::Auxiliary qw( Usage getoptions );

    Usage();

    $flagref = getoptions();

=cut

=head1 DESCRIPTION

Parrot::Ops2pm::Auxiliary provides subroutines called by F<tools/build/ops2pm.pl>, a
program which is called at the very beginning of the Parrot F<make> process.
This package is intended to hold subroutines used by that program I<other
than> the object-oriented methods provided by Parrot::Ops2pm.

Extraction of the subroutines exported by this package from
F<tools/build/ops2pm.pl> facilitates the testing of their functionality by the
tests in F<t/tools/ops2pm/*.t>.

=head1 SUBROUTINES

=head2 C<Usage()>

=over 4

=item * Purpose

Display a short description of how to use F<tools/build/ops2pm.pl> on
standard output.

    usage: tools/build/ops2pm.pl [--help] [--no-lines] input.ops [input2.ops ...]

=item * Arguments

None.

=item * Return Value

Implicitly returns true upon successful printing.

=back

=head2 C<getoptions>

=over 4

=item * Purpose

Process arguments provided on command-line to F<tools/build/ops2pm.pl>.

=item * Arguments

None.

=item * Return Value

Hash reference where any of the following keys may or may not be defined.

   no-lines
   help
   renum

=item * Comment

A wrapper around Getopt::Long::GetOptions() designed to assure testability.

=back

=head1 AUTHOR

Jim Keenan (refactoring code originally found in F<tools/build/ops2pm.pl>).

=head1 SEE ALSO

Parrot::Ops2pm.  F<tools/build/ops2pm.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
