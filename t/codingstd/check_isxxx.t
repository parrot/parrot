#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Parrot::Test::Util::Runloop;

=head1 NAME

t/codingstd/check_isxxx.t - checks that the isxxx() functions are passed
unsigned char

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/check_isxxx.t

    # test specific files
    % perl t/codingstd/check_isxxx.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks all C language files to make sure that arguments to the isxxx()
functions are explicitly cast to unsigned char.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST  = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();

my @no_explicit_cast;

my @isxxx_functions_list = qw(
    isalnum
    isalpha
    isblank
    iscntrl
    isdigit
    isgraph
    islower
    isprint
    ispunct
    isspace
    isupper
);

my $isxxx_functions = join '|', @isxxx_functions_list;

sub check_isxxx {
    my $line = shift;

    # does the line contain an isxxx call?
    return 1 unless $line =~ /[^_]($isxxx_functions)\([^)]+/;
    # is the line missing a cast?
    return 1 unless $line !~ /[^_]($isxxx_functions)\(\(unsigned char\)/;
    # yes!  fail.
    return 0;
}

Parrot::Test::Util::Runloop->testloop(
    name     => 'isxxx() functions cast correctly',
    files    => [@files],
    per_line => \&check_isxxx,
    diag_prefix => 'isxxx() function not cast to unsigned char'
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
