#!/usr/bin/env perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$
use strict;
use warnings;

my %n;
while (<>) {
    #warn "[$_]";
    if (m/^\s*$/) {
        printf "%-10s = %s <%s>\n", $n{U}, $n{N}, $n{E} if $n{U};
        %n = ();
    }
    next unless m/^([NEDUSW]): (.*)/;
    my ($f, $v) = ($1, $2);
    $n{$f} = $v unless $n{$f};  # doesn't do the right thing for the multiline fields
}
