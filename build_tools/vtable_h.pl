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

typedef void* (*vtable_func_t)();

struct _vtable {
  struct PACKAGE *package;
  INTVAL base_type;
  INTVAL int_type;
  INTVAL float_type;
  INTVAL num_type;
  INTVAL string_type;
  vtable_func_t vtable_funcs[VTABLE_SIZE];
};

EOF

print OUT vtbl_enum(%vtable);
print OUT "\n";

print OUT "\n#endif\n";

