#! perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan tests => 9;

=head1 NAME

t/src/embed.t - Embedding parrot

=head1 SYNOPSIS

    % prove t/src/embed.t

=head1 DESCRIPTION

Embedding parrot in C

=cut

sub linedirective
{
    # Provide a #line directive for the C code in the heredoc
    # starting immediately after where this sub is called.
    my $linenum = shift() + 1;
    return "#line " . $linenum . ' "' . __FILE__ . '"' . "\n";
}

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Minimal embed, using just the embed.h header" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/embed.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    puts("Done");
    Parrot_destroy(interp);
    return 0;
}
CODE
Done
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_compile_string populates the error string when an opcode is given improper arguments');

#include <stdio.h>
#include <stdlib.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}


int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, lang;
    Parrot_PMC func_pmc;
    char *str;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    lang = Parrot_new_string(interp, "PIR", 3, (const char*)NULL, 0);

    func_pmc = Parrot_compile_string(interp, lang, ".sub foo\n copy\n.end", &err);
    Parrot_printf(interp, "%Ss\n", err);
    Parrot_destroy(interp);
    return 0;
}
CODE
The opcode 'copy' (copy<0>) was not found. Check the type and number of the arguments
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_compile_string populates the error string when given invalid language string');

#include <stdio.h>
#include <stdlib.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}


int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, lang;
    Parrot_PMC func_pmc;
    char *str;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    lang = Parrot_new_string(interp, "Foo", 3, (const char*)NULL, 0);

    func_pmc = Parrot_compile_string(interp, lang, "This doesn't matter", &err);
    Parrot_printf(interp, "%Ss\n", err);
    Parrot_destroy(interp);
    return 0;
}
CODE
Invalid interpreter type
OUTPUT


c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_compile_string populates the error string when there is an IMCC syntax error', 'todo' => 'TT #1610 : does not properly catch IMCC errors');

#include <stdio.h>
#include <stdlib.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}


int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, lang;
    Parrot_PMC func_pmc;
    char *str;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    lang = Parrot_new_string(interp, "PIR", 3, (const char*)NULL, 0);

    func_pmc = Parrot_compile_string(interp, lang, "The sleeper must awake", &err);
    Parrot_printf(interp,"Caught exception\n");
    Parrot_printf(interp, "%Ss\n", err);
    Parrot_destroy(interp);
    return 0;
}
CODE
Caught exception
error:imcc:syntax error, unexpected IDENTIFIER ('The')
OUTPUT


c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Hello world from main" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;

    /* Create the interpreter and show a message using parrot io */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    Parrot_printf(interp, "Hello, parrot\n");

    /* Compile and execute a pir sub */
    compiler = Parrot_new_string(interp, "PIR", 3, (const char *)NULL, 0);
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Hello, pir'\n"
"\n"
".end\n"
"\n",
        &errstr
    );
    Parrot_ext_call(interp, code, "->");

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello, parrot
Hello, pir
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Hello world from a sub" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC rootns;
    Parrot_String parrotname;
    Parrot_PMC parrotns;
    Parrot_String subname;
    Parrot_PMC sub;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir code */
    compiler = Parrot_new_string(interp, "PIR", 3, (const char *)NULL, 0);
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Must not be seen!'\n"
"\n"
".end\n"
"\n"
".sub hello\n"
"  say 'Hello, sub'\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Get parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = Parrot_new_string(interp, "parrot", 6, (const char *)NULL, 0);
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns,  parrotname);
    /* Get the sub */
    subname = Parrot_new_string(interp, "hello", 5, (const char *)NULL, 0);
    sub = Parrot_PMC_get_pmc_keyed_str(interp, parrotns,  subname);
    /* Execute it */
    Parrot_ext_call(interp, sub, "->");

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello, sub
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "External sub" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);
void hello(Parrot_Interp interp);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

void hello(Parrot_Interp interp)
{
    Parrot_printf(interp, "Hello from C\n");
}

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC hellosub;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir */
    compiler = Parrot_new_string(interp, "PIR", 3, (const char *)NULL, 0);
    code = Parrot_compile_string(interp, compiler,
".sub externcall\n"
"  .param pmc ec\n"
"  ec()\n"
"\n"
".end\n"
"\n",
        &errstr
    );
    hellosub = Parrot_sub_new_from_c_func(interp, (void (*)())& hello, "vJ");
    Parrot_ext_call(interp, code, "P->", hellosub);

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello from C
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Insert external sub in namespace" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/embed.h"
#include "parrot/extend.h"

void fail(const char *msg);
void hello(Parrot_Interp interp);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

void hello(Parrot_Interp interp)
{
    Parrot_printf(interp, "Hello from C\n");
}

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC hellosub;
    Parrot_PMC rootns;
    Parrot_String parrotname;
    Parrot_PMC parrotns;
    Parrot_String helloname;
    void *discard;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir */
    compiler = Parrot_new_string(interp, "PIR", 3, (const char *)NULL, 0);
    code = Parrot_compile_string(interp, compiler,
".sub externcall\n"
"  hello()\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Create extern sub and insert in parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = Parrot_new_string(interp, "parrot", 6, (const char *)NULL, 0);
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns, parrotname);
    hellosub = Parrot_sub_new_from_c_func(interp, (void (*)())& hello, "vJ");
    helloname = Parrot_new_string(interp, "hello", 5, (const char *)NULL, 0);
    Parrot_PMC_set_pmc_keyed_str(interp, parrotns, helloname, hellosub);

    /* Call it */
    Parrot_ext_call(interp, code, "->");

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello from C
OUTPUT

# Old tests, skipped al

SKIP: {

    skip('TT #306; many symbols not exported, embedding parrot fails', 1);

########################################################################

c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Single call" );

#include <stdio.h>
#include "parrot/embed.h"

static opcode_t *
run(PARROT_INTERP, int argc, cosnt char *argv[])
{
    const char *c_src = ".sub main :main\n" "    print \"ok\\n\"\n" ".end\n";

    Parrot_String *src, *smain;
    PMC *prog, *entry;
    opcode_t *dest;
    Parrot_String *error;

    /* get PIR compiler  - TODO API */
    PMC   *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir    = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp   = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        exit(EXIT_FAILURE);
    }

    /* compile source */
    prog = Parrot_compile_string(interp, pir, c_src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog");
        exit(EXIT_FAILURE);
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_find_global_cur(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
    return NULL;
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    const char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, (char **)argv);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
ok
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple Calls" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog");
        exit(EXIT_FAILURE);
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_find_global_cur(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print \"ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;

    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        exit(EXIT_FAILURE);
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    const char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, (char **) argv);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
ok
hola
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple 1st bad PIR" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_find_global_cur(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **) argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;

    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    const char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, argv);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
Pir compiler returned no prog
hola
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple 2nd bad PIR" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_find_global_cur(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;
    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c2_src, pir, argc, argv);
    compile_run(interp, c_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, argv);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
hola
Pir compiler returned no prog
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple bad PIR" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_find_global_cur(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src = ".sub main :main\n" "    print hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;
    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, argv);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
Pir compiler returned no prog
Pir compiler returned no prog
OUTPUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
