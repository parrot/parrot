/*
** jit.h
*/

#ifndef JIT_H_GUARD
#define JIT_H_GUARD

#define MAX_VARIABLE 6

char *build_asm(struct Parrot_Interp *, opcode_t *, opcode_t *, opcode_t *);

typedef struct {
    int position;
    int number;
} info_t;

typedef struct {
    int amount;
    info_t info[MAX_VARIABLE];
} substitution_t;

typedef struct {
    int position;
    int number;
    int flag;
} string_info_t;

typedef struct {
    int amount;
    string_info_t info[MAX_VARIABLE];
} string_substitution_t;

typedef struct {
    char *assembly;
    int size;
    int nargop;
    /* &interpreter->xxx->register[pc[x]] */
    substitution_t intval_register_address;
    substitution_t floatval_register_address;
    string_substitution_t string_register_address;
    substitution_t pmc_r_a;
    /* pc[x] || interpreter->code->const_table->constants[pc[x]]->number || interpreter->code->const_table->constants[pc[x]]->string || ?? */
    substitution_t intval_constant_value;
    substitution_t floatval_constant_value; /* Not likely to be used */
    string_substitution_t string_constant_value;
    substitution_t pmc_c_v;
    /* &pc[x] || &interpreter->code->const_table->constants[pc[x]]->number || &interpreter->code->const_table->constants[pc[x]]->string || ?? */
    substitution_t intval_constant_address;
    substitution_t floatval_constant_address;
    string_substitution_t string_constant_address;
    substitution_t pmc_c_a;
    /* &(temporary variables) ... */
    substitution_t temporary_intval_address;
    substitution_t temporary_floatval_address;
    substitution_t temporary_string_address;
    substitution_t temporary_char_address;
    /* constants ... */
    substitution_t c_intval_v;
    substitution_t c_floatval_v; /* Not likely to be used */
    substitution_t c_string_v; /* Not likely to be used */
    substitution_t c_char_v;
    /* &constants ... */
    substitution_t c_intval_a;
    substitution_t c_floatval_a;
    substitution_t c_string_a;
    substitution_t c_char_a;
    /* where to branch */
    substitution_t fixup_v;
    substitution_t fixup_a;
    substitution_t fixup_o;
    /* this is cheating */
    substitution_t libc_c;
} opcode_assembly_t;


/* Don't ever count on any info here */

extern INTVAL temp_intval[10];
extern char temp_char[100];

extern FLOATVAL floatval_constants[1];
extern char char_constants[];


#define START "\x55\x89\xe5"
#define START_SIZE 3


#endif /* JIT_H_GUARD */

