/*
** jit.h
**
** $Id$
*/

#ifndef JIT_H_GUARD
#define JIT_H_GUARD

typedef void (*jit_f)(struct Parrot_Interp *);

jit_f build_asm(struct Parrot_Interp *,
                opcode_t *,
                opcode_t *,
                opcode_t *);

/* Platform generic fixup information */
typedef struct Parrot_jit_fixup_t {
    int type;
    ptrdiff_t native_offset;    /* Where to apply fixup */
    union { 
        opcode_t opcode;
        void (*fptr)(void);
    } param;                    /* Fixup specific data */

    struct Parrot_jit_fixup_t *next;
} Parrot_jit_fixup;

/* Hold native code offsets/addresses */
typedef union {
    void *ptr;           /* Pointer to native code */
    ptrdiff_t offset;    /* Offset of native code from arena_start */
} Parrot_jit_opmap;

enum {
    JIT_BRANCH_NO,      /* The opcode doesn't branch */
    JIT_BRANCH_TARGET,  /* The opcode is a branch target */
    JIT_BRANCH_SOURCE   /* The opcode is a branch source */
};

typedef int Parrot_jit_register_count_t;

/* Hold information about which Parrot register is mapped to a 
** hardware register, whether we need to add some instructions before
** or after the opcode.
**/

typedef struct Parrot_jit_optimizer_section *Parrot_jit_optimizer_section_ptr;

typedef struct Parrot_jit_optimizer_section {
    opcode_t begin;
    opcode_t end;
    Parrot_jit_register_count_t int_reg_count[NUM_REGISTERS];
    Parrot_jit_optimizer_section_ptr prev;
    Parrot_jit_optimizer_section_ptr next;
    int jit_op_count; /* Number of jitted ops */
} Parrot_jit_optimizer_section_t;

typedef struct {
    Parrot_jit_optimizer_section_t *sections;
    char has_unpredictable_jumps;
} Parrot_jit_optimizer_t; 

typedef struct {
    opcode_t *cur_op;
    opcode_t op_i;
    Parrot_jit_opmap *op_map;    /* Maps opcode offsets to native code */
    UINTVAL map_size;
    char *native_ptr;        /* Current pointer to native code */
    char *arena_start;       /* Start of current native code segment */
    ptrdiff_t arena_size;    /* in bytes */
    Parrot_jit_fixup *fixups;   /* List of fixupes */
    Parrot_jit_optimizer_t *optimizer; /* Optimizer information */
} Parrot_jit_info;

#define Parrot_jit_fixup_target(jit_info, fixup) \
    ((jit_info)->arena_start + (fixup)->native_offset)

typedef void (*jit_fn_t)(Parrot_jit_info *jit_info, 
                         struct Parrot_Interp * interpreter);

typedef struct {
    jit_fn_t fn;
    int nargop;
    char extcall;
} jit_fn_info_t; 

extern jit_fn_info_t op_jit[];

void Parrot_jit_newfixup(Parrot_jit_info *jit_info);

void Parrot_jit_begin(Parrot_jit_info *jit_info, 
                      struct Parrot_Interp * interpreter);
void Parrot_jit_dofixup(Parrot_jit_info *jit_info, 
                        struct Parrot_Interp * interpreter);
void Parrot_jit_cpcf_op(Parrot_jit_info *jit_info, 
                        struct Parrot_Interp * interpreter);
void Parrot_jit_normal_op(Parrot_jit_info *jit_info, 
                          struct Parrot_Interp * interpreter);

Parrot_jit_optimizer_t *
optimize_jit(struct Parrot_Interp *, 
             opcode_t *, 
             opcode_t *, 
             opcode_t *);

#endif /* JIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
