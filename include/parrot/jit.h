/*
 * jit.h
 *
 * $Id$
 */

#if !defined(PARROT_JIT_H_GUARD)
#define PARROT_JIT_H_GUARD

typedef void (*jit_f)(Interp *interpreter, opcode_t *pc);

jit_f build_asm(Interp *interpreter, opcode_t *pc,
                opcode_t *code_start, opcode_t *code_end,
                void *objfile);

void Parrot_destroy_jit(void *);

/*  Parrot_jit_fixup_t
 *      Platform generic fixup information
 *
 *  type:           The type of fixup.
 *  native_offset:  Where to apply the fixup.
 *  skip:           Skip instructions after the target.
 *  param:          Fixup specific data.
 */

typedef struct Parrot_jit_fixup *Parrot_jit_fixup_ptr;

typedef struct Parrot_jit_fixup {
    int                         type;
    ptrdiff_t                   native_offset;
    char                        skip;
    char                        dummy[3]; /* For alignment */
    union {
        opcode_t                opcode;
        void                    (*fptr)(void);
    } param;

    Parrot_jit_fixup_ptr        next;
} Parrot_jit_fixup_t;

/*  Parrot_jit_opmap_t
 *      Hold native code offsets/addresses
 *
 *  ptr:    Pointer to native code
 *  offset: Offset of native code from arena.start
 */

typedef union {
    void *ptr;
    ptrdiff_t offset;
} Parrot_jit_opmap_t;

enum {
    JIT_BRANCH_NO,      /* The opcode doesn't branch */
    JIT_BRANCH_TARGET,  /* The opcode is a branch target */
    JIT_BRANCH_SOURCE   /* The opcode is a branch source */
};


/*  Parrot_jit_arena_t
 *      Holds pointers to the native code of one or more sections.
 *
 *  start:          Start of current native code segment.
 *  size:           The size of the arena in bytes
 *  op_map:         Maps opcode offsets to native code.
 *  map_size:       The size of the map in bytes.
 *  fixups:         List of fixupes.
 */

typedef struct {
    char                            *start;
    ptrdiff_t                        size;
    Parrot_jit_opmap_t              *op_map;
    unsigned long                    map_size;
    Parrot_jit_fixup_t              *fixups;
} Parrot_jit_arena_t;

/*  Parrot_jit_optimizer_section_t
 *      The bytecode will be divided in sections depending on the
 *      program structure.
 *
 *  begin:              Points where sections begins in the bytecode.
 *  end:                Points where sections ends in the bytecode.
 *  arena:              The first arena for this section, or NULL if the
 *                      section is in the arena inlined in jit_info.
 *  ru[4]:              register_usage_t per [IPSN]
 *  maps:               Total maps done.
 *  jit_op_count:       How many opcodes are jitted.
 *  op_count:           Opcodes in this section.
 *  load_size:          The size of the register load instructions to be
 *                      skipped in an in-section branch.
 *  isjit:              If this section is a jitted one or not.
 *  block:              block number of section
 *  branch_target:      The section where execution continues if this section
 *                      ends at a branch source the targeted section is used.
 */

typedef struct Parrot_jit_optimizer_section *Parrot_jit_optimizer_section_ptr;

/*  reg_count:      An array with one position for each register
 *                  holding the number of times each register is used in the
 *                  section.
 *  reg_usage:      An array with the registers sorted by the usage.
 *  reg_dir:        If the register needs to be loaded or saved.
 *  registers_used: count of used registers
 */
typedef struct {
    int                                 reg_count[NUM_REGISTERS];
    unsigned int                        reg_usage[NUM_REGISTERS];
    char                                reg_dir[NUM_REGISTERS];
    int                        registers_used;
} Parrot_jit_register_usage_t;

typedef struct Parrot_jit_optimizer_section {
    opcode_t                            *begin;
    opcode_t                            *end;
    Parrot_jit_register_usage_t          ru[4];
    Parrot_jit_arena_t                  *arena;
    unsigned int                         maps;
    unsigned int                         jit_op_count;
    unsigned int                         op_count;
    ptrdiff_t                            load_size;
    char                                 isjit;
    char                                 done;
    char                                 ins_count;
    char                                 dummy; /* For alignment */
    int                                  block;
    Parrot_jit_optimizer_section_ptr     branch_target;
    Parrot_jit_optimizer_section_ptr     prev;
    Parrot_jit_optimizer_section_ptr     next;
} Parrot_jit_optimizer_section_t;

