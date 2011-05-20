# Copyright (C) 2004-2011, Parrot Foundation.

package Parrot::Pmc2c::Pmc2cMain;

use strict;
use warnings;

use File::Spec ();
use Carp;
use Storable;

use Parrot::PMC ();
use Parrot::Pmc2c::VTable ();
use Parrot::Pmc2c::Dumper 'dump_pmc';
use Parrot::Pmc2c::Library ();
use Parrot::Pmc2c::UtilFunctions 'filename';
use Parrot::Pmc2c::PMC::default ();
use Parrot::Pmc2c::PMC::Null ();
use Parrot::Pmc2c::PMC::Object ();

# put the options in a package var so it can be accessed from
# Parrot::Pmc2c::Emitter.
our $OPTIONS;

# This is useful for debugging, but upgrades deprecation warnings to errors.
#$SIG{'__WARN__'} = sub { use Carp; warn $_[0]; Carp::confess; };

=head1 NAME

Parrot::Pmc2c::Pmc2cMain - Functions called within F<tools/build/pmc2c.pl>

=head1 SYNOPSIS

    use Parrot::Pmc2c::Pmc2cMain;

=head1 DESCRIPTION

Parrot::Pmc2c::Pmc2cMain holds subroutines called within F<tools/build/pmc2c.pl>.

=cut

=head1 FUNCTIONS

=head2 Publicly Available Methods

=head3 C<new()>

    $self = Parrot::Pmc2c::Pmc2cMain->new( {
        include => \@include,
        opt     => \%opt,
        args    => \@args,
    } );

B<Purpose:>  Parrot::Pmc2c::Pmc2cMain constructor.

B<Arguments:>  Reference to a hash holding 3 required keys:

=over 4

=item * C<include>

Array reference.  Array passed holds list of paths in which various methods
should try to locate files.

=item * C<opt>

Hash reference.  Holds results of processing of options to C<pmc2c.pl()>.

=item * C<args>

Array reference.  In most cases, the array passed will hold the elements of
C<@ARGV> remaining after options processing.

=back

B<Return Values:>  Parrot::Pmc2c::Pmc2cMain object.  Will C<die> with error
message if arguments are defective.

=cut

sub new {
    my ( $class, $allargsref ) = @_;
    die "Must pass a hash ref to Parrot::Pmc2c::Pmc2cMain::new"
        unless ref($allargsref) eq q{HASH};
    die "Must have key 'include' which is a reference to an array of directories"
        unless ( defined $allargsref->{include} and ref( $allargsref->{include} ) eq q{ARRAY} );
    die "Must have key 'opt' which is a reference to a hash of option values"
        unless ( defined $allargsref->{opt} and ref( $allargsref->{opt} ) eq q{HASH} );
    die "Must have key 'args' which is a reference to a list of the remaining arguments"
        unless ( defined $allargsref->{args} and ref( $allargsref->{args} ) eq q{ARRAY} );

    unshift @{ $allargsref->{include} },
        '.', "$allargsref->{bin}/../..", "$allargsref->{bin}/../../src/pmc", "$allargsref->{bin}/../../src/dynpmc";

    foreach my $opt ( qw(nolines) ) {
        if ( !defined $allargsref->{opt}{$opt} ) {
            $allargsref->{opt}{$opt} = 0;
        }
    }

    $OPTIONS = $allargsref->{opt};

    return bless( $allargsref, $class );
}

=head3 C<dump_vtable()>

    $self->dump_vtable("$Bin/../../src/vtable.tbl");

B<Purpose:>  Create a F<.dump> file for the default vtable (from which
all PMCs inherit).

B<Arguments:>  Scalar holding filename of vtable.

B<Return Values:>  Scalar holding path to F<.dump> file.

B<Comments:>  In earlier version of F<pmc2c.pl>, this subroutine returned
C<undef> upon success.  This was changed to more Perl-ish C<1>.

If the caller of this subroutine has C<chdir>-ed to a tempdir before this
subroutine is called -- as ought to be the case during testing of build
tools -- then F<vtable.dump> will be created within that tempdir.
Otherwise, F<vtable.dump> is created in the caller's working directory.
When the caller is F<make>, that directory is the top-level Parrot directory.

