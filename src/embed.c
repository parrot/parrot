/* embed.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The Parrot embedding interface.
 *  Data Structure and Algorithms:
 *     See include/parrot/embed.h and docs/embed.pod.
 *  History:
 *     Initial version by Brent Dax on 2002.1.28
 *  Notes:
 *  References:
 */


#include "parrot/parrot.h"
#include "parrot/embed.h"

static INTVAL world_inited = 0;

struct Parrot_Interp *
Parrot_new(void)
{
    /* interpreter.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(NO_FLAGS);
}

void
Parrot_init(struct Parrot_Interp *interpreter, void* stacktop)
/*                                             ^^^^^^^^^^^^^^
    XXX BD Do we really need this to be user-provided, or can
        we set up our own in embed.c:Parrot_runcode()?
*/
{
    if (!world_inited) {
        /* global_setup.c:init_world sets up some vtable stuff.
         * It must only be called once.
         */

        world_inited = 1;
        init_world(interpreter);
    }

    if (stacktop) interpreter->lo_var_ptr = stacktop;
}

void
Parrot_setflag(struct Parrot_Interp *interpreter, Parrot_Interp_flag flag,
               Parrot_Interp_flag_val value)
{
    /* These two macros (from interpreter.h) do exactly what they look like. */

    if (value) {
        Interp_flags_SET(interpreter, flag);
    }
    else {
        Interp_flags_CLEAR(interpreter, flag);
    }
}

void
Parrot_setwarnings(struct Parrot_Interp *interpreter, Parrot_warnclass wc)
{
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interpreter, wc);
}

struct PackFile *
Parrot_readbc(struct Parrot_Interp *interpreter, char *filename)
{
    off_t program_size;
    char *program_code;
    struct PackFile *pf;
    ParrotIO * io = NULL;

#ifdef HAS_HEADER_SYSSTAT
    struct stat file_stat;
#endif

#ifdef HAS_HEADER_SYSMMAN
    int fd = -1;
#endif

    if (filename == NULL || strcmp(filename, "-") == 0) {
        /* read from STDIN */
        io = PIO_STDIN(interpreter);
        /* read 1k at a time */
        program_size = 0;
    }
    else {

#ifdef HAS_HEADER_SYSSTAT
        /* if we have stat(), get the actual file size so we can read it
         * in one chunk. */
        if (stat(filename, &file_stat)) {
            PIO_eprintf(interpreter, "Parrot VM: Can't stat %s, code %i.\n", filename,
                    errno);
            return NULL;
        }

        if (!S_ISREG(file_stat.st_mode)) {
            PIO_eprintf(interpreter, "Parrot VM: %s is not a normal file.\n", filename);
            return NULL;
        }

        program_size = file_stat.st_size;

#else   /* HAS_HEADER_SYSSTAT */

        /* otherwise, we will read it 1k at a time */
        program_size = 0;

#endif  /* HAS_HEADER_SYSSTAT */

#ifndef HAS_HEADER_SYSMMAN
        io = PIO_open(interpreter, filename, "<");
        if (!io) {
            PIO_eprintf(interpreter, "Parrot VM: Can't open %s, code %i.\n", filename,
                    errno);
            return NULL;
        }

#else   /* HAS_HEADER_SYSMMAN */

        /* the file wasn't from stdin, and we have mmap available- use it */
        io = NULL;

#endif  /* HAS_HEADER_SYSMMAN */

    }

    /* if we've opened a file (or stdin) with PIO, read it in */
    if (io != NULL) {
        size_t chunk_size;
        char *cursor;
        INTVAL read_result;

        chunk_size = program_size > 0 ? program_size : 1024;
        program_code = (char *)malloc(chunk_size);
        program_size = 0;

        if (NULL == program_code) {
            /* Whoops, out of memory. */

            PIO_fprintf(interpreter, PIO_STDERR(interpreter),
                    "Parrot VM: Could not allocate buffer to read packfile from PIO.\n");

            return NULL;
        }

        cursor = (char *)program_code;

        while ((read_result =
                PIO_read(interpreter, io, cursor, chunk_size)) > 0) {
            program_size += read_result;
            chunk_size = 1024;
            program_code =
                realloc(program_code, program_size + chunk_size);

            if (NULL == program_code) {
                PIO_fprintf(interpreter, PIO_STDERR(interpreter),
                        "Parrot VM: Could not reallocate buffer while reading packfile from PIO.\n");
                return NULL;
            }

            cursor = (char *)program_code + program_size;
        }

        if (read_result < 0) {
            PIO_fprintf(interpreter, PIO_STDERR(interpreter),
                    "Parrot VM: Problem reading packfile from PIO.\n");
            return NULL;
        }
    }
    else {
        /* if we've gotten here, we opted not to use PIO to read the file.
         * use mmap */

#ifdef HAS_HEADER_SYSMMAN

        fd = open(filename, O_RDONLY | O_BINARY);
        if (!fd) {
            PIO_eprintf(interpreter, "Parrot VM: Can't open %s, code %i.\n", filename,
                    errno);
            return NULL;
        }

        program_code =
            mmap(0, program_size, PROT_READ, MAP_SHARED, fd, (off_t)0);

        if (!program_code) {
            PIO_eprintf(interpreter, "Parrot VM: Can't read file %s, code %i.\n",
                    filename, errno);
            return NULL;
        }

#else   /* HAS_HEADER_SYSMMAN */

        PIO_fprintf(interpreter, PIO_STDERR(interpreter),
                "Parrot VM: uncaught error occurred reading file or mmap not available.\n");
        return NULL;

#endif  /* HAS_HEADER_SYSMMAN */

    }

    /* Now that we have the bytecode, let's unpack it. */

    pf = PackFile_new();

    if (!PackFile_unpack
        (interpreter, pf, (opcode_t *)program_code, program_size)) {
        PIO_eprintf(interpreter, "Parrot VM: Can't unpack packfile %s.\n", filename);
        return NULL;
    }

#ifdef HAS_HEADER_SYSMMAN

    if (fd >= 0) {
        munmap(program_code, program_size);
        close(fd);
    }

#endif

    return pf;
}

