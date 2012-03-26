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
    Parrot_Signature *sig = Parrot_gc_allocate_fixed_size_storage(interp, sizeof(Parrot_Signature));

    return sig;
}

/*
=item C<void Parrot_pcc_signature_free(PARROT_INTERP, Parrot_Signature *sig)>

Free Signature

=cut
*/

PARROT_EXPORT
void
Parrot_pcc_signature_free(PARROT_INTERP, ARGFREE(Parrot_Signature *sig))
{
    Parrot_gc_free_fixed_size_storage(interp, sizeof(Parrot_Signature), sig);
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
