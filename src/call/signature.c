/*
Copyright (C) 2012, Parrot Foundation.

=head1 NAME

src/call/signature.c

=head1 DESCRIPTION

Signature for encapsulating PCC parameters passing.

=head1 FUNCTIONS

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/signature.h"

/* HEADERIZER HFILE: include/parrot/signature.h */

typedef struct Pcc_cell
{
    union u {
        PMC     *p;
        STRING  *s;
        INTVAL   i;
        FLOATVAL n;
    } u;
    INTVAL type;
} Pcc_cell;

#define NOCELL     0
#define INTCELL    1
#define FLOATCELL  2
#define STRINGCELL 3
#define PMCCELL    4

#define ALLOC_CELL(i) \
    (Pcc_cell *)Parrot_gc_allocate_fixed_size_storage((i), sizeof (Pcc_cell))

#define FREE_CELL(i, c) \
    Parrot_gc_free_fixed_size_storage((i), sizeof (Pcc_cell), (c))

#define CLONE_CELL(i, c, c_new) do { \
    (c_new)  = ALLOC_CELL(i); \
    *(c_new) = *(c); \
} while (0)

#define CELL_TYPE_MASK(c) (c)->type

#define CELL_INT(c)     (c)->u.i
#define CELL_FLOAT(c)   (c)->u.n
#define CELL_STRING(c)  (c)->u.s
#define CELL_PMC(c)     (c)->u.p

