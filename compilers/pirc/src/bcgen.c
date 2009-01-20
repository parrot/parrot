/*
 * $Id$
 * Copyright (C) 2008-2009, The Perl Foundation.
 */
#include <stdio.h>
#include <assert.h>
#include "pirsymbol.h"

#include "parrot/parrot.h"

#include "parrot/interpreter.h"

/* #include "parrot/embed.h" */

#include "bcgen.h" /* XXX future maybe parrot/bcgen.h */


/* XXX Fix the build for now; #including parrot/interpreter.h that
   defines this doesn't seem to help. */
#ifndef PMCNULL
#  define PMCNULL         ((PMC *)NULL)
#endif

/* turn this on when debugging */
#define DEBUGBC     0




/*

=head1 DESCRIPTION

This file implements an API for generating bytecode. All gory details
are hidden. In order to improve modularity, all bytecode generating
functions take a C<bytecode> struct parameter, which keeps track of
the I<state>; this includes a Parrot interpreter.

Since this state is private, the bytecode struct is declared in this
C file, not in the header file. It is, however, declared in the header
file as a struct, so you can use it as a type, but not touch its
private bits. Everything you need to know should be accessible through
accessor functions.

=head1 SYNOPSIS

  // create a bytecode object
  bytecode *bc = new_bytecode(interp, "foo.pir", codesize, bytes);

  // add a subroutine PMC
  add_sub_pmc(bc, mysub->info, sub->needlex, mysub->pragmas);

  while ( ... ) {

      // write opcodes
      int opcode = ...
      emit_opcode(bc, opcode);

      // emit constants
      int mystring = add_string_const(bc, "hello");

      // emit the constant index into bytecode stream
      emit_int_arg(bc, mystring);
  }

  // write the pbc file
  write_pbc_file(bc, "foo.pbc");

  // clean up
  destroy_bytecode(bc);

=cut

*/


struct bytecode {
    PackFile        *packfile;       /* the actual packfile */
    opcode_t        *opcursor;       /* for writing ops into the code segment */
    Interp          *interp;         /* parrot interpreter */
    PackFile_Debug  *debug_seg;      /* debug segment */
    int              instr_counter;
};


static int new_pbc_const(bytecode * const bc);

static STRING *add_string_const_from_cstring(bytecode * const bc, char const * const str);


/*

=head1 FUNCTIONS

=over 4

=cut

*/


/*

=item C<static int
new_pbc_const(bytecode * const bc)>

Add a new constant to the constant table.

XXX This function needs to be cleaned up, as it's not really efficient: constant table
is resized each time a constant is added.

=cut

*/
static int
new_pbc_const(bytecode * const bc) {
    Interp            *interp;
    size_t             oldcount;
    size_t             newcount;
    PackFile_Constant *new_pbc_constant;

    interp   = bc->interp;
    oldcount = interp->code->const_table->const_count;
    newcount = oldcount + 1;

    new_pbc_constant = PackFile_Constant_new(interp);

    /* Update the constant count and reallocate */
    if (interp->code->const_table->constants)
        interp->code->const_table->constants
            = mem_realloc_n_typed(interp->code->const_table->constants,
                newcount, PackFile_Constant *);
    else
        interp->code->const_table->constants
            = mem_allocate_n_typed(newcount, PackFile_Constant *);

    interp->code->const_table->constants[oldcount] = new_pbc_constant;
    interp->code->const_table->const_count         = newcount;

    return oldcount;
}



/*

=item C<int
add_pmc_const(bytecode * const bc, PMC * pmc)>

Add the PMC constant C<pmc> to the constant table. This
function returns the index in the constant table where C<pmc>
is stored.

=cut

*/
int
add_pmc_const(bytecode * const bc, PMC * pmc) {
    int index                   = new_pbc_const(bc);
    PackFile_Constant *constant = bc->interp->code->const_table->constants[index];
    constant->type              = PFC_PMC;
    constant->u.key             = pmc;
    return index;
}


