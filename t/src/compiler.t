#! perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;

=head1 NAME

t/src/compiler.t - Compile and run a PIR program from C.

=head1 SYNOPSIS

    % prove t/src/compiler.t

=head1 DESCRIPTION

Show steps to run a program from C. Functionality should be
gathered in some API calls..

=cut

c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Single call" );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static opcode_t *
run(PARROT_INTERP, int argc, char *argv[])
{
    const char *c_src = ".sub main :main\n" "    print \"ok\\n\"\n" ".end\n";

    STRING *src, *smain;
    PMC *prog, *entry;
    opcode_t *dest;
    STRING *error;

    /* get PIR compiler  - TODO API */
    PMC   *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    STRING *pir    = const_string(interp, "PIR");
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
    dod_register_pmc(interp, prog);

    /* locate function to run */
    smain = const_string(interp, "main");
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
main(int margc, char *margv[])
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
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static void
compile_run(PARROT_INTERP, const char *src, STRING *type, int argc,
            char *argv[])
{
    STRING   *smain;
    PMC      *entry;
    STRING   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog");
        exit(EXIT_FAILURE);
    }

    /* keep eval PMC alive */
    dod_register_pmc(interp, prog);

    /* locate function to run */
    smain = const_string(interp, "main");
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
run(PARROT_INTERP, int argc, char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print \"ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    STRING *src, *smain;

    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    STRING *pir     = const_string(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        exit(EXIT_FAILURE);
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, char *margv[])
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
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static void
compile_run(PARROT_INTERP, const char *src, STRING *type, int argc,
            char *argv[])
{
    STRING   *smain;
    PMC      *entry;
    STRING   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    dod_register_pmc(interp, prog);

    /* locate function to run */
    smain = const_string(interp, "main");
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
run(PARROT_INTERP, int argc, char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    STRING *src, *smain;

    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    STRING *pir     = const_string(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, char *margv[])
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
hola
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple 2nd bad PIR" );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static void
compile_run(PARROT_INTERP, const char *src, STRING *type, int argc,
            char *argv[])
{
    STRING   *smain;
    PMC      *entry;
    STRING   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    dod_register_pmc(interp, prog);

    /* locate function to run */
    smain = const_string(interp, "main");
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
run(PARROT_INTERP, int argc, char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    STRING *src, *smain;
    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    STRING *pir     = const_string(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c2_src, pir, argc, argv);
    compile_run(interp, c_src, pir, argc, argv);
}

int
main(int margc, char *margv[])
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
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static void
compile_run(PARROT_INTERP, const char *src, STRING *type, int argc,
            char *argv[])
{
    STRING   *smain;
    PMC      *entry;
    STRING   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    dod_register_pmc(interp, prog);

    /* locate function to run */
    smain = const_string(interp, "main");
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
run(PARROT_INTERP, int argc, char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src = ".sub main :main\n" "    print hola\\n\"\n" ".end\n";

    STRING *src, *smain;
    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    STRING *pir     = const_string(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, char *margv[])
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
