/* embed.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The Parrot embedding interface.
 *  Data Structure and Algorithms:
 *     See include/parrot/embed.h.
 *  History:
 *     Initial version by Brent Dax on 2002.1.28
 *  Notes:
 *  References:
 */


#include "parrot/parrot.h"
#include "parrot/embed.h"

static BOOLVAL world_inited=0;

struct Parrot_Interp *
Parrot_new(void) {
    if(!world_inited) {
        world_inited=1;
        init_world();
    }
    return make_interpreter(0);
}

void
Parrot_init(struct Parrot_Interp *interpreter) {
    if(!world_inited) {
        world_inited=1;
        init_world();
    }
}

void
Parrot_setflag(struct Parrot_Interp *interpreter, Parrot_flag flag, Parrot_flag_val value) {
    interpreter->flags |= flag;
}

void
Parrot_setwarnings(struct Parrot_Interp *interpreter, Parrot_warnclass wc) {
	char* msg=mem_sys_allocate(32);
	PARROT_WARNINGS_on(interpreter, wc);
}

struct PackFile *
Parrot_readbc(struct Parrot_Interp *interpreter, char *filename) {
    /* XXX This ugly mess ought to be cleanupable. */
    int fd;
    struct stat file_stat;

    opcode_t program_size;
    char *program_code;
    struct PackFile *pf;

    if(filename == NULL || strcmp(filename, "-")==0) { /* read from STDIN */
        char *cursor;
        INTVAL read_result;

        program_size = 0;
           
        program_code = (char*)malloc((unsigned)program_size + 1024);
        if (NULL == program_code) {
            fprintf(stderr, "Parrot VM: Could not allocate buffer to read packfile from stdin.\n");
            return NULL;
        }
        cursor = (char*)program_code;

        while ((read_result = read(0, cursor, 1024)) > 0) {
            program_size += read_result;
            program_code = realloc(program_code, (unsigned)program_size + 1024);

            if (NULL == program_code) {
                fprintf(stderr, "Parrot VM: Could not reallocate buffer while reading packfile from stdin.\n");
                return NULL;
            }

            cursor = (char*)program_code + program_size;
        }

        if (read_result < 0) {
            fprintf(stderr, "Parrot VM: Problem reading packfile from stdin.\n");
            return NULL;
        }
    }
    else {
        if (stat(filename, &file_stat)) {
            fprintf(stderr, "Parrot VM: Can't stat %s, code %i.\n", filename, errno);
            return NULL;
        }
        
        if(!S_ISREG(file_stat.st_mode)) {
            fprintf(stderr, "Parrot VM: %s is not a normal file.\n", filename);
            return NULL;
        }
        
        fd = open(filename, O_RDONLY);
        if (!fd) {
             fprintf(stderr, "Parrot VM: Can't open %s, code %i.\n", filename, errno);
             return NULL;
        }
            
        program_size = file_stat.st_size;

#ifndef HAS_HEADER_SYSMMAN

        program_code = (char*)mem_sys_allocate(program_size);
        read(fd, (void*)program_code, program_size);

        if (!program_code) {
            fprintf(stderr, "Parrot VM: Can't read file %s, code %i.\n", filename, errno);
            return NULL;
        }

#else

        program_code = mmap(0, (unsigned)program_size, PROT_READ, MAP_SHARED, fd, (off_t)0);

        if (!program_code) {
            fprintf(stderr, "Parrot VM: Can't read file %s, code %i.\n", filename, errno);
            return NULL;
        }

#endif

    }

    pf = PackFile_new();

    if(!PackFile_unpack(interpreter, pf, program_code, (unsigned)program_size) ) {
        fprintf(stderr, "Parrot VM: Can't unpack packfile %s.\n", filename);
        return NULL;
    }

    return pf;
}

void
Parrot_loadbc(struct Parrot_Interp *interpreter, struct PackFile *pf) {
    interpreter->code=pf;
}

void
Parrot_runcode(struct Parrot_Interp *interpreter, int argc, char *argv[]) {
    INTVAL i;
    PMC* userargv;
    
    if(interpreter->flags & PARROT_DEBUG_FLAG) {
        fprintf(stderr, "Parrot VM: Debugging enabled.\n");

        if(interpreter->flags & PARROT_BOUNDS_FLAG) {
            fprintf(stderr, "Parrot VM: Bounds checking enabled.\n");
        }
        if(interpreter->flags & PARROT_PREDEREF_FLAG) {
            fprintf(stderr, "Parrot VM: Predereferencing enabled.\n");
        }
        if(interpreter->flags & PARROT_JIT_FLAG) {
            fprintf(stderr, "Parrot VM: JIT enabled.\n");
        }
    }

#if !defined(JIT_CAPABLE) || !JIT_CAPABLE
    if(interpreter->flags & PARROT_JIT_FLAG) {
        fprintf(stderr, "Parrot VM: Platform " JIT_ARCHNAME " is not JIT-capable.\n");
        exit(1);
    }
#endif

    if(interpreter->flags & PARROT_DEBUG_FLAG) {
        fprintf(stderr, "Parrot VM: Setting up ARGV array in P0.  Current argc: %d\n", argc);
    }

    userargv=pmc_new(interpreter, enum_class_PerlArray);
    
    for(i=0; i < argc; i++) {
        if(interpreter->flags & PARROT_DEBUG_FLAG) {
            fprintf(stderr, "\t" INTVAL_FMT ": %s\n", i, argv[i]);
        }

        userargv->vtable->set_string_index(interpreter, userargv, 
            string_make(interpreter, argv[i], strlen(argv[i]), 0, 0, 0), i
        );
    }

    interpreter->pmc_reg.registers[0]=userargv;

    runops(interpreter, interpreter->code, 0);

    /*
    ** If any profile information was gathered, print it out:
    */

    if (interpreter->profile != NULL) {
        unsigned int j;
        int op_count   = 0;
        int call_count = 0;
        FLOATVAL sum_time = 0.0;

	printf("\n\n");
        printf("                   OPERATION PROFILE                 \n\n");
        printf("  CODE   OP FULL NAME   CALLS  TOTAL TIME    AVG TIME\n");
        printf("  -----  ------------  ------  ----------  ----------\n");

        for (j = 0; j < interpreter->op_count; j++) {
            if(interpreter->profile[j].numcalls > 0) {
                op_count++;
                call_count += interpreter->profile[j].numcalls;
                sum_time += interpreter->profile[j].time;

                printf("  %5d  %-12s  %6ld  %10f  %10f\n", j, 
                       interpreter->op_info_table[j].full_name,
                       interpreter->profile[j].numcalls,
                       interpreter->profile[j].time,
                       interpreter->profile[j].time / (FLOATVAL)interpreter->profile[j].numcalls
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
}

void
Parrot_destroy(struct Parrot_Interp *interp) {
    free(interp);
}