/*

=item C<int
add_string_const(bytecode * const bc, char const * const str, char const * charset)>

Add the string constant C<str> to the constant table. This function
returns the index in the constant table where C<str> is stored.
C<str> is assumed to be a C-string; it is converted to a Parrot STRING
object, using the character set passed in C<charset>.

XXX what to do with "encoding"?

=cut

*/
int
add_string_const(bytecode * const bc, char const * const str, char const * charset) {
    STRING *parrotstr = string_make(bc->interp, str, strlen(str), charset, PObj_constant_FLAG);
    int index         = 0;
    int count         = bc->interp->code->const_table->const_count;
    PackFile_Constant *constant;

    /* check whether the string is already stored; if so, return that index */
    while (index < count) {
        constant = bc->interp->code->const_table->constants[index];
        if (constant->type == PFC_STRING) {
            if (string_equal(bc->interp, constant->u.string, parrotstr) == 0) {
#if DEBUGBC
                fprintf(stderr, "found string %s at index %d\n", str, index);
#endif
                return index;
            }
        }
        ++index;
    }

    /* fprintf(stderr, "string '%s' not found, storing...\n", str);
    */
    /* it wasn't stored yet, store it now, and return the index */
    index    = new_pbc_const(bc);
    constant = bc->interp->code->const_table->constants[index];

    constant->type     = PFC_STRING;
    constant->u.string = parrotstr;

#if DEBUGBC
    fprintf(stderr, "add_string_const (%s) at index: %d\n", str, index);
#endif

    return index;

}


/*

=item c<int
add_num_const(bytecode * const bc, double f)>

XXX should f be a FLOATVAL?

Add a number constant to the constants list. The index in the constant
table where C<f> is stored is returned.

=cut

*/
int
add_num_const(bytecode * const bc, double f) {
    int index                   = new_pbc_const(bc);
    PackFile_Constant *constant = bc->interp->code->const_table->constants[index];
    constant->type              = PFC_NUMBER;
    constant->u.number          = f;
#if DEBUGBC
    fprintf(stderr, "add_num_const (%f) at index: %d\n", f, index);
#endif
    return index;
}


/*

=item C<int
add_key_const(bytecode * const bc, PMC *key)>

Add a key constant to the constants list. The index where C<key> is
stored in the constants table is returned.

=cut

*/
int
add_key_const(bytecode * const bc, PMC *key) {
    PackFile_Constant *constant;
    int count  = bc->interp->code->const_table->const_count;
    int index  = 0;
    STRING *s1 = key_set_to_string(bc->interp, key);

    /* iterate over all constants; if a constant is a key, compare the string representations */
    while (index < count) {
        constant = bc->interp->code->const_table->constants[index];

        if (constant->type == PFC_KEY) {
            STRING *s2 = key_set_to_string(bc->interp, constant->u.key);
            if (string_equal(bc->interp, s1, s2) == 0) {
#if DEBUGBC
                fprintf(stderr, "found equal key (%d)\n", index);
#endif
                return index;
            }
        }
        ++index;
    }

    /* key wasn't found, so add it now */
    index            = new_pbc_const(bc);
    constant         = bc->interp->code->const_table->constants[index];
    constant->type   = PFC_KEY;
    constant->u.key  = key;
#if DEBUGBC
    fprintf(stderr, "new key const (%d)\n", index);
#endif
    return index;
}


/*

=item C<static void
check_requested_constant(bytecode * const bc, unsigned index, int expectedtype)>

Perform a sanity check on a requested constant. The constant at index C<index>
is requested; this function checks whether the index is valid. Then, if so, the
constant is checked for its type, which must be C<expectedtype>. This must be one
of: PFC_PMC, PFC_NUMBER, PFC_STRING.

=cut

*/
static void
check_requested_constant(bytecode * const bc, unsigned index, int expectedtype) {
    /* make sure the requested PMC exists. */
    PARROT_ASSERT(index < bc->interp->code->const_table->const_count);
    /* make sure the requested constant is a PMC */
    PARROT_ASSERT(bc->interp->code->const_table->constants[index]->type == expectedtype);
}

