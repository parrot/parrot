# Copyright (C) 2005-2008, Parrot Foundation.

=head1 NAME

Parrot::Revision - SVN Revision of Parrot

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

We currently always return "r1" to tell old HLL's that this version of Parrot is too new for them.
There is currently no way to say "we are too new for you", so we have to lie again and say we are
too old.

=cut

package Parrot::Revision;

use strict;
use warnings;
use File::Spec;

our $cache = q{.parrot_current_rev};

our $current = _get_revision();

sub update {
    my $prev = _get_revision();
    my $revision = "r1";
    $current = _handle_update( {
        prev        => $prev,
        revision    => $revision,
        cache       => $cache,
        current     => $current,
    } );
}

sub _handle_update {
    my $args = shift;
    if (! defined $args->{revision}) {
        $args->{revision} = 'unknown';
        _print_to_cache($args->{cache}, $args->{revision});
        return $args->{revision};
    }
    else {
        if (defined ($args->{prev}) && ($args->{revision} ne $args->{prev})) {
            _print_to_cache($args->{cache}, $args->{revision});
            return $args->{revision};
        }
        else {
            return $args->{current};
        }
    }
}

sub _print_to_cache {
    my ($cache, $revision) = @_;
    open my $FH, ">", $cache
        or die "Unable to open handle to $cache for writing: $!";
    print {$FH} "$revision\n";
    close $FH or die "Unable to close handle to $cache after writing: $!";
}

sub _get_revision {
    my $revision;
    if (-f $cache) {
        open my $FH, '<', $cache
            or die "Unable to open $cache for reading: $!";
        chomp($revision = <$FH>);
        close $FH or die "Unable to close $cache after reading: $!";
    }
    else {
        $revision = "r1";
        _print_to_cache($cache, $revision);
    }
    return $revision;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
