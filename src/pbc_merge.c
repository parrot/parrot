/*
Copyright: 2005 The Perl Foundation. All Rights Reserved.
$Id: $

=head1 NAME

src/pbc_merge.c - Merge multiple Parrot bytecode (PBC) files into
                  a single PBC file.

=head1 SYNOPSIS

    % make pbc_merge

    % ./pbc_merge -o out.pbc input1.pbc input2.pbc ...

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


#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/oplib/ops.h"


/* This struct describes an input file. */
struct pbc_merge_input
{
    char *filename;       /* Filename of the input file. */
    struct PackFile *pf;  /* The loaded packfile. */
    opcode_t code_start;  /* Where the bytecode is located in the merged
                             bytecode. */
    opcode_t const_start; /* Where the const table is located in the merged
                             one. */
};


/*

=item C<static void help(void)>

Print out the user help info.

=cut

*/
static void
help(void)
{
    printf("pbc_merge - merge multiple parrot bytecode files into one\n");
    printf("Usage:\n");
    printf("   pbc_merge -o out.pbc file1.pbc file2.pbc ...\n\n");
    Parrot_exit(0);
}


/*

=item C<static struct PackFile*
pbc_merge_loadpbc(Interp *interpreter, char *filename)>

This function loads a PBC file and unpacks it. We can't
use Parrot_readbc because that is specified to also
fixup the segments, which we don't want.

=cut

*/
static struct PackFile*
pbc_merge_loadpbc(Interp *interpreter, char *fullname)
{
    INTVAL program_size, wanted;
    char *program_code;
    struct PackFile *pf;
    FILE * io = NULL;
    INTVAL is_mapped = 0;
    size_t chunk_size;
    char *cursor;
    INTVAL read_result;

    /* Check the file exists. */
    STRING *fs;
    fs = string_make(interpreter, fullname,
            strlen(fullname), NULL, 0);
    if (!Parrot_stat_info_intval(interpreter, fs, STAT_EXISTS)) {
        PIO_eprintf(interpreter, "PBC Merge: Can't stat %s, code %i.\n",
                fullname, errno);
        Parrot_exit(1);
    }
    
    /* Get program size. */
    program_size = Parrot_stat_info_intval(interpreter, fs, STAT_FILESIZE);

    /* Attempt to open file and handle any errors. */
    io = fopen(fullname, "rb");
    if (!io) {
        PIO_eprintf(interpreter, "PBC Merge: Can't open %s, code %i.\n",
                fullname, errno);
        Parrot_exit(1);
    }

    /* Read in program. Nabbed from Parrot_readpbc. */
    chunk_size = program_size > 0 ? program_size : 1024;
    program_code = (char *)mem_sys_allocate(chunk_size);
    wanted = program_size;
    program_size = 0;
    cursor = (char *)program_code;
    while ((read_result = fread(cursor, 1, chunk_size, io)) > 0) {
        program_size += read_result;
        if (program_size == wanted)
            break;
        chunk_size = 1024;
        program_code =
            mem_sys_realloc(program_code, program_size + chunk_size);

        if (!program_code) {
            PIO_eprintf(interpreter,
                "PBC Merge: Could not reallocate buffer");
            Parrot_exit(1);
        }

        cursor = (char *)program_code + program_size;
    }

    if (read_result < 0) {
        PIO_eprintf(interpreter,
                "PBC Merge: Problem reading packfile from PIO.\n");
        Parrot_exit(1);
    }
    fclose(io);

    /* Now that we have the bytecode, let's unpack it. */
    pf = PackFile_new(interpreter, is_mapped);
    if (!PackFile_unpack
        (interpreter, pf, (opcode_t *)program_code, program_size)) {
        PIO_eprintf(interpreter, "PBC Merge: Can't unpack packfile %s.\n",
                fullname);
        Parrot_exit(1);
    }

    /* Return the packfile. */
    return pf;
}