/*

=item C<PMC *
get_pmc_const(bytecode * const bc, unsigned index)>

Get the PMC constant at index C<index> in the PBC constant table.

=cut

*/
PMC *
get_pmc_const(bytecode * const bc, unsigned index) {
    check_requested_constant(bc, index, PFC_PMC);
    return bc->interp->code->const_table->constants[index]->u.key;
}

/*

=item C<FLOATVAL
get_num_const(bytecode * const bc, unsigned index)>

Get the FLOATVAL constant at index C<index> in the PBC constant table.

=cut

*/
FLOATVAL
get_num_const(bytecode * const bc, unsigned index) {
    check_requested_constant(bc, index, PFC_NUMBER);
    return bc->interp->code->const_table->constants[index]->u.number;
}

/*

=item C<STRING *
get_string_const(bytecode * const bc, unsigned index)>

Get the STRING constant at index C<index> in the PBC constant table.

=cut

*/
STRING *
get_string_const(bytecode * const bc, unsigned index) {
    check_requested_constant(bc, index, PFC_STRING);
    return bc->interp->code->const_table->constants[index]->u.string;
}

/*

=item C<bytecode *
new_bytecode(Interp *interp, char const * const filename)>

Create a new bytecode struct, representing the bytecode for file C<filename>.
The bytecode struct contains a PackFile, which is initialized and
loaded into the Parrot interpreter C<interp>. Default bytecode segments
are created, and the interpreter's C<iglobals> field is stored as a constant
PMC in the bytecode's constant table.

=cut

*/
bytecode *
new_bytecode(Interp *interp, char const * const filename) {
    PMC      *self;
    bytecode *bc = (bytecode *)mem_sys_allocate(sizeof (bytecode));

    /* Create a new packfile and load it into the parrot interpreter */
    bc->packfile = PackFile_new(interp, 0);
    Parrot_loadbc(interp, bc->packfile);

    /* store a pointer to the parrot interpreter, which saves passing around
     * the interp as an extra argument.
     */
    bc->interp   = interp;

    /* create segments */
    PARROT_ASSERT(filename != NULL);
    interp->code = PF_create_default_segs(interp, filename, 1);

    /* add interpreter globals to bytecode. XXX Why is this? */
    self         = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_INTERPRETER);
    add_pmc_const(bc, self);

    /* initialize debug-segment fields */
    bc->instr_counter = 0;
    bc->debug_seg     = NULL;

    return bc;
}

/*

=item C<void
create_codesegment(bytecode * const bc, int codesize)>

Create a code segment of size C<codesize>. C<bc>'s C<opcursor> attribute
is initialized; this is the pointer used to write opcodes and operands
into the code segment.

=cut

*/
void
create_codesegment(bytecode * const bc, int codesize) {
    /* allocate enough space. XXX I *think* bytes is /always/ codesize * 4. */
    bc->interp->code->base.data = (opcode_t *)mem_sys_realloc(bc->interp->code->base.data,
                                                              codesize * 4);
    /* store the size of the code-segment */
    bc->interp->code->base.size = codesize;

    /* initialize the cursor to write opcodes into the code segment */
    bc->opcursor = (opcode_t *)bc->interp->code->base.data;
}

/*

=item C<void
create_debugsegment(bytecode * const bc, size_t size, char const * const file)>

Create a debug segment of size C<size>.

=cut

*/
void
create_debugsegment(bytecode * const bc, size_t size, char const * const file) {
    bc->debug_seg = Parrot_new_debug_seg(bc->interp, bc->interp->code, size);


    Parrot_debug_add_mapping(bc->interp, bc->debug_seg, bc->instr_counter, file);
}

/*

=item C<void
emit_debug_info(bytecode * const bc, int sourceline)>

Emit the C<sourceline> number in the debug segment.

=cut

*/
void
emit_debug_info(bytecode * const bc, int sourceline) {
    bc->debug_seg->base.data[bc->instr_counter++] = sourceline;
}


