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
 *     These are the vtable functions for the $classname base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

pmclass $classname {

EOF

my $decls;

for (@{$vtbl}) {
    my ($retval, $methname, $args) = @{$_};

    print "    $retval $methname ($args) {\n";
    f($retval !~ /void/) {
        print "        return ($retval)0;\n";
    }
    print "    }\n\n";
}

print "}\n";
