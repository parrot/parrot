/*
Copyright (C) 2005-2010, Parrot Foundation.

=head1 NAME

pbc_merge - Merge multiple Parrot bytecode (PBC) files into
                  a single PBC file.

=head1 SYNOPSIS

 pbc_merge -o out.pbc input1.pbc input2.pbc ...

=head1 DESCRIPTION

This program takes two or more PBC files and produces a single
merged output PBC file with a single fix-up table and constants
table.

=head2 Command-Line Options

=over 4

=item C<-o out.pbc>

The name of the PBC file to produce, containing the merged
segments from the input PBC files.

=back

=head2 Functions

=over 4

=cut

*/

#define PARROT_IN_EXTENSION

#include "parrot/parrot.h"
#include "parrot/longopt.h"
#include "parrot/oplib/ops.h"
#include "parrot/oplib/core_ops.h"
#include "pmc/pmc_sub.h"
#include "parrot/embed.h"

extern const unsigned char * Parrot_get_config_hash_bytes(void);
extern int Parrot_get_config_hash_length(void);

/* This struct describes an input file. */
typedef struct pbc_merge_input {
    const char *filename;       /* name of the input file */
    PackFile   *pf;             /* loaded packfile struct */
    opcode_t    code_start;     /* where the bytecode is located in the merged
    packfile */
    struct {
        opcode_t  const_start;  /* where the const table is located within the
                                   merged table */
        opcode_t *const_map;    /* map constants from input files to their location
                                   in the output file */
    } num, str, pmc;
} pbc_merge_input;

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_DOES_NOT_RETURN
static void help(PARROT_INTERP)
        __attribute__nonnull__(1);

static void pbc_fixup_bytecode(PARROT_INTERP,
    ARGMOD(pbc_merge_input **inputs),
    int num_inputs,
    ARGMOD(PackFile_ByteCode *bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*inputs)
        FUNC_MODIFIES(*bc);

static void pbc_fixup_constants(PARROT_INTERP,
    ARGMOD(pbc_merge_input **inputs),
    int num_inputs)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*inputs);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile* pbc_merge_begin(PARROT_INTERP,
    ARGMOD(pbc_merge_input **inputs),
    int num_inputs)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*inputs);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_ByteCode* pbc_merge_bytecode(PARROT_INTERP,
    ARGMOD(pbc_merge_input **inputs),
    int num_inputs,
    ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*inputs)
        FUNC_MODIFIES(*pf);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_ConstTable* pbc_merge_constants(PARROT_INTERP,
    ARGMOD(pbc_merge_input **inputs),
    int num_inputs,
    ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*inputs)
        FUNC_MODIFIES(*pf);