/*

=item C<void
create_annotations_segment(bytecode * const bc, char const * const name)>

Create an annotations segment, and an initial annotations group.

=cut

*/
void
create_annotations_segment(bytecode * const bc, char const * const name) {
    char *segment_name = (char *)mem_sys_allocate((strlen(name) + 5) * sizeof (char));
    sprintf(segment_name, "%s_ANN", name);

    bc->interp->code->annotations = PackFile_Segment_new_seg(bc->interp,
                                        bc->interp->code->base.dir,
                                        PF_ANNOTATIONS_SEG, segment_name, 1);

    bc->interp->code->annotations->code = bc->interp->code;

    /* Create initial group. */
    PackFile_Annotations_add_group(bc->interp,
                                   bc->interp->code->annotations,
                                   bc->opcursor - bc->interp->code->base.data);
}

/* Look up table for PackFile Annotation types */
static int packfile_annotation_types[10] = {
    PF_ANNOTATION_KEY_TYPE_INT,     /* INT_TYPE */
    PF_ANNOTATION_KEY_TYPE_STR,     /* STRING_TYPE */
    -1,                             /* PMC_TYPE */
    PF_ANNOTATION_KEY_TYPE_NUM,     /* NUM_TYPE */
    -1,                             /* UNKNOWN_TYPE */
    PF_ANNOTATION_KEY_TYPE_INT,     /* INT_VAL */
    PF_ANNOTATION_KEY_TYPE_STR,     /* STRING_VAL */
    -1,                             /* PMC_VAL */
    PF_ANNOTATION_KEY_TYPE_NUM,     /* NUM_VAL */
    PF_ANNOTATION_KEY_TYPE_STR      /* USTRING_VAL */
};

/*

=item C<void
add_annotation(bytecode * const bc, opcode_t offset, opcode_t key, opcode_t type, opcode_t value)>

Add an annotation for the bytecode at C<offset>, having a key C<key>,
of type C<type> and a value passed in C<value>.

=cut

*/
void
add_annotation(bytecode * const bc, opcode_t offset, opcode_t key, opcode_t type, opcode_t value) {
    /* look up the type */
    int annotation_type = packfile_annotation_types[type];
    if (annotation_type == -1) {/* this is no good */
        fprintf(stderr, "wrong annotation type!");
        return;
    }

    PackFile_Annotations_add_entry(bc->interp, bc->interp->code->annotations,
                                   offset, key, annotation_type, value);
}




/*

=item C<void
destroy_bytecode(bytecode * bc)>

Destructor for bytecode struct; frees all memory.

=cut

*/
void
destroy_bytecode(bytecode * bc) {
    /* XXX should we do this? Not Parrot? */
    mem_sys_free(bc->interp->code->base.data);
    mem_sys_free(bc);
}


/*

=item C<opcode_t
emit_opcode(bytecode * const bc, opcode_t op)>

Write the opcode C<op> into the bytecode stream. The bytecode
offset where the instruction is written is returned.

=cut

*/
PARROT_IGNORABLE_RESULT
opcode_t
emit_opcode(bytecode * const bc, opcode_t op) {
    *bc->opcursor = op;
#if DEBUGBC
    fprintf(stderr, "\n[%d]", op);
#endif
    return (bc->opcursor++ - bc->interp->code->base.data);

}

/*

=item C<opcode_t
emit_int_arg(bytecode * const bc, int intval)>

Write an integer argument into the bytecode stream. The offset
in bytecode where the instruction is written is returned.

=cut

*/
PARROT_IGNORABLE_RESULT
opcode_t
emit_int_arg(bytecode * const bc, int intval) {
    *bc->opcursor = intval;
#if DEBUGBC
    fprintf(stderr, "{%d}", intval);
#endif
    return (bc->opcursor++ - bc->interp->code->base.data);
}


