# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/php/superglobals.t - tests for Pipp

=head1 SYNOPSIS

    perl t/harness t/php/superglobals.t

=head1 DESCRIPTION

Test PHP superglobal variables.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 5;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'php_sapi_name' );
<?php
echo php_sapi_name();
echo "\n";
?>
CODE
cgi-fcgi
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'using two superglobals' );
<?php

echo $_REQUEST['name'];
echo "\n";

echo $_SESSION['name'];
echo "\n";

?>
CODE
$_REQUEST
$_SESSION
OUT

$ENV{REQUEST_TYPE} = 'GET';
$ENV{QUERY_STRING} = 'as=df';

language_output_is( 'Pipp', <<'CODE', <<'OUT', '$_GET' );
<?php
echo $_GET['as'];
echo "\n";
?>
CODE
df
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump( $_GET )', todo => 'currently broken' );
<?php
var_dump( $_GET );
echo "\n";
?>
CODE
array(1) {
  ["as"]=>
  string(2) "df"
}

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', q{$_ENV['QUERY_STRING']}, todo => '$_ENV not set yet' );
<?php

echo 'outside function: ';
echo $_ENV['QUERY_STRING'];
echo "\n";

?>
CODE
outside function: as=df
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', '$_GET in a function' );
<?php

echo 'outside function: ';
echo $_GET['as'];
echo "\n";

function echo_as () {
    echo 'inside function: ';
    echo $_GET['as'];
    echo "\n";
}

echo_as();

?>
CODE
outside function: df
inside function: df
OUT