static void pbc_merge_debugs(PARROT_INTERP,
    ARGMOD(pbc_merge_input **inputs),
    int num_inputs,
    ARGMOD(PackFile_ByteCode *bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*inputs)
        FUNC_MODIFIES(*bc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile* pbc_merge_loadpbc(PARROT_INTERP,
    ARGIN(const char *fullname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void pbc_merge_write(PARROT_INTERP,
    ARGMOD(PackFile *pf),
    ARGIN(const char *filename))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pf);

#define ASSERT_ARGS_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pbc_fixup_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(inputs) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_pbc_fixup_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(inputs))
#define ASSERT_ARGS_pbc_merge_begin __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(inputs))
#define ASSERT_ARGS_pbc_merge_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(inputs) \
    , PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_pbc_merge_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(inputs) \
    , PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_pbc_merge_debugs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(inputs) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_pbc_merge_loadpbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(fullname))
#define ASSERT_ARGS_pbc_merge_write __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf) \
    , PARROT_ASSERT_ARG(filename))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static void help(PARROT_INTERP)>

Print out the user help info.

=cut

*/

PARROT_DOES_NOT_RETURN
static void
help(PARROT_INTERP)
{
    printf("pbc_merge - merge multiple parrot bytecode files into one\n");
    printf("Usage:\n");
    printf("   pbc_merge -o out.pbc file1.pbc file2.pbc ...\n\n");
    Parrot_x_exit(interp, 0);
}

/*

=item C<static PackFile* pbc_merge_loadpbc(PARROT_INTERP, const char *fullname)>

This function loads a PBC file and unpacks it. We can't
use Parrot_pbc_read because that is specified to also
fixup the segments, which we don't want.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile*
pbc_merge_loadpbc(PARROT_INTERP, ARGIN(const char *fullname))
{
    ASSERT_ARGS(pbc_merge_loadpbc)
    INTVAL program_size, wanted;
    char *program_code;
    PackFile *pf;
    FILE * io = NULL;
    INTVAL is_mapped = 0;
    size_t chunk_size;
    char *cursor;
    INTVAL read_result;

    /* Check the file exists. */
    STRING * const fs = Parrot_str_new_init(interp, fullname,
            strlen(fullname), Parrot_default_encoding_ptr, 0);
    if (!Parrot_file_stat_intval(interp, fs, STAT_EXISTS)) {
        Parrot_io_eprintf(interp, "PBC Merge: Can't stat %s, code %i.\n",
                fullname, errno);
        Parrot_x_exit(interp, 1);
    }

    /* Get program size. */
    program_size = Parrot_file_stat_intval(interp, fs, STAT_FILESIZE);

    /* Attempt to open file and handle any errors. */
    io = fopen(fullname, "rb");
    if (!io) {
        Parrot_io_eprintf(interp, "PBC Merge: Can't open %s, code %i.\n",
                fullname, errno);
        Parrot_x_exit(interp, 1);
    }

    /* Read in program. Nabbed from Parrot_pbc_read. */
    chunk_size   = program_size > 0 ? program_size : 1024;
    program_code = mem_gc_allocate_n_typed(interp, chunk_size, char);
    wanted       = program_size;
    program_size = 0;
    cursor       = (char *)program_code;

    while ((read_result = fread(cursor, 1, chunk_size, io)) > 0) {
        program_size += read_result;
        if (program_size == wanted)
            break;
        chunk_size   = 1024;
        program_code = mem_gc_realloc_n_typed(interp, program_code,
                program_size + chunk_size, char);

        cursor = (char *)program_code + program_size;
    }

    if (read_result < 0) {
        Parrot_io_eprintf(interp,
                "PBC Merge: Problem reading packfile from PIO.\n");
        Parrot_x_exit(interp, 1);
    }
    fclose(io);

    /* Now that we have the bytecode, let's unpack it. */
    pf = PackFile_new(interp, is_mapped);
    if (!PackFile_unpack(interp,
                pf, (opcode_t *)program_code, program_size)) {
        Parrot_io_eprintf(interp, "PBC Merge: Can't unpack packfile %s.\n",
                fullname);
        Parrot_x_exit(interp, 1);
    }

    /* Return the packfile. */
    return pf;
}


static void
ensure_libdep(PARROT_INTERP, PackFile_ByteCode *bc, STRING *lib) {
    size_t i;
    for (i = 0; i < bc->n_libdeps; i++) {
        if (Parrot_str_equal(interp, bc->libdeps[i], lib)) {
            return;
        }
    }

    /* not found, add to libdeps list */
    bc->libdeps = mem_gc_realloc_n_typed_zeroed(interp, bc->libdeps, bc->n_libdeps + 1,
                                                bc->n_libdeps, STRING *);
    bc->libdeps[bc->n_libdeps] = lib;
    bc->n_libdeps++;
}

