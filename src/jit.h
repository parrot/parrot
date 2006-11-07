/*
 * jit.h
 *
 * $Id$
 */

#if !defined(PARROT_JIT_H_GUARD)
#define PARROT_JIT_H_GUARD

typedef void (*jit_f)(Interp *interpreter, opcode_t *pc);


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
    char                        dummy[3]; /* For alignment ??? XXX */
    union {                               /* What has to align with what? */
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
    char                                 dummy; /* For alignment ??? XXX */
    int                                  block; /* What has to align with what? */
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
    unsigned char                    dummy[3]; /* For alignment ??? XXX */
} Parrot_jit_optimizer_t;                      /* What has to align with what? */

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

typedef enum {
    JIT_CODE_FILE,
    JIT_CODE_SUB,
    JIT_CODE_SUB_REGS_ONLY,

    /* size */
    JIT_CODE_TYPES,
    /* special cases */
    JIT_CODE_RECURSIVE     = 0x10,
    JIT_CODE_SUB_REGS_ONLY_REC = JIT_CODE_SUB_REGS_ONLY|JIT_CODE_RECURSIVE
} enum_jit_code_type;

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
    enum_jit_code_type              code_type;
    int                             flags;
    const struct jit_arch_info_t    *arch_info;
    int                              n_args;
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

extern PARROT_API Parrot_jit_fn_info_t *op_jit;
extern Parrot_jit_fn_info_t op_exec[];

PARROT_API void Parrot_jit_newfixup(Parrot_jit_info_t *jit_info);

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
 * with offsets relative to the base register (obtained by
 * Parrot_jit_emit_get_base_reg_no)
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
 * interface to architecture specific details
 */
typedef void (*jit_arch_f)(Parrot_jit_info_t *, Interp *);

typedef struct {
    /*
     * begin function - emit ABI call prologue
     */
    jit_arch_f jit_begin;

    int n_mapped_I;
    int n_preserved_I;
    const char *map_I;
    int n_mapped_F;
    int n_preserved_F;
    const char *map_F;
} jit_arch_regs;

typedef void (*mov_RM_f)(Parrot_jit_info_t *,
        int cpu_reg, int base_reg, INTVAL offs);
typedef void (*mov_MR_f)(Parrot_jit_info_t *,
        int base_reg, INTVAL offs, int cpu_reg);

typedef struct jit_arch_info_t {
    /* CPU <- Parrot reg move functions */
    mov_RM_f mov_RM_i;
    mov_RM_f mov_RM_n;
    /* Parrot <- CPU reg move functions */
    mov_MR_f mov_MR_i;
    mov_MR_f mov_MR_n;

    /* fixup branches and calls after codegen */
    jit_arch_f jit_dofixup;
    /* flush caches */
    jit_arch_f jit_flush_cache;
    /* register mapping info */
    const jit_arch_regs regs[JIT_CODE_TYPES];
} jit_arch_info;

/*
 * return the jit_arch_info for the given JIT_CODE type
 */
const jit_arch_info * Parrot_jit_init(Interp *);

/*
 * interface to create JIT code
 */
Parrot_jit_info_t *
parrot_build_asm(Interp *interpreter,
                opcode_t *code_start, opcode_t *code_end,
                void *objfile, enum_jit_code_type);
/*
 * NCI interface
 */
void *Parrot_jit_build_call_func(Interp *, PMC *, String *);

#endif /* PARROT_JIT_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
