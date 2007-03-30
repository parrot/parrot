#ifndef __VTABLE_H
#  define __VTABLE_H

struct parser_state;

/* vtable that contains function pointers for emit
 * routines.
 */
typedef struct pirvtable {

	void (* sub_start)(struct parser_state *p);
	void (* sub_end)  (struct parser_state *p);
	void (* name)     (struct parser_state *p, char *name);

} pirvtable;



/* #defines for cleaner invocation syntax */
#  define emit_sub_start(P)    (*P->vtable->sub_start)(P)
#  define emit_sub_end(P)      (*P->vtable->sub_end)  (P)
#  define emit_name(P,N)       (*P->vtable->name)   (P,N)




#endif



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