/*

=item C<static PackFile_ByteCode* pbc_merge_bytecode(PARROT_INTERP,
pbc_merge_input **inputs, int num_inputs, PackFile *pf)>

This function merges the bytecode from the input packfiles, storing the
offsets that each bit of bytecode now exists at.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_ByteCode*
pbc_merge_bytecode(PARROT_INTERP, ARGMOD(pbc_merge_input **inputs),
                   int num_inputs, ARGMOD(PackFile *pf))
{
    ASSERT_ARGS(pbc_merge_bytecode)
    int i;
    size_t j;
    opcode_t *bc    = mem_gc_allocate_typed(interp, opcode_t);
    opcode_t cursor = 0;

    /* Add a bytecode segment. */
    PackFile_ByteCode * const bc_seg =
        (PackFile_ByteCode *)PackFile_Segment_new_seg(interp,
            &pf->directory, PF_BYTEC_SEG, BYTE_CODE_SEGMENT_NAME, 1);

    if (!bc_seg) {
        Parrot_io_eprintf(interp,
            "PBC Merge: Error creating bytecode segment.");
        Parrot_x_exit(interp, 1);
    }

    /* Loop over input files. */
    for (i = 0; i < num_inputs; ++i) {
        /* Get the bytecode segment from the input file. */
        PackFile_ByteCode * const in_seg = inputs[i]->pf->cur_cs;
        if (in_seg == NULL) {
            Parrot_io_eprintf(interp,
                "PBC Merge: Cannot locate bytecode segment in %s",
                inputs[i]->filename);
            Parrot_x_exit(interp, 1);
        }

        /* Re-allocate the current buffer. */
        bc = mem_gc_realloc_n_typed(interp, bc, cursor + in_seg->base.size, opcode_t);

        /* Copy data and store cursor. */
        memcpy(bc + cursor, in_seg->base.data,
            in_seg->base.size * sizeof (opcode_t));
        inputs[i]->code_start = cursor;

        /* Update cursor. */
        cursor += in_seg->base.size;

        /* Update libdeps. */
        for (j = 0; j < in_seg->n_libdeps; j++)
            ensure_libdep(interp, bc_seg, in_seg->libdeps[j]);

        /* Update main_sub. */
        if (in_seg->main_sub >= 0) {
            if (bc_seg->main_sub < 0)
                bc_seg->main_sub = in_seg->main_sub + inputs[i]->pmc.const_start;
            /*
            XXX hide incessant warning messages triggered by implicit :main
            this can be added when TT #1704 is implemented

            else
                Parrot_io_eprintf(interp,
                    "PBC Merge: multiple :main subs encountered, using first "
                    "and ignoring sub found in `%s'",
                    inputs[i]->filename);
            */
        }
    }

    /* Stash produced bytecode. */
    bc_seg->base.data = bc;
    bc_seg->base.size = cursor;
    bc_seg->base.name = Parrot_str_new_constant(interp, "MERGED");
    return bc_seg;
}


