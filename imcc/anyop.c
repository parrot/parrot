#include <stdarg.h>

#include "anyop.h"
#include "imc.h"
#include "../../include/parrot/platform.h"

static void * dl_handles[16] = { NULL }; /* try in main first. */
static int lastdl_handle = 1;
static struct Oplib oplibs[16];
static int lastlib = 0;

op_t NULLOP = { -1, -1 };

int
same_op(op_t a, op_t b) {
    return *(long *)&a == *(long *)&b;
}

void
op_load_file(const char * file) {
    void * handle;
    handle = Parrot_dlopen(file);
    if (handle == NULL) {
	fprintf(stderr, "Can't open %s: %s\n", file, Parrot_dlerror());
	exit(EX_SOFTWARE);
    }
    dl_handles[lastdl_handle++] = handle;
}

void
op_close_lib()
{
    int i;
    for (i = 0; i < lastlib; i++) {
	free(oplibs[i].name);
    }
    for (i = 0; i < lastdl_handle; i++) {
	if (dl_handles[i])
	    Parrot_dlclose(dl_handles[i]);
    }
}

void
op_load_lib(const char * oplib, int major, int minor, int rev) {
    char name[128];
    op_lib_t * (*loader)();
    int i;
    sprintf(name, "Parrot_DynOp_%s_%d_%d_%d", oplib, major, minor, rev);
    for (i = 0; i < lastdl_handle; i++) {
	loader = (op_lib_t *(*)())Parrot_dlsym(dl_handles[i], name);
	if (loader) {
	    oplibs[lastlib].oplib = loader();
	    oplibs[lastlib].name = strdup(name);
	    lastlib++;
	    return;
	}
    }
    if (loader == NULL) {
	fprintf(stderr, "Can't find loader %s: %s\n", name, Parrot_dlerror());
	exit(EX_SOFTWARE);
    }
}

op_t
op_find_exact(const char * name) {
    short i;
    for (i = 0; i < lastlib; i++) {
	short opnum = oplibs[i].oplib->op_code(name);
	if (opnum >= 0) {
	    op_t ret;
	    ret.lib = i;
	    ret.op = opnum;
	    return ret;
	}
    }
    return NULLOP;
}

static char argtypes[] = { '\0',
			   'I', 'N', 'P', 'S', 'P', 'P',
			   'I', 'N', 'P', 'S', 'P', 'P'};

const static char * argdirs[] = {"??", "in", "out", "inout" };

op_t
op_findv(const char * name, int nargs, char * type, short * dir) {
    int i, j;
    --type;
    --dir;
    for (i = 0; i < lastlib; i++) {
	op_lib_t * lib = oplibs[i].oplib;
	for (j = 0; j < lib->op_count; j++) {
	    op_info_t * info = &(lib->op_info_table[j]);
	    int cmp = strcmp(name, info->name);
	    int k;
	    op_t ret;
	    if (strcmp(name, info->full_name) == 0) {
		ret.lib = i;
		ret.op = j;
		return ret;
	    }

	    if (cmp != 0)
		continue;
/* 	    if (cmp < 0) */
/* 		continue; */
/* 	    if (cmp > 0) */
/* 		break;		/\* not in this lib *\/ */

	    if (info->arg_count != nargs + 1)
		continue;
	    for (k = 1; k <= nargs; k++) {
		if ((type[k] && argtypes[info->types[k]] != type[k])
		    || (dir[k] && dir[k] != info->dirs[k]))
		    break;
	    }
	    if (k > nargs) {
		ret.lib = i;
		ret.op = j;
		return ret;
	    }
	}
    }
    return NULLOP;
}

op_t
op_find(const char * name, int nargs, ...) {
    va_list ap;
    int i;
    char type[PARROT_MAX_ARGS];
    short dir[PARROT_MAX_ARGS];

    va_start(ap, nargs);
    for (i = 0; i < nargs; i++) {
	type[i] = (char)va_arg(ap, int);
	dir[i] = (char)va_arg(ap, int);
    }
    va_end(ap);

    return op_findv(name, nargs, type, dir);
}

void
op_dump() {
    int i, j;
    for (i = 0; i < lastlib; i++) {
	op_lib_t * lib = oplibs[i].oplib;
	for (j = 0; j < lib->op_count; j++) {
	    op_info_t * info = &(lib->op_info_table[j]);
	    fprintf(stderr, "%s: %s\n", info->name, info->full_name);
	}
    }
}

op_info_t *
op_info(op_t op) {
    return &(oplibs[op.lib].oplib->op_info_table[op.op]);
}

void
print_op_info(FILE * file, op_info_t * info) {
    char buf[128];
    int offset = 0;
    int i;
    for (i = 1; i < info->arg_count; i++) {
	offset += sprintf(buf + offset, "%s %c, ", argdirs[info->dirs[i]],
			  argtypes[info->types[i]]);
    }
    offset -= 2;
    buf[offset] = '\0';
    fprintf(file, "op: %s (%s)\n", info->name, buf);
}

/* op_func_t * */
/* op_func(op_t op) { */
/*     return &(oplibs[op.lib].oplib->op_func_table[op.op]); */
/* } */

#ifdef TEST

#include <stdio.h>
#include <getopt.h>

int
main(int argc, char * argv[]) {
    int i, c;
    extern char * optarg;
    extern int optind;
    char type[PARROT_MAX_ARGS];
    short dir[PARROT_MAX_ARGS];
    int nargs = 0;
    op_load_file("../../blib/lib/libparrot.so");
    op_load_file("../../rx_ops.so");
    while ((c = getopt(argc, argv, "l:a:")) != -1) {
	switch (c) {
	case 'l':
	    op_load_lib(optarg, 0, 0, 7);
	    break;

	case 'a':
	    if (*optarg == '0')
		type[nargs] = 0;
	    else
		type[nargs] = *optarg;
	    if (strcmp(optarg + 1, "i") == 0)
		dir[nargs] = PARROT_ARGDIR_IN;
	    else if (strcmp(optarg + 1, "o") == 0)
		dir[nargs] = PARROT_ARGDIR_OUT;
	    else if (strcmp(optarg + 1, "io") == 0)
		dir[nargs] = PARROT_ARGDIR_INOUT;
	    else
		dir[nargs] = PARROT_ARGDIR_IGNORED;
	    nargs++;
	    break;

	default:
	    exit(EX_SOFTWARE);
	};
    }
    for (i = optind; i < argc; i++) {
	op_t op = op_findv(argv[i], nargs, type, dir);
	if (!same_op(op, NULLOP)) {
	    fprintf(stderr, "Op %s (%d, %d)\n", argv[i],
		    op.lib, op.op);
	    print_op_info(stderr, op_info(op));
	} else {
	    fprintf(stderr, "NO Op %s\n", argv[i]);
	}
    }
    return 0;
}

#endif
