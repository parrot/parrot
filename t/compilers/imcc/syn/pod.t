#!perl
# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 4;

=head1 NAME

t/compilers/imcc/syn/pod.t

=head1 SYNOPSIS

    % prove t/compilers/imcc/syn/pod.t

=head1 DESCRIPTION

Tests PIR's handling of Plain Old Documentation (POD) format.

=cut


pir_output_is( <<'CODE', <<'OUT', "simple pod" );
.sub test :main
    print "pass\n"
    end
.end
=head1 Some POD
This should be ignored, incl. digit 1
CODE
pass
OUT

pir_output_is( <<'CODE', <<'OUT', "pod with decimal digits" );
.sub test :main
    print "pass\n"
    end
.end
=head1 Some POD
This should be ignored, incl. number 1.0
=cut
CODE
pass
OUT

pir_output_is( <<'CODE', <<'OUT', "pod inside sub" );
.sub test :main
     print "pass\n"
     _x()
     end
.end

.sub _x
=head1 Some POD
 This should be ignored, incl. digit 1.0
=cut
  print "ok\n"
.end
CODE
pass
ok
OUT

open my $FOO, ">", "include.tempfile";
print $FOO <<'ENDF';

=head1 Foobar

we don't cut out!!!

ENDF
close $FOO;

SKIP: {
    skip( "Closing out of pod from included files", 1 );
    pir_output_is( <<'CODE', <<'OUT', "simple pod" );
.include "include.tempfile"
.sub test :main
    print "pass\n"
    end
.end
CODE
pass
OUT
}

unlink( 'macro.tempfile', 'include.tempfile' );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
