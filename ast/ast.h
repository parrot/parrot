#if !defined(PARROT_AST_H_GUARD)
#define PARROT_AST_H_GUARD

#include "parrot/parrot.h"
#include "astparser.h"

typedef enum {
    CTX_UNK,		/* unknown context */
    CTX_INT,
    CTX_NUM,
    CTX_STR,
    CTX_PMC,
    CTX_KEY,
    CTX_BOOL,
    CTX_VOID
} context_type;

typedef struct nodeType_t* (*node_opt_t)    (struct nodeType_t*);
typedef struct nodeType_t* (*node_expand_t) (Interp*, struct nodeType_t*);
typedef struct nodeType_t* (*node_create_t) (int, struct nodeType_t*,
					       struct nodeType_t*);
typedef void               (*node_dump_t)   (struct nodeType_t*, int level);
typedef context_type       (*node_context_t)(struct nodeType_t*, context_type);

/* imcc forward declarations */
struct _SymReg;
struct _IMC_Unit;

typedef enum {
	NODE_HAS_CHILD = 1 << 0
} node_flags_enum;

typedef struct nodeType_t {
    node_expand_t expand;	/* create code for node */
    node_opt_t    opt;		/* optimize node */
    node_dump_t   dump;		/* debug dump node */
    node_context_t context;	/* TODO create register type context */
    context_type up_ctx;	/* context coming from upper node */
    context_type ctx;		/* context of this node */
    const char* description;	/* visible name of the node */
    struct nodeType_t *parent;	/* parent of node */
    struct nodeType_t *next;	/* next statement */
    struct nodeType_t *dest;	/* destination or result */
    struct _IMC_Unit *unit;	/* IMCC compilation unit to place code */
    YYLTYPE loc;		/* yacc/bison code location */
    node_flags_enum flags;	/* NODE_HAS_CHILD ... */
    union {
	struct _SymReg *r;	/* var, temp, const node */
	struct nodeType_t *child;	/* contained node */
    } u;
} nodeType;

#define CHILD(p) (p)->u.child

nodeType * IMCC_new_const_node(Interp*, char *name, int set, YYLTYPE *loc);
nodeType * IMCC_new_var_node(Interp*, char *name, int set, YYLTYPE *loc);
nodeType * IMCC_new_node(Interp*, int nr, nodeType *child, YYLTYPE *loc);
nodeType * IMCC_append_node(Interp*, nodeType *head, nodeType *tail,
		YYLTYPE *loc);
nodeType * IMCC_new_temp_node(Interp*, int set, YYLTYPE *loc);

void IMCC_dump_nodes(Interp *, nodeType *);
nodeType * IMCC_expand_nodes(Interp*, nodeType *);
void IMCC_free_nodes(Interp*, nodeType *);

int IMCC_find_node_type(const char *name);


#endif /* PARROT_AST_H_GUARD */