/*  Parrot_jit_optimizer_section_t
 *      All the information related to optimizing the bytecode.
 *
 *  sections:               A pointer to the first section.
 *  cur_section:            Pointer to the current section.
 *  map_branch:             A pointer to an array with the size of the bytecode
 *                          where the positions of the opcodes will have a value
 *                          indicating if the opcode is a branch target, source
 *                          or isn't related with a control flow opcode at all,
 *                          and which register was allocated for each opcode
 *                          argument if any.
 *  has_unpredictable_jump: XXX need to define how to handle this.
 */

typedef struct {
    Parrot_jit_optimizer_section_t  *sections;
    Parrot_jit_optimizer_section_t  *cur_section;
    char                            *map_branch;
    opcode_t                       **branch_list;
    unsigned char                    has_unpredictable_jump;
    unsigned char                    dummy[3]; /* For alignment */
} Parrot_jit_optimizer_t;

/*  Parrot_jit_constant_pool_t
 *      Constants pool information.
 *
 */
typedef struct {
    long                             frames_used;
    long                             cur_used;
    char                            *cur_const;
    INTVAL                          *slot_ptr;
} Parrot_jit_constant_pool_t;

/*  Parrot_jit_info_t
 *      All the information needed to jit the bytecode will be here.
 *
 *  prev_op:        The previous opcode in this section.
 *  cur_op:         The current opcode during the build process.
 *  op_i:           Opcode index.
 *  native_ptr:     Current pointer to native code.
 *  arena:          The arena inlined, this will be the only one used in cases
 *                  where there is a way to load an immediate.
 *  optimizer:      Optimizer information.
 *  constant_pool:  The constant pool information.
 */

typedef struct {
    opcode_t                        *prev_op;
    opcode_t                        *cur_op;
    opcode_t                         op_i;
    char                            *native_ptr;
    Parrot_jit_arena_t               arena;
    Parrot_jit_optimizer_t          *optimizer;
    Parrot_jit_constant_pool_t      *constant_pool;
    char                            *intval_map;
    char                            *floatval_map;
#  if EXEC_CAPABLE
    Parrot_exec_objfile_t           *objfile;
#  else
    void                            *objfile;
#  endif /* EXEC_CAPABLE */
} Parrot_jit_info_t;

#define Parrot_jit_fixup_target(jit_info, fixup) \
    ((jit_info)->arena.start + (fixup)->native_offset)

typedef void (*jit_fn_t)(Parrot_jit_info_t *jit_info,
                         Interp *interpreter);

/*  Parrot_jit_fn_info_t
 *      The table of opcodes.
 *
 *  jit_fn_t:       A pointer to the function that emits code for the opcode
 *                  or to the C funtion if the opcode is not jitted.
 *  extcall:        If the opcode makes an external call to a C funtion.
 *                  also used for vtable functions, extcall is #of vtable func
 */

typedef struct {
    jit_fn_t                        fn;
    int                            extcall;
} Parrot_jit_fn_info_t;

extern Parrot_jit_fn_info_t op_jit[];
extern Parrot_jit_fn_info_t op_exec[];

void Parrot_jit_newfixup(Parrot_jit_info_t *jit_info);

void Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                      Interp *interpreter);

void Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                        Interp *interpreter);

void Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                        Interp *interpreter);

void Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                          Interp *interpreter);

void Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                          Interp *interpreter);

void Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info,
                        Interp *interpreter);

void Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                          Interp *interpreter);

void Parrot_exec_restart_op(Parrot_jit_info_t *jit_info,
                          Interp *interpreter);

/*
 * interface functions for the register save/restore code
 *
 * 1) old style with memory location of the register
 */

void Parrot_jit_emit_mov_mr_n(
    Interp *interpreter, char *mem, int);
void Parrot_jit_emit_mov_mr(
    Interp *interpreter, char *mem, int);
void Parrot_jit_emit_mov_rm_n(
    Interp *interpreter, int reg, char *mem);
void Parrot_jit_emit_mov_rm(
    Interp *interpreter, int reg, char *mem);

/*
 * 2) new style with offsets relative to the base register
 *    These are used if the platform defines the macro
 *    Parrot_jit_emit_get_base_reg_no
 */
void Parrot_jit_emit_mov_mr_n_offs(
    Interp *, int base_reg, size_t offs, int src_reg);
void Parrot_jit_emit_mov_mr_offs(
    Interp *,  int base_reg, size_t offs, int src_reg);
void Parrot_jit_emit_mov_rm_n_offs(
    Interp *, int dst_reg, int base_reg, size_t offs);
void Parrot_jit_emit_mov_rm_offs(
    Interp *, int dst_reg, int base_reg, size_t offs);

/*
 * NCI interface
 */
void *Parrot_jit_build_call_func(Interp *, PMC *, String *);

#endif /* PARROT_JIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
