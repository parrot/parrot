# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/base64.t - Standard Library base64

=head1 SYNOPSIS

    perl t/harness t/php/base64.t

=head1 DESCRIPTION

Tests PHP Standard Library base64
(implemented in F<languages/pipp/src/common/php_base64.pir>).

See L<http://www.php.net/manual/en/ref.url.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 8;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'base64_encode(str)' );
<?php
  echo base64_encode('Plum Headed Parakeet'), "\n";
?>
CODE
UGx1bSBIZWFkZWQgUGFyYWtlZXQ=
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'base64_encode(no arg)' );
<?php
  echo base64_encode(), "\n";
?>
CODE
/base64_encode\(\) expects exactly 1 parameter, 0 given/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'base64_encode(3.14)' );
<?php
  echo base64_encode(3.14), "\n";
?>
CODE
My4xNA==
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'base64_encode(TRUE)' );
<?php
  echo base64_encode(TRUE), "\n";
?>
CODE
MQ==
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'base64_encode(NULL)' );
<?php
  echo base64_encode(NULL), "\n";
?>
CODE

OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'base64_encode(array)' );
<?php
  $hello['world'] = 'hi';
  echo base64_encode($hello), "\n";
?>
CODE
/base64_encode\(\) expects parameter 1 to be string, array given/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'base64_decode(str)' );
<?php
  echo base64_decode('UGx1bSBIZWFkZWQgUGFyYWtlZXQ='), "\n";
?>
CODE
Plum Headed Parakeet
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'base64_decode(no arg)' );
<?php
  echo base64_decode(), "\n";
?>
CODE
/base64_decode\(\) expects at least 1 parameter, 0 given/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
