#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use Archive::Tar;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw( tempdir );

my $cwd = cwd();
opendir my $DIRH, $cwd
    or croak "Unable to open directory handle";
my @tarballs = grep { m/parrot-.*\.tar\.gz$/ } readdir $DIRH;
closedir $DIRH or croak "Unable to close directory handle";
croak "Should find exactly one gzipped tarball"
    unless @tarballs == 1;
my $tb = $tarballs[0];
my $distro = '';
if ($tb =~ m/(parrot-\d+\.\d+\.\d+(?:-devel)?)\.tar\.gz$/ ) {
    $distro = $1;
}
else {
    croak "Unable to extract distro from $tb";
}
print "Performing releasecheck on $tb\n";
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    print "Changing to temporary directory\n";
    my $ctarball = "$tdir/$tb";
    copy "$cwd/$tb" => $ctarball
        or croak "Unable to copy $tb";
    my $tar = Archive::Tar->new;
    $tar->read($ctarball);
    $tar->extract();
    chdir $distro or croak "Unable to chdir to $distro";
    print "Reconfiguring\n";
    system(qq{$^X Configure.pl --silent}) and croak "Unable to configure";
    print "Rebuilding\n";
    system(qq{make --silent}) and croak "Unable to build";
    print "Retesting\n";
    system(qq{make test}) and croak "'make test' did not complete successfully";
    print "Rereleasing\n";
    system(qq{make release --silent}) and croak "Unable to release";
    print "Recleaning\n";
    system(qq{make realclean --silent}) and croak "Unable to realclean";
    chdir $cwd or croak "Unable to change dir back";
    print "Leaving temporary directory\n";
}
print "Completed releasecheck on $tb\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
