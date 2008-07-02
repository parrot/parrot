#! perl
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
use lib "$FindBin::Bin/../../lib";

use Test::More     tests => 5;
use Parrot::Test;


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


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
