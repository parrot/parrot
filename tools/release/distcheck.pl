# !perl
use strict;
use warnings;
use Data::Dumper;$Data::Dumper::Indent=1;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw( tempdir );

my $cwd = cwd();
opendir my $DIRH, $cwd
    or croak "Unable to open directory handle";
#my @tarballs = grep { m/(parrot-\d+\.\d+\.\d+(?:-devel)?)\.tar\.gz$/ }
my @tarballs = grep { m/parrot-.*\.tar\.gz$/ } readdir $DIRH;
#my $distro = $1;
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
print "Performing distcheck on $tb\n";
{
    my $tdir = tempdir( CLEANUP => 1 );
    my $ctarball = "$tdir/$tb";
    copy "$cwd/$tb" => $ctarball
        or croak "Unable to copy $tb";
    system(qq{tar xvf $ctarball})
        and croak "Unable to untar $ctarball";
    chdir $distro or croak "Unable to chdir to $distro";
    system(qq{$^X Configure.pl}) and croak "Unable to configure";
    system(qq{make}) and croak "Unable to build";
    system(qq{make test}) and croak "'make test' did not complete successfully";
    system(qq{make release}) and croak "Unable to release";
    chdir $cwd or croak "Unable to change dir back";
}
print "Completed distcheck on $tb\n";
    
