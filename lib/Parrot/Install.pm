package Parrot::Install;
# Copyright (C) 2001-2009, Parrot Foundation.
use strict;
use warnings;
use File::Basename qw(dirname);
use File::Copy;
use File::Path qw( mkpath );
use File::Spec;
use base qw( Exporter );
our @EXPORT_OK = qw(
    lines_to_files
    create_directories
    install_files
);

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Install - Functionality for installation programs

=head1 SYNOPSIS

    use Parrot::Install qw(
        install_files
        create_directories
        lines_to_files
    );

=head1 DESCRIPTION

This module exports on demand only three subroutines used in the Parrot
installation programs F<tools/dev/install_files.pl> and
F<tools/dev/install_dev_files.pl>.  The subroutines are tested by tests found
in F<t/tools/install/>.

=head1 SUBROUTINES

=head2 C<lines_to_files()>

B<Purpose:> Suck in the lines from the mentioned manifests, and turn them into
file locations.

B<Arguments:> List of five scalars.

    ($files, $directories) =
        lines_to_files(
            \%metatransforms,
            \@transformorder,
            \@manifests,
            \%options,
            $parrotdir,
        );

B<Return Value:> List of three scalars.

B<Comment:>

=cut

sub lines_to_files {
    my ($metatransforms, $transformorder, $manifests_ref,
        $options_ref, $parrotdir) = @_;
    my @files;
    my %directories;
    my($tkey, $thash);
    my $filehash;

    # We'll report multiple occurrences of the same file
    my(%seen);

    # Check $manifests_ref
    ref($manifests_ref) eq 'ARRAY'
        or die "Manifests must be listed in an array reference: $!";
    @{ $manifests_ref } > 0 or die "No manifests specified";

    # Check $transformorder
    ref($transformorder) eq 'ARRAY'
        or die "Transform order should be an array of keys\n";

    @ARGV = @{ $manifests_ref };
    LINE: while ( my $entry = <> ) {
        chomp $entry;

        $entry =~ s/\#.*//;    # Ignore comments
        next if $entry =~ /^\s*$/;    # Skip blank lines

        my ( $src, $meta, $dest ) = split( /\s+/, $entry );
        $dest = $src unless $dest;

        if ( $seen{$src}++ ) {
            print STDERR "$ARGV:$.: Duplicate entry $src\n";
        }

        # Parse out metadata
        die "Malformed line in MANIFEST: $entry" if not defined $meta;
        my $generated = $meta =~ s/^\*//;
        my ($package) = $meta =~ /^\[(.*?)\]/;
        $meta =~ s/^\[(.*?)\]//;
        next unless $package;    # Skip if this file belongs to no package

        my $plist = defined ( $options_ref->{packages})
            ? $options_ref->{packages}
            : '.*';
        next unless $package =~ /$plist/;

        my %metadata;
        @metadata{ split( /,/, $meta ) } = ();
        $metadata{$_} = 1 for ( keys %metadata );          # Laziness

        $filehash = {
            Source => $src,
            Dest => $dest,
            DestDirs => [],
        };

        FIXFILE: {
            # Have to catch this case early for some unknown reason
            if ( $entry =~ /^runtime/ ) {
                $filehash->{Dest} =~ s/^runtime\/parrot\///;
                $filehash->{Dest} = File::Spec->catdir(
                    $options_ref->{libdir}, $parrotdir, $filehash->{Dest}
                );
                last FIXFILE;
            }
            foreach my $tkey (@$transformorder) {
                $thash = $metatransforms->{$tkey};
                unless($thash->{ismeta} ? $metadata{$tkey} : $entry =~ /$tkey/) { next; }
                $filehash = &{ $thash->{transform} }($filehash);
                ref($filehash) eq 'HASH' or die "Error: transform didn't return a hash for key '$tkey'\n";
                $filehash->{Dest} = File::Spec->catdir(
                    $options_ref->{$thash->{optiondir} . 'dir'},
                    @{ $filehash->{DestDirs} },
                    $filehash->{Dest}
                );
                last FIXFILE;
            }
            die "Unknown install location in MANIFEST for file '$entry'\n";
        }

        if(! $filehash->{Installable}) {
            $filehash->{Dest} = File::Spec->catdir( $options_ref->{buildprefix}, $filehash->{Dest} )
                if $options_ref->{buildprefix};
        }

        $directories{ dirname($filehash->{Dest}) } = 1;
        push( @files, $filehash );
    }
    continue {
        close ARGV if eof;    # Reset line numbering for each input file
    }

    (grep { ! ref } @files) and die "lines_to_files from Parrot::Install created a bad hash!\n";
    return(\@files, \%directories);
}

=head2 C<create_directories()>

B<Purpose:> Creates the directories passed in.

B<Arguments:>  Two scalar arguments.

    create_directories(
        $destination_directory,
        $directories_hash_ref,
    );

B<Return Value:>  True value.

B<Comment:>

=cut

sub create_directories {
    my ( $destdir, $directories ) = @_;

    my @dirs_to_create = grep { ! -d } map { $destdir . $_ } sort keys %{$directories};

    my $print_the_dirs = 0;
    my $mode = oct('0777');

    # We must use the legacy interface to support File::Path versions before 2.01.
    my @dirs_created = mkpath( \@dirs_to_create, $print_the_dirs, $mode );

    return 1;
}

=head2 C<install_files()>

B<Purpose:> Install the mentioned files into the appropriate locations.

    install_files(
        $destination_directory,
        $dry_run_option,
        $list_of_files_and_executables,
    );

B<Arguments:>  Takes two scalar arguments, followed by a reference to a
list consisting of hashes.

B<Return Value:>  True value.

B<Comment:>

=cut

sub install_files {
    my($destdir, $dryrun, $files) = @_;
    my($src, $dest, $mode);

    ref($files) eq 'ARRAY' or die "Error: parameter \$files must be an array\n";
    print("Installing ...\n");
    foreach my $el ( @$files ) {
        unless(ref($el) eq 'HASH') {
            my($ref) = ref($el);
            warn "Bad reference passed in \$files (want a HASH, got a '$ref')\n";
            next;
        }
        ( $src, $dest ) = map { $el->{$_} } qw(Source Dest);
        $dest = $destdir . $dest;
        if ( $dryrun ) {
            print "$src -> $dest\n";
            next;
        }
        else {
            next unless -e $src;
            next if ($^O eq 'cygwin' || $^O eq 'msys') and -e "$src.exe"; # stat works, copy not
            if (-l $src) {   # a link should be created
                # check if the system supports symbolic linking
                use Config;
                if ($Config{d_symlink} && $Config{d_readlink}) {
                    # copy as symbolic link
                    unlink($dest);
                    symlink(readlink($src), $dest);
                    # by success take next file, else the file will be
                    # copied with the command after the eval block of
                    # this loop
                    if (-e $dest) {
                        print "$dest\n";
                        next;
                    }
                }
            }
            copy( $src, $dest ) or die "Error: couldn't copy $src to $dest: $!\n";
            print "$dest\n";
        }
        $mode = ( stat($src) )[2];
        chmod $mode, $dest;
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
