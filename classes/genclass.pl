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

my $decls;
for (vtbl_enumerate(%vtbl)) {
    my $proto = $_->[2];
    my $howmany = $_->[3];
    for my $i (1..$howmany) {
        my $thisproto = $proto;
        # I am Jack's crufty code
        $thisproto =~ s[(\S+) (\S+)]
                       ["$1 Parrot_${classname}_$2".($howmany > 1 ? "_$i":"")]e;
        print "static $thisproto {\n";
        print "}\n\n";
    }
    if ($howmany > 1) {
        my $name = $_->[1];
        $decls .= "$_->[0] Parrot_${classname}_${name}_array[] = ";
        $decls .= "{\n";
        $decls .= "\tParrot_${classname}_${name}_$_,\n" for 1..$howmany;
        $decls .= "};\n";
    }
}

print "void Parrot_${classname}_init (void) {\n";
#print $decls;

# I am Jack's contorted attempt at portability
print <<EOF;
    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_$classname,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */

EOF
    
for (vtbl_enumerate(%vtbl)) {
    if ($_->[3] > 1) {
        print "\t\t{\n";
        my $name = $_->[1];
        print "\t\t\tParrot_${classname}_${name}_$_,\n" for 1..$_->[3];
        print "\t\t},\n";
    } else {
        print "\t\tParrot_${classname}_$_->[1],\n";
    }
}
print "\t};\n";
print "\tParrot_base_vtables[enum_class_$classname] = temp_base_vtable;\n";
print "}\n";

