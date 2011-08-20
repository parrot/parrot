package MSYS::Cwd::Native;
use warnings;
use strict;

our $VERSION = '0.01';

my @cwdsubs = qw(cwd getcwd fastcwd fastgetcwd);

sub import {
    return unless $^O eq 'msys';

    no strict 'refs';
    no warnings 'redefine';

    my $caller = caller;
    for (@cwdsubs) {
        *{'Cwd::'.$_} = \&Cwd::_NT_cwd;
        *{$caller.'::'.$_} = \&Cwd::_NT_cwd if defined &{$caller.'::'.$_};
    }
}

1;
