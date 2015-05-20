#! perl
# Copyright (C) 2013, Parrot Foundation.
use strict;
use warnings;
use JSON;
use lib qw( lib );
use Parrot::BuildUtil;

my $release_info_path = 'tools/release/release.json';
my $host = 'parrot@ftp-osl.osuosl.org';

my %valid_type = map { $_ => 1 } qw( devel supported );

die <<"END_OF_USAGE" if @ARGV;
  Usage: $0
      All info is taken from file '$release_info_path'.
      No command-line switches or parameters are allowed.
      This program is always safe to run, as it only validates
      data and calculates commands; it *never* runs the commands itself.
END_OF_USAGE

my $href = decode_json( Parrot::BuildUtil::slurp_file($release_info_path) )
    or die "Failed to decode json";

my ( $type, $version, $ftp ) =
    map { $href->{$_} or die "'$_' missing from $release_info_path" }
    qw( release.type release.version ftp.path );

my $tsv = "$type/$version"; # Type Slash Version

my $expected_ftp_path = "ftp://ftp.parrot.org/pub/parrot/releases/$tsv/";
if ( $ftp ne $expected_ftp_path ) {
    warn "WARNING: The ftp.path in $release_info_path may be wrong!\n"
       . "\t The ftp.path value is '$ftp'\n"
       . "\t The expected value is '$expected_ftp_path'\n\n";
}

if ( ! $valid_type{$type} ) {
    my $valid_types = join ',', sort keys %valid_type;
    die "Invalid release.type '$type'. Valid types are: $valid_types\n";
}

if ( $version !~ m{ \A \d+ [.] \d+ [.] \d+ \z }msx ) {
    die "Invalid release.version '$version'."
      . " It should be three positive integers, joined by periods,"
      . " such as '5.11.2'\n";
}

my @cmds = (
    "ssh $host 'echo Yes,_your_credentials_are_valid.'",

    "ssh $host "
    ."'mkdir ~/ftp/releases/$tsv && cd ~/ftp/releases/all && ln -s ../$tsv .'",

    "scp parrot-$version.tar.{gz,bz2}{,.sha256} '$host:~/ftp/releases/$tsv/'",

    "ssh $host '~/trigger-parrot'",

    "curl -IsS '${ftp}parrot-$version.tar.{gz,bz2}{,.sha256}'",
);

print <<"END_OF_INSTRUCTIONS";
Run these commands by cutting and pasting them onto your command line, one
line at a time. Watch for errors after pasting each line.
These commands will:
    0. Verify that your credentials work on the FTP server.
    1. Create the receiving directory on the FTP server.
    2. Link the "all" directory to the receiving directory.
    3. Copy the 2 tarballs and 2 checksums to the receiving directory.
    4. Trigger the replication of files to the FTP mirrors.
    5. Verify that the replication occurred (Wait a few minutes for sync.)
In other words, they make the new Parrot available to the whole world.

On Win32 with PuTTY, you may need `pscp` instead of `scp`.

If you prefer to use a different method of copying the files,
or prefer to `ssh` directly to the server to create|link|trigger,
then that is fine; this program's output is just a convenience.

The commands for type '$type' and version '$version' are:
END_OF_INSTRUCTIONS

print "    $_\n" for @cmds;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
