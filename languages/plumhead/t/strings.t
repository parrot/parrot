# $Id$

=head1 NAME

plumhead/t/strings.t - tests for Plumhead

=head1 DESCRIPTION

String testing.

=cut

# pragmata
use strict;
use warnings;
use 5.006_001;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More     tests => 5;

# Parrot modules
use Parrot::Test;


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', '== for equal strings' );
<?php
if ( 'asdf' == 'asdf' )
{
  echo "== for equal strings\n";
}
?>
END_CODE
== for equal strings
END_EXPECTED


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', '== for unequal strings' );
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


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', '!= for equal strings' );
<?php
if ( 'asdf' != 'asdf' )
{
}
else
{
  echo "!= for equal strings\n";
}
?>
END_CODE
!= for equal strings
END_EXPECTED


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', '!= for unequal strings' );
<?php
if ( 'asdf' != 'jklö' )
{
  echo "!= for unequal strings\n";
}
?>
END_CODE
!= for unequal strings
END_EXPECTED


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'var_dump()' );
<?php
var_dump( 'asdf' );
?>
END_CODE
string(4) "asdf"
END_EXPECTED

