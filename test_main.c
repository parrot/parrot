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

    struct Parrot_Interp *interpreter;
    init_world();
  
    /*
    ** Look for the switches:
    **
    **   -d  debugging
    **   -b  bounds checking
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

    while (argc > 1 && argv[1][0] == '-') {
        if (argv[1][1] == 'b' && argv[1][2] == '\0') {
            bounds_checking = 1;
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

    if (argc == 1) {
        fprintf(stderr, "%s: usage: %s prog\n", argv[0], argv[0]);
        exit(1);
    }
    /* Otherwise load in the program they gave and try that */
    else {
        opcode_t *program_code;        
        long program_size;
        struct stat file_stat;
        int fd;
        struct PackFile * pf;

        if (stat(argv[1], &file_stat)) {
            printf("can't stat %s, code %i\n", argv[1], errno);
            return 1;
        }
        fd = open(argv[1], O_RDONLY);
        if (!fd) {
            printf("Can't open, error %i\n", errno);
            return 1;
        }
        
        program_size = file_stat.st_size;

#ifndef HAS_HEADER_SYSMMAN
        program_code = (opcode_t*)mem_sys_allocate(program_size);
        read(fd, (void*)program_code, program_size);
#else
        program_code = (opcode_t*)mmap(0, program_size, PROT_READ, MAP_SHARED, fd, 0);
#endif

        if (!program_code) {
            printf("Can't mmap, code %i\n", errno);
            return 1;
        }
        
        pf = PackFile_new();
        if( !PackFile_unpack(interpreter, pf, (char *)program_code, program_size) ) {
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
            int i;
            int op_count   = 0;
            int call_count = 0;

            printf("Operation profile:\n\n");

            printf("  CODE   OP FULL NAME  CALLS\n");
            printf("  -----  ------------  ------------\n");

            for (i = 0; i < core_numops; i++) {
                if(interpreter->profile[i] > 0) {
                    op_count++;
                    call_count += interpreter->profile[i];

                    printf("  %5d  %-12s  %12ld\n",i, core_opinfo[i].full_name,
                        interpreter->profile[i]);
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
