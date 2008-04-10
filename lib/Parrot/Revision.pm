# Copyright (C) 2005-2007, The Perl Foundation.
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
    my $nul = File::Spec->devnull;
    if ( my @svn_info = qx/svn --xml info 2>$nul/ and $? == 0 ) {
        if ( my ($line) = grep /^\s*revision=/, @svn_info ) {
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