/*

=item C<static struct PackFile_ByteCode*
pbc_merge_bytecode(Interp *interpreter, struct pbc_merge_input **inputs,
                   int num_inputs, struct PackFile *pf)>

This function merges the bytecode from the input packfiles, storing the
offsets that each bit of bytecode now exists at.

=cut

*/
static struct PackFile_ByteCode*
pbc_merge_bytecode(Interp *interpreter, struct pbc_merge_input **inputs,
                   int num_inputs, struct PackFile *pf)
{
    struct PackFile_ByteCode *bc_seg;
    opcode_t *bc = mem_sys_allocate(1);
    opcode_t cursor = 0;
    int i;

    /* Add a bytecode segment. */
    bc_seg = (struct PackFile_ByteCode*)PackFile_Segment_new_seg(interpreter,
              &pf->directory, PF_BYTEC_SEG, BYTE_CODE_SEGMENT_NAME, 1);
    if (bc_seg == NULL)
    {
        PIO_eprintf(interpreter, "PBC Merge: Error creating bytecode segment.");
        Parrot_exit(1);
    }
    
    /* Loop over input files. */
    for (i = 0; i < num_inputs; i++)
    {
        /* Get the bytecode segment from the input file. */
        struct PackFile_ByteCode *in_seg = inputs[i]->pf->cur_cs;
        if (in_seg == NULL)
        {
            PIO_eprintf(interpreter, 
                "PBC Merge: Cannot locate bytecode segment in %s",
                inputs[i]->filename);
            Parrot_exit(1);
        }

        /* Re-allocate the current buffer. */
        bc = mem_sys_realloc(bc, 
            (cursor + in_seg->base.size) * sizeof(opcode_t));
        if (bc == NULL)
        {
            PIO_eprintf(interpreter, "PBC Merge: Cannot reallocate memory\n");
            Parrot_exit(1);
        }

        /* Copy data and store cursor. */
        memcpy(bc + cursor, in_seg->base.data, 
            in_seg->base.size * sizeof(opcode_t));
        inputs[i]->code_start = cursor;
        
        /* Update cursor. */
        cursor += in_seg->base.size;
    }

    /* Stash produced bytecode. */
    bc_seg->base.data = bc;
    bc_seg->base.size = cursor;
    bc_seg->base.name = "MERGED";
    return bc_seg;
}


/*

=item C<static struct PackFile_ConstTable*
pbc_merge_constants(Interp *interpreter, struct pbc_merge_input **inputs,
                    int num_inputs, struct PackFile *pf,
                    struct PackFile_ByteCode *bc)>

This function merges the constants tables from the input PBC files.

=cut

*/
static struct PackFile_ConstTable*
pbc_merge_constants(Interp *interpreter, struct pbc_merge_input **inputs,
                    int num_inputs, struct PackFile *pf,
                    struct PackFile_ByteCode *bc)
{
    struct PackFile_ConstTable *const_seg;
    struct PackFile_Constant **constants = mem_sys_allocate(1);
    opcode_t cursor = 0;
    int i, j;

    /* Add a constant table segment. */
    const_seg = (struct PackFile_ConstTable*)PackFile_Segment_new_seg(
        interpreter, &pf->directory, PF_CONST_SEG, CONSTANT_SEGMENT_NAME, 1);
    if (const_seg == NULL)
    {
        PIO_eprintf(interpreter,
            "PBC Merge: Error creating constant table segment.");
        Parrot_exit(1);
    }

