use Parrot::Vtable;
my %vtbl = parse_vtable("vtable.tbl");
my $classname = shift;
die "No classname given!\n" unless $classname;

print <<EOF;
/* ${classname}.pmc
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     \$Id$
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
for (vtbl_enumerate(%vtbl)) {
    my $proto = $_->[2];
    my $thisproto = $proto;
    # I am Jack's crufty code
    $thisproto =~ s[(\S+) (\S+)]
                   [$1 $2];
    # Quick hack - don't do that at home:
    $thisproto =~ s/struct Parrot_Interp \*interpreter, PMC\* pmc,* *//;
    print "   $thisproto {\n";
    print "   }\n\n";
}

print "}\n";





