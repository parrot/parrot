# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$
package Parrot::Pmc2c::Pmc2cMain;
use strict;
use warnings;
use FindBin;
use Data::Dumper;
use Parrot::Vtable;
use Parrot::Pmc2c::Library;
use Parrot::Pmc2c::PCCMETHOD;
use Parrot::Pmc2c::Parser qw(parse_pmc);
use Cwd qw(cwd realpath);
use File::Basename;
use Carp;

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
        ( ".", "$FindBin::Bin/../..", "$FindBin::Bin/../../src/pmc/" );

    foreach my $opt qw(nolines debug verbose) {
        if ( !defined $allargsref->{opt}{$opt} ) {
            $allargsref->{opt}{$opt} = 0;
        }
    }
    return bless( $allargsref, $class );
}

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

    die "cannot find file '$file' in path '", join( "', '", @includes ), "'" if $die_unless_found;
    return;
}

=head3 C<dump_vtable()>

    $self->dump_vtable("$FindBin::Bin/../../vtable.tbl");

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
    my $default = parse_vtable($file);
    my $dump    = $file;
    $dump =~ s/\.\w+$/\.dump/;
    $dump = cwd() . q{/} . basename($dump);

    my $vtd = open_file( ">", $dump, $self->{opt}{verbose} );

    my %vtable = (
        flags => {},
        pre   => '',
        post  => '',
    );
    my %meth_hash;
    my $i = 0;
    foreach my $entry (@$default) {
        $meth_hash{ $entry->[1] } = $i++;
        push @{ $vtable{methods} },
            {
            parameters => $entry->[2],
            meth       => $entry->[1],
            type       => $entry->[0],
            section    => $entry->[3],
            mmd        => $entry->[4],
            attr       => $entry->[5]
            };
    }
    $vtable{'has_method'} = \%meth_hash;

    my $Dumper = Data::Dumper->new( [ \%vtable ], ['class'] );
    $Dumper->Indent(3);
    print $vtd $Dumper->Dump();
    close $vtd;

    return $dump;
}

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

B<Comment:>  In earlier version of F<pmc2c.pl>, this subroutine returned
C<undef> upon success.  This was changed to more Perl-ish C<1>.

The purpose of this method is unclear.  (1) It is not called by Makefile.  (2)
Since internally calls read_dump(), a F<.dump> file must already exist for
this method to generate meaningful output.  But since F<.dump> files do B<not>
exist prior to calling F<make>, this can only be viewed as an attempt at a
utility method to be called B<after> F<make> has run.  That might be useful.
It would be responding to a request such as, "Given these F<.dump> files,
reconstruct the inheritance trees of their ancestral F<.pmc> files."  But
that's a very different purpose from the other methods in this program, whose
point is to go from F<.pmc> to F<.c> files.

=cut

sub print_tree {
    my ( $self, $argsref ) = @_;
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
        if ( @{ $self->{args} } ) {
            @files = @{ $self->{args} };
        }
        else {
            die "print_tree() lacked files to print; nothing in constructor's 'args' key";
        }
    }

    for my $f (@files) {
        my $class = $self->read_dump($f);
        print "    " x $depth, $class->{class}, "\n";
        for my $k ( keys %{ $class->{flags}{extends} } ) {
            $self->print_tree(
                {
                    depth => $depth + 1,
                    files => [ lc("$k.pmc") ],
                }
            );
        }
    }
    return 1;
}

=head3 C<read_dump()>

  $self->read_dump('filename');

B<Purpose:>  A F<.dump> file is the result of a call to C<dump_pmc()> and
consists of a print-out of a hash reference Data::Dumper-style.
C<read_dump()> reads in the F<.dump> file, recreates the data structure and
returns a new hash reference holding the data structure.

B<Arguments:>  Scalar holding name of file whose structure is to be dumped.
The method will only process F<foo.dump> files, but you can also pass
C<'foo.c'> or C<'foo.pmc'> as the argument and it will analyze the
corresponding F<foo.dump> file.

B<Return Values:>  Reference to hash holding recreated data structure.

B<Comment:>  If the appropriate F<.dump> file cannot be located, program
will die with error message (see C<find_file()> above).
Called internally by C<print_tree()>, C<gen_c()>, C<gen_parent_list()>,
C<dump_pmc()>.

=cut

sub read_dump {
    my ( $self, $file ) = @_;

    $file =~ s/\.\w+$/.dump/;
    $file = $self->find_file( $file, 1 );

    my $fh = open_file( "<", $file, $self->{opt}{verbose} );

    my $class;
    eval do { local $/; <$fh> };
    die $@ if $@;

    close $fh;
    return $class;
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
    my $self    = shift;
    my @files   = @{ $self->{args} };
    my $optsref = $self->{opt};
    my %pmcs    = map { $_, $self->read_dump($_) } @files;

    Parrot::Pmc2c::Library->new( $optsref, $self->read_dump("vtable.pmc"), %pmcs )->write_all_files;

    return 1;
}

=head3 C<dump_pmc()>

    $return_value = $self->dump_pmc();