/*

=item C<static PackFile_ConstTable* pbc_merge_constants(PARROT_INTERP,
pbc_merge_input **inputs, int num_inputs, PackFile *pf)>

This function merges the constants tables from the input PBC files.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_ConstTable*
pbc_merge_constants(PARROT_INTERP, ARGMOD(pbc_merge_input **inputs),
                    int num_inputs, ARGMOD(PackFile *pf))
{
    ASSERT_ARGS(pbc_merge_constants)

    FLOATVAL  *num_constants = mem_gc_allocate_typed(interp, FLOATVAL);
    STRING   **str_constants = mem_gc_allocate_typed(interp, STRING *);
    PMC      **pmc_constants = mem_gc_allocate_typed(interp, PMC *);

    opcode_t num_cursor = 0;
    opcode_t str_cursor = 0;
    opcode_t pmc_cursor = 0;

    int      i, j;

    /* Add a constant table segment. */
    PackFile_ConstTable * const const_seg = (PackFile_ConstTable *)
        PackFile_Segment_new_seg(interp, &pf->directory,
        PF_CONST_SEG, CONSTANT_SEGMENT_NAME, 1);

    if (const_seg == NULL) {
        Parrot_io_eprintf(interp,
            "PBC Merge: Error creating constant table segment.");
        Parrot_x_exit(interp, 1);
    }

    /* Loop over input files. */
    for (i = 0; i < num_inputs; ++i) {

        /* Get the constant table segment from the input file. */
        PackFile_ConstTable * const in_seg = inputs[i]->pf->cur_cs->const_table;
        if (in_seg == NULL) {
            Parrot_io_eprintf(interp,
                "PBC Merge: Cannot locate constant table segment in %s\n",
                inputs[i]->filename);
            Parrot_x_exit(interp, 1);
        }

        /* Store cursor as position where constant table starts. */
        inputs[i]->num.const_start = num_cursor;
        inputs[i]->str.const_start = str_cursor;
        inputs[i]->pmc.const_start = pmc_cursor;

        /* Allocate space for the constant list, provided we have some. */
        if (in_seg->num.const_count > 0)
            num_constants = mem_gc_realloc_n_typed(interp, num_constants,
                                num_cursor + in_seg->num.const_count, FLOATVAL);
        if (in_seg->str.const_count > 0)
            str_constants = mem_gc_realloc_n_typed(interp, str_constants,
                                str_cursor + in_seg->str.const_count, STRING *);
        if (in_seg->pmc.const_count > 0)
            pmc_constants = mem_gc_realloc_n_typed(interp, pmc_constants,
                                pmc_cursor + in_seg->pmc.const_count, PMC *);

        /* Loop over the constants and copy them to the output PBC. */
        for (j = 0; j < in_seg->num.const_count; j++) {
            num_constants[num_cursor] = in_seg->num.constants[j];
            inputs[i]->num.const_map[j] = num_cursor;
            num_cursor++;
        }

        for (j = 0; j < in_seg->str.const_count; j++) {
            str_constants[str_cursor] = in_seg->str.constants[j];
            inputs[i]->str.const_map[j] = str_cursor;
            str_cursor++;
        }

        for (j = 0; j < in_seg->pmc.const_count; j++) {
            pmc_constants[pmc_cursor] = in_seg->pmc.constants[j];
            inputs[i]->pmc.const_map[j] = pmc_cursor;
            pmc_cursor++;
        }
    }

    /* Stash merged constants table and count and return the new segment. */
    const_seg->num.const_count = num_cursor;
    const_seg->num.constants   = num_constants;
    const_seg->str.const_count = str_cursor;
    const_seg->str.constants   = str_constants;
    const_seg->pmc.const_count = pmc_cursor;
    const_seg->pmc.constants   = pmc_constants;
    return const_seg;
}


/*

=item C<static void pbc_merge_debugs(PARROT_INTERP, pbc_merge_input **inputs,
int num_inputs, PackFile_ByteCode *bc)>

This function merges the debug segments from the input PBC files.

=cut

*/