    /* Loop over input files. */
    for (i = 0; i < num_inputs; i++)
    {
        /* Get the constant table segment from the input file. */
        struct PackFile_ConstTable *in_seg = inputs[i]->pf->cur_cs->const_table;
        if (in_seg == NULL)
        {
            PIO_eprintf(interpreter,
                "PBC Merge: Cannot locate constant table segment in %s\n",
                inputs[i]->filename);
            Parrot_exit(1);
        }
        
        /* Store cursor as position where constant table starts. */
        inputs[i]->const_start = cursor;

        /* Allocate space for the constant list, provided we have some. */
        if (in_seg->const_count > 0)
        {
            constants = mem_sys_realloc(constants, 
                (cursor + in_seg->const_count) * sizeof(Parrot_Pointer));
            if (constants == NULL)
            {
                PIO_eprintf(interpreter, "PBC Merge: Out of memory");
                Parrot_exit(1);
            }
        }

        /* Loop over the constants and copy them to the output PBC. */
        for (j = 0; j < in_seg->const_count; j++)
        {
            /* Get the entry and allocate space for copy. */
            struct PackFile_Constant *cur_entry = in_seg->constants[j];
            struct PackFile_Constant *copy = mem_sys_allocate(
                sizeof(struct PackFile_Constant));
            if (copy == NULL)
            {
                PIO_eprintf(interpreter, "PBC Merge: Out of memory");
                Parrot_exit(1);
            }
            
            /* Copy. */
            copy->type = cur_entry->type;
            copy->u = cur_entry->u;

            /* If it's a sub PMC, need to deal with offsets. */
            if (copy->type == PFC_PMC)
            {
                struct Parrot_sub *sub;
                switch (copy->u.key->vtable->base_type) {
                    case enum_class_Sub:
                    case enum_class_Closure:
                    case enum_class_Coroutine:
                        sub = PMC_sub(copy->u.key);
                        sub->address += inputs[i]->code_start;
                        sub->end += inputs[i]->code_start;
                        break;
                }
            }
            
            /* Slot it into the list. */
            constants[cursor] = copy;
            cursor++;
        }
    }

    /* Stash merged constants table and count and return the new segment. */
    const_seg->constants = constants;
    const_seg->const_count = cursor;
    const_seg->code = bc;
    return const_seg;
}


/*

=item C<static void
pbc_merge_fixups(Interp *interpreter, struct pbc_merge_input **inputs,
                 int num_inputs, struct PackFile *pf,
                 struct PackFile_ByteCode *bc)>

This function merges the fixups tables from the input PBC files.

=cut

*/
static void
pbc_merge_fixups(Interp *interpreter, struct pbc_merge_input **inputs,
                 int num_inputs, struct PackFile *pf,
                 struct PackFile_ByteCode *bc)
{
    struct PackFile_FixupTable *fixup_seg;
    struct PackFile_FixupEntry **fixups = mem_sys_allocate(1);
    opcode_t cursor = 0;
    int i, j;

    /* Add a fixup table segment. */
    fixup_seg = (struct PackFile_FixupTable*)PackFile_Segment_new_seg(
        interpreter, &pf->directory, PF_FIXUP_SEG, FIXUP_TABLE_SEGMENT_NAME, 1);
    if (fixup_seg == NULL)
    {
        PIO_eprintf(interpreter,
            "PBC Merge: Error creating fixup table segment.");
        Parrot_exit(1);
    }

