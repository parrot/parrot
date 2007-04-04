#ifndef __VTABLE_H
#  define __VTABLE_H

struct parser_state;

struct emit_data;

/* vtable that contains function pointers for emit
 * routines, and a pointer to some data. The definition of the
 * 'emit_data' structure is left to each back-end separately.
 */
typedef struct pirvtable {
    struct emit_data        *data;
    void (* initialize)     (struct emit_data *);
    void (* destroy)        (struct emit_data *);
    void (* sub_start)      (struct emit_data *, char *source, int pos);
    void (* sub_end)        (struct emit_data *);
    void (* name)           (struct emit_data *, char *name);
    void (* stmts_start)    (struct emit_data *);
    void (* stmts_end)      (struct emit_data *);
    void (* end)            (struct emit_data *);
    void (* param_start)    (struct emit_data *);
    void (* param_end)      (struct emit_data *);
    void (* type)           (struct emit_data *, char *type);
    void (* sub_flag)       (struct emit_data *, int flag);
    void (* op_start)       (struct emit_data *, char *op);
    void (* op_end)         (struct emit_data *);
    void (* expression)     (struct emit_data *, char *expr);
    void (* next_expr)      (struct emit_data *);
    void (* list_start)     (struct emit_data *);
    void (* list_end)       (struct emit_data *);
    void (* sub_flag_start) (struct emit_data *);
    void (* sub_flag_end)   (struct emit_data *);


} pirvtable;

/* #defines for cleaner invocation syntax */
#  define emit_init(P)             (*P->vtable->initialize)    (P->vtable->data)
#  define emit_destroy(P)          (*P->vtable->destroy)       (P->vtable->data)
#  define emit_sub_start(P,S,L)    (*P->vtable->sub_start)     (P->vtable->data, S,L)
#  define emit_sub_end(P)          (*P->vtable->sub_end)       (P->vtable->data)
#  define emit_name(P,N)           (*P->vtable->name)          (P->vtable->data, N)
#  define emit_stmts_start(P)      (*P->vtable->stmts_start)   (P->vtable->data)
#  define emit_stmts_end(P)        (*P->vtable->stmts_end)     (P->vtable->data)
#  define emit_end(P)              (*P->vtable->end)           (P->vtable->data)
#  define emit_param_start(P)      (*P->vtable->param_start)   (P->vtable->data)
#  define emit_param_end(P)        (*P->vtable->param_end)     (P->vtable->data)
#  define emit_type(P,T)           (*P->vtable->type)          (P->vtable->data, T)
#  define emit_sub_flag(P,F)       (*p->vtable->sub_flag)      (P->vtable->data, F)
#  define emit_sub_flag_start(P)   (*P->vtable->sub_flag_start)(P->vtable->data)
#  define emit_sub_flag_end(P)     (*P->vtable->sub_flag_end)  (P->vtable->data)
#  define emit_op_start(P,O)       (*P->vtable->op_start)      (P->vtable->data, O)
#  define emit_op_end(P)           (*P->vtable->op_end)        (P->vtable->data)
#  define emit_expr(P,E)           (*P->vtable->expression)    (P->vtable->data, E)
#  define emit_next_expr(P)        (*P->vtable->next_expr)     (P->vtable->data)
#  define emit_list_start(P)       (*P->vtable->list_start)    (P->vtable->data)
#  define emit_list_end(P)         (*P->vtable->list_end)      (P->vtable->data)

extern pirvtable *new_pirvtable(void);

extern void destroy_pirvtable(pirvtable *vtable);


#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
