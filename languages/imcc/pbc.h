#ifndef __PBC_H
#define __PBC_H

int e_pbc_open(void *);
int e_pbc_emit(void *, Instruction * ins);
int e_pbc_close(void *);
void fixup_bsrs(struct Parrot_Interp *interpreter);

#endif
