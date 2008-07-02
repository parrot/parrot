# $Id$

=head1 NAME

plumhead/t/control_flow.t - tests for Plumhead

=head1 DESCRIPTION

Test control flow.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 10;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'if, one statement in block' );
<?php
if (1)
{
  echo "Hi\n";
}
?>
END_CODE
Hi
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'if, no statements in block' );
<?php
if (1)
{
}
echo "Hi\n";
?>
END_CODE
Hi
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'if, two statements in block' );
<?php
if (1)
{
  echo "Hi";
  echo "\n";
}
?>
END_CODE
Hi
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'if/else taking if-branch' );
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
END_CODE
if block
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'i/else taking else-branchf' );
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
END_CODE
else block
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED' . q{  }, 'positive int' );
<?php
if (1) {
  ?>
    Condition is true.
  <?php
}
?>
END_CODE
    Condition is true.
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'zero' );
<?php
if (0) {
  ?>
    'Condition is true' does not apply.
  <?php
}
?>
Condition is false.
END_CODE
Condition is false.
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'string' );
<?php
if ( 'false' ) {
?>
The string 'false' is true.
<?php
}
?>
END_CODE
The string 'false' is true.
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'string' );
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
END_CODE
The string 'vrai' is true.
END_EXPECTED


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'string' );
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
END_CODE
The integer 0 is false.
END_EXPECTED
