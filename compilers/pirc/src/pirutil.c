/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

pirutil.c - various utility functions

=cut

*/
#include "pirutil.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "parrot/parrot.h"

/*

=head1 FUNCTIONS

=over 4

=item C<char * clone_string(NOTNULL(char const * src))>

clone a string. Copy the characters of src into dest
and return dest. Memory allocation is done by this function, keeping
this function's client code simple. Please free() the memory after usage!

=cut

*/
char *
clone_string(NOTNULL(char const * src))
{
    int srclen;
    char * dest, *ptr;

    srclen = strlen(src);
    /* dest is used as an iterator, ptr - still pointing to the beginning
     * of the string - is returned
     */
    dest = ptr = (char *)calloc(srclen + 1, sizeof (char));
    while (*src) {
        *dest++ = *src++;
    }
    return ptr;
}

/*

=item C<FILE * open_file(char const *filename, char const *mode)>

Open the file C<filename> in mode C<mode>. If this fails, an error message
is printed, and the program is terminated.

=cut

*/
FILE *
open_file(char const *filename, char const *mode)
{
    FILE *file = fopen(filename, mode);

    if (file == NULL) {
        fprintf(stderr, "Failed to open file '%s' in mode '%s'\nTerminating\n", filename, mode);
        exit(EXIT_FAILURE);
    }

    return file;
}

/*

=item C<void printverbose(char *message)>

Prints the specified message if the verbose flag was set

=cut

*/
void
printverbose(char *message)
{
    fprintf(stdout, message);
}

/*

=item C<void printdebug(char *message)>

Prints the specified message if the debug flag was set.

=cut

*/
void
printdebug(char *message)
{
    fprintf(stdout, message);
}



