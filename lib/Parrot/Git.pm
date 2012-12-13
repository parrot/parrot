# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

Parrot::Git - Detect run-time Git support in a portable way

=head1 SYNOPSIS

    use Parrot::Git qw/has_git/;

    if (has_git()){
        # git magic
    } else {
        # so sad, no git
    }

=head1 DESCRIPTION

See if there is a Git binary available.

=cut

package Parrot::Git;

use strict;
use warnings;
use lib qw( lib );

our @EXPORT_OK = qw/has_git/;

sub has_git {
    my $to_dev_null = $^O =~ /Win/ ? "1> NUL 2>&1" : ">/dev/null 2>&1";
    my $has_git      = system("git --version $to_dev_null") == 0 ? 1 : 0 ;

    return $has_git;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
