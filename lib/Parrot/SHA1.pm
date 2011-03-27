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
use Parrot::Configure::Utils qw( print_to_cache );

our $cache = q{.parrot_current_sha1};

our $current = _get_sha1();

sub update {
    my $prev = _get_sha1();
    my $sha1 = 1;
    $current = _handle_update( {
        prev    => $prev,
        sha1    => $sha1,
        cache   => $cache,
        current => $current,
    } );
}

sub _handle_update {
    my $args = shift;
    if (! defined $args->{sha1}) {
        $args->{sha1} = 'unknown';
        print_to_cache($args->{cache}, $args->{sha1});
        return $args->{sha1};
    }
    else {
        if (defined ($args->{prev}) && ($args->{sha1} ne $args->{prev})) {
            print_to_cache($args->{cache}, $args->{sha1});
            return $args->{sha1};
        }
        else {
            return $args->{current};
        }
    }
}

sub _get_sha1 {
    my $sha1 = 0;
    if (-f $cache) {
        open my $FH, '<', $cache
            or die "Unable to open $cache for reading: $!";
        chomp($sha1 = <$FH>);
        close $FH or die "Unable to close $cache after reading: $!";
    }
    else {
        if ( !$sha1 && (-d '.git') ) {
             $sha1 = `git rev-parse HEAD`;
             chomp($sha1);
             print_to_cache($cache, $sha1);
        }
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
