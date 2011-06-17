#! perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use File::Spec::Functions;
use Parrot::Test::Util 'create_tempfile';

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile(qw/src parrot_config.o/);

plan tests => 6;

=head1 NAME

t/src/embed/api.t - Parrot's embedding API

=head1 SYNOPSIS

    % prove t/src/embed/api.t

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

#c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Test set_std_handles');
#
##include <stdio.h>
##include <stdlib.h>
##include <string.h>
##include "parrot/parrot.h"
##include "parrot/api.h"
##include "parrot/embed.h"
##include "parrot/extend.h"
#
#static void fail(const char *msg);
#static Parrot_String createstring(Parrot_Interp interp, const char * value);
#
#static void fail(const char *msg)
#{
#    fprintf(stderr, "failed: %s\n", msg);
#    exit(EXIT_FAILURE);
#}
#
#static Parrot_String createstring(Parrot_Interp interp, const char * value)
#{
#    return Parrot_new_string(interp, value, strlen(value), (const char*)NULL, 0);
#}
#
#
#int main(int argc, const char **argv)
#{
#
#    char * c_outstr = NULL;
#    Parrot_Init_Args *initargs = NULL;
#    Parrot_PMC interpmc = NULL;
#    Parrot_PMC p_str = NULL, p_keyedstr = NULL;
#    Parrot_String s_teststr = NULL, s_outstr = NULL;
#
#    FILE * stdout = fopen("/tmp/stdout", "w");
#    /*FILE * stdin  = fopen("/tmp/stdin", "r");
#    FILE * stderr = fopen("/tmp/stdin", "w");*/
#
#    GET_INIT_STRUCT(initargs);
#    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);
#
#    Parrot_api_set_stdhandles(interpmc, stdout, PIO_INVALID_HANDLE, PIO_INVALID_HANDLE);
#    /* Now run a simple PIR program that outputs some text, and make sure that it is
#       writen to the file instead of stdout etc */
#    puts("Done");
#    return 0;
#
#}
#CODE
#OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "get set compiler" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"

int main(int argc, const char **argv)
{
    char * c_outstr = NULL;
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC apmc = NULL;
    Parrot_PMC bpmc = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL;
    int a;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "PIR", &s_teststr);
    Parrot_api_load_language(interpmc, s_teststr);

    Parrot_api_get_compiler(interpmc, s_teststr, &apmc);
    Parrot_api_set_compiler(interpmc, s_teststr, apmc);
    Parrot_api_get_compiler(interpmc, s_teststr, &bpmc);

    printf ("%s\n", apmc == bpmc ? "True" : "False!");
    puts("Done");
    return 0;
}
CODE
True
Done
OUTPUT

my (undef, $temp_pir)  = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
my (undef, $temp_pbc)  = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
open my $PIR_FILE, ">", $temp_pir;
print $PIR_FILE <<'PIR_CODE';
.sub main :main
    .param pmc args
    say "executed"
.end
PIR_CODE

c_output_is( linedirective(__LINE__) . <<"CODE", << 'OUTPUT', "Parrot_api_serialize_bytecode_pmc" );
#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"
#include "imcc/api.h"

int main(void) {
    Parrot_PMC interp;
    Parrot_PMC bytecode;
    Parrot_PMC pir_compiler;
    Parrot_String pbc_s;
    Parrot_String filename;
    Parrot_Int length;
    char * pbc_c;
    FILE * file;

    Parrot_api_make_interpreter(NULL, 0, NULL, &interp);

    /* Step 1: Take the PIR, and compile it to PBC. Write to file */
    imcc_get_pir_compreg_api(interp, 1, &pir_compiler);
    Parrot_api_string_import(interp, "$temp_pir", &filename);
    Parrot_api_toggle_gc(interp, 0);
    imcc_compile_file_api(interp, pir_compiler, filename, &bytecode);

    Parrot_api_serialize_bytecode_pmc(interp, bytecode, &pbc_s);
    Parrot_api_toggle_gc(interp, 1);
    Parrot_api_string_export_ascii(interp, pbc_s, &pbc_c);
    Parrot_api_string_byte_length(interp, pbc_s, &length);
    file = fopen("$temp_pbc", "w");
    fwrite(pbc_c, length, 1, file);
    fclose(file);

    /* Step 2: Now load in the PIR and execute it */
    Parrot_api_string_import(interp, "$temp_pbc", &filename);
    Parrot_api_load_bytecode_file(interp, filename, &bytecode);
    Parrot_api_run_bytecode(interp, bytecode, NULL);
    return 0;
}
CODE
executed
OUTPUT

(undef, $temp_pir)  = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
open $PIR_FILE, ">", $temp_pir;
print $PIR_FILE <<'PIR_CODE';
.sub main :main
    .param pmc args
    $P0 = newclass "MyObject"
