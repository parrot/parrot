#! perl
# Copyright (C) 2010, Parrot Foundation.
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
