#if !defined(PARROT_AST_H_GUARD)
#define PARROT_AST_H_GUARD

#include "astparser.h"

typedef enum {
    UNK_CTX
} context_type;

YYLTYPE noloc;

typedef struct nodeType_t* (*node_opt_t)    (struct nodeType_t*);
typedef struct nodeType_t* (*node_expand_t) (struct nodeType_t*);
typedef struct nodeType_t* (*node_create_t) (int, struct nodeType_t*,
					       struct nodeType_t*);
typedef void               (*node_dump_t)   (struct nodeType_t*, int level);
typedef context_type       (*node_context_t)(struct nodeType_t*, context_type);

struct _SymReg;

typedef struct nodeType_t {
    node_expand_t expand;
    node_opt_t    opt;
    node_dump_t   dump;
    node_context_t context;
    context_type up_ctx;	/* ctx coming from upper */
    context_type ctx;
    const char* d;
    struct nodeType_t *up;
    struct nodeType_t *next;
    YYLTYPE loc;
    union {
	    struct _SymReg *r;
	    struct nodeType_t *child;
    } u;
} nodeType;

#define NODE0(p) (p)->u.child
#define NODE1(p) (p)->u.child->u.child

#ifdef AST_TEST
enum VARTYPE {		/* variable type can be */
    VTCONST 	= 1 << 0,	/* constant */
    VTREG	= 1 << 1,	/* register */
    VT_UNICODE  = 1 << 16       /* unicode string constant */
};

typedef struct _SymReg {
    char * name;
    enum VARTYPE type;       /* Variable type */
    int set;                /* Which register set/file it belongs to */
    struct _SymReg * next;   /* used in the symbols hash */
} SymReg;
SymReg * mk_const(char * name, int t);
SymReg * mk_symreg(char * name, int t);

#endif

nodeType * IMCC_new_const_node(char *name, int set, YYLTYPE *loc);
nodeType * IMCC_new_node(int nr, nodeType *child, YYLTYPE *loc);
nodeType * IMCC_append_node(nodeType *head, nodeType *tail, YYLTYPE *loc);

void dump_nodes(nodeType *);

int find_node_type(const char *name);


#endif /* PARROT_AST_H_GUARD */
