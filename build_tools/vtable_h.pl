use Parrot::Vtable;

my %vtable = parse_vtable();

open OUT, ">include/parrot/vtable.h" or die $!;

print OUT <<'EOF';
/*  vtable.h
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

#define VTABLE_SIZE 512

#define YOU_LOSE_VTABLE NULL

EOF

print OUT vtbl_struct(%vtable);

#print OUT vtbl_defs(%vtable);
print OUT "\n";

print OUT "\n#endif\n";