=cut

sub dump_vtable {
    my ( $self, $file ) = @_;
    return Parrot::Pmc2c::VTable->new($file)->dump;
}

=head3 C<dump_pmc()>

see C<lib/Parrot/Pmc2c/Dumper>.

=head3 C<read_dump()>

  $self->read_dump('filename');

B<Purpose:>  A F<.dump> file is the result of a call to C<dump_pmc()> and
consists of a binary dump of a hash reference, Storable-style.
C<read_dump()> reads in the F<.dump> file, recreates the data structure and
returns a new hash reference holding the data structure.

B<Arguments:>  Scalar holding name of file whose structure is to be dumped.
The method will only process F<foo.dump> files, but you can also pass
C<'foo.c'> or C<'foo.pmc'> as the argument and it will analyze the
corresponding F<foo.dump> file.

B<Return Values:>  Reference to hash holding recreated data structure.

B<Comment:>  If the appropriate F<.dump> file cannot be located, program
will die with error message (see C<find_file()> above).
Called internally by C<gen_c()>, C<gen_parent_list()>,
C<dump_pmc()>.

=cut

sub read_dump {
    my ( $self, $filename ) = @_;
    $filename = $self->find_file( filename( $filename, '.dump' ), 1 );

    return unless -f $filename;
    return Storable::retrieve($filename);
}

=head3 C<gen_c()>

    $return_value = $self->gen_c();

B<Purpose:>  Generate the C source code file for each of the files passed in,
using the directories passed in to search for the PMC dump files.

B<Arguments:>  None.

B<Return Values:>  Returns C<1> upon success.

B<Comment:>  Internally calls C<Parrot::Pmc2c::Library::new()> and
C<write_all_files()>.  In earlier version of F<pmc2c.pl>, this
subroutine returned C<undef> upon success.  This was changed to more
Perl-ish C<1>.

=cut

sub gen_c {
    my $self        = shift;
    my $vtable_dump = $self->read_dump("vtable.pmc");

    foreach my $filename ( @{ $self->{args} } ) {
        Parrot::Pmc2c::PMC->prep_for_emit( $self->read_dump($filename), $vtable_dump )->generate;
    }
    return 1;
}

sub gen_library {
    my ( $self, $library_name ) = @_;
    my $pmcs = [ map { $self->read_dump($_) } @{ $self->{args} } ];

    Parrot::Pmc2c::Library->generate_library( $library_name, $pmcs );
    return 1;
}

=head2 Subroutines

These are auxiliary subroutines called inside the methods described above.


=head3 C<find_file()>

    $path = $self->find_file($file, $die_unless_found_flag);

B<Purpose:>  Return the full path to C<$file>.  (Search in the directories
listed in the C<include> key in the hash passed by reference to the
constructor).  Optionally, die with an error message if that file cannot
be found.

B<Arguments:>  Two arguments.  Required:  string holding name of the file
sought.  Optional:  a flag variable which, if set to a true value, will cause
program to die if file is not located.

B<Return Values:>  Upon success, string holding a path.  Upon failure,
C<undef> (unless C<$die_unless_found_flag> is set to a true value, in which
case program C<die>s).

B<Comment:>  Called inside C<read_dump()> and C<dump_pmc()>.

=cut

sub find_file {
    my ( $self, $file, $die_unless_found ) = @_;

    return $file if ( File::Spec->file_name_is_absolute($file) && -e $file );

    my @includes = @{ $self->{include} };
    foreach my $dir (@includes) {
        my $path = File::Spec->catfile( $dir, $file );
        return $path if -e $path;
    }

    if ($die_unless_found) {
        my $includes_list = join q|', '| => @includes;
        Carp::confess("cannot find file '$file' in path '$includes_list'");
    }

    return;
}

=head1 AUTHOR

Leopold Toetsch wrote F<pmc2c.pl>.  It was cleaned up by Matt Diephouse.
James E Keenan extracted the subroutines into F<lib/Parrot/Pmc2c/Pmc2cMain.pm> and
wrote the accompanying test suite.

=head1 SEE ALSO

F<tools/build/pmc2c.pl>, Parrot::Pmc2c, Parrot::Pmc2c::Library.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
