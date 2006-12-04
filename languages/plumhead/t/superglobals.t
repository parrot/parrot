# $Id$

=head1 NAME

plumhead/t/superglobals.t - tests for Plumhead

=head1 DESCRIPTION

Test PHP superglobal variables.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 2;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'hello' );
<?php
echo php_sapi_name();
echo "\n";
?>
END_CODE
cgi-fcgi
END_EXPECTED

$ENV{REQUEST_TYPE} = 'GET';
$ENV{QUERY_STRING} = 'as=df';
language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'hello' );
<?php
echo $_GET['as'];
echo "\n";
?>
END_CODE
df
END_EXPECTED

