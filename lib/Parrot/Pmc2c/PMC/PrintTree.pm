package Parrot::Pmc2c::PMC::PrintTree;
# Copyright (C) 2007, Parrot Foundation.
# $Id$
use strict;
use warnings;
use base 'Parrot::Pmc2c::Pmc2cMain';

=head1 NAME

Parrot::Pmc2c::PMC::PrintTree

=head1 DESCRIPTION

This class inherits from Parrot::Pmc2c::Pmc2cMain and adds one method,
C<print_tree()>.  C<print_tree()> is called within F<tools/dev/pmctree.pl>.

=head2 METHODS

=head3 C<print_tree()>

    $self->print_tree( {
        depth   => 0,
        files   => [ @files_to_be_printed ],    # optional
    } );

B<Purpose:>  Print the inheritance tree for each of the files, using the
given directories to search for all of correct PMCs.

B<Arguments:>  Reference to hash holding key-value pairs.

=over 4

=item * depth

Number holding the display depth.  Used for the recursive
definition of this function.  Defaults to C<0> if not specified.

=item * files

Optional.  Reference to an array holding a list of files.  If not supplied, the
value of the C<args> key in C<Parrot::Pmc2c::Pmc2cMain::new()> will be used.
(This is used for the recursive call.)

=back

B<Return Values:>  C<1> upon successful printing.

B<Comment:>  C<print_tree()> was formerly found within Parrot::Pmc2c::Pmc2cMain.
However, since the primary purpose of that class is to provide methods for a
different program, F<tools/build/pmc2c.pl>, which is invoked repeatedly by
F<make>, it was felt better to extract this method into a class of its own.

B<Comment:>  In earlier version of F<pmc2c.pl>, this subroutine returned
C<undef> upon success.  This was changed to more Perl-ish C<1>.

=cut

sub print_tree {
    my ( $self, $argsref ) = @_;
    die "This program may only be called after 'make' has run"
        unless (-e 'parrot' or -e 'parrot.exe');
    my $depth = $argsref->{depth} || 0;
    my @files;

    # First, look for list of files provided as argument to 'files' key in
    # hash passed by ref to this method call.
    if ( defined $argsref->{files} ) {
        die "Value of 'files' key in call to print_tree() must be array ref"
            unless ref( $argsref->{files} ) eq 'ARRAY';
        die
"Array ref which is value of 'files' key in call to print_tree() must hold positive number of files"
            unless scalar( @{ $argsref->{files} } );
        @files = @{ $argsref->{files} };

        # Next, look for list of files provided as argument to 'args' key of
        # constructor.
    }
    else {
        @files = @{ $self->{args} };
        if ( !@files ) {
            die "print_tree() lacked files to print; nothing in constructor's 'args' key";
        }
    }
    for my $f (@files) {
        my $class = $self->read_dump($f);
        print "    " x $depth, $class->{name}, "\n";
        for my $k ( @{ $class->parents } ) {
            unless ( $k eq $class->{name} ) {
                $self->print_tree(
                    {
                        depth => $depth + 1,
                        files => [ lc("$k.pmc") ],
                    }
                );
            }
        }
    }
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
