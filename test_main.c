/* test_main.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     A sample test program
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

#include "parrot/oplib/core_ops.h"

int
main(int argc, char **argv) {
    int i;
    int flags;
    int bounds_checking;
    int profiling;
    int tracing;
    int debugging;
    int predereferencing;
    int jit;
    int from_stdin;
    int from_file;
    char *filename;
    char **argp;

    struct Parrot_Interp *interpreter;
    init_world();
  
    /*
    ** Look for the switches:
    **
    **   -d  debugging
    **   -b  bounds checking
    **   -j  JIT
    **   -p  profiling
    **   -P  predereferencing
    **   -t  tracing
    **   -f  filename or stdin
    **
    */
    argp             = argv+1;
    flags            = 0;
    bounds_checking  = 0;
    profiling        = 0;
    tracing          = 0;
    debugging        = 0;
    predereferencing = 0;
    jit              = 0;
    from_stdin       = 0;
    from_file        = 0;
    filename         = NULL;

    while (*argp && (*argp)[0] == '-') {
        if((*argp)[2] != '\0')
            internal_exception(PARROT_USAGE_ERROR,
                        "%s: Invalid switch: %s\n", argv[0], (*argp));
 
        switch((*argp)[1]) {
            case 'd':   debugging = 1;
                        argp++; break;
            case 'b':   bounds_checking = 1;
                        argp++; break;
            case 'j':   jit = 1;
                        argp++; break;
            case 'p':   profiling = 1;
                        argp++; break;
            case 'P':   predereferencing = 1;
                        argp++; break;
            case 't':   tracing = 1;
                        argp++; break;
            case 'f':   if(*(++argp) == NULL)
                                internal_exception(PARROT_USAGE_ERROR,
                                        "%s: -f requires an argument\n",
                                                argv[0]);

                        if(strcmp("-", (*argp)) == 0) {
                            from_stdin = 1;
                        } else {
                            filename = malloc(strlen((*argp))+1);
                            filename = strcpy(filename, (*argp));
                        }
                        argp++; break;
            default:
                        internal_exception(PARROT_USAGE_ERROR,
                                "%s: Invalid switch: %s\n",
                                        argv[0], (*argp));
        }
    }

    if (debugging)              flags |= PARROT_DEBUG_FLAG;
    if (profiling)              flags |= PARROT_PROFILE_FLAG;
    if (predereferencing)       flags |= PARROT_PREDEREF_FLAG;
    if (tracing)                flags |= PARROT_TRACE_FLAG;
    if (bounds_checking)        flags |= PARROT_BOUNDS_FLAG;
    if (jit)                    flags |= PARROT_JIT_FLAG;
 
#if !JIT_CAPABLE
    if(jit)
        internal_exception( JIT_UNAVAILABLE, "%s: Cannot use the '-j' JIT-enabling flag on this architecture: " JIT_ARCHNAME "\n", argv[0]);
#endif

    if(debugging)
        fprintf(stderr, "Parrot VM: Debugging enabled.\n");

    interpreter = make_interpreter(flags);
    
    /* If we got only the program name, complain */

    if (*argp == NULL && !filename && !from_stdin) {
        internal_exception(PARROT_USAGE_ERROR, "%s: usage: %s prog\n", argv[0], argv[0]);
    }
    /* Otherwise load in the program they gave and try that, or - */
    else {
        opcode_t *program_code;
#ifdef __LCC__
        /* work around for a code generation bug in our lcc test environment */
        int program_size;
#else       
        size_t program_size;
#endif       
        struct stat file_stat;
        int fd;
        struct PackFile * pf;

        if (from_stdin) {
            char *cursor;
            INTVAL read_result;

            program_size = 0;
            
            program_code = (opcode_t*)malloc(program_size + 1024);
            if (NULL == program_code) {
                fprintf(stderr, "Could not allocate buffer to read stdin\n");
            }
            cursor = (char*)program_code;

            while ((read_result = read(0, cursor, 1024)) > 0) {
                program_size += read_result;
                program_code = realloc(program_code, program_size + 1024);
                if (NULL == program_code) {
                    fprintf(stderr,
                            "Could not reallocate buffer to read stdin\n");
                }
                cursor = (char*)program_code + program_size;
            }

            if (read_result < 0) {
                internal_exception(PIO_ERROR,"Problem reading from stdin\n");
            }
        }
        else { /* read from file */
            if (!filename) {
                filename = malloc(strlen((*argp))+1);
                strcpy(filename, (*argp));
            }

            if (stat(filename, &file_stat)) {
                printf("can't stat %s, code %i\n", filename, errno);
                return 1;
            }
            fd = open(filename, O_RDONLY);
            if (!fd) {
                printf("Can't open, error %i\n", errno);
                return 1;
            }
            
            program_size = file_stat.st_size;

#ifndef HAS_HEADER_SYSMMAN
            program_code = (opcode_t*)mem_sys_allocate(program_size);
            read(fd, (void*)program_code, program_size);
#else
            program_code = 
                (opcode_t *) mmap(0, program_size, PROT_READ,
                                  MAP_SHARED, fd, (off_t)0);
#endif
        } /* end reading from file */

        if (!program_code) {
            printf("Can't mmap, code %i\n", errno);
            return 1;
        }
        
        pf = PackFile_new();
        if( !PackFile_unpack(interpreter, pf, (char *)program_code, 
                             (size_t)program_size) ) {
            printf( "Can't unpack.\n" );
            return 1;
        }

        /*
        ** Run the interpreter loop:
        */

        runops(interpreter, pf, 0);

        /*
        ** If any profile information was gathered, print it out:
        */

        if (interpreter->profile != NULL) {
            unsigned int j;
            int op_count   = 0;
            int call_count = 0;
            FLOATVAL sum_time = 0.0;

            printf("Operation profile:\n\n");

            printf("  CODE   OP FULL NAME  CALLS        TOTAL TIME AVG TIME  \n");
            printf("  -----  ------------  ------------ ---------- ----------\n");

            for (j = 0; j < interpreter->op_count; j++) {
                if(interpreter->profile[j].numcalls > 0) {
                    op_count++;
                    call_count += interpreter->profile[j].numcalls;
                    sum_time += interpreter->profile[j].time;

                    printf("  %5d  %-12s  %12ld  %5.6f  %5.6f\n", j, 
                           interpreter->op_info_table[j].full_name,
                           interpreter->profile[j].numcalls,
                           interpreter->profile[j].time,
                           interpreter->profile[j].time / (FLOATVAL)interpreter->profile[j].numcalls
                    );
                }

            }

            printf("  -----  ------------  ------------ ---------- ----------\n");
            printf("  %5d  %-12s  %12d  %5.6f  %5.6f\n", 
                op_count,
                "",
                call_count,
                sum_time,
                sum_time / (FLOATVAL)call_count
            );
        }
    }

    return 0;
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
