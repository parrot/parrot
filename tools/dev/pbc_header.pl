#! perl

# Copyright (C) 2004-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

=head1 NAME

pbc_header.pl - PBC header info and manipulation

=head1 SYNOPSIS

  perl pbc_header.pl files ...
  perl pbc_header.pl --update-fingerprint files ...

=head1 DESCRIPTION

The F<PBC_COMPAT> file is used to maintain Parrot bytecode
compatability. During release preparation (and other changes to
PBC_COMPAT) the fingerprint of existing bytecode files is invalidated.

This utility updates the version and fingerprint information in the bytecode,
but can of course not assure that it will run correctly, when incompatible
changes were done.

If no options are given, a summary of the PBC header is printed to STDOUT.

=head1 SEE ALSO

The C<pbc_dump> utility does a much more thorough job of showing bytecode file
headers.

=cut

use Getopt::Long;
use Digest::MD5 qw(md5);

my %opt;
use constant FP_LEN => 12;
my $word_size = 4;

main();

sub get_fp {

    # s. also fingerprint_c.pl
    my $compat_file = 'PBC_COMPAT';
    open my $IN, '<', $compat_file or die "Can't read $compat_file";
    my @lines = <$IN>;
    close $IN;

    my $len = FP_LEN;
    my $fingerprint = md5 join "\n", grep { !/^#/ } @lines;

    return substr $fingerprint, 0, $len;
}

sub get_version {
    my $version_file = 'VERSION';
    open my $IN, '<', $version_file or die "Can't read $version_file";
    my $v = <$IN>;
    close $IN;
    $v =~ /^(\d+)\.(\d+).?(\d+)?/;
    my ($major, $minor, $patch) = ($1, $2, $3 ? $3 : 0);
    die "Can't read $version_file" unless defined $major;
    return ( $major, $minor, $patch );
}

sub get_bc_version {
    my $compat_file = 'PBC_COMPAT';
    my ( $major, $minor );
    open my $IN, '<', $compat_file or die "Can't read $compat_file";
    while (<$IN>) {
        if (/^(\d+)\.0*(\d+)/) {
            ( $major, $minor ) = ( $1, $2 );
            last;
        }
    }
    die "Can't read $compat_file" unless defined $major;
    close $IN;
    return ( $major, $minor );
}

sub update_fp {
    my (@args) = @_;

    my $fp = get_fp();
    my ( $major, $minor, $patch ) = get_version();
    my ( $bc_major, $bc_minor ) = get_bc_version();
    for my $f (@args) {
        my $b;
        open my $F, "+<", "$f" or die "Can't open $f: $!";
        binmode $F;
        # magic8, wordsize byteorder floattype
        # parrot_major parrot_minor parrot_patch
        # bc_major bc_minor uuid_type uuid_size
        seek $F, 11, 0;      # pos 11: major, minor, patch
        print $F pack "ccc", $major, $minor, $patch;
        #seek $F, 14, 0;    # pos 14: major, minor
        print $F pack "cc", $bc_major, $bc_minor;
        # uuid_type = 1, uuid_size = 10, uuid_data = $fp
        read $F, $b, 8;
        my ($type, $uuid_len) = unpack "cc", $b;
        if ($type != 1 or $uuid_len != FP_LEN) {
            # if uuid_type was 0 or of different size copy the tail first
            my $leftover = (18 + $uuid_len) % 16;
            my $n = $leftover == 0 ? 0 : 16 - $leftover;
            # we can skip the copy if there's enough room already (pad:14=>2)
            goto SEEK if $n > FP_LEN;
            my $dirstart = 18 + $uuid_len + $n;
            seek $F, $dirstart, 0;   # skip to dir
            my $size = -s $F;
            read $F, $b, $size - $dirstart;
            seek $F, $dirstart, 0;   # again to dir
            print $F $b;
        }
      SEEK:
        seek $F, 16, 0;   # back to pos 16: uuid_type, uuid_size
        print $F pack "cc", 1, FP_LEN;
        print $F $fp;
        close $F;
    }

    return;
}

sub pbc_info {
    for my $f (@ARGV) {
        open my $F, "<", "$f" or die "Can't open $f: $!";
        binmode $F;
        print "$f\n";

        show_pbc_file_info($F);
    }

    return;
}

my @pbc_header_type_names;
BEGIN {
    @pbc_header_type_names = qw( directory default fixup constant
                                 bytecode annotations pic dependencies );
}

sub show_pbc_file_info {
    my $F = shift;

    # [bad assumption?  -- rgr, 10-Feb-08.
    #  No, header format is the same also for 64bit - rurban 2009-02-19]
    my $word_unpack = 'V';
    my $packfile_offset = 0;

    my $read_pbc_words = sub {
        my ($n_words) = @_;

        my @result;
        my $bytes;
        read $F, $bytes, $n_words*$word_size;
        for my $i (0 .. $n_words-1) {
            my $word = substr $bytes, $word_size*$i, $word_size;
            push(@result, unpack $word_unpack, $word);
        }
        @result;
    };

    # Display single_byte fields.
    my @byte_fields = qw( wordsize byteorder floattype
                          parrot_major parrot_minor parrot_patch
                          bc_major bc_minor
                          uuid_type uuid_size );
    my $n_byte_fields = @byte_fields;
    my $header;
    read $F, $header, $n_byte_fields+8;
    $packfile_offset += ($n_byte_fields+8)/$word_size;
    for my $i ( 0 .. $n_byte_fields-1 ) {
        my $c = substr $header, $i+8, 1;
        $c = unpack 'c', $c;
        printf "\t%-14s= %3d\n", $byte_fields[$i], $c;
    }

    # Show the UUID, if any, followed by the header padding.
    my $uuid_type = ord substr $header, $n_byte_fields+6;
    my $uuid_len = ord substr $header, $n_byte_fields+7;
    my $leftover = (18+$uuid_len) % 16;
    my $n = $leftover == 0 ? 0 : 16 - $leftover;
    my $uuid;
    read $F, $uuid, $uuid_len+$n;
    $packfile_offset += ($uuid_len+$n)/$word_size;
    if ($uuid_type) {
        printf "\t%-14s= '%s'\n", 'UUID', unpack "H$uuid_len", $uuid;
    }
    printf "\t%-14s= %3d\n", 'pad', $n;

    # Show the directory format header.
    printf "\t%-14s= %d, %d, %d, %d\n", 'dir_format', $read_pbc_words->(4);
    $packfile_offset += 4;
}

sub main {
    my ( $result, $upd_fp );
    $result = GetOptions( "update-fingerprint" => \$upd_fp, );

    my (@args) = $^O eq 'MSWin32' ? <@ARGV> : @ARGV;

    $upd_fp and do {
        update_fp(@args);
        exit;
    };

    return pbc_info();
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