static void
pbc_merge_debugs(PARROT_INTERP, ARGMOD(pbc_merge_input **inputs),
                 int num_inputs, ARGMOD(PackFile_ByteCode *bc))
{
    ASSERT_ARGS(pbc_merge_debugs)
    PackFile_Debug                 *debug_seg;
    opcode_t                       *lines    = mem_gc_allocate_typed(interp,
                                                opcode_t);
    PackFile_DebugFilenameMapping *mappings =
        mem_gc_allocate_typed(interp, PackFile_DebugFilenameMapping);

    opcode_t num_mappings = 0;
    opcode_t num_lines    = 0;

    int i;

    /* We need to merge both the mappings and the list of line numbers.
       The line numbers can just be concatenated. The mappings must have
       their offsets fixed up. */
    for (i = 0; i < num_inputs; ++i) {
        const PackFile_Debug * const in_seg = inputs[i]->pf->cur_cs->debugs;
        int j;

        /* Concatenate line numbers. */
        lines = mem_gc_realloc_n_typed(interp, lines,
                num_lines + in_seg->base.size, opcode_t);

        memcpy(lines + num_lines, in_seg->base.data,
            in_seg->base.size * sizeof (opcode_t));

        /* Concatenate mappings. */
        mappings = mem_gc_realloc_n_typed(interp, mappings,
                num_mappings + in_seg->num_mappings,
                PackFile_DebugFilenameMapping);

        for (j = 0; j < in_seg->num_mappings; ++j) {
            PackFile_DebugFilenameMapping *mapping = mappings + num_mappings + j;

            STRUCT_COPY_FROM_STRUCT(mapping, in_seg->mappings[j]);
            mapping->offset   += num_lines;
            mapping->filename += inputs[i]->str.const_start;
        }

        num_lines    += in_seg->base.size - 1;
        num_mappings += in_seg->num_mappings;
    }

    /* Create merged debug segment. Replace created data and mappings
       with merged ones we have created. */
    debug_seg = Parrot_new_debug_seg(interp, bc, num_lines);
    mem_gc_free(interp, debug_seg->base.data);
    debug_seg->base.data    = lines;
    mem_gc_free(interp, debug_seg->mappings);

    debug_seg->mappings     = mappings;
    debug_seg->num_mappings = num_mappings;
}


static opcode_t
bytecode_remap_op(PARROT_INTERP, PackFile *pf, opcode_t op) {
    int i;
    op_info_t         *info    = pf->cur_cs->op_info_table[op];
    op_lib_t          *lib     = info->lib;
    op_func_t         op_func  = pf->cur_cs->op_func_table[op];
    PackFile_ByteCode *bc      = interp->code;
    PackFile_ByteCode_OpMappingEntry *om;

    for (i = 0; i < bc->op_mapping.n_libs; i++) {
        if (lib == bc->op_mapping.libs[i].lib) {
            om = &bc->op_mapping.libs[i];
            goto found_lib;
        }
    }

    /* library not yet mapped */
    bc->op_mapping.n_libs++;
    bc->op_mapping.libs = mem_gc_realloc_n_typed_zeroed(interp, bc->op_mapping.libs,
                            bc->op_mapping.n_libs, bc->op_mapping.n_libs - 1,
                            PackFile_ByteCode_OpMappingEntry);

    /* initialize a new lib entry */
    om            = &bc->op_mapping.libs[bc->op_mapping.n_libs - 1];
    om->lib       = lib;
    om->n_ops     = 0;
    om->lib_ops   = mem_gc_allocate_n_zeroed_typed(interp, 0, opcode_t);
    om->table_ops = mem_gc_allocate_n_zeroed_typed(interp, 0, opcode_t);

  found_lib:
    for (i = 0; i < om->n_ops; i++) {
        if (bc->op_func_table[om->table_ops[i]] == op_func)
            return om->table_ops[i];
    }

    /* op not yet mapped */
    bc->op_count++;
    bc->op_func_table =
        mem_gc_realloc_n_typed_zeroed(interp, bc->op_func_table, bc->op_count, bc->op_count - 1,
                                        op_func_t);
    bc->op_func_table[bc->op_count - 1] = op_func;
    bc->op_info_table =
        mem_gc_realloc_n_typed_zeroed(interp, bc->op_info_table, bc->op_count, bc->op_count - 1,
                                        op_info_t *);
    bc->op_info_table[bc->op_count - 1] = info;

    /* initialize new op mapping */
    om->n_ops++;

    om->lib_ops =
        mem_gc_realloc_n_typed_zeroed(interp, om->lib_ops, om->n_ops, om->n_ops - 1, opcode_t);
    for (i = 0; i < lib->op_count; i++) {
        if (lib->op_func_table[i] == op_func) {
            om->lib_ops[om->n_ops - 1] = i;
            break;
        }
    }
    PARROT_ASSERT(om->lib_ops[om->n_ops - 1] || !i);

    om->table_ops =
        mem_gc_realloc_n_typed_zeroed(interp, om->table_ops, om->n_ops, om->n_ops - 1, opcode_t);
    om->table_ops[om->n_ops - 1] = bc->op_count - 1;

    return bc->op_count - 1;
}