    /* Loop over input files. */
    for (i = 0; i < num_inputs; i++)
    {
        /* Get the fixup segment from the input file. */
        struct PackFile_FixupTable *in_seg = inputs[i]->pf->cur_cs->fixups;
        if (in_seg == NULL)
        {
            PIO_eprintf(interpreter,
                "PBC Merge: Cannot locate fixup segment in %s",
                inputs[i]->filename);
            Parrot_exit(1);
        }

        /* Allocate space for these fixups, provided we have some. */
        if (in_seg->fixup_count > 0)
        {
            fixups = mem_sys_realloc(fixups, 
                (cursor + in_seg->fixup_count) * sizeof(Parrot_Pointer));
            if (fixups == NULL)
            {
                PIO_eprintf(interpreter, "PBC Merge: Out of memory");
                Parrot_exit(1);
            }
        }

        /* Loop over the fixups and copy them to the output PBC, correcting
           the offsets into the bytecode. */
        for (j = 0; j < in_seg->fixup_count; j++)
        {
            /* Get the entry and allocate space for copies. */
            struct PackFile_FixupEntry *cur_entry = in_seg->fixups[j];
            struct PackFile_FixupEntry *copy = mem_sys_allocate(
                sizeof(struct PackFile_FixupEntry));
            char *name_copy = mem_sys_allocate(strlen(cur_entry->name) + 1);
            if (copy == NULL || name_copy == NULL)
            {
                PIO_eprintf(interpreter, "PBC Merge: Out of memory");
                Parrot_exit(1);
            }
            
            /* Copy type and name. */
            copy->type = cur_entry->type;
            strcpy(name_copy, cur_entry->name);
            copy->name = name_copy;

            /* Set new offset and bytecode pointer. */
            switch (copy->type)
            {
                case enum_fixup_label:
                    copy->offset = cur_entry->offset + inputs[i]->code_start;
                    break;
                case enum_fixup_sub:
                    copy->offset = cur_entry->offset + inputs[i]->const_start;
                    break;
                default:
                    PIO_eprintf(interpreter, "PBC Merge: Unknown fixup type");
                    Parrot_exit(1);
            }
            
            copy->seg = bc;
            
            /* Slot it into the list. */
            fixups[cursor] = copy;
            cursor++;
        }
    }

    /* Stash merged fixup table and count. */
    fixup_seg->fixups = fixups;
    fixup_seg->fixup_count = cursor;
}


/*

=item C<static void
pbc_merge_debugs(Interp *interpreter, struct pbc_merge_input **inputs,
                 int num_inputs, struct PackFile *pf, 
                 struct PackFile_ByteCode *bc)>

This function merges the debug segments from the input PBC files.

=cut

*/
static void
pbc_merge_debugs(Interp *interpreter, struct pbc_merge_input **inputs,
                 int num_inputs, struct PackFile *pf, 
                 struct PackFile_ByteCode *bc)
{
    struct PackFile_Debug *debug_seg;
    opcode_t *lines = mem_sys_allocate(1);
    struct PackFile_DebugMapping **mappings =
        mem_sys_allocate(sizeof(Parrot_Pointer));
    opcode_t num_mappings = 0;
    opcode_t num_lines = 0;
    int i, j;

    /* We need to merge both the mappings and the list of line numbers.
       The line numbers can just be concatenated. The mappings must have
       their offsets fixed up. */
    for (i = 0; i < num_inputs; i++)
    {
        struct PackFile_Debug *in_seg = inputs[i]->pf->cur_cs->debugs;

        /* Concatenate line numbers. */
        lines = mem_sys_realloc(lines, 
                (num_lines + in_seg->base.size) * sizeof(opcode_t));
        if (lines == NULL)
        {
            PIO_eprintf(interpreter, "PBC Merge: Cannot reallocate memory\n");
            Parrot_exit(1);
        }
        memcpy(lines + num_lines, in_seg->base.data, 
            in_seg->base.size * sizeof(opcode_t));
        
        /* Concatenate mappings. */
        mappings = mem_sys_realloc(mappings,
                   (num_mappings + in_seg->num_mappings) * 
                   sizeof(Parrot_Pointer));
        for (j = 0; j < in_seg->num_mappings; j++)
        {
            struct PackFile_DebugMapping *mapping = mem_sys_allocate(
                sizeof(struct PackFile_DebugMapping));
            memcpy(mapping, in_seg->mappings[j], 
                sizeof(struct PackFile_DebugMapping));
            mapping->offset += num_lines;
            if (mapping->mapping_type == PF_DEBUGMAPPINGTYPE_FILENAME)
                mapping->u.filename += inputs[i]->const_start;
            mappings[num_mappings + j] = mapping;
        }

        /* Update counts. */
        num_lines += in_seg->base.size;
        num_mappings += in_seg->num_mappings;
    }
    