.end

.namespace ["MyObject"]

.sub "MyMethod" :method
    say "executed MyMethod"
.end
PIR_CODE

c_output_is( linedirective(__LINE__) . <<"CODE", << 'OUTPUT', "Parrot_api_set_runcore: invalid runcore");
#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"
#include "imcc/api.h"

int main(void) {
    Parrot_PMC interp;

    Parrot_api_make_interpreter(NULL, 0, NULL, &interp);
    /* This should throw an exception */
    Parrot_api_set_runcore(interp, "junk", 0);
    return 0;
}
CODE
OUTPUT

c_output_is( linedirective(__LINE__) . <<"CODE", << 'OUTPUT', "Parrot_api_set_runcore");
#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"
#include "imcc/api.h"

int main(void) {
    Parrot_PMC interp;
    Parrot_PMC pir_compiler;

    Parrot_api_make_interpreter(NULL, 0, NULL, &interp);

    Parrot_api_debug_flag(interp, 0x01, 0);
    Parrot_api_flag(interp, 0x01, 0);

    Parrot_api_set_runcore(interp, "gcdebug", 0);
    Parrot_api_set_runcore(interp, "exec", 0);

    return 0;
}
CODE
OUTPUT

c_output_is( linedirective(__LINE__) . <<"CODE", << 'OUTPUT', "Parrot_api_(un)wrap_pointer");
#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"
#include "imcc/api.h"

int main(void) {
    Parrot_Int wrap1, wrap2;
    Parrot_PMC interp;
    Parrot_PMC pir_compiler;

    Parrot_api_make_interpreter(NULL, 0, NULL, &interp);

    wrap1 = Parrot_api_wrap_pointer(interp, NULL, 0, &pir_compiler);
    wrap2 = Parrot_api_wrap_pointer(interp, NULL, 1, &pir_compiler);

    /* Need a Ptr or PtrBuf for this
    wrap = Parrot_api_unwrap_pointer(interp, pir_compiler, ptr, 0);
    */
    return 0;
}
CODE
OUTPUT

c_output_is( linedirective(__LINE__) . <<"CODE", << 'OUTPUT', "Parrot_api_reset_call_signature" );
#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"
#include "imcc/api.h"

int main(void) {
    Parrot_PMC interp;
    Parrot_PMC bytecode;
    Parrot_PMC pir_compiler;
    Parrot_String filename;
    int i;
    Parrot_String signature_s;
    Parrot_String callcontext_s, myobject_s, mymethod_s;
    Parrot_PMC callcontext_sp, myobject_sp;
    Parrot_PMC callcontext_class, myobject_class;
    Parrot_PMC callcontext, myobject, mymethod;

    Parrot_api_make_interpreter(NULL, 0, NULL, &interp);
    Parrot_api_set_runcore(interp, "gcdebug", 0);
    Parrot_api_string_import(interp, "$temp_pir", &filename);
    Parrot_api_toggle_gc(interp, 0);
    imcc_get_pir_compreg_api(interp, 1, &pir_compiler);
    imcc_compile_file_api(interp, pir_compiler, filename, &bytecode);
    Parrot_api_run_bytecode(interp, bytecode, NULL);

    Parrot_api_set_warnings(interp, 0);
    Parrot_api_add_library_search_path(interp, ".");
    Parrot_api_add_dynext_search_path(interp, ".");

    Parrot_api_string_import_ascii(interp, "Pi->", &signature_s);

    Parrot_api_string_import_ascii(interp, "CallContext", &callcontext_s);
    Parrot_api_pmc_box_string(interp, callcontext_s, &callcontext_sp);
    Parrot_api_pmc_get_class(interp, callcontext_sp, &callcontext_class);
    Parrot_api_pmc_new_from_class(interp, callcontext_class, NULL, &callcontext);

    Parrot_api_string_import_ascii(interp, "MyObject", &myobject_s);
    Parrot_api_pmc_box_string(interp, myobject_s, &myobject_sp);
    Parrot_api_pmc_get_class(interp, myobject_sp, &myobject_class);
    Parrot_api_pmc_new_from_class(interp, myobject_class, NULL, &myobject);

    Parrot_api_string_import_ascii(interp, "MyMethod", &mymethod_s);
    Parrot_api_pmc_find_method(interp, myobject, mymethod_s, &mymethod);

    for (i = 0; i < 5; i++) {
        Parrot_api_pmc_set_string(interp, callcontext, signature_s);
        Parrot_api_pmc_set_keyed_int(interp, callcontext, 0, myobject);
        Parrot_api_pmc_invoke(interp, mymethod, callcontext);
        Parrot_api_reset_call_signature(interp, callcontext);
    }
    return 0;
}
CODE
executed MyMethod
executed MyMethod
executed MyMethod
executed MyMethod
executed MyMethod
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

