# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

t/php/dir.t - Standard Library dir

=head1 SYNOPSIS

    perl t/harness t/php/dir.t

=head1 DESCRIPTION

Tests PHP Standard Library dir
(implemented in F<languages/pipp/src/common/php_dir.pir>).

See L<http://docs.php.net/manual/en/book.dir.php>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 1;
use Parrot::Config qw( %PConfig );


language_output_is( 'Pipp', <<'CODE', $PConfig{slash}, 'dirname("/not_there")', todo => 'not yet' );
<?php
  echo dirname("/not_there");
?>
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
