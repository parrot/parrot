#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/base64.t - Standard Library base64

=head1 SYNOPSIS

    % perl -I../lib plumhead/t/php/base64.t

=head1 DESCRIPTION

Tests PHP Standard Library base64
(implemented in F<languages/plumhead/src/common/php_base64.pir>).

See L<http://www.php.net/manual/en/ref.url.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More     skip_all => 'Compiler updates needed'; #tests => 2;
use Parrot::Test;


language_output_is( 'Plumhead', <<'CODE', <<'OUTPUT', 'base64_encode(str)' );
<?php
  echo base64_encode('Plum Headed Parakeet'), "\n";
?>
CODE
UGx1bSBIZWFkZWQgUGFyYWtlZXQ=
OUTPUT

language_output_is( 'Plumhead', <<'CODE', <<'OUTPUT', 'base64_decode(str)' );
<?php
  echo base64_decode('UGx1bSBIZWFkZWQgUGFyYWtlZXQ='), "\n";
?>
CODE
Plum Headed Parakeet
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
