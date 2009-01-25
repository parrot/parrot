# Copyright (C) 2005-2009, The Perl Foundation.
# $Id$

=head1 NAME

lazy-k/t/cat.t - testing cat.lazy

=head1 SYNOPSIS

    % cd languages/lazy-k && perl t/cat.t

=head1 DESCRIPTION

Test cat.lazy.

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib";

use Test::More       tests => 1;
use Parrot::Config   qw(%PConfig);
use File::Spec       ();

my $is_win32  = $^O eq 'MSWin32';

my $parrot    = File::Spec->catfile( File::Spec->updir(), File::Spec->updir(), $PConfig{test_prog} );
my $lazy_k    = "$parrot lazy.pbc";
my $source_fn = 'examples/cat.lazy'; 

# XXX This does not look portable.
my $cmd;
if ($is_win32) {
    # Don't quote the string on Windows, it is passed on literally
    $cmd = qq{echo 1+2*3 | $lazy_k $source_fn};
}
else {
    $cmd = qq{echo '1+2*3' | $lazy_k $source_fn};
}

is( `$cmd`, "1+2*3\n", 'cat.lazy' );