/*

=item C<static void pbc_fixup_bytecode(PARROT_INTERP, pbc_merge_input **inputs,
int num_inputs, PackFile_ByteCode *bc)>

Fixup bytecode. This includes correcting pointers into the constant table
and updating the ops mapping.

=cut

*/

static void
pbc_fixup_bytecode(PARROT_INTERP, ARGMOD(pbc_merge_input **inputs),
                     int num_inputs, ARGMOD(PackFile_ByteCode *bc))
{
    ASSERT_ARGS(pbc_fixup_bytecode)
    int        cur_arg;
    opcode_t  *op_ptr;
    opcode_t  *ops       = bc->base.data;
    opcode_t   cur_op    = 0;
    int        cur_input = 0;
    op_lib_t  *core_ops  = PARROT_GET_CORE_OPLIB(interp);

    /* Loop over the ops in the merged bytecode. */
    while (cur_op < (opcode_t)bc->base.size) {
        op_info_t *op;
        opcode_t   op_num;
        op_func_t  op_func;

        /* Keep track of the current input file. */
        if (cur_input + 1 < num_inputs &&
            cur_op >= inputs[cur_input + 1]->code_start)
            ++cur_input;

        /* Get info about this op, remap it, and jump over it. */
        op_num = ops[cur_op] = bytecode_remap_op(interp, inputs[cur_input]->pf, ops[cur_op]);
        op     = bc->op_info_table[op_num];
        op_ptr = ops + cur_op;
        ++cur_op;

        /* Loop over the arguments. */
        for (cur_arg = 1; cur_arg < op->op_count; ++cur_arg) {
            /* Pick out any indexes into the constant table and correct them. */
            switch (op->types[cur_arg - 1]) {
                case PARROT_ARG_NC:
                    ops[cur_op] = inputs[cur_input]->num.const_map[ ops[cur_op] ];
                    break;

                case PARROT_ARG_SC:
                case PARROT_ARG_NAME_SC:
                    ops[cur_op] = inputs[cur_input]->str.const_map[ ops[cur_op] ];
                    break;

                case PARROT_ARG_PC:
                case PARROT_ARG_KC:
                    ops[cur_op] = inputs[cur_input]->pmc.const_map[ ops[cur_op] ];
                    break;

                default:
                    break;
            }

            /* Move along the bytecode array. */
            ++cur_op;
        }

        /* Handle special case variable argument opcodes. */
        op_func = interp->code->op_func_table[op_num];
        if (op_func == core_ops->op_func_table[PARROT_OP_set_args_pc]    ||
            op_func == core_ops->op_func_table[PARROT_OP_get_results_pc] ||
            op_func == core_ops->op_func_table[PARROT_OP_get_params_pc]  ||
            op_func == core_ops->op_func_table[PARROT_OP_set_returns_pc]) {
            /* Get the signature. */
            PMC * const sig = bc->const_table->pmc.constants[op_ptr[1]];

            /* Loop over the arguments to locate any that need a fixup. */
            const int sig_items = VTABLE_elements(interp, sig);
            for (cur_arg = 0; cur_arg < sig_items; ++cur_arg) {
                switch (VTABLE_get_integer_keyed_int(interp, sig, cur_arg)) {
                    case PARROT_ARG_NC:
                        ops[cur_op] = inputs[cur_input]->num.const_map[ ops[cur_op] ];
                        break;

                    case PARROT_ARG_SC:
                    case PARROT_ARG_NAME_SC:
                        ops[cur_op] = inputs[cur_input]->str.const_map[ ops[cur_op] ];
                        break;

                    case PARROT_ARG_PC:
                    case PARROT_ARG_KC:
                        ops[cur_op] = inputs[cur_input]->pmc.const_map[ ops[cur_op] ];
                        break;

                    default:
                        break;
                }
                ++cur_op;
            }
        }
    }
}