typedef struct Parrot_Signature {
    struct  Pcc_cell *positionals;  /* array of positionals */
    INTVAL  num_positionals;        /* count of used positionals */
    INTVAL  allocated_positionals;  /* count of allocated positionals */

    Hash   *hash;                   /* Hash of named arguments */
} Parrot_Signature ;

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static FLOATVAL autobox_floatval(PARROT_INTERP, ARGIN(const Pcc_cell *cell))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL autobox_intval(PARROT_INTERP, ARGIN(const Pcc_cell *cell))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC * autobox_pmc(PARROT_INTERP, ARGIN(Pcc_cell *cell), INTVAL type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * autobox_string(PARROT_INTERP, ARGIN(const Pcc_cell *cell))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void ensure_positionals_storage(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static Pcc_cell* get_cell_at(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static Hash * get_hash(PARROT_INTERP, ARGIN(PMC *SELF))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void mark_cell(PARROT_INTERP, ARGIN(Pcc_cell *c))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void mark_hash(PARROT_INTERP, ARGIN(Hash *h))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void mark_positionals(PARROT_INTERP, ARGIN(Parrot_Signature *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_autobox_floatval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cell))
#define ASSERT_ARGS_autobox_intval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cell))
#define ASSERT_ARGS_autobox_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cell))
#define ASSERT_ARGS_autobox_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cell))
#define ASSERT_ARGS_ensure_positionals_storage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_get_cell_at __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_get_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(SELF))
#define ASSERT_ARGS_mark_cell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(c))
#define ASSERT_ARGS_mark_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(h))
#define ASSERT_ARGS_mark_positionals __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*
=item C<Parrot_Signature* Parrot_pcc_signature_new(PARROT_INTERP)>

Allocate new Signature. Caller mast call C<Parrot_pcc_signature_free>
to free resources.

=cut
*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Signature*
Parrot_pcc_signature_new(PARROT_INTERP)
{
    Parrot_Signature *sig = (Parrot_Signature *)Parrot_gc_allocate_fixed_size_storage(interp, sizeof(Parrot_Signature));
    memset(sig, 1, sizeof (Parrot_Signature));

    return sig;
}

/*
=item C<void Parrot_pcc_signature_free(PARROT_INTERP, Parrot_Signature *self)>

Free Signature

=cut
*/

PARROT_EXPORT
void
Parrot_pcc_signature_free(PARROT_INTERP, ARGFREE(Parrot_Signature *self))
{
    if (self->allocated_positionals) {
        Pcc_cell *c;

        if (self->allocated_positionals > 8)
            Parrot_gc_free_memory_chunk(interp, self->positionals);
        else
            Parrot_gc_free_fixed_size_storage(interp,
                self->allocated_positionals * sizeof (Pcc_cell), self->positionals);
    }

    if (self->hash) {
        parrot_hash_iterate(self->hash,
            FREE_CELL(interp, (Pcc_cell *)_bucket->value););
        Parrot_hash_destroy(interp, self->hash);
    }

    Parrot_gc_free_fixed_size_storage(interp, sizeof(Parrot_Signature), self);
}

/*
=item C<void Parrot_pcc_signature_reset(PARROT_INTERP, Parrot_Signature *self)>

Reset Signature for reuse.

=cut
*/
PARROT_EXPORT
void
Parrot_pcc_signature_reset(PARROT_INTERP, ARGIN(Parrot_Signature *self))
{
    /* Don't free positionals. Just reuse them */
    self->num_positionals = 0;

    if (self->hash) {
        parrot_hash_iterate(self->hash,
           FREE_CELL(interp, (Pcc_cell *)_bucket->value););
        Parrot_hash_destroy(interp, self->hash);
        self->hash = NULL;
    }
}

/*
=back

=head1 ACCESSOR FUNCTIONS

=over 4

=item C<void Parrot_pcc_signature_push_integer(PARROT_INTERP, Parrot_Signature
*self, INTVAL value)>

=item C<void Parrot_pcc_signature_push_float(PARROT_INTERP, Parrot_Signature
*self, FLOATVAL value)>

=item C<void Parrot_pcc_signature_push_string(PARROT_INTERP, Parrot_Signature
*self, STRING *value)>

=item C<void Parrot_pcc_signature_push_pmc(PARROT_INTERP, Parrot_Signature
*self, PMC *value)>

Append positional parameter to Signature.

=cut
*/


void
Parrot_pcc_signature_push_integer(PARROT_INTERP, ARGIN(Parrot_Signature *self),
        INTVAL value)
{
    INTVAL num_pos = self->num_positionals;

    ensure_positionals_storage(interp, self, num_pos + 1);

    self->positionals[num_pos].u.i  = value;
    self->positionals[num_pos].type = INTCELL;
    self->num_positionals++;
}

void
Parrot_pcc_signature_push_float(PARROT_INTERP, ARGIN(Parrot_Signature *self),
        FLOATVAL value)
{
    INTVAL num_pos = self->num_positionals;

    ensure_positionals_storage(interp, self, num_pos + 1);

    self->positionals[num_pos].u.n  = value;
    self->positionals[num_pos].type = FLOATCELL;
    self->num_positionals++;
}

void
Parrot_pcc_signature_push_string(PARROT_INTERP, ARGIN(Parrot_Signature *self),
        ARGIN_NULLOK(STRING *value))
{
    INTVAL num_pos = self->num_positionals;

    ensure_positionals_storage(interp, self, num_pos + 1);

    self->positionals[num_pos].u.s      = value;
    self->positionals[num_pos].type     = STRINGCELL;
    self->num_positionals++;
}

void
Parrot_pcc_signature_push_pmc(PARROT_INTERP, ARGIN(Parrot_Signature *self),
        ARGIN_NULLOK(PMC *value))
{
    INTVAL num_pos = self->num_positionals;

    PARROT_ASSERT(!PObj_on_free_list_TEST(value)
            || !"Push dead object into CallContext!");


    ensure_positionals_storage(interp, self, num_pos + 1);

    self->positionals[num_pos].u.p      = value;
    self->positionals[num_pos].type     = PMCCELL;
    self->num_positionals++;
}

/*

=back

=head1 INTERNAL FUNCTIONS

=over 4

=item C<static void ensure_positionals_storage(PARROT_INTERP, Parrot_Signature
*self, INTVAL size)>

Ensure that we have enough space to store C<size> amount of positional elements.

=cut

*/

static void
ensure_positionals_storage(PARROT_INTERP, ARGIN(Parrot_Signature *self), INTVAL size)
{
    ASSERT_ARGS(ensure_positionals_storage)
    Pcc_cell *new_array;

    if (size <= self->allocated_positionals)
        return;

    if (size < 8)
        size = 8;

    if (size > 8)
        new_array = (Pcc_cell *)Parrot_gc_allocate_memory_chunk(interp,
                size * sizeof (Pcc_cell));
    else
        new_array = (Pcc_cell *)Parrot_gc_allocate_fixed_size_storage(interp,
                size * sizeof (Pcc_cell));

    if (self->positionals) {
        memcpy(new_array, self->positionals, self->num_positionals * sizeof (Pcc_cell));

        if (self->allocated_positionals > 8)
            Parrot_gc_free_memory_chunk(interp, self->positionals);
        else
            Parrot_gc_free_fixed_size_storage(interp,
                self->allocated_positionals * sizeof (Pcc_cell), self->positionals);
    }

    self->allocated_positionals = size;
    self->positionals           = new_array;
}

/*
=item C<static Pcc_cell* get_cell_at(PARROT_INTERP, Parrot_Signature *self,
INTVAL key)>

Get cell at index with reallocating if nessesary.

=cut
*/

PARROT_CANNOT_RETURN_NULL
static Pcc_cell*
get_cell_at(PARROT_INTERP, ARGIN(Parrot_Signature *self), INTVAL key)
{
    ASSERT_ARGS(get_cell_at)
    ensure_positionals_storage(interp, self, key + 1);
    return &self->positionals[key];
}

/*
=item C<static INTVAL autobox_intval(PARROT_INTERP, const Pcc_cell *cell)>

=item C<static STRING * autobox_string(PARROT_INTERP, const Pcc_cell *cell)>

=item C<static FLOATVAL autobox_floatval(PARROT_INTERP, const Pcc_cell *cell)>

=item C<static PMC * autobox_pmc(PARROT_INTERP, Pcc_cell *cell, INTVAL type)>

Autobox stored value to required value.

=cut
*/

static INTVAL
autobox_intval(PARROT_INTERP, ARGIN(const Pcc_cell *cell))
{
    ASSERT_ARGS(autobox_intval)
    switch (CELL_TYPE_MASK(cell)) {
      case INTCELL:
        return CELL_INT(cell);
      case FLOATCELL:
        return (INTVAL)CELL_FLOAT(cell);
      case STRINGCELL:
        return CELL_STRING(cell) ? Parrot_str_to_int(interp, CELL_STRING(cell)) : 0;
      case PMCCELL:
        return VTABLE_get_integer(interp, CELL_PMC(cell));
      default:
        break;
    }

    /* exception */
    return 0;
}

static FLOATVAL
autobox_floatval(PARROT_INTERP, ARGIN(const Pcc_cell *cell))
{
    ASSERT_ARGS(autobox_floatval)
    switch (CELL_TYPE_MASK(cell)) {
      case INTCELL:
        return (FLOATVAL)CELL_INT(cell);
      case FLOATCELL:
        return CELL_FLOAT(cell);
      case STRINGCELL:
        return CELL_STRING(cell) ? Parrot_str_to_num(interp, CELL_STRING(cell)) : 0.0;
      case PMCCELL:
        return VTABLE_get_number(interp, CELL_PMC(cell));
      default:
        break;
    }

    /* exception */
    return 0.0;
}

PARROT_CANNOT_RETURN_NULL
static STRING *
autobox_string(PARROT_INTERP, ARGIN(const Pcc_cell *cell))
{
    ASSERT_ARGS(autobox_string)
    switch (CELL_TYPE_MASK(cell)) {
      case INTCELL:
        return Parrot_str_from_int(interp, CELL_INT(cell));
      case FLOATCELL:
        return Parrot_str_from_num(interp, CELL_FLOAT(cell));
      case STRINGCELL:
        return CELL_STRING(cell);
      case PMCCELL:
        return VTABLE_get_string(interp, CELL_PMC(cell));
      default:
        break;
    }

    /* exception */
    return STRINGNULL;
}

PARROT_CANNOT_RETURN_NULL
static PMC *
autobox_pmc(PARROT_INTERP, ARGIN(Pcc_cell *cell), INTVAL type)
{
    ASSERT_ARGS(autobox_pmc)
    PMC *result = PMCNULL;

    switch (type) {
      case INTCELL:
        result = Parrot_pmc_box_integer(interp, CELL_INT(cell));
        break;
      case FLOATCELL:
        result = Parrot_pmc_box_number(interp, CELL_FLOAT(cell));
        break;
      case STRINGCELL:
        result = Parrot_pmc_box_string(interp, CELL_STRING(cell));
        break;
      case PMCCELL:
        result = CELL_PMC(cell);
      default:
        /* exception */
        break;
    }

    return result;
}

/*
=item C<static Hash * get_hash(PARROT_INTERP, PMC *SELF)>

Lazily allocated Hash for named parameters.

=cut
*/

PARROT_CANNOT_RETURN_NULL
static Hash *
get_hash(PARROT_INTERP, ARGIN(PMC *SELF))
{
    ASSERT_ARGS(get_hash)
    Hash   *hash;

    GETATTR_CallContext_hash(interp, SELF, hash);

    if (!hash) {
        hash = Parrot_hash_create(interp,
            enum_type_ptr,
            Hash_key_type_STRING);

        SETATTR_CallContext_hash(interp, SELF, hash);
    }

    return hash;
}

/*
=item C<static void mark_cell(PARROT_INTERP, Pcc_cell *c)>

Helper function for marking.

=cut
*/

static void
mark_cell(PARROT_INTERP, ARGIN(Pcc_cell *c))
{
    ASSERT_ARGS(mark_cell)
    switch (CELL_TYPE_MASK(c)) {
        case STRINGCELL:
            if (CELL_STRING(c))
                Parrot_gc_mark_STRING_alive(interp, CELL_STRING(c));
            break;
        case PMCCELL:
            if (!PMC_IS_NULL(CELL_PMC(c)))
                Parrot_gc_mark_PMC_alive(interp, CELL_PMC(c));
            break;
        case INTCELL:
        case FLOATCELL:
        default:
            break;
    }

}

/*
=item C<static void mark_positionals(PARROT_INTERP, Parrot_Signature *self)>

Helper function to mark positional arguments.

=cut
*/

static void
mark_positionals(PARROT_INTERP, ARGIN(Parrot_Signature *self))
{
    ASSERT_ARGS(mark_positionals)
    INTVAL i;

    for (i = 0; i < self->num_positionals; ++i)
        mark_cell(interp, &self->positionals[i]);
}

/*
=item C<static void mark_hash(PARROT_INTERP, Hash *h)>

Helper to mark named parameters.

=cut
*/

/* don't look now, but here goes encapsulation.... */
static void
mark_hash(PARROT_INTERP, ARGIN(Hash *h))
{
    ASSERT_ARGS(mark_hash)
    parrot_hash_iterate(h,
        Parrot_gc_mark_STRING_alive(interp, (STRING *)_bucket->key);
        mark_cell(interp, (Pcc_cell *)_bucket->value););
}


/*

=back

=head1 SEE ALSO

F<include/parrot/call.h>, F<src/call/ops.c>, F<src/call/pcc.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
