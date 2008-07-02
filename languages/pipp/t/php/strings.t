# $Id$

=head1 NAME

pipp/t/strings.t - tests for Pipp

=head1 DESCRIPTION

String testing.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 6;

# Parrot modules
use Parrot::Test;


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', '== for equal strings', todo => 'currently broken' );
<?php
if ( 'asdf' == 'asdf' )
{
  echo "== for equal strings\n";
}
?>
END_CODE
== for equal strings
END_EXPECTED


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', '== for unequal strings', todo => 'currently broken' );
<?php
if ( 'asdf' == 'jklö' )
{
  echo "wrong turn\n";
}
else
{
  echo "== for unequal strings\n";
}
?>
END_CODE
== for unequal strings
END_EXPECTED


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', '!= for equal strings', todo => 'currently broken' );
<?php
if ( 'asdf' != 'asdf' )
{
  echo "dummy";
}
else
{
  echo "!= for equal strings\n";
}
?>
END_CODE
!= for equal strings
END_EXPECTED


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', '!= for unequal strings', todo => 'currently broken' );
<?php
if ( 'asdf' != 'jklö' )
{
  echo "!= for unequal strings\n";
}
?>
END_CODE
!= for unequal strings
END_EXPECTED


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'var_dump()' );
<?php
var_dump( 'asdf' );
?>
END_CODE
string(4) "asdf"
END_EXPECTED


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'string interpolation', todo => 'not implemented yet' );
<?php
$var1 = "VAR1";
$var2 = "VAR2";
echo "$var1 $var2\n";
?>
END_CODE
VAR1 VAR2
END_EXPECTED

