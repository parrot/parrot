#! perl -w
use strict;

=head1 NAME

pbc_header.pl - PBC header info and manipulation

=head1 SYNOPSIS

  perl pbc_header.pl files ...
  perl pbc_header.pl --update-fingerprint files ...

=head1 DESCRIPTION

The F<PBC_COMPAT> file is used to maintain Parrot bytecode
compatability. During release preparation (and other changes to
PBC_COMPAT) the fingerprint of existing bytecode files is invalidated.

This utility updates the version and finperprint information in the bytecode,
but can of course not assure that it will run correctly, when incompatible
changes were done.

If no options are given a summary of the PBC header is printed to STDOUT.

=cut

use Getopt::Long;
use lib 'lib';
use Digest::Perl::MD5 qw(md5);
my %opt;
&main;

sub get_fp {
    # s. also fingerprint_c.pl
    my $compat_file = 'PBC_COMPAT';
    open IN, $compat_file or die "Can't read $compat_file";
    my @lines = <IN>;
    close IN;

    my $len = 10;
    my $fingerprint = md5 join "\n", grep { ! /^#/ } @lines;
    return substr $fingerprint, 0, $len;
}

sub get_version {
    my $version_file = 'VERSION';
    open IN, $version_file or die "Can't read $version_file";
    my $v = <IN>;
    close IN;
    $v =~ /^(\d+)\.(\d+)/;
    ($1, $2);
}

sub update_fp {
    my $fp = get_fp;
    my ($major, $minor)  = get_version;
    for my $f (@ARGV) {
	open F, "+<$f" or die "Can't open $f: $!";
	seek F, 2, 0;	# pos 2: major, minor
	print F pack "cc", $major, $minor;
	seek F, 6, 0;	# pos 6: pad = finger_print
	print F $fp;
	close F;
    }
}

sub pbc_info {
    for my $f (@ARGV) {
	open F, "<$f" or die "Can't open $f: $!";
	my $header;
	read F, $header, 16;
	my (@fields) = qw( wordsize byteorder major minor
	    intvalsize floattype );
	print "$f\n";
	for my $i (0..5) {
	    my $c = substr $header, $i, 1;
	    $c = unpack 'c', $c;
	    printf "\t%-12s= %s\n", $fields[$i],$c;
	}
    }
}

sub main {
    my ($result, $upd_fp);
    $result = GetOptions(
	"update-fingerprint"     => \$upd_fp,
    );

    $upd_fp and do {
	update_fp;
	exit;
    };

    pbc_info;
}
