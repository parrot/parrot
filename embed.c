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
    /* global_setup.c:init_world sets up some vtable stuff.
       We need it called before we make an interpreter, but 
       it must only be called once.                         */

    if (!world_inited) {
        world_inited = 1;
        init_world();
    }
    
    /* interpreter.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(NO_FLAGS);
}

void
Parrot_init(struct Parrot_Interp *interpreter, void* stacktop)
{
    /* This function currently unused, but is here in case we need it later. */

    if (!world_inited) {
        /* See comments in Parrot_new. */
        world_inited = 1;
        init_world();
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
    size_t program_size;
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
            fprintf(stderr, "Parrot VM: Can't stat %s, code %i.\n", filename,
                    errno);
            return NULL;
        }

        if (!S_ISREG(file_stat.st_mode)) {
            fprintf(stderr, "Parrot VM: %s is not a normal file.\n", filename);
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
            fprintf(stderr, "Parrot VM: Can't open %s, code %i.\n", filename,
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

            fprintf(stderr,
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
                fprintf(stderr,
                        "Parrot VM: Could not reallocate buffer while reading packfile from PIO.\n");
                return NULL;
            }

            cursor = (char *)program_code + program_size;
        }

        if (read_result < 0) {
            fprintf(stderr,
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
            fprintf(stderr, "Parrot VM: Can't open %s, code %i.\n", filename,
                    errno);
            return NULL;
        }

        program_code =
            mmap(0, program_size, PROT_READ, MAP_SHARED, fd, (off_t)0);

        if (!program_code) {
            fprintf(stderr, "Parrot VM: Can't read file %s, code %i.\n",
                    filename, errno);
            return NULL;
        }

#else   /* HAS_HEADER_SYSMMAN */

        fprintf(stderr,
                "Parrot VM: uncaught error occurred reading file or mmap not available.\n");
        return NULL;

#endif  /* HAS_HEADER_SYSMMAN */

    }

    /* Now that we have the bytecode, let's unpack it. */

    pf = PackFile_new();

    if (!PackFile_unpack
        (interpreter, pf, (opcode_t *)program_code, program_size)) {
        fprintf(stderr, "Parrot VM: Can't unpack packfile %s.\n", filename);
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

void
Parrot_runcode(struct Parrot_Interp *interpreter, int argc, char *argv[])
{
    INTVAL i;
    PMC *userargv;
    KEY key;

    /* Debugging mode nonsense. */
    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        fprintf(stderr, "*** Parrot VM: Debugging enabled. ***\n");

        if (Interp_flags_TEST(interpreter, PARROT_BOUNDS_FLAG)) {
            fprintf(stderr, "*** Parrot VM: Bounds checking enabled. ***\n");
        }
        if (Interp_flags_TEST(interpreter, PARROT_PREDEREF_FLAG)) {
            fprintf(stderr, "*** Parrot VM: Predereferencing enabled. ***\n");
        }
        if (Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
            fprintf(stderr, "*** Parrot VM: JIT enabled. ***\n");
        }
        if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
            fprintf(stderr, "*** Parrot VM: Tracing enabled. ***\n");
        }
    }

#if !defined(JIT_CAPABLE) || !JIT_CAPABLE 

    /* No JIT here--make sure they didn't ask for it. */

    if (Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
        fprintf(stderr,
                "Parrot VM: Platform " JIT_ARCHNAME " is not JIT-capable.\n");
        exit(1);
    }
    
#endif

    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        fprintf(stderr,
                "*** Parrot VM: Setting up ARGV array in P0.  Current argc: %d ***\n",
                argc);
    }
    
    /* Set up @ARGS (or whatever this language calls it).
       XXX Should this be Array or PerlArray?             */
    
    userargv = pmc_new(interpreter, enum_class_PerlArray);
    /* immediately anchor pmc to root set */
    interpreter->ctx.pmc_reg.registers[0] = userargv;

    key.atom.type = enum_key_int;
    key.next = NULL;

    userargv->vtable->set_integer_native(interpreter, userargv, (INTVAL) argc);
    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  0, BUFFER_external_FLAG, 0);

        if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
            fprintf(stderr, "\t" INTVAL_FMT ": %s\n", i, argv[i]);
        }

        key.atom.val.int_val = i;
        userargv->vtable->set_string_keyed(interpreter, userargv, &key, arg);
    }
    
    /* Let's kick the tires and light the fires--call interpreter.c:runops. */
    runops(interpreter, interpreter->code, 0);

    /*
     * If any profile information was gathered, print it out:
     */

    if (interpreter->profile != NULL) {
        unsigned int j;
        int op_count = 0;
        int call_count = 0;
        FLOATVAL sum_time = 0.0;

        printf("\n\n");
        printf("                   OPERATION PROFILE                 \n\n");
        printf("  CODE   OP FULL NAME   CALLS  TOTAL TIME    AVG TIME\n");
        printf("  -----  ------------  ------  ----------  ----------\n");

        for (j = 0; j < interpreter->op_count; j++) {
            if (interpreter->profile[j].numcalls > 0) {
                op_count++;
                call_count += interpreter->profile[j].numcalls;
                sum_time += interpreter->profile[j].time;

                printf("  %5u  %-12s  %6ld  %10f  %10f\n", j, 
                       interpreter->op_info_table[j].full_name,
                       interpreter->profile[j].numcalls,
                       interpreter->profile[j].time,
                       interpreter->profile[j].time / 
                           (FLOATVAL)interpreter->profile[j].numcalls
                );
            }
        }

        printf("  -----  ------------  ------  ----------  ----------\n");
        printf("  %5d  %-12s  %6d  %10f  %10f\n", 
            op_count,
            "",
            call_count,
            sum_time,
            sum_time / (FLOATVAL)call_count
        );
    }

    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        /* Give the souls brave enough to activate debugging an earful 
         * about GC. */
        fprintf(stderr, "\
*** Parrot VM: Dumping GC info ***\n\
\tTotal memory allocated: %u\n\
\tTotal DOD runs:         %u\n\
\tTotal collector runs:   %u\n\
\tActive PMCs:            %u\n\
\tActive buffers:         %u\n\
\tTotal PMCs:             %u\n\
\tTotal buffers:          %u\n\
\tSince last collection:\n\
\t\tHeader allocations: %u\n\
\t\tMemory allocations: %u\n\
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
    free(interp);
}

void
Parrot_debug(struct Parrot_Interp *interpreter)
{
    PDB_t *pdb;
    const char *command;

    pdb = (PDB_t *)mem_sys_allocate(sizeof(PDB_t));

    interpreter->pdb = pdb;
    pdb->cur_opcode = interpreter->code->byte_code;

    PDB_init(interpreter,NULL);
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
            printf("L%li:\t", line->label->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n' && c)
            printf("%c", *(c++));
        printf("\n");
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
