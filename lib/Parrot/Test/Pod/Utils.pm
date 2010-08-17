# Copyright (C) 2007, Parrot Foundation.
# $Id$
package Parrot::Test::Pod::Utils;
use strict;
use warnings;
use Pod::Simple;
use Pod::Simple::PullParser;
our (@ISA, @EXPORT_OK);
@ISA       = qw( Exporter );
@EXPORT_OK = qw(
    file_pod_ok
    empty_description
);

# Pulled from Test::Pod
sub file_pod_ok {
    my $file    = shift;
    my $checker = Pod::Simple->new;

    $checker->output_string( \my $trash );      # Ignore any output
    $checker->parse_file($file);

    return !$checker->any_errata_seen;
}

sub empty_description {
    my $file = shift;

    use Pod::Simple::PullParser;
    my $parser = Pod::Simple::PullParser->new;
    $parser->set_source( $file );
    my $description = $parser->get_description;

    if ( $description =~ m{^\s*$}m ) {
        return 1;
    }

    return 0;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
