/*
 * jit_debug.c
 *
 * $Id$
 *
 * write stabs file for jit code
 * when debugging jit code with gdb, do:
 *
 * add-symbol-file <file.o> 0
 *
 */

#include <parrot/parrot.h>
#include "parrot/jit.h"

#ifdef __GNUC__
void Parrot_jit_debug(struct Parrot_Interp* interpreter);

static void
Parrot_jit_debug_stabs(struct Parrot_Interp *interpreter)
{
    Parrot_jit_info_t *jit_info = interpreter->jit_info;
    STRING *file = interpreter->current_file;
    STRING *pasmfile, *stabsfile, *ofile, *cmd;
    FILE *stabs;
    size_t i;
    int line;

    /* chop pbc */
    file = string_chopn(file, 3);
    pasmfile = string_copy(interpreter, file);
    pasmfile = string_append(interpreter, pasmfile,
            string_make(interpreter, "pasm", 4, 0, 0, 0),
            0);
    stabsfile = string_copy(interpreter, file);
    stabsfile = string_append(interpreter, stabsfile,
            string_make(interpreter, "stabs.s", 7, 0, 0, 0),
            0);
    ofile = string_copy(interpreter, file);
    ofile = string_append(interpreter, ofile,
            string_make(interpreter, "o", 4, 0, 0, 0),
            0);
    stabsfile = string_copy(interpreter, file);
    stabsfile = string_append(interpreter, stabsfile,
            string_make(interpreter, "stabs.s", 7, 0, 0, 0),
            0);
    stabs = fopen(string_to_cstring(interpreter,stabsfile), "w");
    if (stabs == NULL)
        return;

    /* filename info */
    fprintf(stabs, ".stabs \"%s\",100,0,0,0\n",
            string_to_cstring(interpreter, pasmfile));
    /* jit_func start addr */
    fprintf(stabs, ".stabs \"jit_func:F(0,1)\",36,0,1,%p\n",
            jit_info->arena.start);
    /* we don't have line numbers yet, emit dummys, assuming there are
     * no comments and spaces in source for testing
     */

    /* jit_begin */
    fprintf(stabs, ".stabn 68,0,1,0\n");
    line = 1;
    for (i = 0; i < jit_info->arena.map_size; i++) {
        if (jit_info->arena.op_map[i].ptr) {
            fprintf(stabs, ".stabn 68,0,%d,%d\n", line,
                    (char *)jit_info->arena.op_map[i].ptr -
                    (char *)jit_info->arena.start);
            line++;
        }
    }
    fprintf(stabs, ".stabs \"\",36,0,1,%p\n",
            (char *)jit_info->arena.start+ jit_info->arena.size);
    fclose(stabs);
    /* run the stabs file through C<as> generating file.o */
    cmd = Parrot_sprintf_c(interpreter, "as %Ss -o %Ss", stabsfile, ofile);
    system(string_to_cstring(interpreter, cmd));
}

void
Parrot_jit_debug(struct Parrot_Interp* interpreter)
{

    Parrot_jit_debug_stabs(interpreter);
}


#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
