#include "parrot/parrot.h"

#include <stdarg.h>

INTVAL
Parrot_warn(struct Parrot_Interp *interpreter, INTVAL warnclass, char* message, ...) {
	STRING * targ;

	va_list args;
	va_start(args, message);

	if(!PARROT_WARNINGS_test(interpreter, warnclass)) {
		return 2;
	}

	if(!(targ=Parrot_vsprintf_c(interpreter, message, &args))) {
		return -1;
	}

	va_end(args);

	if(!(targ=Parrot_sprintf_c(interpreter, "%S at %S line %d.\n", targ, interpreter->current_file, interpreter->current_line))) {
		return -1;
	}

	if(PIO_write(interpreter, PIO_STDERR(interpreter), targ->bufstart, targ->bufused) < 0) {
		return -2;
	}
	else {
		return 1;
	}
}

INTVAL
Parrot_warn_s(struct Parrot_Interp *interpreter, INTVAL warnclass, STRING* message, ...) {
	STRING * targ;

	va_list args;
	va_start(args, message);

	if(!PARROT_WARNINGS_test(interpreter, warnclass)) {
		return 2;
	}

	if(!(targ=Parrot_vsprintf_s(interpreter, message, &args))) {
		return -1;
	}

	va_end(args);

	if(!(targ=Parrot_sprintf_c(interpreter, "%S at %S line %d.\n", targ, interpreter->current_file, interpreter->current_line))) {
		return -1;
	}

	if(PIO_write(interpreter, PIO_STDERR(interpreter), targ->bufstart, targ->bufused) < 0) {
		return -2;
	}
	else {
		return 1;
	}
}
