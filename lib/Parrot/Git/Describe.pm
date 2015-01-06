# Copyright (C) 2010-2014, Parrot Foundation.

=head1 NAME

Parrot::Git::Describe - Git describe string of Parrot

=head1 SYNOPSIS

    use Parrot::Git::Describe;

    print $Parrot::Git::Describe::current;

=head1 DESCRIPTION

Get Parrot's current and configure time "git describe" string, which is the output of

    git describe --tags

=cut

package Parrot::Git::Describe;

use strict;
use warnings;
use lib qw( lib );
use Parrot::Git qw/has_git/;

our $current = _get_git_describe();

sub _get_git_describe {
    my $git_describe = 0;

    if ( -d '.git' && has_git()) {
        $git_describe = `git describe --tags --always`;
        chomp( $git_describe );
    }
    return $git_describe;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
