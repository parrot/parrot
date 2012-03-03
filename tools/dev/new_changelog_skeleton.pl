#! perl
# Copyright (C) 2012, Parrot Foundation.

use strict;
use warnings;

=head1 NAME

F<tools/dev/new_changelog_skeleton.pl>

=head1 DESCRIPTION

This program adds a new release announcement skeleton to ChangeLog.

=head1 EXAMPLE

Run this command

    perl tools/dev/new_changelog_skeleton.pl

and then "git status" should show a modification to the ChangeLog file.

=head1 AUTHOR

Jonathan "Duke" Leto

=cut

sub read_changelog {
    my ($x,$y,$z);
    my ($year, $month, $day);

    open (my $fh, '<', 'ChangeLog') or die $!;
    for my $line (<$fh>) {
        if ($line =~ m/(\d+)-(\d+)-(\d+).*release (\d+)\.(\d+)\.(\d+)/) {
            ($year, $month, $day, $x,$y,$z) = ($1,$2,$3,$4,$5,$6);
            return ($year, $month, $day, $x,$y,$z);
        }
    }
    close $fh;
    return;
}

sub run {
    my ($year, $month, $day, $x, $y, $z) = read_changelog();

    return unless $year && $x;

    $month eq '12' ? $month=1 : $month++;

    $y     eq '11' ? ($x++, $y = 0, $z =0 ) : $y++;

    local $/;
    open (my $fh, '<', 'ChangeLog') or die $!;
    my $changelog = <$fh>;
    my $skeleton =<<SKELETON;
$year-$month-XX    release $x.$y.$z
    - Core
    - Documentation
    - Tests
    - Community

SKELETON

    open (my $wfh, '>', 'ChangeLog') or die $!;
    print $wfh $skeleton, $changelog;
    close $wfh;
}

run();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
