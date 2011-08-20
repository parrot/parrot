package MSYS::File::Spec::Native;
use strict;
use warnings;
use File::Spec;

our $VERSION = '0.01';

sub _expand_path {
    my ($path) = @_;
    $path = `cd '$path' && pwd -W`;
    chomp $path;
    return $path;
}

my $tmpdir = _expand_path(File::Spec->tmpdir);
sub _tmpdir { $tmpdir }

sub _import {
    *File::Spec::tmpdir = \&_tmpdir;
}

*import = \&_import if $^O eq 'msys';

1;
