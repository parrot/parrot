#ifndef __PBC_H
#define __PBC_H

int e_pbc_open(void *);
int e_pbc_emit(void *, IMC_Unit *, Instruction * ins);
int e_pbc_new_sub(void *, IMC_Unit *);
int e_pbc_close(void *);
void fixup_bsrs(struct Parrot_Interp *interpreter);
void allocate_jit(struct Parrot_Interp *interpreter, IMC_Unit *);
opcode_t * make_jit_info(struct Parrot_Interp *interpreter, IMC_Unit *);

#endif
