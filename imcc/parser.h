#if !defined(PARROT_IMCC_PARSER_H_GUARD)
#define PARROT_IMCC_PARSER_H_GUARD

#ifdef PARSER_MAIN
#define EXTERN
#else
#define EXTERN extern
#endif

#include "imcparser.h"


EXTERN int expect_pasm;
EXTERN int pasm_file;
EXTERN int is_def;
EXTERN int IMCC_DEBUG;
EXTERN int gc_off;
EXTERN char* output;
EXTERN int yydebug;

#define KEY_BIT(argnum) (1 << (argnum))


SymReg * macro(struct Parrot_Interp *, char *name);
int yyerror(char *);
int yyparse(void *param);
int yylex(YYSTYPE *valp, struct Parrot_Interp *);
void op_fullname(char * dest, const char * name, SymReg * args[], int, int);
void open_comp_unit(void);
void register_compilers(Parrot_Interp);
void *imcc_eval_pasm(Parrot_Interp, const char *s);
void *imcc_eval_pir (Parrot_Interp, const char *s);
int try_find_op(Parrot_Interp, IMC_Unit *, char *, SymReg **, int, int, int);
Instruction * multi_keyed(struct Parrot_Interp *interpreter, IMC_Unit *, char *name,
    SymReg ** r, int nr, int keyvec, int emit);

extern void compile_file(Interp *interp, FILE *file);

#endif /* PARROT_IMCC_PARSER_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
