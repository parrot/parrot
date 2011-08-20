package MSYS::Cwd::Override;
use strict;

our $VERSION = '0.01';

my @cwdsubs = qw(cwd getcwd fastcwd fastgetcwd);

sub _import {
    no strict 'refs';
    local $^W = 0;

    my $caller = caller;
    for (@cwdsubs) {
        *{'Cwd::'.$_} = \&Cwd::_NT_cwd;
        *{$caller.'::'.$_} = \&Cwd::_NT_cwd if defined &{$caller.'::'.$_};
    }
}

*import = \&_import if $^O eq 'msys';

1;