void
Parrot_loadbc(struct Parrot_Interp *interpreter, struct PackFile *pf)
{
    interpreter->code = pf;
}

static void
setup_argv(struct Parrot_Interp *interpreter, int argc, char ** argv)
{
    INTVAL i;
    PMC *userargv;

    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        PIO_fprintf(interpreter, PIO_STDERR(interpreter),
                "*** Parrot VM: Setting up ARGV array in P0.  Current argc: %d ***\n",
                argc);
    }

    userargv = pmc_new(interpreter, enum_class_PerlArray);
    /* immediately anchor pmc to root set */
    interpreter->ctx.pmc_reg.registers[0] = userargv;

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  0, BUFFER_external_FLAG, 0);

        if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
            PIO_eprintf(interpreter, "\t%vd: %s\n", i, argv[i]);
        }

        userargv->vtable->push_string(interpreter, userargv, arg);
    }
}

void
Parrot_runcode(struct Parrot_Interp *interpreter, int argc, char *argv[])
{

    /* Debugging mode nonsense. */
    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        PIO_eprintf(interpreter, "*** Parrot VM: Debugging enabled. ***\n");

        if (Interp_flags_TEST(interpreter, PARROT_BOUNDS_FLAG)) {
            PIO_eprintf(interpreter, "*** Parrot VM: Bounds checking enabled. ***\n");
        }
        if (Interp_flags_TEST(interpreter, PARROT_PREDEREF_FLAG)) {
            PIO_eprintf(interpreter, "*** Parrot VM: Predereferencing enabled. ***\n");
        }
        if (Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
            PIO_eprintf(interpreter, "*** Parrot VM: JIT enabled. ***\n");
        }
        if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
            PIO_eprintf(interpreter, "*** Parrot VM: Tracing enabled. ***\n");
        }
    }

#if !defined(JIT_CAPABLE) || !JIT_CAPABLE

    /* No JIT here--make sure they didn't ask for it. */

    if (Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
        PIO_fprintf(interpreter, PIO_STDERR(interpreter),
                "Parrot VM: Platform " JIT_ARCHNAME " is not JIT-capable.\n");
        exit(1);
    }

