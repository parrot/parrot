# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/ctype.t - Library ctype

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/ctype.t

=head1 DESCRIPTION

Tests PHP Library ctype
(implemented in F<languages/pipp/src/common/php_ctype.pir>).

See L<http://www.php.net/manual/en/ref.ctype.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 4;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'ctype_alnum() ok' );
<?php
  echo ctype_alnum('12abc'), "\n";
?>
CODE
1
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'ctype_alnum() ko' );
<?php
  echo ctype_alnum('12-abc'), "\n";
?>
CODE

OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'ctype_alnum() empty' );
<?php
  echo ctype_alnum(''), "\n";
?>
CODE

OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'ctype_alnum() int' );
<?php
  echo ctype_alnum(65), "\n";
  echo ctype_alnum(32), "\n";
  echo ctype_alnum(512), "\n";
?>
CODE
1

1
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
