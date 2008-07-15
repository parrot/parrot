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
    if (defined ($prev) && ($revision ne $prev)) {
        $revision = 'unknown' unless defined $revision;
        eval {
            open my $FH, ">", $cache;
            print $FH "$revision\n";
            close $FH;
            $current = $revision;
        };
    }
}

sub _get_revision {
    my $revision;
    if (-f $cache) {
        eval {
            open my $FH, "<", $cache;
            chomp($revision = <$FH>);
            close $FH;
        };
        return $revision unless $@;
    }

    $revision = _analyze_sandbox();

    if (! -f $cache) {
        eval {
            open my $FH, ">", $cache;
            print $FH "$revision\n";
            close $FH;
        };
    }
    return $revision;
}

sub _analyze_sandbox {
    my $revision = 0;
    # code taken from pugs/util/version_h.pl rev 14410
    # modified because in xml output commit and entry revision
    # are difficult to distinguih in a simplified parsing
    my $nul = File::Spec->devnull;
    if ( my @svn_info = qx/LANG=C svn info 2>$nul/ and $? == 0 ) {
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
