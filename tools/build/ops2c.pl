#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use warnings;
use strict;
use FindBin qw($Bin);
use lib "$Bin/../lib";    # install location
use lib "$Bin/../../lib"; # build location
use Parrot::Ops2c::Auxiliary qw( Usage getoptions );
use Parrot::Ops2c::Utils ();

my $flagref = getoptions();
if ( ( not defined $flagref )
    or $flagref->{help}
    or ( not @ARGV ) )
{
    Usage();
    exit 1;
}

my $self = Parrot::Ops2c::Utils->new(
    {
        argv   => [@ARGV],
        flag   => $flagref,
        script => $0,
    }
);
if ( not defined $self ) {
    Usage();
    exit 1;
}

$self->print_c_header_file();

$self->print_c_source_file();

exit 0;

#################### DOCUMENTATION ####################

=head1 NAME

tools/build/ops2c.pl - Parser for .ops files

=head1 SYNOPSIS

    % perl tools/build/ops2c.pl trans [--help] [--no-lines] [--dynamic]
                                      [--core | input.ops [input2.ops ...]]
       trans := C

For example:

    % perl tools/build/ops2c.pl C --core

    % perl tools/build/ops2c.pl C --dynamic myops.ops

=head1 DESCRIPTION

This script uses a supplied transform to create a pair of C header and
implementation files from the operation definitions found in one or more
F<*.ops> files.

=head2 Transforms

The first command-line argument is the last package name component of a
subclass of C<Parrot::OpTrans>. These subclasses all have full names of
the form C<Parrot::OpTrans::*>. An instance of the class is created and
later consulted for various bits of information needed to generate the C
code. Each creates a different type of run loop.

=over

=item C<C>

Create the function-based (slow or fast core) run loop.

=back

=head2 Options

=over 4

=item C<--help>

Print synopsis.

=item C<--dynamic>

Indicate that the opcode library is dynamic.

=item C<--core>

Build the Parrot core opcode library.

=item C<--no-lines>

Do not generate C<#line> directives in the generated C code.

=back

=head1 NOTE

Most of the functionality in F<tools/build/ops2c.pl> has been extracted into
methods and subroutines found in Parrot::Ops2c::Utils and
Parrot::Ops2c::Auxiliary.  This refactoring facilitates unit testing and
coverage analysis of that functionality.  A test suite has been provided in
F<t/tools/ops2cutils/>.  It is recommended that future refactoring of this
functionality proceed in a test-driven manner, I<i.e.,> tests should be
written reflecting any changes to interface or functionality; the code should
be written which implements the revisions; the code should be tested; and
coverage analysis should be performed with Devel::Cover to measure the extent
to which the tests exercise the code.

=head1 AUTHORS

Based on the commit logs, the following members of the Parrot project have
contributed to this program:

    ambs bernhard boemmels brentdax chip
    coke dan gregor grunblatt jgoff
    jkeenan jonathan josh jrieks leo
    mikescott mrjoltcola nicholas particle paultcochrane
    petdance rgrjr robert simon

=head1 SEE ALSO

=over 4

=item F<tools/build/ops2pm.pl>

=item C<Parrot::OpsFile>

=item C<Parrot::Op>

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::C>

=item C<Parrot::Ops2c::Utils>

=item C<Parrot::Ops2c::Auxiliary>

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

