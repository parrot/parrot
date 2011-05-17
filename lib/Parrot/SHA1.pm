# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

Parrot::SHA1 - Git SHA1 of Parrot

=head1 SYNOPSIS

    use Parrot::SHA1;

    print $Parrot::SHA1::current;

=head1 DESCRIPTION

Get Parrot's current and configure time SHA1.

=cut

package Parrot::SHA1;

use strict;
use warnings;
use File::Spec;
use lib qw( lib );

our $current = _get_sha1();

sub _get_sha1 {
    my $sha1 = 0;
    if ( -d '.git') {
        $sha1 = `git rev-parse HEAD`;
        chomp($sha1);
    }
    return $sha1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
