#! perl

# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

=head1 NAME

svnclobber.pl - delete all files that are not checked into SVN

=head1 SYNOPSIS

    perl svnclobber.pl

=head1 DESCRIPTION

This is a dangerous script. It deletes all files that are not checked
into SVN.

Usually this script is invoked by C<make svnclobber> of the root Parrot makefile.
In case that there is no Makefile, this script can also be invoked dirctly.

=head1 HISTORY

Extracted from F<config/gen/makefiles/root.in>

=cut

package main;

use strict;
use warnings;
use 5.008;

use File::Find ();

# Try to be nice and delete files only below a checked out SVN repository.

die "The current directory is not a SVN working copy" unless -d '.svn';

File::Find::find(
    sub {
        if (     -f                                       # remove only files
             and not $File::Find::name =~ m/\.svn/
             and not -e ".svn/text-base/$_.svn-base"
           )
        {
          unlink $_;
        }
    },
    q{.}
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
