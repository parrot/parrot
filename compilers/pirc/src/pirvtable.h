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
	void (* param_start) (struct parser_state *p);
	void (* param_end)   (struct parser_state *p);
	void (* type)        (struct parser_state *p, char *type);
	void (* sub_flag)    (struct parser_state *p, int flag);
	void (* sub_flag_arg)(struct parser_state *p, int flag, char *arg);
	void (* op_start)    (struct parser_state *p, char *op);
	void (* op_end)    (struct parser_state *p);
	void (* expression)  (struct parser_state *p, char *expr);
	void (* next_expr)   (struct parser_state *p);


} pirvtable;



/* #defines for cleaner invocation syntax */
#  define emit_init(P)              (*P->vtable->initialize)  (P)
#  define emit_sub_start(P,S,L)     (*P->vtable->sub_start)   (P,S,L)
#  define emit_sub_end(P)      		(*P->vtable->sub_end)     (P)
#  define emit_name(P,N)       		(*P->vtable->name)        (P,N)
#  define emit_stmts_start(P)       (*P->vtable->stmts_start) (P)
#  define emit_stmts_end(P)         (*P->vtable->stmts_end)   (P)
#  define emit_end(P)               (*P->vtable->end)         (P)
#  define emit_param_start(P)       (*P->vtable->param_start) (P)
#  define emit_param_end(P)         (*P->vtable->param_end)   (P)
#  define emit_type(P,T)            (*P->vtable->type)        (P,T)
#  define emit_sub_flag(P,F)        (*P->vtable->sub_flag)    (P,F)
#  define emit_sub_flag_arg(P,F,A)  (*P->vtable->sub_flag_arg)(P,F,A)
#  define emit_op_start(P,O)        (*P->vtable->op_start)    (P,O)
#  define emit_op_end(P)            (*P->vtable->op_end)      (P)
#  define emit_expr(P,E)            (*P->vtable->expression)  (P,E)
#  define emit_next_expr(P)         (*P->vtable->next_expr)   (P)

extern pirvtable *new_pirvtable(void);


#endif



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

