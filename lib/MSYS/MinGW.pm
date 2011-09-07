package MSYS::MinGW;
use strict;
use warnings;

our $VERSION = '0.01';

return 1 unless $^O eq 'msys' && $ENV{MSYSTEM} =~ /^mingw/i;

*import = \&_import;

sub _expand_path {
    my ($path) = @_;
    $path = `cd '$path' && pwd -W`;
    chomp $path;
    return $path;
}

my $tmpdir = do {
    use File::Spec;
    _expand_path(File::Spec->tmpdir);
};

sub _tmpdir { $tmpdir }

my @cwdsubs = qw(cwd getcwd fastcwd fastgetcwd);

sub _import {
    no strict 'refs';
    no warnings 'redefine';

    *File::Spec::tmpdir = \&_tmpdir;

    my $caller = caller;
    for (@cwdsubs) {
        *{'Cwd::'.$_} = \&Cwd::_NT_cwd;
        *{$caller.'::'.$_} = \&Cwd::_NT_cwd if defined &{$caller.'::'.$_};
    }
}

1;
