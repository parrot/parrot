#! perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;

=head1 NAME

tools/util/gen_release_info.pl - generate release info for graphs and charts

=head1 DESCRIPTION

This utility generates release information from subversion in csv format,
suitable for graphs, charts, and reports.

=cut


my $repo_url = 'https://svn.parrot.org/parrot/tags';

##  ceate a release information data structure
my $r = {
    map { $_->{number} => $_ }
    map { m{^(RELEASE_)(.*)/}
            ? {
                tag => "$1$2",
                number => sub{$a = shift; $a =~ y/_/./; $a }->($2),
            }
            : ()
        }
    qx  { svn ls $repo_url }
};

##  gather interesting release-related information from the tag
map {
    ##  ask subversion for info about the tag
    my $readme = $repo_url . '/' . $r->{$_}{tag};
    warn "retrieving info on $readme\n";
    my $info = qx{ LANG=C svn info $readme };

    ##  pull the interesting items
    $info =~ m{Author: (\S+)} and $r->{$_}{author}   = $1;
    $info =~ m{Rev: (\S+)}    and $r->{$_}{revision} = $1;
    $info =~ m{Date: (\S+)}   and $r->{$_}{date}     = $1;
} keys %{ $r };


##  output info in csv format
print
    map { "$_\n" }
    map { my $n = $_; join ',' =>
        map { $r->{$n}{$_} || '' }
        qw{ tag number author revision date  }
    }
    sort keys %$r;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
