# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/builtin.t - Standard Library

=head1 SYNOPSIS

    % perl t/harness t/php/builtin.t

=head1 DESCRIPTION

Tests PHP Standard Library
(implemented in F<languages/pipp/src/common/php_builtin.pir>).

See L<http://www.php.net/manual/en/ref.?.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 9;
use Parrot::Test;


language_output_like( 'Pipp', <<'CODE', <<'OUT', 'get_resource_type()' );
<?php
  $fp = fopen('file.txt', 'w');
  echo get_resource_type($fp);
?>
CODE
/^(stream|FileHandle)$/
OUT

unlink 'pipp/file.txt' if (-f 'pipp/file.txt');

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'get_resource_type() bad arg' );
<?php
  echo get_resource_type('bad');
?>
CODE
/Supplied argument is not a valid resource handle/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strcmp()' );
<?php
  echo strcmp('ABC', 'ABC'), "\n";
  echo strcmp('ABC', 'BCD'), "\n";
  echo strcmp('BCD', 'ABC'), "\n";
?>
CODE
0
-1
1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strlen()' );
<?php
  echo strlen('str'), "\n";
?>
CODE
3
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strlen() empty string' );
<?php
  echo strlen(''), "\n";
?>
CODE
0
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'strlen() no arg' );
<?php
  echo strlen(), "\n";
?>
CODE
/Wrong parameter count for strlen\(\)/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'strlen() too many arg' );
<?php
  echo strlen('str', 42), "\n";
?>
CODE
/Wrong parameter count for strlen\(\)/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'extension_loaded() returns FALSE, echo' );
<?php
  echo extension_loaded("asdf");
?>
CODE
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'extension_loaded() returns FALSE, var_dump' );
<?php
  var_dump( extension_loaded("asdf") );
?>
CODE
bool(false)
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
