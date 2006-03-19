# Pugs-specific PMC testing
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

package t::pmc;
use Parrot::Test 'no_plan';
use Test::More;

sub import {
    my $class = shift;

    my (undef, $file, undef) = caller();
    $file =~ /(\w+)\.t$/ or die "malformed file: $file";
    my $type = "Pugs\u$1";

    main::pir_output_is(<< 'CODE', << 'OUTPUT', "check sanity for pugs_group");
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

main::pir_output_is(<< "CODE", << "OUTPUT", "check sanity for creation");
.HLL "Perl6", "pugs_group"
.sub _main
    .local pmc pmc1
    .local string typ
    pmc1 = new .$type
    typ = typeof pmc1
    print typ
    print "\\n"
.end
CODE
$type
OUTPUT

}

1;
