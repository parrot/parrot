/*
 * exec.h
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    Exec header file.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#if EXEC_CAPABLE
#  ifndef EXEC_H_GUARD
#   define EXEC_H_GUARD

#   define OPENBSD      1
#   define FREEBSD      2
#   define NETBSD       3
#   define LINUX        4
#   define DARWIN       5

#   if EXEC_OS == OPENBSD
#     define EXEC_A_OUT
#   endif
#   if EXEC_OS == DARWIN
#     define EXEC_MACH_O
#   endif
#   if (EXEC_OS == FREEBSD) || (EXEC_OS == LINUX)
#     define EXEC_ELF
#   endif

#   ifdef EXEC_A_OUT
#    define EXEC_CALLDISP jit_info->arena.start - jit_info->native_ptr - 4
#   else
#    define EXEC_CALLDISP 0xfffffffc
#   endif

/* Symbol types */
#   define STYPE_UND   1     /* Undefined */
#   define STYPE_GCC   2     /* GCC */
#   ifdef I386
#     define STYPE_GDATA 3   /* Global data */
#     define STYPE_FUNC  4   /* Function */
#   else
#     define STYPE_GDATA 0x0F020000   /* Global data */
#     define STYPE_FUNC  0x0F010000  /* Function */
#   endif
#   define STYPE_COM   5   /* Variable */ 

/* Rellocation types */
#   define RTYPE_DATA  1   /* Data */
#   define RTYPE_COM   2   /* Variable */
#   define RTYPE_FUNC  3   /* Function */
#   define RTYPE_DATA1 4   /* 2nd. rellocation for RISC machines */

#   define FIXUP_BYTECODE  1
#   define FIXUP_OPMAP     2

typedef struct {
    int                                                 type;
    void                                               *addr;
} Parrot_exec_fixup_t;

typedef struct {
    int                                                 offset_list;
    int                                                 type;
    int                                                 value;
    const char                                         *symbol;
} Parrot_exec_symbol_t;

typedef struct {
    int                                                 offset;
    short                                               symbol_number;
    int                                                 type;
    Parrot_exec_fixup_t                                *fixup;
} Parrot_exec_rellocation_t;

typedef struct {
    char                                               *code;
    int                                                 size;
} Parrot_exec_section_t;

typedef struct {
    Parrot_exec_section_t                               text;
    Parrot_exec_section_t                               data;
    Parrot_exec_section_t                               bss;
    int                                                *data_size;
    int                                                 data_count;
    Parrot_exec_rellocation_t                          *text_rellocation_table;
    int                                                 text_rellocation_count;
    Parrot_exec_rellocation_t                          *data_rellocation_table;
    int                                                 data_rellocation_count;
    Parrot_exec_symbol_t                               *symbol_table;
    int                                                 symbol_count;
    int                                                 symbol_list_size;
    int                                                 bytecode_header_size;
} Parrot_exec_objfile_t;

void Parrot_exec(struct Parrot_Interp *interpreter, opcode_t *pc,
    opcode_t *code_start, opcode_t *code_end);
void Parrot_exec_add_text_rellocation_func(Parrot_exec_objfile_t *obj,
    char *nptr, const char *func_name);
int *Parrot_exec_add_text_rellocation_reg(Parrot_exec_objfile_t *obj,
    char *nptr, const char *var, int offset, int disp);
void Parrot_exec_add_text_rellocation(Parrot_exec_objfile_t *obj, char *nptr,
    int type, const char *symbol, int disp);
int Parrot_exec_add_symbol(Parrot_exec_objfile_t *obj, const char *symbol,
    int stype);

void Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file);

void Parrot_exec_emit_mov_mr(struct Parrot_Interp * interpreter, char *mem,
                             int reg);
void Parrot_exec_emit_mov_mr_n(struct Parrot_Interp * interpreter, char *mem,
                             int reg);
void Parrot_exec_emit_mov_rm(struct Parrot_Interp * interpreter, int reg,
                             char *mem);
void Parrot_exec_emit_mov_rm_n(struct Parrot_Interp * interpreter, int reg,
                             char *mem);
#  endif /* EXEC_H_GUARD */
#endif /* EXEC_CAPABLE */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
