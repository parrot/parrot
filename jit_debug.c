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
write_types(FILE *stabs)
{
    fprintf(stabs,
".stabs \"int:t1=r1;0020000000000;0017777777777;\",128,0,0,0\n"
".stabs \"char:t2=r2;0;127;\",128,0,0,0\n"
".stabs \"long int:t3=r1;0020000000000;0017777777777;\",128,0,0,0\n"
".stabs \"unsigned int:t4=r1;0000000000000;0037777777777;\",128,0,0,0\n"
".stabs \"long unsigned int:t5=r1;0000000000000;0037777777777;\",128,0,0,0\n"
".stabs \"long long int:t6=r1;01000000000000000000000;07777777777777777777;\",128,0,0,0\n"
".stabs \"long long unsigned int:t7=r1;0000000000000;017777777777777777777;\",128,0,0,0\n"
".stabs \"short int:t8=r8;-32768;32767;\",128,0,0,0\n"
".stabs \"short unsigned int:t9=r9;0;65535;\",128,0,0,0\n"
".stabs \"signed char:t10=r10;-128;127;\",128,0,0,0\n"
".stabs \"unsigned char:t11=r11;0;255;\",128,0,0,0\n"
".stabs \"float:t12=r1;4;0;\",128,0,0,0\n"
".stabs \"double:t13=r1;8;0;\",128,0,0,0\n"
           );
#if INTVAL_SIZE == 4
    fprintf(stabs, ".stabs \"Parrot_Int:t14=1\",128,0,0,0\n");
#else
    fprintf(stabs, ".stabs \"Parrot_Int:t14=6\",128,0,0,0\n");
#endif
#if NUMVAL_SIZE == 4
    fprintf(stabs, ".stabs \"Parrot_Float:t15=12\",128,0,0,0\n");
#else
    fprintf(stabs, ".stabs \"Parrot_Float:t15=13\",128,0,0,0\n");
#endif
}

static void
write_vars(FILE *stabs, struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        fprintf(stabs, ".stabs \"I%d:b14\",38,0,0,%p\n", i,
                (char*)&interpreter->ctx.int_reg.registers[i]);
        fprintf(stabs, ".stabs \"N%d:b15\",38,0,0,%p\n", i,
                (char*)&interpreter->ctx.num_reg.registers[i]);
    }
}

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
            string_make(interpreter, "pasm", 4, 0, BUFFER_external_FLAG, 0),
            0);
    stabsfile = string_copy(interpreter, file);
    stabsfile = string_append(interpreter, stabsfile,
            string_make(interpreter, "stabs.s", 7, 0, BUFFER_external_FLAG, 0),
            0);
    ofile = string_copy(interpreter, file);
    ofile = string_append(interpreter, ofile,
            string_make(interpreter, "o", 4, 0, BUFFER_external_FLAG, 0),
            0);
    stabsfile = string_copy(interpreter, file);
    stabsfile = string_append(interpreter, stabsfile,
            string_make(interpreter, "stabs.s", 7, 0, BUFFER_external_FLAG, 0),
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
    write_types(stabs);
    write_vars(stabs, interpreter);
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
    /* eof */
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
