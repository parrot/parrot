use Parrot::Vtable;
my %vtbl = parse_vtable("../vtable.tbl");
my $classname = shift;
die "No classname given!\n" unless $classname;

print <<EOF;
/* ${classname}class.c
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

EOF

for (vtbl_enumerate(%vtbl)) {
    my $proto = $_->[2];
    # I am Jack's crufty code
    $proto =~ s/(\S+) /$1 Parrot_${classname}_/;
    print "static $proto {\n";
    print "}\n";
}

print <<EOF;
void Parrot_${classname}_init (void) {
    Parrot_base_vtables[enum_class_$classname] = (struct _vtable) {
        NULL,
        enum_class_$classname,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */

EOF
    
for (vtbl_enumerate(%vtbl)) {
    print "\t\tParrot_${classname}_$_->[1],\n";
}
print "\t};\n";
print "}\n";

