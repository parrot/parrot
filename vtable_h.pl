use Parrot::Vtable;

my %vtable = parse_vtable();

open OUT, ">include/parrot/vtable.h" or die $!;

print OUT <<'EOF';
/* register.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the base PMC vtable structure
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_VTABLE_H_GUARD)
#define PARROT_VTABLE_H_GUARD

#include "parrot/parrot.h"

EOF

print OUT vtbl_enum(%vtable);
print OUT "\n";
print OUT vtbl_struct(%vtable);

print OUT "\n#endif\n";

