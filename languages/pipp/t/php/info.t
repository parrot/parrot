# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/php/info.t - Standard Library info

=head1 SYNOPSIS

    perl t/harness t/php/info.t

=head1 DESCRIPTION

Tests PHP Standard Library info
(implemented in F<languages/pipp/src/common/php_info.pir>).

See L<http://www.php.net/manual/en/ref.?.php>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 10;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'php_egg_logo_guid()' );
<?php
  echo php_egg_logo_guid(), "\n";
?>
CODE
PHPE9568F36-D428-11d2-A769-00AA001ACF42
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'php_logo_guid()' );
<?php
  echo php_logo_guid(), "\n";
?>
CODE
/PHPE9568F3[46]-D428-11d2-A769-00AA001ACF42/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'php_real_logo_guid()' );
<?php
  echo php_real_logo_guid(), "\n";
?>
CODE
PHPE9568F34-D428-11d2-A769-00AA001ACF42
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'php_uname()' );
<?php
  echo php_uname(), "\n";
?>
CODE
/.+/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'php_uname("a")' );
<?php
  echo php_uname('a'), "\n";
?>
CODE
/.+/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'phpversion()' );
<?php
  echo phpversion(), "\n";
?>
CODE
/^5\.3/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'phpversion("ctype")' );
<?php
  echo phpversion('ctype'), "\n";
?>
CODE

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'zend_logo_guid()' );
<?php
  echo zend_logo_guid(), "\n";
?>
CODE
PHPE9568F35-D428-11d2-A769-00AA001ACF42
OUT

language_output_is( 'Pipp', <<'CODE', '.', 'get_include_path()' );
<?php
  echo get_include_path();
?>
CODE

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'get_loaded_extensions()' );
<?php
  print join( ';', get_loaded_extensions());
  echo "\n";
?>
CODE
standard;Reflection
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
