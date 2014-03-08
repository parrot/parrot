# Copyright (C) 2007, Parrot Foundation.
package Parrot::Test::Pod::Utils;
use strict;
use warnings;
use Pod::Checker;
use Capture::Tiny 'capture';
use Pod::Simple::PullParser;
our (@ISA, @EXPORT_OK);
@ISA       = qw( Exporter );
@EXPORT_OK = qw(
    file_pod_ok
    empty_description
);

sub file_pod_ok {
    my $file    = shift;
    my $checker = Pod::Checker->new;

    # ignore output; we just want to know if we have warnings/errors
    my $trash = capture {
        $checker->parse_from_file($file);
    };

    return !$checker->num_errors;
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