/*

=item C<static void pbc_fixup_constants(PARROT_INTERP, pbc_merge_input **inputs,
int num_inputs)>

Fixup constants. This includes correcting pointers into bytecode.

=cut

*/

static void
pbc_fixup_constants(PARROT_INTERP, ARGMOD(pbc_merge_input **inputs), int num_inputs)
{
    ASSERT_ARGS(pbc_fixup_constants)
    int i, j;

    /* Loop over input files. */
    for (i = 0; i < num_inputs; ++i) {
        /* Get the constant table segment from the input file. */
        PackFile_ConstTable * const in_seg = inputs[i]->pf->cur_cs->const_table;

        for (j = 0; j < in_seg->pmc.const_count; j++) {
            PMC * const v = in_seg->pmc.constants[j];

            /* If it's a sub PMC, need to deal with offsets. */
            switch (v->vtable->base_type) {
                case enum_class_Sub:
                case enum_class_Coroutine:
                    {
                        Parrot_Sub_attributes *sub;
                        PMC_get_sub(interp, v, sub);
                        sub->start_offs += inputs[i]->code_start;
                        sub->end_offs   += inputs[i]->code_start;
                    }
                    break;
                default:
                    break;
            }
        }
    }
}

/*

=item C<static PackFile* pbc_merge_begin(PARROT_INTERP, pbc_merge_input
**inputs, int num_inputs)>

This is the function that drives PBC merging process.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile*
pbc_merge_begin(PARROT_INTERP, ARGMOD(pbc_merge_input **inputs), int num_inputs)
{
    ASSERT_ARGS(pbc_merge_begin)
    PackFile_ByteCode   *bc;
    PackFile_ConstTable *ct;
    int                  i;

    /* Create a new empty packfile. */
    PackFile * const merged = PackFile_new(interp, 0);
    if (merged == NULL) {
        Parrot_io_eprintf(interp, "PBC Merge: Error creating new packfile.\n");
        Parrot_x_exit(interp, 1);
    }

    /* calculate how many constants are stored in the packfiles to be merged */
    for (i = 0; i < num_inputs; ++i) {
        PackFile_Directory *pf_dir = &inputs[i]->pf->directory;
        unsigned int j = 0;
        for (j = 0; j < pf_dir->num_segments; ++j) {
            PackFile_Segment *seg = (PackFile_Segment *)pf_dir->segments[j];
            if (seg->type == PF_CONST_SEG) {
                PackFile_ConstTable *ct = (PackFile_ConstTable *)seg;
                inputs[i]->num.const_map = mem_gc_allocate_n_typed(interp, ct->num.const_count,
                                                                    opcode_t);
                inputs[i]->str.const_map = mem_gc_allocate_n_typed(interp, ct->str.const_count,
                                                                    opcode_t);
                inputs[i]->pmc.const_map = mem_gc_allocate_n_typed(interp, ct->pmc.const_count,
                                                                    opcode_t);
            }
        }
    }

    /* Merge the various stuff. */
    ct = pbc_merge_constants(interp, inputs, num_inputs, merged);
    bc = pbc_merge_bytecode(interp, inputs, num_inputs, merged);
    bc->const_table = ct;
    ct->code        = bc;
    interp->code    = bc;

    pbc_merge_debugs(interp, inputs, num_inputs, bc);

    /* Walk bytecode and fix ops that reference the constants table. */
    pbc_fixup_bytecode(interp, inputs, num_inputs, bc);

    /* Walk constants and fix references into bytecode. */
    pbc_fixup_constants(interp, inputs, num_inputs);

    for (i = 0; i < num_inputs; ++i) {
        mem_gc_free(interp, inputs[i]->num.const_map);
        mem_gc_free(interp, inputs[i]->str.const_map);
        mem_gc_free(interp, inputs[i]->pmc.const_map);
    }

    /* Return merged result. */
    return merged;
}


