#! perl -w

use Parrot::Test tests => 3;

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
        #include <stdio.h>

        int main(int argc, char* argv[]) {
                printf("Hello, World!\n");
              exit(0);
        }
CODE
Hello, World!
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "direct internal_exception call");
        #include <parrot/parrot.h>
        #include <parrot/exceptions.h>

        int main(int argc, char* argv[]) {
                internal_exception(0, "Blow'd Up(tm)\n");
        }
CODE
Blow'd Up(tm)
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "run_native");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t* run_compiled(Parrot_Interp,
	opcode_t *cur_opcode, opcode_t *start_code);

int main(int argc, char* argv[])
{
    static opcode_t program_code[] = {
	22,	/* enternative op# - TODO use op_lib->op_code */
	0
    };
    struct Parrot_Interp *     interpreter;
    struct PackFile *          pf;

    interpreter = Parrot_new();
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    /*
     * these + the program code could be hidden in embed
     */
    pf = PackFile_new(0);
    pf->cur_cs = (struct PackFile_ByteCode *)
	(pf->PackFuncs[PF_BYTEC_SEG].new_seg)(pf, "code", 1);
    pf->byte_code = pf->cur_cs->base.data = program_code;
    pf->cur_cs->base.size = 2;
    Parrot_loadbc(interpreter, pf);
    /*
     * till here
     */

    run_native = run_compiled;
    runops(interpreter, 0);
    PIO_eprintf(interpreter, "back\n");
    Parrot_exit(0);
    return 0;
}

static opcode_t*
run_compiled(struct Parrot_Interp *interpreter, opcode_t *cur_opcode,
	opcode_t *start_code)
{
    /* tests go here */
    PIO_eprintf(interpreter, "ok\n");
    return 0;
}

CODE
ok
back
OUTPUT

1;