#endif

    /* Set up @ARGS (or whatever this language calls it).
       XXX Should this be Array or PerlArray?             */

    setup_argv(interpreter, argc, argv);

    /* Let's kick the tires and light the fires--call interpreter.c:runops. */
    runops(interpreter, interpreter->code, 0);

    /*
     * If any profile information was gathered, print it out:
     */

    if (interpreter->profile != NULL) {
        UINTVAL j;
        UINTVAL op_count = 0;
        UINTVAL call_count = 0;
        FLOATVAL sum_time = 0.0;

        PIO_printf(interpreter, "\n\n");
        PIO_printf(interpreter, "                   OPERATION PROFILE                 \n\n");
        PIO_printf(interpreter, "  CODE   OP FULL NAME   CALLS  TOTAL TIME    AVG TIME\n");
        PIO_printf(interpreter, "  -----  ------------  ------  ----------  ----------\n");

        for (j = 0; j < interpreter->op_count; j++) {
            if (interpreter->profile[j].numcalls > 0) {
                op_count++;
                call_count += interpreter->profile[j].numcalls;
                sum_time += interpreter->profile[j].time;

                PIO_printf(interpreter, "  %5vu  %-12s  %6vu  %10vf  %10vf\n", j,
                       interpreter->op_info_table[j].full_name,
                       interpreter->profile[j].numcalls,
                       interpreter->profile[j].time,
                       (FLOATVAL)(interpreter->profile[j].time /
                           (FLOATVAL)interpreter->profile[j].numcalls)
                );
            }
        }

        PIO_printf(interpreter, "  -----  ------------  ------  ----------  ----------\n");
        PIO_printf(interpreter, "  %5vu  %-12s  %6vu  %10vf  %10vf\n",
            op_count,
            "",
            call_count,
            sum_time,
            (FLOATVAL)(sum_time / (FLOATVAL)call_count)
        );
    }

    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        /* Give the souls brave enough to activate debugging an earful
         * about GC. */
        PIO_eprintf(interpreter, "\
*** Parrot VM: Dumping GC info ***\n\
\tTotal memory allocated: %d\n\
\tTotal DOD runs:         %d\n\
\tTotal collector runs:   %d\n\
\tActive PMCs:            %d\n\
\tActive buffers:         %d\n\
\tTotal PMCs:             %d\n\
\tTotal buffers:          %d\n\
\tSince last collection:\n\
\t\tHeader allocations:   %d\n\
\t\tMemory allocations:   %d\n\
\n",
            interpreter->memory_allocated,
            interpreter->dod_runs,
            interpreter->collect_runs,
            interpreter->active_PMCs,
            interpreter->active_Buffers,
            interpreter->total_PMCs,
            interpreter->total_Buffers,
            interpreter->header_allocs_since_last_collect,
            interpreter->mem_allocs_since_last_collect
        );
    }
}

void
Parrot_destroy(struct Parrot_Interp *interp)
{
    /* XXX Leaks tons of memory. */
    mem_sys_free(interp);
}

/* XXX Doesn't handle arguments with spaces */
static char*
argv_join(char ** argv)
{
    char* command;
    char* p;
    int space = 0;
    int i;

    for (i = 0; argv[i]; i++)
        space += strlen(argv[i]) + 1;

    command = (char*) malloc(space == 0 ? 1 : space);
    p = command;
    for (i = 0; argv[i]; i++) {
        strcpy(p, argv[i]);
        p += strlen(argv[i]);
        *(p++) = ' ';
    }
    if (p > command) p--;
    *p = '\0';
    return command;
}

void
Parrot_debug(struct Parrot_Interp *interpreter, int argc, char ** argv)
{
    PDB_t *pdb;
    const char *command;

    pdb = (PDB_t *)mem_sys_allocate(sizeof(PDB_t));

    interpreter->pdb = pdb;
    pdb->cur_opcode = interpreter->code->byte_code;

    /* Parrot_setup_argv(interpreter, argc, argv); */
    PDB_init(interpreter, argv_join(argv));
    PDB_disassemble(interpreter,NULL);
    while (!(pdb->state & PDB_EXIT)) {
        PDB_get_command(interpreter);
        command = pdb->cur_command;
        PDB_run_command(interpreter, command);
    }
}

void
Parrot_disassemble(struct Parrot_Interp *interpreter)
{
    PDB_t *pdb;
    PDB_line_t *line;
    char *c;

    pdb = (PDB_t *)mem_sys_allocate(sizeof(PDB_t));

    interpreter->pdb = pdb;
    pdb->cur_opcode = interpreter->code->byte_code;

    PDB_disassemble(interpreter, NULL);
    line = pdb->file->line;

    while (line->next) {
        /* If it has a label print it */
        if (line->label)
            PIO_printf(interpreter, "L%li:\t", line->label->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n' && c)
            PIO_printf(interpreter, "%c", *(c++));
        PIO_printf(interpreter, "\n");
        line = line->next;
    }
    return;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
