#ifndef PARROT_PIRC_PIRVTABLE_H_GUARD
#define PARROT_PIRC_PIRVTABLE_H_GUARD

/* predeclaration; the actual definition is left to the back-end(s) */
struct emit_data;

/* NOTE: when adding a vtable method:
 1. add it to the pirvtable structure;
 2. add an 'emit_' macro below;
 3. initialize the new method to "not_implemented", in pirvtable.c;

*/

/* vtable that contains function pointers for emit
 * routines, and a pointer to some data. The definition of the
 * 'emit_data' structure is left to each back-end separately.
 */
typedef struct pirvtable {
    struct emit_data         *data; /* keep data here */

    /* initializer and destructor */
    void (* initialize)      (struct emit_data *data);
    void (* destroy)         (struct emit_data *data);

    /* location and debug info */
    void (* source)          (struct emit_data *data, char *source);
    void (* position)        (struct emit_data *data, int pos);

    /* sub handling */
    void (* sub_start)       (struct emit_data *data);
    void (* sub_end)         (struct emit_data *data);
    void (* sub_flag)        (struct emit_data *data, int flag);
    void (* sub_flag_start)  (struct emit_data *data);
    void (* sub_flag_end)    (struct emit_data *data);
    /* parameter handling */
    void (* param_start)     (struct emit_data *data);
    void (* param_end)       (struct emit_data *data);
    void (* type)            (struct emit_data *data, char *type);
    void (* name)            (struct emit_data *data, char *name);

    /* statement handling */
    void (* stmts_start)     (struct emit_data *data);
    void (* stmts_end)       (struct emit_data *data);

    /* ops handling */
    void (* op_start)        (struct emit_data *data, char *op);
    void (* op_end)          (struct emit_data *data);
    void (* expression)      (struct emit_data *data, char *expr);

    /* general list handling */
    void (* list_start)      (struct emit_data *data);
    void (* list_end)        (struct emit_data *data);

    /* invocation of subs and methods */
    void (* method_name)     (struct emit_data *data, char *name);
    void (* invocant)        (struct emit_data *data, char *invocant);
    void (* args_start)      (struct emit_data *data);
    void (* args_end)        (struct emit_data *data);
    void (* target)          (struct emit_data *data, char *target);
    void (* invokable)       (struct emit_data *data, char *invokable);
    void (* invocation_start)(struct emit_data *data);
    void (* invocation_end)  (struct emit_data *data);

    /* assignments */
    void (* assign_start)    (struct emit_data *data);
    void (* assign)          (struct emit_data *data);
    void (* assign_end)      (struct emit_data *data);

    void (* binary_op)       (struct emit_data *data, char *op);
    void (* comparison_op)   (struct emit_data *data, char *op);

    /* function results */
    void (* results_start)   (struct emit_data *data);
    void (* results_end)     (struct emit_data *data);

    /* finalizer (not destructor, that only should be called to free resources */
    void (* end)             (struct emit_data *data);


} pirvtable;

/* #defines for cleaner invocation syntax */
#  define emit_init(P)             (*P->vtable->initialize)       (P->vtable->data)
#  define emit_destroy(P)          (*P->vtable->destroy)          (P->vtable->data)

#  define emit_source(P,S)         (*P->vtable->source)           (P->vtable->data, S)
#  define emit_position(P,L)       (*P->vtable->position)         (P->vtable->data, L)

#  define emit_sub_start(P)        (*P->vtable->sub_start)        (P->vtable->data)
#  define emit_sub_end(P)          (*P->vtable->sub_end)          (P->vtable->data)
#  define emit_sub_flag(P,F)       (*p->vtable->sub_flag)         (P->vtable->data, F)
#  define emit_sub_flag_start(P)   (*P->vtable->sub_flag_start)   (P->vtable->data)
#  define emit_sub_flag_end(P)     (*P->vtable->sub_flag_end)     (P->vtable->data)
#  define emit_param_start(P)      (*P->vtable->param_start)      (P->vtable->data)
#  define emit_param_end(P)        (*P->vtable->param_end)        (P->vtable->data)
#  define emit_type(P,T)           (*P->vtable->type)             (P->vtable->data, T)
#  define emit_name(P,N)           (*P->vtable->name)             (P->vtable->data, N)

#  define emit_stmts_start(P)      (*P->vtable->stmts_start)      (P->vtable->data)
#  define emit_stmts_end(P)        (*P->vtable->stmts_end)        (P->vtable->data)
#  define emit_end(P)              (*P->vtable->end)              (P->vtable->data)

#  define emit_op_start(P,O)       (*P->vtable->op_start)         (P->vtable->data, O)
#  define emit_op_end(P)           (*P->vtable->op_end)           (P->vtable->data)
#  define emit_expr(P,E)           (*P->vtable->expression)       (P->vtable->data, E)

#  define emit_list_start(P)       (*P->vtable->list_start)       (P->vtable->data)
#  define emit_list_end(P)         (*P->vtable->list_end)         (P->vtable->data)

#  define emit_method_name(P,N)    (*P->vtable->method_name)      (P->vtable->data, N)
#  define emit_invocant(P,N)       (*P->vtable->invocant)         (P->vtable->data, N)
#  define emit_args_start(P)       (*P->vtable->args_start)       (P->vtable->data)
#  define emit_args_end(P)         (*P->vtable->args_end)         (P->vtable->data)
#  define emit_target(P,T)         (*P->vtable->target)           (P->vtable->data, T)
#  define emit_invokable(P,S)      (*P->vtable->invokable)        (P->vtable->data, S)
#  define emit_invocation_start(P) (*P->vtable->invocation_start) (P->vtable->data)
#  define emit_invocation_end(P)   (*P->vtable->invocation_end)   (P->vtable->data)

#  define emit_assign_start(P)     (*P->vtable->assign_start)     (P->vtable->data)
#  define emit_assign_end(P)       (*P->vtable->assign_end)       (P->vtable->data)
#  define emit_assign(P)           (*P->vtable->assign)           (P->vtable->data)

#  define emit_results_start(P)    (*P->vtable->results_start)    (P->vtable->data)
#  define emit_results_end(P)      (*P->vtable->results_end)      (P->vtable->data)

#  define emit_comparison_op(P,O)  (*P->vtable->comparison_op)    (P->vtable->data, O)
#  define emit_binary_op(P,O)      (*P->vtable->binary_op)        (P->vtable->data, O)

/* constructor */
extern pirvtable *new_pirvtable(void);

/* destructor */
extern void destroy_pirvtable(pirvtable *vtable);


#endif /* PARROT_PIRC_PIRVTABLE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