B<Purpose:>  Create a F<.dump> file for each file listed in the constructor's
C<arg> key (which can be found in the directories listed in the C<include> key).

A C<'*.pmc'> glob may also be passed to emulate a proper shell in the presence
of a dumb one.

    $self = Parrot::Pmc2c::Pmc2cMain->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ ( q{*.pmc} ) ],
    } );
    $self->dump_pmc();

B<Arguments:>  None.

B<Return Values:>  Returns 1 upon success.

B<Comments:>  Called when C<--dump> is specified as the command-line option to
F<pmc2c.pl>.

=cut

sub dump_pmc {
    my $self    = shift;
    my @files   = @{ $self->{args} };
    my $opt     = $self->{opt};

    # help these dumb 'shells' that are no shells
    if ( $files[0] eq 'src/pmc/*.pmc' ) {
        @files = glob $files[0];
    }

    # make sure that a default.dump will always be created if it doesn't
    # already exist; do so by adding default.pmc to list of files for dumping
    unshift @files, qq{./src/pmc/default.pmc} unless ( -e qq{./src/pmc/default.dump} );

    my $all;
    for my $file (@files) {
        $file =~ s/\.\w+$/.pmc/;
        $file = $self->find_file( $file, 1 );

        #slurp file contents
        my $fh = open_file( "<", $file );
        my $contents = do { local $/; <$fh> };
        close $fh;

        my $parsed_pmc = parse_pmc( $contents, $opt );
        $parsed_pmc->{file} = $file;
        $all->{$parsed_pmc->{class}} = $parsed_pmc;
    }

    $all->{default} = $self->read_dump("default.pmc") if not $all->{default};

    my $vt = $self->read_dump("vtable.pmc");

    foreach my $entry ( @{ $vt->{methods} } ) {
        my $method_name = $entry->{meth};
        $all->{default}->{super}{$method_name} = 'default';
    }

    foreach my $name ( keys %{$all} ) {
        my $dumpfile = $all->{$name}->{file};
        $dumpfile =~ s/\.\w+$/.dump/;
        my $existing = $self->find_file($dumpfile);

        if ( $dumpfile =~ /default\.dump$/ && defined $existing && dump_is_newer($existing) ) {
           # don't overwrite default.dump skip all preparations for dumping
           next;
        }

        $all = $self->gen_parent_list( $name, $all );

        my $class = gen_super_meths( $name, $all, $vt );
        my $Dumper = Data::Dumper->new( [$class], ['class'] );
        $Dumper->Indent(1);

        my $fh = open_file( ">", $dumpfile );
        print $fh $Dumper->Dump;
        close $fh;
    }    # end foreach loop
    return 1;
}

=head2 Non-Public Methods

These functions are expressed as methods called on the Parrot::Pmc2c::Pmc2cMain
object, but only because they make use of data stored in that object.  They
are called within the publicly available methods described above and are not
intended to be publicly callable.

=head3 C<gen_parent_list()>

    $self->gen_parent_list($name, \%all);

B<Purpose:>  Generate an ordered list of parent classes to put in the
C<$classes->{class}->{parents}> array, using the given directories
to find parents.

B<Arguments:>  List of two arguments:

=over 4

=item *

String holding class name.

=item *

Hash reference holding data structure being built up within C<dump_pmc()>.

=back

B<Return Value:>  Reference to hash holding the data structure being built up
within C<dump_pmc()>, suitably modified.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub gen_parent_list {
    my ( $self, $pmc_name, $all ) = @_;
    my $pmc_class = $all->{$pmc_name};

    # An interesting construction:  note below that in the course of processing
    # @todo, new elements can be pushed on to it.  So it's not necessarily
    # exhausted when $n is shifted off it.
    my @todo = ($pmc_name);
    while (@todo) {
        my $current_pmc_name  = shift @todo;
        next if $current_pmc_name eq 'default';
        my $current_pmc = $all->{$current_pmc_name};

        #generate list of parent_names and sort by extends order
        my %parent_hash = %{ $current_pmc->{flags}{extends} };
        my @parent_names = sort { $parent_hash{$a} <=> $parent_hash{$b} } keys %parent_hash;

        for my $parent_name (@parent_names) {
            #load $parent_name into $all
            $all->{$parent_name} = 
                $self->read_dump( lc("$parent_name.pmc") ) if not $all->{$parent_name};

            #add parent's has_method hash to pmc_class' has_parent hash
            $pmc_class->{has_parent}{$parent_name} = { %{ $all->{$parent_name}{has_method} } };
            #add parent_name to parents lists
            push @{ $pmc_class->{parents} }, $parent_name;
            #add parent_name to recursion list.
            push @todo, $parent_name;
        }
    }
    return $all;
}

=head2 Subroutines

These are auxiliary subroutines called inside the methods described above.

=head3 C<open_file()>

    $fh = open_file( "<", $file, $verbose);

B<Purpose:>  Utility subroutine.

B<Arguments:>  List of scalars:  two required, one optional.

=over 4

=item * action

