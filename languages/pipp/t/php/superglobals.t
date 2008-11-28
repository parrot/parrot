# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/superglobals.t - tests for Pipp

=head1 SYNOPSIS

    perl t/harness t/php/superglobals.t

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

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'php_sapi_name' );
<?php
echo php_sapi_name();
echo "\n";
?>
CODE
cgi-fcgi
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

