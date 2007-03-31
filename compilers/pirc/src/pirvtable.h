#ifndef __VTABLE_H
#  define __VTABLE_H

struct parser_state;

/* vtable that contains function pointers for emit
 * routines.
 */
typedef struct pirvtable {

	void (* initialize)  (struct parser_state *p);
	void (* sub_start)   (struct parser_state *p, char *source, int pos);
	void (* sub_end)     (struct parser_state *p);
	void (* name)        (struct parser_state *p, char *name);
	void (* stmts_start) (struct parser_state *p);
	void (* stmts_end)   (struct parser_state *p);
	void (* end)         (struct parser_state *p);

} pirvtable;



/* #defines for cleaner invocation syntax */
#  define emit_init(P)              (*P->vtable->initialize) (P)
#  define emit_sub_start(P,S,L)     (*P->vtable->sub_start)  (P,S,L)
#  define emit_sub_end(P)      		(*P->vtable->sub_end)    (P)
#  define emit_name(P,N)       		(*P->vtable->name)       (P,N)
#  define emit_stmts_start(P)       (*P->vtable->stmts_start)(P)
#  define emit_stmts_end(P)         (*P->vtable->stmts_end)  (P)
#  define emit_end(P)               (*P->vtable->end)        (P)

extern pirvtable *new_pirvtable(void);


#endif



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
