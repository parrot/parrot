# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/builtin.t - Standard Library

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/builtin.t

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


language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'get_resource_type()' );
<?php
  $fp = fopen('file.txt', 'w');
  echo get_resource_type($fp);
?>
CODE
/^(stream|ParrotIO)$/
OUTPUT

unlink 'pipp/file.txt' if (-f 'pipp/file.txt');

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'get_resource_type() bad arg' );
<?php
  echo get_resource_type('bad');
?>
CODE
/Supplied argument is not a valid resource handle/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'strcmp()' );
<?php
  echo strcmp('ABC', 'ABC'), "\n";
  echo strcmp('ABC', 'BCD'), "\n";
  echo strcmp('BCD', 'ABC'), "\n";
?>
CODE
0
-1
1
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'strlen()' );
<?php
  echo strlen('str'), "\n";
?>
CODE
3
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'strlen() empty string' );
<?php
  echo strlen(''), "\n";
?>
CODE
0
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'strlen() no arg' );
<?php
  echo strlen(), "\n";
?>
CODE
/Wrong parameter count for strlen\(\)/
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'strlen() too many arg' );
<?php
  echo strlen('str', 42), "\n";
?>
CODE
/Wrong parameter count for strlen\(\)/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'extension_loaded() returns FALSE, echo' );
<?php
  echo extension_loaded("asdf");
?>
CODE
OUTPUT


language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'extension_loaded() returns FALSE, var_dump' );
<?php
  var_dump( extension_loaded("asdf") );
?>
CODE
bool(false)
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
