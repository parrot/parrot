#! perl
# Copyright (C) 2006-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_returns.t - checks for possible use of C<return (foo);> from functions

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_returns.t

    # test specific files
    % perl t/codingstd/c_returns.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files return using C<return foo;> rather
than C<return (foo);>

=head1 NOTES

This test was hacked from the C<check_returns> sub in
C<tools/dev/check_source_standards.pl>

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();
my @paren_return;

foreach my $file (@files) {
    my $path;

    ## get the full path of the file
    # if we have command line arguments, the file is the full path
    if (@ARGV) {
        $path = $file;
    }

    # otherwise, use the relevant Parrot:: path method
    else {
        $path = $file->path;
    }

    my $buf = $DIST->slurp($path);

    # look for instances of return(
    push @paren_return => "$path\n"
        if ( $buf =~ m/[^_.]return\(/ );
}

ok( !scalar(@paren_return), 'Correctly formed return statement' )
    or diag( "Possible use of C<return(foo);> rather than C<return foo;> in "
        . scalar @paren_return
        . " files:\n@paren_return" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
