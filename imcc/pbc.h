#ifndef __PBC_H
#define __PBC_H

int e_pbc_open(char *);
int e_pbc_emit(Instruction * ins);
int e_pbc_close();
void fixup_bsrs();

#endif
