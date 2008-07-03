#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/file.t - Standard Library file

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/file.t

=head1 DESCRIPTION

Tests PHP Standard Library file
(implemented in F<languages/pipp/src/common/php_file.pir>).

See L<http://www.php.net/manual/en/ref.file.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More     tests => 4;
use Parrot::Test;


unlink '../file.txt' if (-f '../file.txt');
open my $X, '>', '../file.txt';
print {$X} "line 1\n";
print {$X} "line 2\n";
print {$X} "line 3\n";
close $X;

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'file_get_contents(file)' );
<?php
  echo file_get_contents('file.txt'), "\n";
?>
CODE
line 1
line 2
line 3

OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'file_get_contents(nofile)' );
<?php
  echo file_get_contents('nofile.txt'), "\n";
?>
CODE

OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'readfile(file)' );
<?php
  echo readfile('file.txt'), "\n";
?>
CODE
line 1
line 2
line 3
21
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'readfile(nofile)' );
<?php
  echo readfile('nofile.txt'), "\n";
?>
CODE

OUTPUT

unlink '../file.txt' if (-f '../file.txt');


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