/* Array holding all parrot ops */
static char const *parrot_ops[] = {
        "yield",
        "xor",
        "warningson",
        "warningsoff",
        "valid_type",
        "upcase",
        "unshift",
        "unregister",
        "unpin",
        "unless_null",
        "unless",
        "typeof",
        "trans_encoding",
        "trans_charset",
        "trace",
        "titlecase",
        "time",
        "throw",
        "thaw",
        "tell",
        "tanh",
        "tan",
        "tailcallmethod",
        "tailcall",
        "sysinfo",
        "sweepon",
        "sweepoff",
        "sweep",
        "substr",
        "subclass",
        "sub",
        "stringinfo",
        "store_lex",
        "stat",
        "sqrt",
        "sprintf",
        "split",
        "spawnw",
        "socket",
        "sockaddr",
        "sleep",
        "sizeof",
        "sinh",
        "sin",
        "shr",
        "shl",
        "shift",
        "setstdout",
        "setstderr",
        "sets_ind",
        "setref",
        "setprop",
        "setp_ind",
        "setn_ind",
        "seti_ind",
        "setattribute",
        "set_root_global",
        "set_returns",
        "set_hll_global",
        "set_global",
        "set_args",
        "set_addr",
        "set",
        "send",
        "seek",
        "sech",
        "sec",
        "savec",
        "saveall",
        "save",
        "runinterp",
        "rotate_up",
        "rot",
        "returncc",
        "rethrow",
        "ret",
        "result_info",
        "restoreall",
        "restore",
        "reserved",
        "repeat",
        "removeparent",
        "removeattribute",
        "register",
        "recv",
        "readline",
        "read",
        "pushmark",
        "pushaction",
        "push_eh",
        "push",
        "prophash",
        "profile",
        "printerr",
        "print",
        "pow",
        "popmark",
        "pop",
        "poll",
        "pioctl",
        "pin",
        "peek",
        "ord"
        "or",
        "open",
        "null",
        "not",
        "noop",
        "newclosure",
        "newclass",
        "new_callback",
        "new",
        "new",
        "neg",
        "needs_destroy",
        "ne_str",
        "ne_num",
        "ne_addr",
        "ne",
        "n_repeat",
        "n_not",
        "n_neg",
        "n_infix",
        "n_concat",
        "n_bnots"
        "n_bnot"
        "n_abs",
        "mul",
        "mod",
        "add_multi",
        "find_multi",
        "lt_str",
        "lt_num",
        "lt_addr",
        "lt",
        "lsr",
        "lookback",
        "log2",
        "log10",
        "localtime",
        "loadlib",
        "load_bytecode",
        "ln",
        "listen",
        "length",
        "le_str",
        "le_num",
        "le_addr",
        "le",
        "lcm",
        "jsr",
        "join",
        "istrue",
        "issame",
        "isnull",
        "isntsame",
        "isne",
        "islt",
        "isle",
        "isgt",
        "isge",
        "isfalse",
        "iseq",
        "isa",
        "is_cclass",
        "invokecc",
        "invoke",
        "interpinfo",
        "infix",
        "index",
        "inc",
        "if_null",
        "if",
        "hash",
        "gt_str",
        "gt_num",
        "gt_addr",
        "gt",
        "gmtime",
        "getstdout",
        "getstdin",
        "getstderr",
        "getprop",
        "getline",
        "getinterp",
        "getfile",
        "getattribute",
        "get_root_namespace",
        "get_root_global",
        "get_results",
        "get_repr",
        "get_params",
        "get_namespace",
        "get_mro",
        "get_hll_namespace",
        "get_hll_global",
        "get_global",
        "get_addr",
        "ge_str",
        "ge_num",
        "ge_addr",
        "ge",
        "gcd",
        "gc_debug",
        "freeze",
        "floor",
        "find_type",
        "find_not_cclass",
        "find_name",
        "find_method",
        "find_lex",
        "find_encoding",
        "find_charset",
        "find_cclass",
        "fdopen",
        "fdiv",
        "fact",
        "exp",
        "exit",
        "exists",
        "exchange",
        "escape",
        "errorson",
        "errorsoff",
        "err",
        "eq_str",
        "eq_num",
        "eq_addr",
        "eq",
        "entrytype",
        "enternative",
        "end",
        "encoding",
        "elements",
        "downcase",
        "does",
        "dlvar",
        "dlfunc",
        "div",
        "die",
        "deref",
        "depth",
        "delprop",
        "delete",
        "defined",
        "decodetime",
        "decodelocaltime",
        "dec",
        "debug_print",
        "debug_load",
        "debug_init",
        "debug_break",
        "debug",
        "cosh",
        "cos",
        "connect",
        "concat",
        "compreg",
        "compose",
        "collecton",
        "collectoff",
        "collect",
        "cmp_str",
        "cmp_num",
        "cmp",
        "cmod",
        "close",
        "clone",
        "clears",
        "clearp",
        "clearn",
        "cleari",
        "pop_eh",
        "classname",
        "class",
        "chr",
        "chopn",
        "charsetname",
        "charset",
        "ceil",
        "can",
        "callmethodcc",
        "callmethod",
        "bytelength",
        "bxors",
        "bxor",
        "bsr",
        "branch_cs",
        "branch",
        "bounds",
        "bors",
        "bor",
        "bnots",
        "bnot",
        "bind",
        "bands",
        "band",
        "backtrace",
        "atan",
        "assign",
        "asin",
        "asec",
        "and",
        "addparent",
        "addmethod",
        "addattribute",
        "add",
        "acos",
        "accept",
        "abs",
        NULL
};



/*

=item C<int is_op(char *id)>

Return 1 if the specified id is a Parrot op, 0 otherwise.

=cut

*/
int
is_op(char *id)
{
    char const *iter = parrot_ops[0];
    int index = 0;

    /* very inefficient implementation, but for now it works */
    /* suggestions: hashtable, binary search */

    while (iter != NULL) {
        if (strcmp(iter, id) == 0)
            return 1;

        iter = parrot_ops[++index];
    }


    return 0;
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