/*

=item C<int
store_key_bytecode(bytecode * const bc, opcode_t * key)>

Store the bytecode for a key. The bytecode was emitted in an
array, passed in C<key>. The bytecode is I<unpacked> into the
current PackFile, pointed to by the interpreter in C<bc>.
The key PMC is added to the constants table, and the index
in the constants table is returned.

=cut

*/
int
store_key_bytecode(bytecode * const bc, opcode_t * key) {
    PackFile_Constant   *pfc;
    const opcode_t      *rc;
    int                  index;

    pfc   = mem_allocate_typed(PackFile_Constant);
    rc    = PackFile_Constant_unpack_key(bc->interp, bc->interp->code->const_table, pfc, key);

    if (!rc) {
        mem_sys_free(pfc);
        fprintf(stderr, "add_const_key: PackFile_Constant error\n");
        exit(EXIT_FAILURE); /* XXX how to release memory? or maybe throw an exception? */
    }

    index = add_key_const(bc, pfc->u.key);

#if DEBUGBC
    fprintf(stderr, "store key at index %d\n", index);
#endif

    mem_sys_free(pfc);

    return index;
}





/*

=item C<static STRING *
add_string_const_from_cstring(bytecode * const bc, char const * const str)>

Utility function to add a C-string to the constants table. Before adding
it to the constants table, the C-string is converted to a Parrot STRING
first, which is returned. This function is handy if you don't want to
retrieve the index in the constants table (where the string is stored),
but you want the STRING representing the string instead.

=cut

*/
static STRING *
add_string_const_from_cstring(bytecode * const bc, char const * const str) {
    int index = add_string_const(bc, str, "ascii");
    return bc->interp->code->const_table->constants[index]->u.string;
}


/*

=item C<PMC *
generate_multi_signature(bytecode * const bc)>

Generate a PMC for the multi signature, based on the types defined in C<multi_types>
C<type_count> indicates the number of types in the list.

=cut

*/
static PMC *
generate_multi_signature(bytecode * const bc, multi_type * const types, unsigned type_count) {
    unsigned     i;
    multi_type *iter;
    PMC        *multi_signature;

    /* cancel if there's no :multi flag */
    if (type_count == 0)
        return PMCNULL;

    /* A type_count of 1 means there was a :multi flag, but no :multi types.
     * therefore, create a special signature and return that.  */
    if (type_count == 1)
        return pmc_new(bc->interp, enum_class_FixedIntegerArray);

    /* create a FixedPMCArray to store all multi types */
    multi_signature = pmc_new(bc->interp, enum_class_FixedPMCArray);

    /* set its size as specified in type_count */
    VTABLE_set_integer_native(bc->interp, multi_signature, type_count);

    iter = types;
    --type_count; /* type count is 1 too high, fix that now. */

    /* add all multi types to the PMC array */
    for (i = 0; i < type_count; ++i) {
        PMC *sig_pmc = NULL;

        switch (iter->entry_type) {
            case MULTI_TYPE_IDENT: {
                /* add the string to the constant table, retrieve a pointer to the STRING */
                STRING * typestring = add_string_const_from_cstring(bc, types[i].entry.ident);
                /* create a new String PMC. */
                sig_pmc = pmc_new(bc->interp, enum_class_String);
                /* set the STRING in the String PMC */
                VTABLE_set_string_native(bc->interp, sig_pmc, typestring);
                break;
            }
            case MULTI_TYPE_KEYED: {
                /* XXX implement this */

                break;
            }
            default:
                fprintf(stderr, "invalid multi entry type");
                break; /* XXX fatal; throw excpetion? */
        }

        /* store the signature PMC in the array */
        VTABLE_set_pmc_keyed_int(bc->interp, multi_signature, i, sig_pmc);
    }

    return multi_signature;
}


