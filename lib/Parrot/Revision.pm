# Copyright (C) 2005-2011, Parrot Foundation.

=head1 NAME

Parrot::Revision - counts commits to git repository of Parrot

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;

=head1 DESCRIPTION

From the output of

     git log

counting the commit to Parrot's git repository. The result is similar like
a SVN Revision.

=cut

package Parrot::Revision;

use strict;
use warnings;
use File::Spec;

our $cache = q{.parrot_current_rev};

our $current = _get_revision();

sub update {
    my $prev = 1;
    my $revision = _get_revision();
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
        $revision = 0;
        if ( -d '.git' ) {
            open my $GIT_LOG, 'git log |';
            while (<$GIT_LOG>) {
                $revision++ if /^commit/;
            }
            close $GIT_LOG;
        }
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