String holding action/direction desired:   C<E<lt>> for
reading or C<E<gt>E<gt>> for writing or appending.

=item * filename

String holding name of file to be opened.

=item * verbose

Optional.  True value if verbose output is desired.  That output will be the
action followed by the filename.
In most cases, the third argument will be C<$self->{opt}{verbose}>.

=back

B<Return Values:>  Filehandle to file so opened.

B<Comment:>  Called within C<dump_vtable()>, C<read_dump()>, C<find_and_parse_pmc()>,
and C<dump_pmc()>.

=cut

sub open_file {
    my ( $direction, $filename, $verbose ) = @_;

    my $actions_descriptions = { '<' => 'Reading', '>>' => "Appending", '>' => "Writing" };
    my $action = $actions_descriptions->{$direction} || "Unknown";

    print "$action $filename\n" if $verbose;
    open my $fh, $direction, $filename or die "$action $filename: $!\n";
    return $fh;
}

=head3 C<dump_is_newer()>

    dump_is_newer($existing);

B<Purpose:>  Determines whether the dump of a file is newer than the PMC file.
(If it's not, then the PMC file has changed and the dump has not been updated.)

B<Arguments:>  String holding filename.

B<Return Values:>  Returns true if timestamp of existing is more recent than
that of PMC.

B<Comments:>  Called within C<find_and_parse_pmc()>.

=cut

sub dump_is_newer {
    my $dumpfile = shift;

    # Extract name of .pmc file corresponding to .dump file
    my $pmc = $dumpfile;
    $pmc =~ s/\.\w+$/.pmc/;

    my $pmc_dt  = 0;
    my $dump_dt = 0;
    $pmc_dt  = ( stat $pmc )[9];
    $dump_dt = ( stat $dumpfile )[9];
    return $dump_dt > $pmc_dt;
}

=head3 C<gen_super_meths()>

    $class = gen_super_meths($name, $all, $vt);

B<Purpose:>  Generate a list of inherited methods for C<$name> by searching the
inheritance tree. The method list is found in C<$vt>.

B<Arguments:>  List of three elements:

=over 4

=item *

String holding name of class being dumped.

=item *

Reference to the hash holding the data structure being built up within
C<dump_pmc()>.

=item *

The result of a call of C<read_dump()> on F<vtable.pmc>.

=back

B<Return Value:>  Hash reference representing the class being dumped.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub gen_super_meths {
    my ( $name, $all, $vt ) = @_;
    my $class = $all->{$name};

    # look through all meths in class and locate the nearest parent
    foreach my $entry ( @{ $vt->{methods} } ) {
        my $meth = $entry->{meth};
        next if exists $class->{super}{$meth};
        foreach my $pname ( @{ $class->{parents} } ) {
            if ( exists( $class->{has_parent}{$pname}{$meth} ) ) {
                $class->{super}{$meth} = $pname;
                my $n = $class->{has_parent}{$pname}{$meth};
                $class->{super_attrs}{$meth} = $all->{$pname}{methods}[$n]{attrs};
                if ( exists $class->{has_method}{$meth} ) {
                    $class = inherit_attrs( $class, $meth );
                }
                my $super_mmd = $all->{$pname}{methods}[$n]{mmds};
                if ( $super_mmd && scalar @{$super_mmd} ) {
                    push @{ $class->{super_mmd} },
                        {
                        $pname => $super_mmd,
                        'meth' => $meth,
                        };
                }
                last;
            }
        }
        unless ( exists $class->{super}{$meth} ) {

            # XXX this is a quick hack to get the inheritance
            # ParrotClass isa delegate
            #
            # delegate has everything autogenerated, so these
            # methods aren't seen and not inherited properly
            #
            # the correct way would be to look at
            # $class->implements but when dumping there isn't
            # a $class object
            $class->{super}{$meth} =
                   $class->{class} eq 'ParrotObject'
                || $class->{class} eq 'ParrotClass'
                ? 'delegate'
                : 'default';
        }
    }
    return $class;
}

=head3 C<inherit_attrs()>

    $class = inherit_attrs($class, $meth);

B<Purpose:>  Modify $attrs to inherit attrs from $super_attrs as appropriate.

B<Arguments:>  List of two arguments:

=over 4

=item *

Reference to hash holding the data structure being built up within
C<dump_pmc()>.

=item *

Method name.

=back

B<Return Values:>  Reference to hash holding the data structure being built up
within C<dump_pmc()>.

B<Comments:> Called within C<gen_super_meths()>.

=cut

sub inherit_attrs {
    my ( $class, $meth ) = @_;
    my $super_attrs = $class->{methods}[ $class->{has_method}{$meth} ]->{attrs};
    my $attrs       = $class->{super_attrs}{$meth};
    if ( ( $super_attrs->{read} or $super_attrs->{write} )
        and not( $attrs->{read} or $attrs->{write} ) )
    {
        $attrs->{read} = $super_attrs->{read} if exists $super_attrs->{read};
        $attrs->{write} = $super_attrs->{write} if exists $super_attrs->{write};
    }
    return $class;
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
