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
    **
    ** We really should use getopt, but are we allowed?
    */

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

    while (argc > 1 && argv[1][0] == '-') {
        if (argv[1][1] == 'b' && argv[1][2] == '\0') {
            bounds_checking = 1;
            for(i = 2; i < argc; i++) {
                argv[i-1] = argv[i];
            }
            argc--;
        }
        else if (argv[1][1] == 'j' && argv[1][2] == '\0') {
            jit = 1;
            for(i = 2; i < argc; i++) {
                argv[i-1] = argv[i];
            }
            argc--;
        }
        else if (argv[1][1] == 'p' && argv[1][2] == '\0') {
            profiling = 1;
            for(i = 2; i < argc; i++) {
                argv[i-1] = argv[i];
            }
            argc--;
        }
        else if (argv[1][1] == 'P' && argv[1][2] == '\0') {
            predereferencing = 1;
            for(i = 2; i < argc; i++) {
                argv[i-1] = argv[i];
            }
            argc--;
        }
        else if (argv[1][1] == 't' && argv[1][2] == '\0') {
            tracing = 1;
            for(i = 2; i < argc; i++) {
                argv[i-1] = argv[i];
            }
            argc--;
        }
        else if (argv[1][1] == 'd' && argv[1][2] == '\0') {
            debugging = 1;
            for(i = 2; i < argc; i++) {
                argv[i-1] = argv[i];
            }
            argc--;
        }
        else if (argv[1][1] == 'f') {
            if (strcmp("-", argv[2]) == 0) {
                from_stdin = 1;
            }
            else {
                filename = malloc(strlen(argv[2])+1);
                filename = strcpy(filename, argv[2]);
            }
            for (i = 3; i < argc; i++) {
                argv[i-2] = argv[i];
            }
            argc -= 2;
        }
        else {
            fprintf(stderr, "%s: Invalid switch: %s\n", argv[0], argv[1]);
            exit(1);
        } 
    }


    if (debugging) {
        fprintf(stderr, "Parrot VM: Debugging enabled.\n");
        flags |= PARROT_DEBUG_FLAG;
    }

    if (bounds_checking) {
        flags |= PARROT_BOUNDS_FLAG;
    }

    if (jit) {
        if (!JIT_CAPABLE) {
            fprintf(stderr, "%s: Cannot use the '-j' JIT-enabling flag on this architecture: %s\n",
                argv[0], JIT_ARCHNAME);
            exit(1);
        }
        flags |= PARROT_JIT_FLAG;
    }

    if (profiling) {
        flags |= PARROT_PROFILE_FLAG;
    }

    if (predereferencing) {
        flags |= PARROT_PREDEREF_FLAG;
    }

    if (tracing) {
        flags |= PARROT_TRACE_FLAG;
    }

    interpreter = make_interpreter(flags);
    
    /* If we got only the program name, complain */

    if (argc == 1 && !filename && !from_stdin) {
        fprintf(stderr, "%s: usage: %s prog\n", argv[0], argv[0]);
        exit(1);
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
            INTVAL read_last;

            program_size = 1024;
            
            program_code = (opcode_t*)malloc(1024);
            if (NULL == program_code) {
                fprintf(stderr, "Could not allocate buffer to read stdin\n");
            }
            cursor = (char*)program_code;

            while ((read_result = read(0, cursor, 1024)) > 0) {
                read_last = read_result;
                program_size += 1024;
                program_code = realloc(program_code, program_size);
                if (NULL == program_code) {
                    fprintf(stderr,
                            "Could not reallocate buffer to read stdin\n");
                }
                cursor = (char*)program_code + program_size - 1024;
            }

            if (read_result == 0) {
                program_size = program_size - 2048 + read_last;
            }
            else if (read_result < 0) {
                fprintf(stderr, "Problem reading from stdin\n");
                exit(1);
            }
        }
        else { /* read from file */
            if (!filename) {
                filename = malloc(strlen(argv[1])+1);
                strcpy(filename, argv[1]);
            }

            if (stat(filename, &file_stat)) {
                printf("can't stat %s, code %i\n", argv[1], errno);
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
                             (opcode_t)program_size) ) {
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

            printf("Operation profile:\n\n");

            printf("  CODE   OP FULL NAME  CALLS\n");
            printf("  -----  ------------  ------------\n");

            for (j = 0; j < interpreter->op_count; j++) {
                if(interpreter->profile[j] > 0) {
                    op_count++;
                    call_count += interpreter->profile[j];

                    printf("  %5d  %-12s  %12ld\n", j, 
                           interpreter->op_info_table[j].full_name,
                           interpreter->profile[j]);
                }

            }

            printf("  -----  ------------  ------------\n");
            printf("  %5d  %-12s  %12d\n", op_count, "", call_count);
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
