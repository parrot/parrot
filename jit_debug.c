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

typedef struct {
	const char *name;
	const char *spec;
} BaseTypes;
static void
write_types(FILE *stabs)
{
    int i;
    /* borrowed from mono */
    static BaseTypes base_types[] = {
            {"Void", "(0,1)"},
            {"Char", ";-128;127;"},
            {"Byte", ";0;255;"},
            {"Int16", ";-32768;32767;"},
            {"UInt16", ";0;65535;"},
            {"Int32", ";0020000000000;0017777777777;"}, /* 5 */
            {"UInt32", ";0000000000000;0037777777777;"},
            {"Int64", ";01000000000000000000000;0777777777777777777777;"},
            {"UInt64", ";0000000000000;01777777777777777777777;"},
            {"Single", "r(0,8);4;0;"},
            {"Double", "r(0,8);8;0;"},  /* 10 */
            {"LongDouble", "r(0,8);12;0;"},
#if INTVAL_SIZE == 4
            {"INTVAL", "(0,5);"},       /* 12 */
#else
            {"INTVAL", "(0,7);"},
#endif
#if NUMVAL_SIZE == 8
            {"FLOATVAL", "(0,10);"},    /* 13 */
#else
            {"FLOATVAL", "(0,11);"},
#endif
            {"Ptr", "*(0,0);"},
            {"CharPtr", "*(0,1);"},     /* 15 */
            {0, 0}
        };
    for (i = 0; base_types[i].name; ++i) {
        if (! base_types[i].spec)
            continue;
        fprintf (stabs, ".stabs \"%s:t(0,%d)=", base_types[i].name, i);
        if (base_types[i].spec [0] == ';') {
            fprintf (stabs, "r(0,%d)%s\"", i, base_types[i].spec);
        } else {
            fprintf (stabs, "%s\"", base_types[i].spec);
        }
        fprintf (stabs, ",128,0,0,0\n");
    }
    fprintf(stabs, ".stabs \"STRING:t(0,%d)=*(0,%d)\""
                ",128,0,0,0\n", i, i+1);
    i++;
    fprintf(stabs, ".stabs \"Parrot_String:T(0,%d)=s%d"
                "bufstart:(0,14),%d,%d;"
                "buflen:(0,6),%d,%d;"   /* XXX type */
                "flags:(0,12),%d,%d;"
                "bufused:(0,12),%d,%d;"
                "strstart:(0,15),%d,%d;"        /* fake a char* */
                ";\""
                ",128,0,0,0\n", i++, sizeof(STRING),
                offsetof(STRING, bufstart) * 8, sizeof(void *) * 8,
                offsetof(STRING, buflen) * 8, sizeof(size_t) * 8,
                offsetof(STRING, obj.flags) * 8, sizeof(UINTVAL) * 8,
                offsetof(STRING, bufused) * 8, sizeof(UINTVAL) * 8,
                offsetof(STRING, strstart) * 8, sizeof(void *) * 8
                );

}

static void
write_vars(FILE *stabs, struct Parrot_Interp *interpreter)
{
    int i;
    /* fake static var stabs */
    for (i = 0; i < NUM_REGISTERS; i++) {
        fprintf(stabs, ".stabs \"I%d:S(0,12)\",38,0,0,%p\n", i,
                (char*)&interpreter->ctx.int_reg.registers[i]);
        fprintf(stabs, ".stabs \"N%d:S(0,13)\",38,0,0,%p\n", i,
                (char*)&interpreter->ctx.num_reg.registers[i]);
        fprintf(stabs, ".stabs \"S%d:S(0,16)\",38,0,0,%p\n", i,
                (char*)&interpreter->ctx.string_reg.registers[i]);
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
            string_make(interpreter, "pasm", 4, 0, PObj_external_FLAG, 0),
            0);
    stabsfile = string_copy(interpreter, file);
    stabsfile = string_append(interpreter, stabsfile,
            string_make(interpreter, "stabs.s", 7, 0, PObj_external_FLAG, 0),
            0);
    ofile = string_copy(interpreter, file);
    ofile = string_append(interpreter, ofile,
            string_make(interpreter, "o", 4, 0, PObj_external_FLAG, 0),
            0);
    stabsfile = string_copy(interpreter, file);
    stabsfile = string_append(interpreter, stabsfile,
            string_make(interpreter, "stabs.s", 7, 0, PObj_external_FLAG, 0),
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
            (char *) jit_info->arena.size);
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