/*

=item C<static PMC *
create_lexinfo(bytecode * const bc, PMC * sub, lexical * const lexicals, int needlex)>

Create a lexinfo PMC for the sub C<sub>. If there are no lexicals,
but the C<:lex> flag was specified, or the sub has an C<:outer> flag,
then a lexinfo is created after all. The created lexinfo is returned.

=cut

*/
static PMC *
create_lexinfo(bytecode * const bc, PMC * sub, lexical * const lexicals, int needlex) {
    lexical      * lexiter     = lexicals;
    INTVAL   const lex_info_id = Parrot_get_ctx_HLL_type(bc->interp, enum_class_LexInfo);
    STRING * const method      = string_from_literal(bc->interp, "declare_lex_preg");

    /* create a lexinfo PMC */
    PMC * lex_info             = pmc_new_noinit(bc->interp, lex_info_id);
    VTABLE_init_pmc(bc->interp, lex_info, sub);

    /* walk through the list of lexicals and register them */
    while (lexiter) {
        STRING *lexname = string_from_cstring(bc->interp, lexiter->name, strlen(lexiter->name));

        /* declare the .lex as such */

        fprintf(stderr, "Create lexinfo: color of .lex '%s' is: %d\n", lexiter->name,
                *lexiter->color);


        Parrot_PCCINVOKE(bc->interp, lex_info, method, "SI->", lexname, *lexiter->color);

        lexiter = lexiter->next;
    }

    /* if lex_info is still NULL, that means that the sub has no .lexicals,
     * and doesn't need a lex_info. If, however, the sub has an :outer or a
     * :lex flag, then create the lex_info anyway.
     */
    if (lex_info == NULL && needlex) {
        lex_info = pmc_new_noinit(bc->interp, lex_info_id);
        VTABLE_init_pmc(bc->interp, lex_info, sub);
    }

    return lex_info;
}

/*

=item C<static PMC *
find_outer_sub(bytecode * const bc, char const * const outername)>

Find the outer sub that has name C<outername>. If not found, NULL is returned.

XXX this function needs access to C<lexer>, which adds a dependency.
XXX This should be fixed, to make bcgen.c a complete independent module.

=cut

*/
static PMC *
find_outer_sub(bytecode * const bc, char const * const outername, struct lexer_state * const lexer)
{
    PMC          *current;
    STRING       *cur_name;
    size_t        len;
    global_label *outersub;

    /* we need a Interp called "interp", because of some macros expansions.
     * needed on Linux. 17-Jan-2009, kjs.
     */
    Interp       *interp = bc->interp;


    /* if sub has no :outer, leave */
    if (outername == NULL)
        return NULL;

    /* if outername is an empty string, leave */
    len = strlen(outername);
    if (len == 0)
        return NULL;

    /* find the outer sub */
    outersub = find_global_label(lexer, outername);

    if (outersub) {
        int const num_constants = interp->code->const_table->const_count;

        /* sanity check for const_table_index */
        if (outersub->const_table_index >= 0 && outersub->const_table_index < num_constants)
        {
            PackFile_Constant *subconst
                       = interp->code->const_table->constants[outersub->const_table_index];
            /* set a flag on that outer sub that it's an outer sub */
            PObj_get_FLAGS(subconst->u.key) |= SUB_FLAG_IS_OUTER;
            return subconst->u.key;
        }

    }

    /* could be eval too; check if :outer is the current sub */
    current = CONTEXT(interp)->current_sub;

    if (current == NULL) {
        fprintf(stderr, "cannot find :outer sub '%s'\n", outername); /* XXX exception ? */
        return NULL;
    }

    cur_name = PMC_sub(current)->name;

    /* XXX can't this be a call to string_compare() ? */
    if (cur_name->strlen == len && (memcmp((char *)cur_name->strstart, outername, len) == 0))
        return current;

    return NULL;
}



/*

=item C<static PMC *
get_namespace_pmc(bytecode * const bc, multi_type * const ns)>

Get a PMC representing the namespace for a sub. The namespace information
is passed in C<ns>.

=cut

*/
static PMC *
get_namespace_pmc(bytecode * const bc, multi_type * const ns) {
    if (ns == NULL)
        return NULL;

    switch (ns->entry_type) {
        case MULTI_TYPE_IDENT: {
            PMC *namespace_pmc         = constant_pmc_new(bc->interp, enum_class_String);
            PMC_str_val(namespace_pmc) = add_string_const_from_cstring(bc, ns->entry.ident);
            break;
        }
        case MULTI_TYPE_KEYED:
        default:
            fprintf(stderr, "keys are not supported for namespaces"); /* XXX exception? */
            break;
    }
    return NULL;
}


