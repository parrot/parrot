#ifndef PARROT_TCL_BINARY_H_GUARD
#define PARROT_TCL_BINARY_H_GUARD

PMC *ParTcl_binary_scan(Interp *interp, STRING *BINSTR, STRING *FORMAT);
STRING *ParTcl_binary_format(Interp *interp, STRING *FORMAT, PMC *values);

#endif /* PARROT_TCL_BINARY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
