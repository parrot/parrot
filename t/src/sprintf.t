#! perl -w

use Parrot::Test tests => 1;

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
        #include <stdio.h>
        #include "parrot/parrot.h"
        #include "parrot/embed.h"

        int main(int argc, char* argv[]) {
	    int dummy_var;
	    STRING *S;
	    struct Parrot_Interp *     interpreter;

	    interpreter = Parrot_new();
	    Parrot_init(interpreter, (void*) &dummy_var);
	    interpreter = make_interpreter(NO_FLAGS);

	    S = Parrot_sprintf_c(interpreter, "Hello, %s\n", "Parrot!");
	    printf(S->strstart);
	    S = Parrot_sprintf_c(interpreter, "PerlHash[0x%x]\n", 256);
	    printf(S->strstart);
	    S = Parrot_sprintf_c(interpreter, "PerlHash[0x%lx]\n", 256);
	    printf(S->strstart);
	    S = Parrot_sprintf_c(interpreter, "Hello, %.2s!\n", "Parrot");
	    printf(S->strstart);
        }
CODE
Hello, Parrot!
PerlHash[0x100]
PerlHash[0x100]
Hello, Pa!
OUTPUT


