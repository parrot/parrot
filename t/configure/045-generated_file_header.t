#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 12;
use Carp;
use File::Temp qw| tempfile |;
use lib qw( lib );
use Parrot::BuildUtil;

{
    my $header;
    my ( $filename, $style ) = ( 'foobar', 'APL' );
    eval { $header = Parrot::BuildUtil::generated_file_header( $filename, $style ); };
    like(
        $@,
        qr/unknown style /,
        'error when no arguments passed',
    );
}

{
    my $header;
    my ( $filename, $style ) = ( 'foobar', 'perl' );

    require File::Spec;
    my $script = File::Spec->abs2rel($0);
    $script =~ s/\\/\//g;

    eval { $header = Parrot::BuildUtil::generated_file_header( $filename, $style ); };
    is( $@, '', "no error when called with '$style' style" );

    like( $header, qr/ft=perl:/, "filetype set to '$style'" );
    like( $header, qr/from '$filename'/, 'filename set' );
    like( $header, qr/by $script/, 'script set' );

    my @header = split /\n/ => $header;
    is(
        @{[ grep( { /^#  / } @header ) ]},
        @header,
        'each line starts with a comment marker',
    );
}

{
    my $header;
    my ( $filename, $style ) = ( 'foobar', 'c' );

    require File::Spec;
    my $script = File::Spec->abs2rel($0);
    $script =~ s/\\/\//g;

    eval { $header = Parrot::BuildUtil::generated_file_header( $filename, $style ); };
    is( $@, '', "no error when called with '$style' style" );

    like( $header, qr/ft=c:/, "filetype set to '$style'" );
    like( $header, qr/from '$filename'/, 'filename set' );
    like( $header, qr/by $script/, 'script set' );

    my @header = split /\n/ => $header;
    is(
        @{[ grep( { /^[ \/]\*[ \/]?/ } @header ) ]},
        @header,
        'each line starts with a comment marker',
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

044-generated_file_header.t - test C<Parrot::BuildUtil::generated_file_header()>

=head1 SYNOPSIS

    % prove t/configure/045-generated_file_header.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test C<Parrot::BuildUtil::generated_file_header()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::BuildUtil, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