    /* Create merged debug segment. Replace created data and mappings
       with merged ones we have created. */
    debug_seg = Parrot_new_debug_seg(interpreter, bc, num_lines);
    PackFile_add_segment(interpreter, &pf->directory, 
                         (struct PackFile_Segment*)debug_seg);
    free(debug_seg->base.data);
    debug_seg->base.data = lines;
    free(debug_seg->mappings);
    debug_seg->mappings = mappings;
    debug_seg->num_mappings = num_mappings;
}


/*

=item C<static void
pbc_merge_ctpointers(Interp *interpreter, struct pbc_merge_input **inputs,
                     int num_inputs, struct PackFile *pf, 
                     struct PackFile_ByteCode *bc,
                     struct PackFile_ConstTable *ct)>

This function corrects the pointers into the constants table found in the
bytecode.

=cut

*/
static void
pbc_merge_ctpointers(Interp *interpreter, struct pbc_merge_input **inputs,
                     int num_inputs, struct PackFile *pf, 
                     struct PackFile_ByteCode *bc,
                     struct PackFile_ConstTable *ct)
{
    opcode_t *ops = bc->base.data;
    opcode_t cur_op = 0;
	opcode_t op_num;
    op_info_t *op;
    int cur_input = 0;
    int cur_arg;

    /* Loop over the ops in the merged bytecode. */
    while (cur_op < bc->base.size)
    {
        /* Keep track of the current input file. */
        if (cur_input + 1 < num_inputs &&
            cur_op >= inputs[cur_input + 1]->code_start)
            cur_input++;

        /* Get info about this op and jump over it. */
		op_num = ops[cur_op];
        op = &interpreter->op_info_table[op_num];
        cur_op++;
        
        /* Loop over the arguments. */
        for (cur_arg = 1; cur_arg < op->arg_count; cur_arg++)
        {
            /* Pick out any indexes into the constant table and correct them. */
            switch (op->types[cur_arg])
            {
                case PARROT_ARG_NC:
                case PARROT_ARG_PC:
                case PARROT_ARG_SC:
                case PARROT_ARG_KC:
                    ops[cur_op] += inputs[cur_input]->const_start;
                    break;
            }

            /* Move along the bytecode array. */
            cur_op++;
        }

        /* Handle special case variable argument opcodes. */
        if (op_num == PARROT_OP_set_args_pc ||
            op_num == PARROT_OP_get_results_pc ||
            op_num == PARROT_OP_get_params_pc ||
            op_num == PARROT_OP_set_returns_pc) {
            PMC *sig;
            sig = ct->constants[ops[cur_op - 1]]->u.key;
            cur_op += VTABLE_elements(interpreter, sig);
        }
    }
}


/*

=item C<static struct PackFile*
pbc_merge_begin(Interp *interpreter, struct pbc_merge_input **inputs,
                int num_inputs)>

This is the function that drives PBC merging process.

=cut

*/
static struct PackFile*
pbc_merge_begin(Interp *interpreter, struct pbc_merge_input **inputs,
                int num_inputs)
{
    struct PackFile *merged;
    struct PackFile_ByteCode *bc;
    struct PackFile_ConstTable *ct;

    /* Create a new empty packfile. */
    merged = PackFile_new(interpreter, 0);
    if (merged == NULL)
    {
        PIO_eprintf(interpreter, "PBC Merge: Error creating new packfile.\n");
        Parrot_exit(1);
    }

    /* Merge the various stuff. */
    bc = pbc_merge_bytecode(interpreter, inputs, num_inputs, merged);
    ct = pbc_merge_constants(interpreter, inputs, num_inputs, merged, bc);
    pbc_merge_fixups(interpreter, inputs, num_inputs, merged, bc);
    pbc_merge_debugs(interpreter, inputs, num_inputs, merged, bc);

    /* Walk bytecode and fix ops that reference the constants table. */
    pbc_merge_ctpointers(interpreter, inputs, num_inputs, merged, bc, ct);
    
    /* Return merged result. */
    return merged;
}


