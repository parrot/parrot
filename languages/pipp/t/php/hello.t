# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/php/hello.t - tests for Pipp

=head1 SYNOPSIS

    perl t/harness t/php/hello.t

=head1 DESCRIPTION

A couple of 'Hello World' tests.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 19;

my $h = "Hello, World!\n";

language_output_is( 'Pipp', <<'CODE', 'Hello, World!', 'sea without newline' );
Hello, World!<?php
?>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'sea with one newline' );
Hello, World!
<?php
?>
CODE

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'sea with two newlines' );
Hello,
World!
<?php
?>
CODE
Hello,
World!
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'sea without following PHP code' );
Hello,
World!
CODE
Hello,
World!
OUT

language_output_is( 'Pipp', <<'CODE', $h, 'sea without following PHP code' );
Hello,<?php
  ?> World!
<?php
?>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'echo one double quoted string' );
<?php
echo "Hello, World!\n";
?>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'echo with single quoted string' );
<?php
echo 'Hello, World!';
echo "\n";
?>
CODE


language_output_is( 'Pipp', <<'CODE', 'Hello World', 'only alphanumic' );
<?php echo "Hello World"; ?>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'two echo statements' );
<?php
echo "Hello, ";
echo "World!\n";
?>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'two echo statements' );
<?php
echo "Hello, ";
?>Wo<?php
echo "rl";
?>d!
<?php
?>
CODE

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'hello with some HTML' );
<html>
<head>
  <title>Servus</title>
</head>
<body>
<pre>
<?php
echo "Hello, World!\n";
?>
</pre>
</body>
</html>
CODE
<html>
<head>
  <title>Servus</title>
</head>
<body>
<pre>
Hello, World!
</pre>
</body>
</html>
OUT


language_output_is( 'Pipp', <<'CODE', $h, 'hello in a scalar' );
<?php
$h = "Hello, World!\n";
echo $h;
?>
CODE


language_output_is( 'Pipp', <<'CODE', $h, 'hello in a hash' );
<?php
$h["e"] = "Hello, World!\n";
echo $h["e"];
?>
CODE


language_output_is( 'Pipp', <<'CODE', $h, 'no semicolon befor CODE_END' );
<?php
echo 'Hello, ';
echo "World!\n"
?>
CODE


language_output_is( 'Pipp', <<'CODE', $h, 'concatenation of two strings' );
<?php
echo 'Hello, ' . "World!\n"
?>
CODE


language_output_is( 'Pipp', <<'CODE', $h, 'script tags' );
<script language="php">
echo "Hello, World!\n";
</script>
CODE


language_output_is( 'Pipp', <<'CODE', $h, 'script tags' );
<script language="php">
echo "Hello, World!\n";
</script>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'echo with three args' );
<?php
echo 'Hello', ', World!', "\n";
?>
CODE

language_output_is( 'Pipp', <<'CODE', $h, 'print with one arg' );
<?php
print "Hello, World!\n";
?>
CODE

