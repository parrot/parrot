# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

pipp/t/superglobals.t - tests for Pipp

=head1 DESCRIPTION

Test PHP superglobal variables.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 3;

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'php_sapi_name' );
<?php
echo php_sapi_name();
echo "\n";
?>
END_CODE
cgi-fcgi
END_EXPECTED

$ENV{REQUEST_TYPE} = 'GET';
$ENV{QUERY_STRING} = 'as=df';

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', '$_GET' );
<?php
echo $_GET['as'];
echo "\n";
?>
END_CODE
df
END_EXPECTED

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'var_dump( $_GET )', todo => 'currently broken' );
<?php
var_dump( $_GET );
echo "\n";
?>
END_CODE
array(1) {
  ["as"]=>
  string(2) "df"
}

END_EXPECTED