/*

=item C<static void
pbc_merge_write(Interp *interpreter, struct PackFile *pf, char *filename)>

This functions writes out the merged packfile.

=cut

*/
static void
pbc_merge_write(Interp *interpreter, struct PackFile *pf, char *filename)
{
    size_t size;
    opcode_t *pack;
    FILE *fp;

    /* Get size of packfile we'll write. */
    size = PackFile_pack_size(interpreter, pf) * sizeof(opcode_t);
    
    /* Allocate memory. */
    pack = (opcode_t*) mem_sys_allocate(size);
    if (pack == NULL) {
        PIO_eprintf(interpreter, "PBC Merge: Out of memory");
        Parrot_exit(1);
    }

    /* Write and clean up. */
    PackFile_pack(interpreter, pf, pack);
    if ((fp = fopen(filename, "wb")) == 0) {
        PIO_eprintf(interpreter, "PBC Merge: Couldn't open %s\n", filename);
        Parrot_exit(1);
    }
    if ((1 != fwrite(pack, size, 1, fp)) ) {
        PIO_eprintf(interpreter, "PBC Merge: Couldn't write %s\n", filename);
        Parrot_exit(1);
    }
    fclose(fp);
    mem_sys_free(pack);
}


/*

=item C<int
main(int argc, char **argv)>

The main function that grabs console input, reads in the packfiles
provided they exist, hands them to another function that runs the
merge process and finally writes out the produce packfile.

=cut

*/

static struct longopt_opt_decl options[] = {
    { 'o', 'o', OPTION_required_FLAG, { "--output" } }
};

int
main(int argc, char **argv)
{
    Interp *interpreter;
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;
    char *output_file = NULL;
    struct pbc_merge_input** input_files;
    struct PackFile *merged;
    int i;

    /* Create a Parrot interpreter. */
    interpreter = make_interpreter(NULL, PARROT_NO_FLAGS);
    Parrot_init(interpreter);

    /* Get options, ensuring we have at least one input
       file and an output file. */
    if (argc < 4) {
        help();
    }
    while ((status = longopt_get(interpreter, argc, argv, options, &opt)) > 0) {
        switch (opt.opt_id) {
            case 'o':
                if (output_file == NULL)
                    output_file = (char*) opt.opt_arg;
                else
                    help();
                break;
            case '?':
                help();
                break;
        }
    }
    if (status == -1 || !output_file) {
        help();
    }
    argc -= opt.opt_index;    /* Now the number of input files. */
    argv += opt.opt_index;    /* Now at first input filename. */

    /* Load each packfile that we are to merge and set up an input
       structure for each of them. */
    input_files = mem_sys_allocate(argc * sizeof(Parrot_Pointer));
    for (i = 0; i < argc; i++)
    {
        /* Allocate a struct. */
        input_files[i] = mem_sys_allocate(sizeof(struct pbc_merge_input));

        /* Set filename (getting the full name). */
        input_files[i]->filename = Parrot_locate_runtime_file(interpreter,
                                     *argv, PARROT_RUNTIME_FT_PBC);
        if (input_files[i]->filename == NULL) {
            PIO_eprintf(interpreter, "PBC Merge: Can't locate %s, code %i.\n",
                        *argv, errno);
            Parrot_exit(1);
        }

        /* Load the packfile and unpack it. */
        input_files[i]->pf = pbc_merge_loadpbc(interpreter, 
            input_files[i]->filename);
        if (input_files[i]->pf == NULL)
        {
            PIO_eprintf(interpreter,
                "PBC Merge: Unknown error while reading and unpacking %s\n",
                *argv);
            Parrot_exit(1);
        }

        /* Next file. */
        argv++;
    }

    /* Merge. */
    merged = pbc_merge_begin(interpreter, input_files, argc);
    if (merged == NULL)
    {
        PIO_eprintf(interpreter, "PBC Merge: Unknown error during merge\n");
        Parrot_exit(1);
    }

    /* Write merged packfile. */
    pbc_merge_write(interpreter, merged, output_file);

    /* Finally, we're done. */
    Parrot_exit(0);
    return 0;
}

/*

=back

=cut

*/

