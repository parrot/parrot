package Parrot::Install;
# Copyright (C) 2001-2014, Parrot Foundation.
use strict;
use warnings;
use File::Basename qw( dirname );
use File::Copy qw( cp );
use File::Path qw( mkpath );
use File::Spec;
use base qw( Exporter );
our @EXPORT_OK = qw(
    lines_to_files
    create_directories
    install_files
);
use lib 'lib';
use Parrot::Config;
use Parrot::BuildUtil;

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

This module exports on demand some subroutines used in the Parrot
installation programs F<tools/dev/install_files.pl> and
F<tools/dev/install_dev_files.pl>.
The subroutines are tested by tests found in F<t/tools/install/>.

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
                    $options_ref->{$thash->{optiondir} . 'dir'} || '',
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

=head2 C<sanitycheck_install()>

Check if the generated F<MANIFEST.generated> contains some typically
needed files. Dies if not ok.

If you update your repo and rebuild parrot without perl Configure.PL
which deletes MANIFEST.generated anew, MANIFEST.generated might not
contain already up-to-date targets, thus not creating the required
MANIFEST.generated lines.

TODO: Keep a manual list of all to be installed files, merge it with
MANIFEST.generated and die if a file in the merged list does not exist,
i.e. cannot be installed.

=cut

sub _check_manifest {
    my ($file,$gen) = @_;
    my $manifest = $_[2];
    my $fname = "MANIFEST.generated";
    unless ($manifest =~ /^\Q$file\E/m) {
        if ($^O eq 'MSWin32') { # Windows has mixed paths
            $file =~ s{/}{\\}g;
            return if $manifest =~ /^\Q$file\E/m;
        }
        if ($gen)  {
            die "Error: configure generated $file missing in $fname.\n"
              . "make reconfig before make install.\n";
        }
        else {
            die "Error: make generated $file missing in $fname.\n"
              . "make clean before make install.\n";
        }
    }
}

sub sanitycheck_install {
    my $fname = "MANIFEST.generated";
    my $manifest = Parrot::BuildUtil::slurp_file($fname);
    die "$fname not found.\n" unless $manifest;
    # configure generated
    _check_manifest($_, 1, $manifest) for qw(
        lib/Parrot/Pmc2c/PCCMETHOD_BITS.pm
        include/parrot/config.h
        include/parrot/pbcversion.h
        include/parrot/vtable.h
        include/parrot/core_pmcs.h
        lib/Parrot/PMC.pm
        myconfig
        lib/Parrot/Config/Generated.pm
        runtime/parrot/library/config.pir
    );
    # make generated
    my @MAKE_gen = qw(
        vtable.dump
        include/parrot/extend_vtable.h
        runtime/parrot/include/datatypes.pasm
        runtime/parrot/library/Test/More.pbc
        compilers/tge/TGE/Parser.pir
        runtime/parrot/library/P6Regex.pbc
        runtime/parrot/languages/winxed/winxed.pbc
        runtime/parrot/library/nqp-setting.pbc
        runtime/parrot/library/config.pbc
        runtime/parrot/library/opsc.pbc
        install_config.fpmc
        runtime/parrot/library/pcre.pbc
        runtime/parrot/library/PCT/Grammar.pbc
    );
    my @dynext = qw(dynlexpad os file rational subproxy);
    push @dynext, map {$_."_ops"} qw(bit io sys obscure math trans debug);
    push @dynext, "select" if $^O !~ /^(MSWin32|msys)$/;
    push @dynext, "gziphandle" if $PConfig{has_zlib};
    push @MAKE_gen, "src/install_config".$PConfig{o};
    push @MAKE_gen, map { "runtime/parrot/dynext/".$_.$PConfig{load_ext} } @dynext;
    push @MAKE_gen, map { "installable_".$_.$PConfig{exe} }
      qw(parrot pbc_dump pbc_disassemble parrot_config pbc_merge
         pbc_to_exe parrot_nci_thunk_gen parrot-ops2c winxed);
    _check_manifest($_, 0, $manifest) for @MAKE_gen;
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

B<Comment:> Adds all installed files to datadir/parrotdir/MANIFEST

=cut

sub install_files {
    my ($options, $type, $files) = @_;
    ref($options) eq 'HASH' or die "Error: parameter \$options must be a hashref\n";

    my ($destdir, $datadir, $versiondir, $dryrun) =
      @$options{qw(destdir datadir versiondir dry-run)};
    ref($files) eq 'ARRAY' or die "Error: parameter \$files must be an arrayref\n";

    my ($src, $dest, $mdest, $mode, $manifest);
    print("Installing ...\n");
    if (!$dryrun) {
        my $destdatadir = $destdir
          ? File::Spec->catdir( $destdir, $datadir, $versiondir)
          : File::Spec->catdir( $datadir, $versiondir);
        my $fname = File::Spec->catdir( $destdatadir, "MANIFEST" . ($type ? ".".$type : '') );
        open $manifest, ">", $fname or die "Could not create $fname\n";
        print "$fname\n";
    }
    foreach my $el ( @$files ) {
        unless(ref($el) eq 'HASH') {
            my($ref) = ref($el);
            warn "Bad reference passed in \$files (want a HASH, got a '$ref')\n";
            next;
        }
        ( $src, $mdest ) = map { $el->{$_} } qw(Source Dest);
        $dest = $destdir . $mdest;
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
                        print $manifest "$mdest\n" unless $dryrun;
                        next;
                    }
                }
            }
            cp( $src, $dest ) or die "Error: couldn't copy $src to $dest: $!\n";
            print "$dest\n";
            print $manifest "$mdest\n" unless $dryrun;
        }
        $mode = ( stat($src) )[2];
        chmod $mode, $dest;
    }
    close $manifest unless $dryrun;
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