/*

=item C<static void pbc_merge_write(PARROT_INTERP, PackFile *pf, const char
*filename)>

This functions writes out the merged packfile.

=cut

*/

static void
pbc_merge_write(PARROT_INTERP, ARGMOD(PackFile *pf), ARGIN(const char *filename))
{
    ASSERT_ARGS(pbc_merge_write)
    FILE     *fp;

    /* Get size of packfile we'll write. */
    const size_t size = PackFile_pack_size(interp, pf) * sizeof (opcode_t);

    /* Allocate memory. */
    opcode_t * const pack = (opcode_t*) Parrot_gc_allocate_memory_chunk(interp, size);

    /* Write and clean up. */
    PackFile_pack(interp, pf, pack);
    if ((fp = fopen(filename, "wb")) == 0) {
        Parrot_io_eprintf(interp, "PBC Merge: Couldn't open %s\n", filename);
        Parrot_x_exit(interp, 1);
    }
    if ((1 != fwrite(pack, size, 1, fp))) {
        Parrot_io_eprintf(interp, "PBC Merge: Couldn't write %s\n", filename);
        Parrot_x_exit(interp, 1);
    }
    fclose(fp);
    mem_gc_free(interp, pack);
}


/*

=item C<int main(int argc, const char **argv)>

The main function that grabs console input, reads in the packfiles
provided they exist, hands them to another function that runs the
merge process and finally writes out the produced packfile.

=cut

*/

static struct longopt_opt_decl options[] = {
    { 'o', 'o', OPTION_required_FLAG, { "--output" } },
    {  0 ,  0 , OPTION_optional_FLAG, { NULL       } }
};

int
main(int argc, const char **argv)
{
    int status;
    pbc_merge_input** input_files;
    PackFile *merged;
    int i;
    const char *output_file     = NULL;
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    Interp * const interp = Parrot_new(NULL);

    {
        const int config_length = Parrot_get_config_hash_length();
        const unsigned char * const config_bytes =
            Parrot_get_config_hash_bytes();
        Parrot_set_configuration_hash_legacy(interp, config_length, config_bytes);
    }

    Parrot_block_GC_mark(interp);

    /* Get options, ensuring we have at least one input
       file and an output file. */
    if (argc < 4) {
        help(interp);
    }
    while ((status = longopt_get(argc, argv, options, &opt)) > 0) {
        switch (opt.opt_id) {
            case 'o':
                if (output_file == NULL)
                    output_file = opt.opt_arg;
                else
                    help(interp);
                break;
            case '?':
                help(interp);
                break;
            default:
                break;
        }
    }
    if (status == -1 || !output_file) {
        help(interp);
    }
    argc -= opt.opt_index;    /* Now the number of input files. */
    argv += opt.opt_index;    /* Now at first input filename. */

    /* Load each packfile that we are to merge and set up an input
       structure for each of them. */
    input_files = mem_gc_allocate_n_typed(interp, argc, pbc_merge_input*);

    for (i = 0; i < argc; ++i) {
        /* Allocate a struct. */
        input_files[i] = mem_gc_allocate_typed(interp, pbc_merge_input);

        /* Set filename */
        input_files[i]->filename = *argv;

        /* Load the packfile and unpack it. */
        input_files[i]->pf = pbc_merge_loadpbc(interp,
            input_files[i]->filename);
        if (input_files[i]->pf == NULL) {
            Parrot_io_eprintf(interp,
                "PBC Merge: Unknown error while reading and unpacking %s\n",
                *argv);
            Parrot_x_exit(interp, 1);
        }

        /* Next file. */
        ++argv;
    }

    /* Merge. */
    merged = pbc_merge_begin(interp, input_files, argc);

    /* Write merged packfile. */
    pbc_merge_write(interp, merged, output_file);

    /* Finally, we're done. */
    Parrot_x_exit(interp, 0);
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
