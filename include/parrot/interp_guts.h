/*
** interp_guts.h
*/

#ifndef INTERP_GUTS_H
#define INTERP_GUTS_H

#define DO_OP(PC,INTERP) PC = ((INTERP->opcode_funcs)[*PC])(PC,INTERP);

#define DO_OP_PREDEREF(PC,PC_PDR,INTERP) \
  if (*PC_PDR == 0) *PC_PDR = prederef(PC, PC_PDR, INTERP); \
  PC_PDR = ((prederef_op_func_t)*PC_PDR)(PC_PDR, INTERP);

#endif /* INTERP_GUTS_H */

