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

IV opcodes[] = {3, 1,                /* put the time in reg 1 */
                0, 2, 0,             /* Set reg 2 to 0 */
		0, 3, 1,             /* set reg 3 to 1 */
		0, 4, 100000000,     /* set reg 4 to 100M  */
                2, 2, 4, 11, 5,      /* is reg 2 eq to reg 4? */
		1, 2, 2, 3,          /* Add register 2 to 3, store in 2 */
		5, -9,               /* branch back to if */
		3, 5,                /* Put the time in reg 5 */
		4, 1,                /* Print reg 1 */
		4, 5,                /* Print reg 5 */
		6                    /* exit */
                };

int
main(int argc, char **argv) {
    int i;
    int tracing;

    struct Parrot_Interp *interpreter;
    init_world();
  
    interpreter = make_interpreter();
    
    /* Look for the '-t' tracing switch. We really should use getopt, but are we allowed? */

    if (argc > 1 && strcmp(argv[1], "-t") == 0) {
        tracing = 1;
        for(i = 2; i < argc; i++) {
            argv[i-1] = argv[i];
        }
        argc--;
    }
    else {
        tracing = 0;
    }

    /* If we got only the program name, run the test program */
    if (argc == 1) {
        runops(interpreter, opcodes, sizeof(opcodes));
    }
    else if (argc == 2 && !strcmp(argv[1], "-s")) { /* String tests */
        STRING *s = string_make("foo", 3, enc_native, 0, 0);
        STRING *t = string_make("quux", 4, enc_native, 0, 0);
        int i;
        time_t foo;
        
        printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
        string_concat(s, t, 0);
        printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
        string_chopn(s, 4);
        printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
        string_chopn(s, 4);
        printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
        foo = time(0);
        for (i = 0; i < 100000000; i++) {
            string_concat(s, t, 0);
            string_chopn(s, 4);
        }
        printf("10000000 concats and chops took %li seconds.\n", time(0)-foo);
        string_destroy(s);
    }
    /* Otherwise load in the program they gave and try that */
    else {
        void *program_code;
        long program_size;
        struct stat file_stat;
        int fd;

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
        program_code = mem_sys_allocate(program_size);
        _read(fd, program_code, program_size);
#else
        program_code = mmap(0, program_size, PROT_READ, MAP_SHARED, fd, 0);
#endif

        if (!program_code) {
            printf("Can't mmap, code %i\n", errno);
            return 1;
        }
        
        program_code = init_bytecode(program_code, &program_size);
        
        if (tracing) {
            interpreter->flags |= PARROT_TRACE_FLAG;
        }

        runops(interpreter, program_code, program_size);
        
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
