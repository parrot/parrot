/*
** interp_guts.h
*/

#if !defined(PARROT_INTERP_GUTS_H_GUARD)
#  define PARROT_INTERP_GUTS_H_GUARD

#  define DO_OP(PC,INTERP) (PC = ((INTERP->op_func_table)[*PC])(PC,INTERP))

#endif /* PARROT_INTERP_GUTS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
