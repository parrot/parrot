/* runcore_profiling.h
 *  Copyright (C) 2001-2012, Parrot Foundation.
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_PROFILING_H_GUARD
#define PARROT_RUNCORE_PROFILING_H_GUARD

struct         profiling_runcore_t;
typedef struct profiling_runcore_t Parrot_profiling_runcore_t;

#include "parrot/parrot.h"
#include "parrot/op.h"
#include "parrot/runcore_api.h"

/* make a #define that will hold an INTVAL and a pointer */
#if PTR_SIZE == INTVAL_SIZE
#  define PPROF_DATA INTVAL
#else
#  define PPROF_DATA HUGEINTVAL
#endif

typedef enum Parrot_profiling_flags {
    PROFILING_EXIT_CHECK_FLAG         = 1 << 0,
    PROFILING_FIRST_LOOP_FLAG         = 1 << 1,
    PROFILING_HAVE_PRINTED_CLI_FLAG   = 1 << 2,
    PROFILING_REPORT_ANNOTATIONS_FLAG = 1 << 3,
    PROFILING_CANONICAL_OUTPUT_FLAG   = 1 << 4
} Parrot_profiling_flags;

typedef enum Parrot_profiling_line {
    PPROF_LINE_CONTEXT_SWITCH,
    PPROF_LINE_OP,
    PPROF_LINE_ANNOTATION,
    PPROF_LINE_VERSION,
    PPROF_LINE_CLI,
    PPROF_LINE_END_OF_RUNLOOP
} Parrot_profiling_line;

typedef void (*profiling_store_fn)  (PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t*), ARGIN(PPROF_DATA*), ARGIN_NULLOK(Parrot_profiling_line));
typedef void (*profiling_init_fn)   (PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t*));
typedef void (*profiling_destroy_fn)(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t*));

#define RUNCORE_init(i, r)        ((r)->output.init    ? (r)->output.init((i), (r))            : (void)NULL)
#define RUNCORE_store(i, r, d, l) ((r)->output.store   ? (r)->output.store((i), (r), (d), (l)) : (void)NULL)
#define RUNCORE_destroy(i, r)     ((r)->output.destroy ? (r)->output.destroy((i), (r))         : (void)NULL)

typedef enum Parrot_profiling_datatype {

    /* context switch */
    PPROF_DATA_NAMESPACE = 0,
    PPROF_DATA_FILENAME  = 1,
    PPROF_DATA_SUB_ADDR  = 2,
    PPROF_DATA_CTX_ADDR  = 3,

    /* op */
    PPROF_DATA_LINE   = 0,
    PPROF_DATA_TIME   = 1,
    PPROF_DATA_OPNAME = 2,

    /* annotation */
    PPROF_DATA_ANNOTATION_NAME  = 0,
    PPROF_DATA_ANNOTATION_VALUE = 1,

    PPROF_DATA_VERSION = 0,

    PPROF_DATA_CLI = 0,

    PPROF_DATA_MAX = 3
} Parrot_profiling_datatype;

typedef struct profiling_output_t {
    profiling_init_fn    init;
    profiling_store_fn   store;
    profiling_destroy_fn destroy;
} Parrot_profiling_output;

struct profiling_runcore_t {
    STRING                      *name;
    int                          id;
    oplib_init_f                 opinit;
    Parrot_runcore_runops_fn_t   runops;
    Parrot_runcore_destroy_fn_t  destroy;
    Parrot_runcore_prepare_fn_t  prepare_run;
    INTVAL                       flags;

    /* end of common members */
    Parrot_profiling_output output;
    UHUGEINTVAL     runcore_start;
    UHUGEINTVAL     op_start;
    UHUGEINTVAL     op_finish;
    UHUGEINTVAL     runcore_finish;
    INTVAL          profiling_flags;
    INTVAL          runloop_count;
    FILE           *profile_fd;
    STRING         *profile_filename;
    PMC            *prev_sub;
    Parrot_Context *prev_ctx;
    UINTVAL         time_size;  /* how big is the following array */
    UHUGEINTVAL    *time;       /* time spent between DO_OP and start/end of a runcore */
    Hash           *line_cache; /* hash for caching pc -> line mapping */
};

#define Profiling_flag_SET(runcore, flag) \
    ((runcore)->profiling_flags |= flag)
#define Profiling_flag_TEST(runcore, flag) \
    ((runcore)->profiling_flags & flag)
#define Profiling_flag_CLEAR(runcore, flag) \
    ((runcore)->profiling_flags &= ~(flag))

#define Profiling_exit_check_TEST(o) \
    Profiling_flag_TEST(o, PROFILING_EXIT_CHECK_FLAG)
#define Profiling_exit_check_SET(o) \
    Profiling_flag_SET(o, PROFILING_EXIT_CHECK_FLAG)
#define Profiling_exit_check_CLEAR(o) \
    Profiling_flag_CLEAR(o, PROFILING_EXIT_CHECK_FLAG)

#define Profiling_first_loop_TEST(o) \
    Profiling_flag_TEST(o, PROFILING_FIRST_LOOP_FLAG)
#define Profiling_first_loop_SET(o) \
    Profiling_flag_SET(o, PROFILING_FIRST_LOOP_FLAG)
#define Profiling_first_loop_CLEAR(o) \
    Profiling_flag_CLEAR(o, PROFILING_FIRST_LOOP_FLAG)

#define Profiling_have_printed_cli_TEST(o) \
    Profiling_flag_TEST(o, PROFILING_HAVE_PRINTED_CLI_FLAG)
#define Profiling_have_printed_cli_SET(o) \
    Profiling_flag_SET(o, PROFILING_HAVE_PRINTED_CLI_FLAG)
#define Profiling_have_printed_cli_CLEAR(o) \
    Profiling_flag_CLEAR(o, PROFILING_HAVE_PRINTED_CLI_FLAG)

#define Profiling_report_annotations_TEST(o) \
    Profiling_flag_TEST(o, PROFILING_REPORT_ANNOTATIONS_FLAG)
#define Profiling_report_annotations_SET(o) \
    Profiling_flag_SET(o, PROFILING_REPORT_ANNOTATIONS_FLAG)
#define Profiling_report_annotations_CLEAR(o) \
    Profiling_flag_CLEAR(o, PROFILING_REPORT_ANNOTATIONS_FLAG)

#define Profiling_canonical_output_TEST(o) \
    Profiling_flag_TEST(o, PROFILING_CANONICAL_OUTPUT_FLAG)
#define Profiling_canonical_output_SET(o) \
    Profiling_flag_SET(o, PROFILING_CANONICAL_OUTPUT_FLAG)
#define Profiling_canonical_output_CLEAR(o) \
    Profiling_flag_CLEAR(o, PROFILING_CANONICAL_OUTPUT_FLAG)

/* HEADERIZER BEGIN: src/runcore/profiling.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_runcore_profiling_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_runcore_profiling_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/profiling.c */

#endif /* PARROT_RUNCORE_PROFILING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
