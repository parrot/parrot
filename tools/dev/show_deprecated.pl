#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use File::Spec::Functions;
use YAML qw/LoadFile/;
use List::MoreUtils qw/any/;

=head1 NAME

show_deprecated.pl - Show deprecated features listed in api.yaml

=head1 SYNOPSIS

    perl tools/dev/show_deprecated.pl

=head1 DESCRIPTION

Shows all currently deprecated features. This script could be used to generate
documentation about deprecated features in the future.

=head1 PREREQUISITE

YAML

=cut

my $api  = catfile(qw/api.yaml/);
my $yaml = LoadFile($api);
use Data::Dumper;
warn Dumper [ $yaml ];

for my $e (@$yaml) {
    my $tags     = $e->{tags};
    my $ticket   = $e->{ticket};
    my $eligible = $e->{eligible};
    my $title    = $e->{name};
    # This format is ugly, but is functional for now
    print "$ticket\t$eligible\t$title\n" if any { $_ eq 'deprecated' } @$tags;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
