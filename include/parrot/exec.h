/*
 * Copyright (C) 2003-2007, Parrot Foundation.
 */

/*
 * exec.h
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    Exec header file.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#ifndef PARROT_EXEC_H_GUARD
#define PARROT_EXEC_H_GUARD

#if EXEC_CAPABLE

#  ifdef PARROT_EXEC_OS_OPENBSD
#    ifdef PARROT_OPENBSD_ELF
#      define EXEC_ELF
#    else
#      define EXEC_A_OUT
#    endif
#  endif
#  ifdef PARROT_EXEC_OS_DARWIN
#    define EXEC_MACH_O
#  endif
#  if defined(PARROT_EXEC_OS_FREEBSD) || defined(PARROT_EXEC_OS_NETBSD) || defined(PARROT_EXEC_OS_LINUX)
#    define EXEC_ELF
#  endif
#  if defined(PARROT_EXEC_OS_MSWIN32) || defined(PARROT_EXEC_OS_CYGWIN)
#    define EXEC_COFF
#  endif

#  ifdef EXEC_A_OUT
#    define EXEC_CALLDISP jit_info->arena.start - jit_info->native_ptr - 4
#  elif defined(EXEC_COFF)
#    define EXEC_CALLDISP 0
#  else
#    define EXEC_CALLDISP 0xfffffffc
#  endif

/* Symbol types */
#  define STYPE_UND   1     /* Undefined */
#  define STYPE_GCC   2     /* GCC */
#  ifdef I386
#    define STYPE_GDATA 3   /* Global data */
#    define STYPE_FUNC  4   /* Function */
#  else
#    define STYPE_GDATA 0x0F020000   /* Global data */
#    define STYPE_FUNC  0x0F010000  /* Function */
#  endif
#  define STYPE_COM   5   /* Variable */

/* Rellocation types */
#  define RTYPE_DATA  1   /* Data */
#  define RTYPE_COM   2   /* Variable */
#  define RTYPE_FUNC  3   /* Function */
#  define RTYPE_DATA1 4   /* 2nd. rellocation for RISC machines */

typedef struct Parrot_exec_symbol_t {
    int                                                 offset_list;
    int                                                 type;
    int                                                 value;
    const char                                         *symbol;
} Parrot_exec_symbol_t;

typedef struct Parrot_exec_rellocation_t {
    int                                                 offset;
    short                                               symbol_number;
    int                                                 type;
} Parrot_exec_rellocation_t;

typedef struct Parrot_exec_section_t {
    char                                               *code;
    size_t                                              size;
} Parrot_exec_section_t;

typedef struct Parrot_exec_objfile_t {
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

/* HEADERIZER BEGIN: src/exec.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_exec_add_text_rellocation(
    ARGIN(Parrot_exec_objfile_t *obj),
    ARGIN(char *nptr),
    int type,
    ARGIN(const char *symbol),
    int disp)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_EXPORT
void Parrot_exec_add_text_rellocation_func(
    ARGIN(Parrot_exec_objfile_t *obj),
    ARGIN(char *nptr),
    ARGIN(const char *func_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
int * Parrot_exec_add_text_rellocation_reg(
    ARGIN(Parrot_exec_objfile_t *obj),
    ARGIN(char *nptr),
    ARGIN(const char *var),
    int offset,
    int disp)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_exec(PARROT_INTERP,
    ARGIN(opcode_t *pc),
    ARGIN(opcode_t *code_start),
    ARGIN(opcode_t *code_end))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

int Parrot_exec_add_symbol(
    ARGMOD(Parrot_exec_objfile_t *obj),
    ARGIN(const char *symbol),
    int stype)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

#define ASSERT_ARGS_Parrot_exec_add_text_rellocation \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(obj) \
    || PARROT_ASSERT_ARG(nptr) \
    || PARROT_ASSERT_ARG(symbol)
#define ASSERT_ARGS_Parrot_exec_add_text_rellocation_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(obj) \
    || PARROT_ASSERT_ARG(nptr) \
    || PARROT_ASSERT_ARG(func_name)
#define ASSERT_ARGS_Parrot_exec_add_text_rellocation_reg \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(obj) \
    || PARROT_ASSERT_ARG(nptr) \
    || PARROT_ASSERT_ARG(var)
#define ASSERT_ARGS_Parrot_exec __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc) \
    || PARROT_ASSERT_ARG(code_start) \
    || PARROT_ASSERT_ARG(code_end)
#define ASSERT_ARGS_Parrot_exec_add_symbol __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(obj) \
    || PARROT_ASSERT_ARG(symbol)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/exec.c */

#endif /* EXEC_CAPABLE */

#endif /* PARROT_EXEC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
