# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/php/constant.t - Test for constants

=head1 SYNOPSIS

    % perl t/harness t/php/constant.t

=head1 DESCRIPTION

Tests support for user set and predefined constants.

See L<http://www.php.net/manual/en/language.constants.php>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test   tests => 25;
use Parrot::Config qw( %PConfig );

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and constant(), string' );
<?php

define( "THIS_IS", "it" );
echo constant("THIS_IS"), "\n";
CODE
it
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and constant(), integer' );
<?php

define( "TEN_TIMES_TEN", 100 );
echo constant("TEN_TIMES_TEN"), "\n";
CODE
100
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and constant(), FALSE' );
<?php

define( "FAUX", FALSE );
echo constant("FAUX"), "\n";
CODE

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and constant(), NULL' );
<?php

define( "NUL", NULL );
echo constant("NUL"), "\n";
CODE

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and constant(), Float' );
<?php

define( "PI", 3.14159 );
echo constant("PI"), "\n";
CODE
3.14159
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and constant(), TRUE' );
<?php

define( "VRAI", TRUE );
echo constant("VRAI"), "\n";
CODE
1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and echo, String' );
<?php

define( "THIS_IS", "it" );
echo THIS_IS;
echo "\n";
CODE
it
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and echo, Float' );
<?php

define( "PI", 3.14159 );
echo PI, "\n";
CODE
3.14159
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'define(), Array' );
<?php
  $hello['world'] = 'hi';
  define( "HELLO", $hello );
CODE
/Constants may only evaluate to scalar values/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() write once' );
<?php

  echo define( 'MY_VAR', 'Ok' ), "\n";
  echo define( 'MY_VAR', 'redefine' ), "\n";
  echo MY_VAR, "\n";
CODE
1

Ok
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'define() and defined()' );
<?php

define( "PI", 3.14159 );
echo defined("PI"), "\n";
echo defined("UNDEF_PI"), "\n";
CODE
1

OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'constant() undefined' );
<?php

  echo constant("UNDEF_CST");
CODE
/Couldn't find constant UNDEF_CST/
OUT

# predefined constants of the info extension

language_output_is( 'Pipp', <<'CODE', $PConfig{osname}, 'PHP_OS' );
<?php
echo constant("PHP_OS");
CODE

language_output_is( 'Pipp', <<'CODE', '5.3.0 on Parrot', 'PHP_VERSION' );
<?php
echo constant("PHP_VERSION");
CODE

language_output_is( 'Pipp', <<'CODE', '5', 'PHP_MAJOR_VERSION' );
<?php
echo constant("PHP_MAJOR_VERSION");
CODE

language_output_is( 'Pipp', <<'CODE', '3', 'PHP_MINOR_VERSION' );
<?php
echo constant("PHP_MINOR_VERSION");
CODE

language_output_is( 'Pipp', <<'CODE', '0', 'PHP_RELEASE_VERSION' );
<?php
echo constant("PHP_RELEASE_VERSION");
CODE

language_output_is( 'Pipp', <<'CODE', ' on Parrot', 'PHP_EXTRA_VERSION' );
<?php
echo constant("PHP_EXTRA_VERSION");
CODE

language_output_is( 'Pipp', <<'CODE', '50300', 'PHP_VERSION_ID' );
<?php
echo constant("PHP_VERSION_ID");
CODE

language_output_is( 'Pipp', <<'CODE', '0', 'PHP_ZTS' );
<?php
echo constant("PHP_ZTS");
CODE

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'NOT_DEFINED' );
<?php
echo constant("NOT_DEFINED");
CODE
/Couldn't find constant NOT_DEFINED/
OUT

language_output_is( 'Pipp', <<'CODE', '5', 'PHP_MAJOR_VERSION' );
<?php
echo PHP_MAJOR_VERSION;
CODE

language_output_is( 'Pipp', <<'CODE', '.', 'DEFAULT_INCLUDE_PATH' );
<?php
echo DEFAULT_INCLUDE_PATH;
CODE

# predefined constants of the dir extension

language_output_is( 'Pipp', <<'CODE', $PConfig{slash}, 'DIRECTORY_SEPARATOR' );
<?php
echo constant("DIRECTORY_SEPARATOR");
CODE

language_output_is( 'Pipp', <<'CODE', $PConfig{slash}, 'PATH_SEPARATOR' );
<?php
echo constant("PATH_SEPARATOR");
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