/*

=item C<static PMC *
create_sub_pmc(bytecode * const bc, char const * const instanceof)>

Create a Sub PMC. If C<instanceof> is not NULL, it indicates the name
of a class to be used. If it's NULL, and C<iscoroutine> is true, a Coroutine
sub PMC is created; otherwise it's a normal Sub. If there was a .HLL_map
directive that maps either Coroutine or Sub to some user-defined class,
then that mapped class is created.

=cut

*/
static PMC *
create_sub_pmc(bytecode * const bc, int iscoroutine, char const * const instanceof) {
    INTVAL type;

    /* Do we have to create an instance of a specific type for this sub? */
    if (instanceof) {
        /* Look it up as a class and as a PMC type. */
        STRING * const classname
                 = string_from_cstring(bc->interp, instanceof + 1, strlen(instanceof) - 2);

        PMC * const classobj = Parrot_oo_get_class_str(bc->interp, classname);

        if (!PMC_IS_NULL(classobj))
            return VTABLE_instantiate(bc->interp, classobj, PMCNULL);
        else {
            const INTVAL type = pmc_type(bc->interp, classname);

            if (type <= 0)
                Parrot_ex_throw_from_c_args(bc->interp, NULL, EXCEPTION_NO_CLASS,
                    "Requested sub class '%Ss' in :instanceof() not found", classname);

            return pmc_new(bc->interp, type);
        }

    }

    type = iscoroutine ? enum_class_Coroutine : enum_class_Sub;

    /* use a possible type mapping for the Sub PMCs, and create it */
    type = Parrot_get_ctx_HLL_type(bc->interp, type);

    /* XXX Most of this code comes from IMCC, which also has the TODO:
     * TODO create constant - see also src/packfile.c
     * XXX is this (still) necessary?
     */
    return pmc_new(bc->interp, type);
}


