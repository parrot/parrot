#include "parrot/parrot.h"

#include <stdarg.h>
#include <assert.h>

static int
find_line(struct Parrot_Interp *interpreter, struct PackFile_Debug * debug)
{
    size_t offs, i, n;
    op_info_t *op_info;
    opcode_t *pc;

    if (!interpreter->cur_pc)
        return -2;
    pc = interpreter->code->cur_cs->base.data;
    offs = interpreter->cur_pc - pc;
    for (i = n = 0; n < interpreter->code->cur_cs->base.size; i++) {
        op_info = &interpreter->op_info_table[*pc];
        if (n >= offs)
            return (int) debug->base.data[i];
        n += op_info->arg_count;
        pc += op_info->arg_count;
    }
    return -1;
}

static INTVAL
print_warning(struct Parrot_Interp *interpreter, STRING *msg)
{
    const char *file;
    int line;
    struct PackFile_Debug * debugs = interpreter->code->cur_cs->debugs;

    if (debugs) {
        file = debugs->filename;
        line = find_line(interpreter, debugs);
    }
    else {
        file = "(unknown)";
        line = 0;
    }


    if (!msg)
        return -1;

    if (PIO_eprintf(interpreter, "%S at %s line %d.\n", msg, file, line))
        return -2;
    else
        return 1;
}

INTVAL
Parrot_warn(struct Parrot_Interp *interpreter, INTVAL warnclass,
            const char *message, ...)
{
    STRING *targ;

    va_list args;

    assert(interpreter);
    if (!PARROT_WARNINGS_test(interpreter, warnclass))
        return 2;

    va_start(args, message);
    targ = Parrot_vsprintf_c(interpreter, message, args);
    va_end(args);
    return print_warning(interpreter, targ);

}

INTVAL
Parrot_warn_s(struct Parrot_Interp *interpreter, INTVAL warnclass,
              STRING *message, ...)
{
    STRING *targ;

    va_list args;

    if (!interpreter || !PARROT_WARNINGS_test(interpreter, warnclass))
        return 2;

    va_start(args, message);
    targ = Parrot_vsprintf_s(interpreter, message, args);
    va_end(args);

    return print_warning(interpreter, targ);
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
