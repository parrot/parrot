# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Revision - SVN Revision

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

=cut

package Parrot::Revision;

use strict;
use warnings;
use File::Spec;

our $cache = q{.parrot_current_rev};

our $current = _get_revision();

sub update {
    my $prev = _get_revision();
    my $revision = _analyze_sandbox();
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
        $revision = _analyze_sandbox();
        _print_to_cache($cache, $revision);
    }
    return $revision;
}

sub _analyze_sandbox {
    my $revision = 0;
    # code taken from pugs/util/version_h.pl rev 14410
    # modified because in xml output commit and entry revision
    # are difficult to distinguih in a simplified parsing
    my $nul = File::Spec->devnull;
    local $ENV{LANG} = 'C';
    if ( my @svn_info = qx/svn info 2>$nul/ and $? == 0 ) {
        if ( my ($line) = grep /^Revision:/, @svn_info ) {
            ($revision) = $line =~ /(\d+)/;
        }
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
