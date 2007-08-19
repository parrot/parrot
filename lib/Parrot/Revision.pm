# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Revision - SVN Revision

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;
    print $Parrot::Revision::config;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

=cut

package Parrot::Revision;

use strict;
use warnings;
use File::Spec;

sub __get_revision {
    return 0 unless ( -e 'DEVELOPING' );

    my $revision;

    # code taken from pugs/util/version_h.pl rev 14410
    my $nul = File::Spec->devnull;
    if ( my @svn_info = qx/svn info 2>$nul/ and $? == 0 ) {
        if ( my ($line) = grep /^Revision:/, @svn_info ) {
            ($revision) = $line =~ / (\d+)$/;
        }
    }
    elsif ( my @git_svn_info = qx/git svn log --limit=1 2>$nul/ and $? == 0 ) {
        ($revision) = $git_svn_info[1] =~ m/^r(\d+)\D/xms;
    }
    elsif ( my @svk_info = qx/svk info 2>$nul/ and $? == 0 ) {
        if ( my ($line) = grep /(?:file|svn|https?)\b/, @svk_info ) {
            ($revision) = $line =~ / (\d+)$/;
        }
        elsif ( my ($source_line) = grep /^(Copied|Merged) From/, @svk_info ) {
            if ( my ($source_depot) = $source_line =~ /From: (.*?), Rev\. \d+/ ) {

                # convert /svk/trunk to //svk/trunk or /depot/svk/trunk
                my ($depot_root) = map { m{Depot Path: (/[^/]*)} } @svk_info;
                $depot_root ||= q{/};
                $source_depot = $depot_root . $source_depot;
                if ( my @svk_info = qx/svk info $source_depot/ and $? == 0 ) {
                    if ( my ($line) = grep /(?:file|svn|https?)\b/, @svk_info ) {
                        ($revision) = $line =~ / (\d+)$/;
                    }
                }
            }
        }
    }
    return ( $revision || 0 );
}

our $current = __get_revision();
our $config  = $current;

# check if Parrot::Config is available
eval 'use Parrot::Config; $config = $PConfig{revision};';

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
