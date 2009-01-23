# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

t/php/filesystem.t - Standard Library filesystem

=head1 SYNOPSIS

    perl t/harness t/php/filesystem.t

=head1 DESCRIPTION

Tests PHP Standard Library filesystem
(implemented in F<languages/pipp/src/common/php_filesystem.pir>).

See L<http://docs.php.net/manual/en/book.filesystem.php>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test   tests => 5;
use Parrot::Config qw( %PConfig );

# test dirname
{
    my @test_cases = (
        ['a/b'                    => 'a' ],
        ['a/b/c'                  => 'a/b' ],
        ['axxxx/bxxxx/cxxxx'      => 'axxxx/bxxxx' ],
        ['axxxx'                  => 'axxxx/bxxxx', todo => 'not yet' ],
        ['/not_there'             => $PConfig{slash} ],
    );

    foreach ( @test_cases ) {
        my ( $path, $dirname, @extra ) = @{$_};

        language_output_is( 'Pipp', <<"CODE", $dirname, qq{dirname('$path')}, @extra );
<?php
  echo dirname('$path');
?>
CODE
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
