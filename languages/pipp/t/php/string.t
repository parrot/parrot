# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/string.t - Standard Library string

=head1 SYNOPSIS

    perl t/harness t/php/string.t

=head1 DESCRIPTION

Tests PHP Standard Library string
(implemented in F<languages/pipp/src/common/php_string.pir>).

See L<http://www.php.net/manual/en/ref.strings.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 14;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'bin2hex' );
<?php
  echo bin2hex('Ab3'), "\n";
?>
CODE
416233
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'chr' );
<?php
  echo chr(65), "\n";
?>
CODE
A
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'ltrim' );
<?php
  echo ltrim('  abc'), "\n";
?>
CODE
abc
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'ord' );
<?php
  echo ord('A'), "\n";
  echo ord(''), "\n";
?>
CODE
65
0
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'rtrim' );
<?php
  echo rtrim('  abc  '), "\n";
?>
CODE
  abc
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'str_repeat' );
<?php
  echo str_repeat('Ab', 3), "\n";
  echo str_repeat('Ab', 0), "\n";
  echo str_repeat('Ab', 1), "\n";
  echo str_repeat('', 3), "\n";
?>
CODE
AbAbAb

Ab

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strchr' );
<?php
  echo strchr('abcdef', 'cd'), "\n";
  echo strchr('abcdef', 'g'), "\n";
?>
CODE
cdef

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strpos' );
<?php
  echo strpos('abcdef', 'cd'), "\n";
  echo strpos('abcdef', 'g'), "\n";
  echo strpos('abcabc', 'b', 3), "\n";
?>
CODE
2

4
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strstr' );
<?php
  echo strstr('abcdef', 'cd'), "\n";
  echo strstr('abcdef', 'g'), "\n";
?>
CODE
cdef

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strtolower' );
<?php
  echo strtolower('aBc'), "\n";
?>
CODE
abc
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strtoupper' );
<?php
  echo strtoupper('aBc'), "\n";
?>
CODE
ABC
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'substr' );
<?php
  echo substr('abcdef', 2), "\n";
  echo substr('abcdef', 2, 2), "\n";
  echo substr('abcdef', -2), "\n";
  echo substr('abcdef', -2, 1), "\n";
?>
CODE
cdef
cd
ef
e
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'trim' );
<?php
  echo trim('  abc  '), "\n";
  echo trim('   '), "\n";
  echo trim(''), "\n";
  echo trim('  abc  ', ' a'), "\n";
?>
CODE
abc


bc
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'ucfirst' );
<?php
  echo ucfirst('abc'), "\n";
?>
CODE
Abc
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
