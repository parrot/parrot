#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id: /mirror/trunk/languages/lua/t/pmc/boolean.t 11586 2006-02-16T17:44:54.559622Z fperrad  $

=head1 NAME

t/pmc/bit.t - PugsBit

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/bit.t

=cut

use Parrot::Test 'no_plan';
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check sanity");
.sub _main
    loadlib $P1, "pugs_group"
    $I0 = defined $P1 
    if $I0 goto ok
    print "not "
ok:
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check sanity");
.HLL "Perl6", "pugs_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .PugsBit
    print "ok\n"
.end
CODE
ok
OUTPUT

