# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

pipp/t/control_flow.t - tests for Pipp

=head1 DESCRIPTION

Test control flow.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 15;

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'if, one statement in block' );
<?php
if (1)
{
  echo "Hi\n";
}
?>
CODE
Hi
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'if, no statements in block' );
<?php
if (1)
{
}
echo "Hi\n";
?>
CODE
Hi
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'if, two statements in block' );
<?php
if (1)
{
  echo "Hi";
  echo "\n";
}
?>
CODE
Hi
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'if/else taking if-branch' );
<?php
if (1)
{
  echo "if block\n";
}
else
{
  echo "else block\n";
}
?>
CODE
if block
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'i/else taking else-branchf' );
<?php
if (0)
{
  echo "if block\n";
}
else
{
  echo "else block\n";
}
?>
CODE
else block
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT' . q{  }, 'positive int' );
<?php
if (1) {
  ?>
    Condition is true.
  <?php
}
?>
CODE
    Condition is true.
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'zero' );
<?php
if (0) {
  ?>
    'Condition is true' does not apply.
  <?php
}
?>
Condition is false.
CODE
Condition is false.
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'string' );
<?php
if ( 'false' ) {
?>
The string 'false' is true.
<?php
}
?>
CODE
The string 'false' is true.
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'string' );
<?php
if ( 'vrai' ) {
?>
The string 'vrai' is true.
<?php
}
else
{
?>
The string 'vrai' is false.
<?php
}
?>
CODE
The string 'vrai' is true.
OUTPUT


language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'string' );
<?php
if ( 0 ) {
?>
The integer 0 is true.
<?php
}
else
{
?>
The integer 0 is false.
<?php
}
?>
CODE
The integer 0 is false.
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'while loop' );
<?php

$count = 0;
while ( $count < 10 ) { $count++; echo "round $count\n"; }
CODE
round 1
round 2
round 3
round 4
round 5
round 6
round 7
round 8
round 9
round 10
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'while with negated expression' );
<?php

$count = 0;
while ( ! ( $count >= 10 ) ) { $count++; echo "round $count\n"; }
CODE
round 1
round 2
round 3
round 4
round 5
round 6
round 7
round 8
round 9
round 10
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'classic for-loop' );
<?php

$count = 0;
for ( $count = 0; $count < 10; $count++ ) { echo "round $count\n"; }
CODE
round 0
round 1
round 2
round 3
round 4
round 5
round 6
round 7
round 8
round 9
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'for-loop with HTML-block' );
<?php

$count = 0;
for ( $count = 0; $count < 10; $count++ ) { ?>round <?php echo $count
?>

<?php } ?>
CODE
round 0
round 1
round 2
round 3
round 4
round 5
round 6
round 7
round 8
round 9
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'another for-loop' );
<?php for ( $count = 0; $count < 10; $count++ ) { ?>round <?php echo $count ?>

<?php } ?>
CODE
round 0
round 1
round 2
round 3
round 4
round 5
round 6
round 7
round 8
round 9
OUTPUT
