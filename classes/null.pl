# $Id$

use FindBin;
use lib "$FindBin::Bin/../lib";

use Parrot::Vtable;

my $vtbl = parse_vtable("$FindBin::Bin/../vtable.tbl");

my $classname = shift;

die "No classname given!\n" unless $classname;

my $DOLLAR = '$';

print <<EOF;
/* ${classname}.pmc
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     ${DOLLAR}Id${DOLLAR}
 *  Overview:
 *     These are the vtable functions for the Null PMC
 *     This simply creates a way of catching NULL register accesses without
 *     really slowing down the bytecode execution.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *     Upon adding new methods to Parrot PMCs, we manually regenerate the Null PMC
 *     for now.
 *     XXX FIXME: Integrate this into the configure/build process to autogen null.pmc
 *                so we don't need a seperate null.pl script.
 *     (perl ./null.pl Null > null.pmc)
 *  References:
 */

#include "parrot/parrot.h"

pmclass $classname {

EOF

my $decls;

for (@{$vtbl}) {
    my ($retval, $methname, $args) = @{$_};
    if ($methname eq 'type' || $methname eq 'name' || $methname =~ /prop/) {
	# default.pmc handles these
	next;
    }

    print "    $retval $methname ($args) {\n";
	print "        internal_exception(NULL_REG_ACCESS, \"Fatal exception: Null PMC access (PMC::$methname)!\");\n";
    if($retval ne 'void') {
        print "        return ($retval)0;\n";
    }
    print "    }\n\n";
}

print "}\n";

