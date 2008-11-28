# Copyright (C) 2008, The Perl Foundation.
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

use Parrot::Test tests => 17;

language_output_is( 'Pipp', <<'CODE', 'Hello, World!', 'sea without newline' );
Hello, World!<?php
?>
CODE

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'sea with one newline' );
Hello, World!
<?php
?>
CODE
Hello, World!
OUT

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

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'sea without following PHP code' );
Hello,<?php
  ?> World!
<?php
?>
CODE
Hello, World!
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'hello' );
<?php
echo "Hello, World!\n";
?>
CODE
Hello, World!
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'hello' );
<?php
echo 'Hello, World!';
echo "\n";
?>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', 'Hello World', 'only alphanumic' );
<?php echo "Hello World"; ?>
CODE

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'two echo statements' );
<?php
echo "Hello, ";
echo "World!\n";
?>
CODE
Hello, World!
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'two echo statements' );
<?php
echo "Hello, ";
?>Wo<?php
echo "rl";
?>d!
<?php
?>
CODE
Hello, World!
OUT

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


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'hello in a scalar' );
<?php
$h = "Hello, World!\n";
echo $h;
?>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'hello in a hash' );
<?php
$h["e"] = "Hello, World!\n";
echo $h["e"];
?>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'no semicolon befor CODE_END' );
<?php
echo 'Hello, ';
echo "World!\n"
?>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'concatenation of two strings' );
<?php
echo 'Hello, ' . "World!\n"
?>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'script tags' );
<script language="php">
echo "Hello, World!\n";
</script>
CODE
Hello, World!
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'script tags' );
<script language="php">
echo "Hello, World!\n";
</script>
CODE
Hello, World!
OUT
