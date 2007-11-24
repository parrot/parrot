/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#ifndef PARROT_PIR_PIRCOMPUNIT_H_GUARD
#define PARROT_PIR_PIRCOMPUNIT_H_GUARD

typedef enum pir_types {
    INT_TYPE,
    NUM_TYPE,
    PMC_TYPE,
    STRING_TYPE

} pir_type;

typedef enum param_flags {
    PARAM_FLAG_NAMED      = 0x001,
    PARAM_FLAG_SLURPY     = 0x002,
    PARAM_FLAG_OPTIONAL   = 0x004,
    PARAM_FLAG_OPT_FLAG   = 0x008,
    PARAM_FLAG_UNIQUE_REG = 0x010

} param_flag;


typedef enum arg_flags {
    ARG_FLAG_NAMED = 0x001,
    ARG_FLAG_FLAT  = 0x002

} arg_flag;


/* Sub flags */
typedef enum sub_flags {
    SUB_FLAG_METHOD    = 0x001,
    SUB_FLAG_INIT      = 0x002,
    SUB_FLAG_LOAD      = 0x004,
    SUB_FLAG_OUTER     = 0x008,
    SUB_FLAG_MAIN      = 0x010,
    SUB_FLAG_ANON      = 0x020,
    SUB_FLAG_POSTCOMP  = 0x040,
    SUB_FLAG_IMMEDIATE = 0x080,
    SUB_FLAG_VTABLE    = 0x100,
    SUB_FLAG_LEX       = 0x200,
    SUB_FLAG_MULTI     = 0x400

} sub_flag;

#define SET_FLAG(obj,flag)      obj |= flag
#define CLEAR_FLAG(obj,flag)    obj &= ~flag
#define TEST_FLAG(obj,flag)     obj & flag


typedef enum arg_types {
    ARG_TYPE_INT,
    ARG_TYPE_NUM,
    ARG_TYPE_STRING,
    ARG_TYPE_PMC

} arg_type;

typedef union value {
        char  *sval;
        double nval;
        int    ival;
        char  *pval;

} value;


typedef struct pir_arg {
    value    val;
    arg_type type;

} pir_arg;


typedef struct constant {
    char *name;
    int type;
    value val;

} constant;


/* a single instruction */
typedef struct pir_instr {
    char *label;
    char *instr;

} pir_instr;


typedef struct variable {
    char *name;
    int type;

} variable;

typedef struct target {
    char *name;
    char *named_flag_arg;
    int flags;

} target;





/*
#define DECLARE(type,itemtype)  typedef struct type##_block {    \
                                    itemtype[type##_BLOCK_SIZE]; \
                                    int count;                   \
                                    struct type##_block *next;   \
                                } type##_block

#define LIST(type, name)    type##_block *name


DECLARE(param, sub_param);

*/

/* a sub */
typedef struct subroutine {
    char *sub_name;
    char *outer_sub;
    char *vtable_method;
    char **multi_types;

    int flags;
/*
    LIST(param, parameters);
    LIST(instr, instructions);

    */
    struct subroutine *next;

} subroutine;

/*

#define ADD_ITEM(type,block,newitem) if (block->count == type##_BLOCK_SIZE) { \
                                   type##_block *newblock = (type##_block *)malloc(sizeof (type##_block));

                               }                                        \
                               else {                                   \
                                   block->type##_items[block->count++] = newitem; \
                               }


ADD_ITEM(param,x);

*/


/* forward declaration */
struct lexer_state;

void set_sub_outer(struct lexer_state *lexer, char *outersub);
void set_sub_vtable(struct lexer_state *lexer, char *vtablename);
void new_sub(struct lexer_state *lexer, char *subname);
void add_param(struct lexer_state *lexer, int type, char *paramname);
void set_param_named(struct lexer_state *lexer, char *alias);
void add_instr(struct lexer_state *lexer, char *label, char *instr);



#endif /* PARROT_PIR_PIRCOMPUNIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