#if 0

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t *
make_jit_info(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
{
    const size_t old  = old_blocks(interp);
    const size_t size = unit->n_basic_blocks + old;

    if (!IMCC_INFO(interp)->globals->cs->jit_info) {
        const size_t len  =
            strlen(IMCC_INFO(interp)->globals->cs->seg->base.name) + 5;
        char * const name = mem_allocate_n_typed(len, char);

        snprintf(name, len, "%s_JIT",
            IMCC_INFO(interp)->globals->cs->seg->base.name);

        IMCC_INFO(interp)->globals->cs->jit_info =
                PackFile_Segment_new_seg(interp,
                    interp->code->base.dir, PF_UNKNOWN_SEG, name, 1);

        mem_sys_free(name);
    }

    /* store current size */
    IMCC_INFO(interp)->globals->cs->subs->n_basic_blocks = unit->n_basic_blocks;

    /* offset of block start and end, 4 * registers_used */
    IMCC_INFO(interp)->globals->cs->jit_info->data =
        mem_realloc_n_typed(IMCC_INFO(interp)->globals->cs->jit_info->data,
            size * 4, opcode_t);

    IMCC_INFO(interp)->globals->cs->jit_info->size = size * 4;

    return IMCC_INFO(interp)->globals->cs->jit_info->data + old * 4;
}

#endif /* HAS_JIT */



/*

=item C<void
add_sub_pmc(bytecode * const bc, sub_info * const info, int needlex, int subpragmas)>

Add a sub PMC to the constant table. This function initializes the sub PMC.
The index where the PMC is stored in the constant table is returned.
If C<needlex> is true, the sub will always get a lexpad; otherwise it will
only have a lexpad if it has lexicals, or if it's lexically nested.
The C<subpragmas> parameter encode flags such as C<:immediate> etc.

=cut

*/
int
add_sub_pmc(bytecode * const bc, sub_info * const info, int needlex, int subpragmas,
            struct lexer_state * const lexer)
{
    PMC                   *sub_pmc;        /* the "Sub" pmc, or a variant, such as "Coroutine" */
    Parrot_sub            *sub;
    int                    subconst_index; /* index in const table for the sub pmc */
    int                    subname_index;
    int                    i;              /* for loop iterator */
    PackFile_Constant     *subname_const;
    /* need a Interp object called "interp", because of some macro expansions. */
    Interp                *interp;


    interp                = bc->interp;
    sub_pmc               = create_sub_pmc(bc, info->iscoroutine, info->instanceof);
    sub                   = PMC_sub(sub_pmc);
    subname_index         = add_string_const(bc, info->subname, "ascii");
    subname_const         = bc->interp->code->const_table->constants[subname_index];

    /* set start and end offset of this sub in the bytecode.
     * This is calculated during the parsing phase.
     */
    sub->start_offs       = info->startoffset;
    sub->end_offs         = info->endoffset;
    sub->namespace_name   = get_namespace_pmc(bc, info->name_space);
    sub->HLL_id           = CONTEXT(bc->interp)->current_HLL;
    /* create a lexinfo object, if needlex is true, or this sub has an :outer */
    sub->lex_info         = create_lexinfo(bc, sub_pmc, info->lexicals,
                                           needlex | (info->outersub != NULL));

    sub->outer_sub        = find_outer_sub(bc, info->outersub, lexer);

    /* Set the vtable index; if this .sub was declared as :vtable, its vtable
     * index was found during the parse; otherwise it's -1.
     */
    sub->vtable_index     = info->vtable_index;
    sub->multi_signature  = generate_multi_signature(bc, info->multi_types, info->num_multi_types);

    /* copy sub pragma flags such as :immediate etc. */
    PObj_get_FLAGS(sub_pmc)     |= subpragmas & SUB_FLAG_PF_MASK;
    Sub_comp_get_FLAGS(sub_pmc) |= subpragmas & SUB_COMP_FLAG_MASK;


    /* store register usage of this sub. */
    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = info->regs_used[i];

    /* store the name of this sub; it's stored in the constant table. */
    sub->name = subname_const->u.string;

    /* If there was a :nsentry, add it to the constants table, and set
     * the ns_entry_name attribute to that STRING. Default value is the sub's name.
     */
    if (info->nsentry)
        sub->ns_entry_name = add_string_const_from_cstring(bc, info->nsentry);
    else
        sub->ns_entry_name = subname_const->u.string;

    /* if there was a :subid, add it to the constants table, and set the subid
     * attribute to that STRING. Default value is the sub's name.
     */
    if (info->subid)
        sub->subid = add_string_const_from_cstring(bc, info->subid);
    else
        sub->subid = subname_const->u.string;


    /* store the sub in a namespace. XXX why, and in what namespace? sub->namespace_name?
     * XXX must this be done always? (this w.r.t. the recent discussion about :vtable/:method
     * and being :anon etc.
     */
    Parrot_store_sub_in_namespace(bc->interp, sub_pmc);
    subconst_index = add_pmc_const(bc, sub_pmc);

    /* Add a new fixup entry in the fixup table for this sub. */
    PackFile_FixupTable_new_entry(bc->interp, info->subname, enum_fixup_sub, subconst_index);

    /* return the index in the constant table where this sub PMC is stored */
    return subconst_index;
}



/*

=item C<void
write_pbc_file(bytecode * const bc, char const * const filename)>

Write the generated bytecode (stored somewhere in a packfile)
to the file C<filename>.

=cut

*/
void
write_pbc_file(bytecode * const bc, char const * const filename) {
    size_t    size;
    opcode_t *packed;
    FILE     *fp;
    int       result;

    /* pack the packfile */
    size   = PackFile_pack_size(bc->interp, bc->interp->code->base.pf) * sizeof (opcode_t);
    packed = (opcode_t*) mem_sys_allocate(size);
    PackFile_pack(bc->interp, bc->interp->code->base.pf, packed);

    /* write to file */
    fp = fopen(filename, "wb");

    if (fp == NULL)
        fprintf(stderr, "Couldn't open %s\n", filename);

    result = fwrite(packed, size, 1, fp);

    if (result != 1)
        fprintf(stderr, "Couldn't write %s\n", filename);

    fclose(fp);

    /* done! */
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
