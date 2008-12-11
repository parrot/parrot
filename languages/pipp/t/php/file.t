# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/file.t - Standard Library file

=head1 SYNOPSIS

    perl t/harness t/php/file.t

=head1 DESCRIPTION

Tests PHP Standard Library file
(implemented in F<languages/pipp/src/common/php_file.pir>).

See L<http://www.php.net/manual/en/ref.filesystem.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 10;
use Parrot::Test;


unlink 'file.txt' if -f 'file.txt';
open my $X, '>', 'file.txt';
binmode $X, ':raw';
print {$X} "line 1\n";
print {$X} "line 2\n";
print {$X} "line 3\n";
close $X;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'basename' );
<?php
  echo basename('def.html'), "\n";
  echo basename('abc/def.html'), "\n";
  echo basename('abc/def.html', '.html'), "\n";
  echo basename('abc/def.html.html', '.html'), "\n";
?>
CODE
def.html
def.html
def
def.html
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'file_get_contents(file)' );
<?php
  echo file_get_contents('file.txt'), "\n";
?>
CODE
line 1
line 2
line 3

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'file_get_contents(nofile)' );
<?php
  echo file_get_contents('nofile.txt'), "\n";
?>
CODE

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'fopen(file)' );
<?php
  $fp = fopen('file.txt', 'r');
  echo gettype($fp), "\n";
?>
CODE
resource
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'fopen(nofile)', todo => 'currently broken' );
<?php
  $fp = fopen('nofile.txt', 'r');
  echo gettype($fp), "\n";
  echo $fp, "\n";
?>
CODE
boolean

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'fopen(file) & fclose' );
<?php
  $fp = fopen('file.txt', 'r');
  echo fclose($fp), "\n";
?>
CODE
1
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'fclose() bad arg', todo => 'currently broken' );
<?php
  fclose('bad');
?>
CODE
/fclose\(\): supplied argument is not a valid (stream|FileHandle) resource/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'fpassthru()', todo => 'currently broken' );
<?php
  $fp = fopen('file.txt', 'r');
  fpassthru($fp);
  fclose($fp);
?>
CODE
line 1
line 2
line 3
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'readfile(file)', todo => 'currently broken' );
<?php
  echo readfile('file.txt'), "\n";
?>
CODE
line 1
line 2
line 3
21
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'readfile(nofile)' );
<?php
  echo readfile('nofile.txt'), "\n";
?>
CODE

OUT

unlink 'file.txt' if -f 'file.txt';


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
