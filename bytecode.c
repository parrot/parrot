#include "parrot.h"
#define GRAB_IV(x) *((IV*)*x)++

static int
check_magic(void** program_code) {
    return (GRAB_IV(program_code) == PARROT_MAGIC);
}

static void
read_constants_table(void** program_code)
{
    IV len = GRAB_IV(program_code);
    /* For now, just skip over it */
    ((IV*)*program_code) += len;
}

static void
read_fixup_table(void** program_code)
{
    IV len = GRAB_IV(program_code);
    /* For now, just skip over it */
    ((IV*)*program_code) += len;
}

void *
init_bytecode(void* program_code) 
{
    if (!check_magic(&program_code)) {
        printf("This isn't Parrot bytecode!\n");
        exit(1);
    }

    read_constants_table(&program_code);
    read_fixup_table(&program_code);
    return program_code;
}
