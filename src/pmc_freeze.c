/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/pmc_freeze.c - Freeze and thaw functionality

=head1 DESCRIPTION

Freeze uses the C<next_for_GC pointer()> to remember seen PMCs. PMCs are
written as IDs (or tags), which are calculated from their arena address.
This PMC number is multiplied by four. The 2 low bits indicate a seen
PMC or a PMC of the same type as the previous one respectively.

Thawing PMCs uses a list with (maximum) size of the amount of PMCs to
keep track of retrieved PMCs.

The individual information of PMCs is frozen/thawed by their vtables.

To avoid recursion, the whole functionality is driven by
C<< pmc->vtable->visit >>, which is called for the first PMC initially.
Container PMCs call a "todo-callback" for all contained PMCs. The
individual action vtable (freeze/thaw) is then called for all todo-PMCs.

In the current implementation C<IMAGE_IO> is a stand-in for some kind of
serializer PMC which will eventually be written. It associates a Parrot
C<STRING> with a vtable.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/* default.pmc thawing of properties */
void Parrot_default_thaw(Interp* , PMC* pmc, visit_info *info);

/*
 * define this to 1 for testing
 */
#ifndef FREEZE_ASCII
#define FREEZE_ASCII 0
#endif

/*
 * normal freeze can use next_for_GC ptrs or a seen hash
 */
#define FREEZE_USE_NEXT_FOR_GC 0

/*
 * when thawing a string longer then this size, we first do a
 * DOD run and then block DOD/GC - the system can't give us more headers
 */
#define THAW_BLOCK_DOD_SIZE 100000

/*
 * preallocate freeze image for aggregates with this estimation
 */
#if FREEZE_ASCII
#  define FREEZE_BYTES_PER_ITEM 17
#else
#  define FREEZE_BYTES_PER_ITEM 9
#endif

/*

=head2 Image Stream Functions

=over 4

=item C<static void
str_append(Parrot_Interp interp, STRING *s, const void *b, size_t len)>

Appends C<len> bytes from buffer C<*b> to string C<*s>.

Plain ascii - for testing only:

For speed reasons we mess around with the string buffers directly.

No encoding of strings, no transcoding.

=cut

*/

static void
str_append(Parrot_Interp interp, STRING *s, const void *b, size_t len)
{
    const size_t used = s->bufused;
    const int need_free = (int)PObj_buflen(s) - used - len;
    /*
     * grow by factor 1.5 or such
     */
    if (need_free <= 16) {
        size_t new_size = (size_t) (PObj_buflen(s) * 1.5);
        if (new_size < PObj_buflen(s) - need_free + 512)
            new_size = PObj_buflen(s) - need_free + 512;
        Parrot_reallocate_string(interp, s, new_size);
        assert(PObj_buflen(s) - used - len >= 15);
    }
    mem_sys_memcopy((void *)((ptrcast_t)s->strstart + used), b, len);
    s->bufused += len;
    s->strlen += len;
}

/*

=item C<static void
push_ascii_integer(Parrot_Interp interp, IMAGE_IO *io, INTVAL v)>

Pushes an ASCII version of the integer C<v> onto the end of the C<*io>
"stream".

=cut

*/

static void
push_ascii_integer(Parrot_Interp interp, IMAGE_IO *io, INTVAL v)
{
    char buffer[128];
    sprintf(buffer, "%d ", (int) v);
    str_append(interp, io->image, buffer, strlen(buffer));
}

/*

=item C<static void
push_ascii_number(Parrot_Interp interp, IMAGE_IO *io, FLOATVAL v)>

Pushes an ASCII version of the number C<v> onto the end of the C<*io>
"stream".

=cut

*/

static void
push_ascii_number(Parrot_Interp interp, IMAGE_IO *io, FLOATVAL v)
{
    char buffer[128];
    sprintf(buffer, "%g ", (double) v);
    str_append(interp, io->image, buffer, strlen(buffer));
}

/*

=item C<static void
push_ascii_string(Parrot_Interp interp, IMAGE_IO *io, STRING *s)>

Pushes an ASCII version of the string C<*s> onto the end of the C<*io>
"stream".

For testing only - no encodings and such.

XXX no string delimiters - so no space allowed.

=cut

*/

static void
push_ascii_string(Parrot_Interp interp, IMAGE_IO *io, STRING *s)
{
    const UINTVAL length = string_length(interp, s);
    char * const buffer = malloc(4*length);
    char *cursor = buffer;
    UINTVAL idx = 0;

    /* temporary--write out in UTF-8 */
    for ( idx = 0; idx < length; ++idx ) {
        *cursor++ = (unsigned char)string_index(interp, s, idx);
    }

    str_append(interp, io->image, buffer, cursor - buffer);
    str_append(interp, io->image, " ", 1);

    free(buffer);
}

/*

=item C<static void
push_ascii_pmc(Parrot_Interp interp, IMAGE_IO *io, PMC* v)>

Pushes an ASCII version of the PMC C<*v> onto the end of the C<*io>
"stream".

=cut

*/

static void
push_ascii_pmc(Parrot_Interp interp, IMAGE_IO *io, const PMC* v)
{
    char buffer[128];
    sprintf(buffer, "%p ", v);
    str_append(interp, io->image, buffer, strlen(buffer));
}

/*

=item C<static INTVAL
shift_ascii_integer(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns an integer from the start of the C<*io> "stream".

=cut

*/

static INTVAL
shift_ascii_integer(Parrot_Interp interp, IMAGE_IO *io)
{
    char * const start = (char*)io->image->strstart;
    char *p = start;
    const INTVAL i = strtoul(p, &p, 10);

    ++p;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    return i;
}

/*

=item C<static FLOATVAL
shift_ascii_number(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns an number from the start of the C<*io> "stream".

=cut

*/

static FLOATVAL
shift_ascii_number(Parrot_Interp interp, IMAGE_IO *io)
{
    char * const start = (char*)io->image->strstart;
    char *p = start;
    const FLOATVAL f = (FLOATVAL) strtod(p, &p);

    ++p;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    return f;
}

/*

=item C<static STRING*
shift_ascii_string(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns an string from the start of the C<*io> "stream".

=cut

*/

static STRING*
shift_ascii_string(Parrot_Interp interp, IMAGE_IO *io)
{
    STRING *s;

    char * const start = (char*)io->image->strstart;
    char *p = start;

    while (*p != ' ')
        ++p;
    ++p;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    s = string_make(interp, start, p - start - 1, "iso-8859-1", 0);
/*    s = string_make(interp, start, p - start - 1, "UTF-8", 0); */
    return s;
}

/*

=item C<static PMC*
shift_ascii_pmc(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns a PMC from the start of the C<*io> "stream".

=cut

*/

static PMC*
shift_ascii_pmc(Parrot_Interp interp, IMAGE_IO *io)
{
    char * const start = (char*)io->image->strstart;
    char *p = start;
    const unsigned long i = strtoul(p, &p, 16);
    ++p;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    return (PMC*) i;
}

/*

=back

=head2 C<opcode_t> IO Functions

=over 4

=item C<static PARROT_INLINE void
op_check_size(Parrot_Interp interp, STRING *s, size_t len)>

Checks the size of the "stream" buffer to see if it can accommodate
C<len> more bytes. If not then the buffer is expanded.

=cut

*/

static PARROT_INLINE void
op_check_size(Parrot_Interp interp, STRING *s, size_t len)
{
    const size_t used = s->bufused;
    const int need_free = (int)PObj_buflen(s) - used - len;
    /*
     * grow by factor 1.5 or such
     */
    if (need_free <= 16) {
        size_t new_size = (size_t) (PObj_buflen(s) * 1.5);
        if (new_size < PObj_buflen(s) - need_free + 512)
            new_size = PObj_buflen(s) - need_free + 512;
        Parrot_reallocate_string(interp, s, new_size);
        assert(PObj_buflen(s) - used - len >= 15);
    }
#ifndef DISABLE_GC_DEBUG
    Parrot_go_collect(interp);
#endif
}

/*

=item C<static void
op_append(Parrot_Interp interp, STRING *s, opcode_t b, size_t len)>

Appends the opcode C<b> to the string C<*s>.

=cut

*/

static void
op_append(Parrot_Interp interp, STRING *s, opcode_t b, size_t len)
{
    op_check_size(interp, s, len);
    *((opcode_t *)((ptrcast_t)s->strstart + s->bufused)) = b;
    s->bufused += len;
    s->strlen += len;
}

/*

=item C<static void
push_opcode_integer(Parrot_Interp interp, IMAGE_IO *io, INTVAL v)>

Pushes the integer C<v> onto the end of the C<*io> "stream".

XXX assumes sizeof(opcode_t) == sizeof(INTVAL).

=cut

*/

static void
push_opcode_integer(Parrot_Interp interp, IMAGE_IO *io, INTVAL v)
{
    assert(sizeof(opcode_t) == sizeof(INTVAL));
    op_append(interp, io->image, (opcode_t)v, sizeof(opcode_t));
}

/*

=item C<static void
push_opcode_number(Parrot_Interp interp, IMAGE_IO *io, FLOATVAL v)>

Pushes the number C<v> onto the end of the C<*io> "stream".

=cut

*/

static void
push_opcode_number(Parrot_Interp interp, IMAGE_IO *io, FLOATVAL v)
{
    const size_t len = PF_size_number() * sizeof(opcode_t);
    STRING * const s = io->image;
    const size_t used = s->bufused;

    op_check_size(interp, s, len);
    PF_store_number( (opcode_t *)((ptrcast_t)s->strstart + used), &v);
    s->bufused += len;
    s->strlen += len;
}

/*

=item C<static void
push_opcode_string(Parrot_Interp interp, IMAGE_IO *io, STRING* v)>

Pushes the string C<*v> onto the end of the C<*io> "stream".

=cut

*/

static void
push_opcode_string(Parrot_Interp interp, IMAGE_IO *io, STRING* v)
{
    const size_t len = PF_size_string(v) * sizeof(opcode_t);
    STRING * const s = io->image;
    const size_t used = s->bufused;

    op_check_size(interp, s, len);
    PF_store_string( (opcode_t *)((ptrcast_t)s->strstart + used), v);
    s->bufused += len;
    s->strlen += len;
}

/*

=item C<static void
push_opcode_pmc(Parrot_Interp interp, IMAGE_IO *io, PMC* v)>

Pushes the PMC C<*v> onto the end of the C<*io> "stream".

=cut

*/

static void
push_opcode_pmc(Parrot_Interp interp, IMAGE_IO *io, PMC* v)
{
    op_append(interp, io->image, (opcode_t)v, sizeof(opcode_t));
}

/*

=item C<static INTVAL
shift_opcode_integer(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns an integer from the start of the C<*io> "stream".

TODO - The shift functions aren't portable yet. We need to have a
packfile header for wordsize and endianess.

=cut

*/

static INTVAL
shift_opcode_integer(Parrot_Interp interp, IMAGE_IO *io)
{
    const char * const start = (char*)io->image->strstart;
    const INTVAL i =
        PF_fetch_integer(io->pf, (opcode_t**) &io->image->strstart);

    io->image->bufused -= ((char*)io->image->strstart - start);
    assert((int)io->image->bufused >= 0);
    return i;
}

/*

=item C<static PMC*
shift_opcode_pmc(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns an PMC from the start of the C<*io> "stream".

Note that this actually reads a PMC id, not a PMC.

=cut

*/

static PMC*
shift_opcode_pmc(Parrot_Interp interp, IMAGE_IO *io)
{
    return (PMC*) shift_opcode_integer(interp, io);
}

/*

=item C<tatic FLOATVAL
shift_opcode_number(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns an number from the start of the C<*io> "stream".

=cut

*/

static FLOATVAL
shift_opcode_number(Parrot_Interp interp, IMAGE_IO *io)
{
    const char * const start = (char*)io->image->strstart;
    const FLOATVAL f =
        PF_fetch_number(io->pf, (opcode_t**) &io->image->strstart);

    io->image->bufused -= ((char*)io->image->strstart - start);
    assert((int)io->image->bufused >= 0);
    return f;
}

/*

=item C<static STRING*
shift_opcode_string(Parrot_Interp interp, IMAGE_IO *io)>

Removes and returns a string from the start of the C<*io> "stream".

=cut

*/

static STRING*
shift_opcode_string(Parrot_Interp interp, IMAGE_IO *io)
{
    char * const start = (char*)io->image->strstart;
    STRING * const s =
        PF_fetch_string(interp, io->pf, (opcode_t**) &io->image->strstart);

    io->image->bufused -= ((char*)io->image->strstart - start);
    assert((int)io->image->bufused >= 0);
    return s;
}

/*

=back

=head2 Helper Functions

=over 4

=cut

*/

/*

=item C<static void
pmc_add_ext(Parrot_Interp interp, PMC *pmc)>

Adds a C<PMC_EXT> to C<*pmc>.

=cut

*/

static void
pmc_add_ext(Parrot_Interp interp, PMC *pmc)
{
    if (pmc->vtable->flags & VTABLE_PMC_NEEDS_EXT)
        add_pmc_ext(interp, pmc);
}

/*

=item C<static void
cleanup_next_for_GC_pool(Parrot_Interp interp,
    struct Small_Object_Pool *pool)>

Sets all the C<next_for_GC> pointers to C<NULL>.

=cut

*/

static void
cleanup_next_for_GC_pool(Parrot_Interp interp,
    struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *arena;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        PMC *p = arena->start_objects;
        UINTVAL i;

        for (i = 0; i < arena->used; i++) {
            if (!PObj_on_free_list_TEST(p)) {
                if (p->pmc_ext)
                    PMC_next_for_GC(p) = NULL;
            }
            p = (PMC *)((char *)p + sizeof(PMC));
        }
    }
}

/*

=item C<static void
cleanup_next_for_GC(Parrot_Interp interp)>

Cleans up the C<next_for_GC> pointers.

=cut

*/

static void
cleanup_next_for_GC(Parrot_Interp interp)
{
    cleanup_next_for_GC_pool(interp,
            interp->arena_base->pmc_pool);
    cleanup_next_for_GC_pool(interp,
            interp->arena_base->constant_pmc_pool);
}

/*
 * this function setup stuff may be replaced by a real PMC
 * in the future
 * TODO add read/write header functions, e.g. vtable->init_pmc
 */

#if FREEZE_ASCII
static image_funcs ascii_funcs = {
    push_ascii_integer,
    push_ascii_pmc,
    push_ascii_string,
    push_ascii_number,
    shift_ascii_integer,
    shift_ascii_pmc,
    shift_ascii_string,
    shift_ascii_number
};
#else
static image_funcs opcode_funcs = {
    push_opcode_integer,
    push_opcode_pmc,
    push_opcode_string,
    push_opcode_number,
    shift_opcode_integer,
    shift_opcode_pmc,
    shift_opcode_string,
    shift_opcode_number
};
#endif

/*

=item C<static void
ft_init(Parrot_Interp interp, visit_info *info)>

Initializes the freeze/thaw subsystem.

=cut

*/

static void
ft_init(Parrot_Interp interp, visit_info *info)
{
    STRING *s = info->image;
    struct PackFile *pf;

    info->image_io = mem_sys_allocate(sizeof(IMAGE_IO));
    info->image_io->image = s = info->image;
#if FREEZE_ASCII
    info->image_io->vtable = &ascii_funcs;
#else
    info->image_io->vtable = &opcode_funcs;
#endif
    pf = info->image_io->pf = PackFile_new(interp, 0);
    if (info->what == VISIT_FREEZE_NORMAL ||
        info->what == VISIT_FREEZE_AT_DESTRUCT) {

        op_check_size(interp, s, PACKFILE_HEADER_BYTES);
        mem_sys_memcopy(s->strstart, pf->header, PACKFILE_HEADER_BYTES);
        s->bufused += PACKFILE_HEADER_BYTES;
        s->strlen += PACKFILE_HEADER_BYTES;
    }
    else {
        if (string_length(interp, s) < PACKFILE_HEADER_BYTES) {
            real_exception(interp, NULL, E_IOError,
                    "bad string to thaw");
        }
        mem_sys_memcopy(pf->header, s->strstart, PACKFILE_HEADER_BYTES);
        PackFile_assign_transforms(pf);
        s->bufused -= PACKFILE_HEADER_BYTES;
        LVALUE_CAST(char *, s->strstart) += 16;
    }

    info->last_type = -1;
    info->id_list = pmc_new(interp, enum_class_Array);
    info->id = 0;
    info->extra_flags = EXTRA_IS_NULL;
    info->container = NULL;
}

static void visit_todo_list(Parrot_Interp, PMC*, visit_info* info);
static void add_pmc_todo_list(Parrot_Interp, PMC*, visit_info* info);

/*

=item C<static void
todo_list_init(Parrot_Interp interp, visit_info *info)>

Initializes the C<*info> lists.

=cut

*/

static void
todo_list_init(Parrot_Interp interp, visit_info *info)
{
    info->visit_pmc_now = visit_todo_list;
    info->visit_pmc_later = add_pmc_todo_list;
    /* we must use PMCs here, so that they get marked properly */
    info->todo = pmc_new(interp, enum_class_Array);
    info->seen = Parrot_new_INTVAL_hash(interp, 0);

    ft_init(interp, info);
}

/*

=item C<PARROT_INLINE static void
freeze_pmc(Parrot_Interp interp, PMC *pmc, visit_info *info,
        int seen, UINTVAL id)>

=cut

*/

PARROT_INLINE static void
freeze_pmc(Parrot_Interp interp, PMC *pmc, visit_info *info,
        int seen, UINTVAL id)
{
    IMAGE_IO * const io = info->image_io;
    INTVAL type;

    if (PMC_IS_NULL(pmc)) {
        /* NULL + seen bit */
        io->vtable->push_pmc(interp, io, (PMC*) 1);
        return;
    }
    type = pmc->vtable->base_type;

    if (PObj_is_object_TEST(pmc))
        type = enum_class_ParrotObject;
    if (seen) {
        if (info->extra_flags) {
            id |= 3;
            io->vtable->push_pmc(interp, io, (PMC*)id);
            io->vtable->push_integer(interp, io, info->extra_flags);
            return;
        }
        id |= 1;         /* mark bit 0 if this PMC is known */
    }
    else if (type == info->last_type) {
        id |= 2;         /* mark bit 1 and don't write type */
    }
    io->vtable->push_pmc(interp, io, (PMC*)id);
    if (! (id & 3)) {    /* else write type */
        io->vtable->push_integer(interp, io, type);
        info->last_type = type;
    }
}

/*

=item C<PARROT_INLINE static int
thaw_pmc(Parrot_Interp interp, visit_info *info,
        UINTVAL *id, INTVAL *type)>

Freeze and thaw a PMC (id).

For example, the ASCII representation of the C<Array>

P0 = [P1=666, P2=777, P0]

may look like this:

0xdf4 30 3 0xdf8 33 666 0xdf2 777 0xdf5

where 30 is C<class_enum_Array>, 33 is C<class_enum_Integer>, the
type of the second C<Integer> is suppressed, the repeated P0 has bit 0
set.

=cut

*/

PARROT_INLINE static int
thaw_pmc(Parrot_Interp interp, visit_info *info,
        UINTVAL *id, INTVAL *type)
{
    PMC *n;
    IMAGE_IO *io = info->image_io;
    int seen = 0;

    info->extra_flags = EXTRA_IS_NULL;
    n = io->vtable->shift_pmc(interp, io);
    if ( ((UINTVAL) n & 3) == 3) {
        /* pmc has extra data */
        info->extra_flags = io->vtable->shift_integer(interp, io);
    }
    else if ( (UINTVAL) n & 1) {     /* seen PMCs have bit 0 set */
        seen = 1;
    }
    else if ( (UINTVAL) n & 2) { /* prev PMC was same type */
        *type = info->last_type;
    }
    else {                       /* type follows */
        info->last_type = *type = io->vtable->shift_integer(interp, io);
        if (*type <= 0)
            internal_exception(1, "Unknown PMC type to thaw %d", (int) *type);
        if (*type >= interp->n_vtable_max ||
            !interp->vtables[*type]) {
            /* that ought to be a class */
            *type = enum_class_ParrotClass;
        }
    }
    *id = (UINTVAL) n;
    return seen;
}

/*

=item C<PARROT_INLINE static void
do_action(Parrot_Interp interp, PMC *pmc, visit_info *info,
        int seen, UINTVAL id)>

Called from C<visit_next_for_GC()> and C<visit_todo_list()> to perform
the action specified in C<< info->what >>.

Currently only C<VISIT_FREEZE_NORMAL> is implemented.

=cut

*/

PARROT_INLINE static void
do_action(Parrot_Interp interp, PMC *pmc, visit_info *info,
        int seen, UINTVAL id)
{
    switch (info->what) {
        case VISIT_FREEZE_AT_DESTRUCT:
        case VISIT_FREEZE_NORMAL:
            freeze_pmc(interp, pmc, info, seen, id);
            if (pmc)
                info->visit_action = pmc->vtable->freeze;
            break;
        default:
            internal_exception(1, "Illegal action %d", info->what);
            break;
    }
}

/*

=item C<PARROT_INLINE static PMC*
thaw_create_pmc(Parrot_Interp interp, PMC *pmc, visit_info *info,
        INTVAL type)>

Called from C<do_thaw()> to attach the vtable etc. to C<*pmc>.

=cut

*/

PARROT_INLINE static PMC*
thaw_create_pmc(Parrot_Interp interp, const visit_info *info,
        INTVAL type)
{
    PMC *pmc;
    switch (info->what) {
        case VISIT_THAW_NORMAL:
            pmc = pmc_new_noinit(interp, type);
            break;
        case VISIT_THAW_CONSTANTS:
            pmc = constant_pmc_new_noinit(interp, type);
            break;
        default:
            pmc = NULL;
            internal_exception(1, "Illegal visit_next type");
            break;
    }
    return pmc;
}

/*

=item C<PARROT_INLINE static void
do_thaw(Parrot_Interp interp, PMC* pmc, visit_info *info)>

Called by C<visit_todo_list_thaw()> to thaw and return a PMC.

C<seen> is false if this is the first time the PMC has been encountered.

=cut

*/

PARROT_INLINE static void
do_thaw(Parrot_Interp interp, PMC* pmc, visit_info *info)
{
    UINTVAL id;
    INTVAL type;
    PMC ** pos;
    int must_have_seen;
    type = 0; /* it's set below, avoid compiler warning. */
    must_have_seen = thaw_pmc(interp, info, &id, &type);

    id >>= 2;

    if (!id) {
        /* got a NULL PMC */
        pmc = PMCNULL;
        if (!info->thaw_result)
            info->thaw_result = pmc;
        else
            *info->thaw_ptr = pmc;
        return;
    }

    pos = list_get(interp, PMC_data(info->id_list), id, enum_type_PMC);
    if (pos == (void*)-1)
        pos = NULL;
    else if (pos) {
        pmc = *(PMC**)pos;
        if (!pmc)
            pos = NULL;
    }
    if (pos) {
        if (info->extra_flags == EXTRA_IS_PROP_HASH) {
            Parrot_default_thaw(interp, pmc, info);
            return;
        }
        /* else maybe VTABLE_thaw ... but there is no other extra stuff */

#if FREEZE_USE_NEXT_FOR_GC
        /*
         * the next_for_GC method doesn't keep track of repeated scalars
         * and such, as these are lacking the next_for_GC pointer, so
         * these are just duplicated with their data.
         * But we track these when thawing, so that we don't create dups
         */
        if (!must_have_seen) {
            /* so we must consume the bytecode */
            VTABLE_thaw(interp, pmc, info);
        }
#else
        assert(must_have_seen);
#endif
        /*
         * that's a duplicate
         if (info->container)
         DOD_WRITE_BARRIER(interp, info->container, NULL, pmc);
         */
        *info->thaw_ptr = pmc;
        return;
    }

    assert(!must_have_seen);
    pmc = thaw_create_pmc(interp, info, type);

    VTABLE_thaw(interp, pmc, info);
    if (info->extra_flags == EXTRA_CLASS_EXISTS) {
        pmc = info->extra;
        info->extra = NULL;
        info->extra_flags = 0;
    }
    if (!info->thaw_result)
        info->thaw_result = pmc;
    else {
        if (info->container) {
            DOD_WRITE_BARRIER(interp, info->container, NULL, pmc);
        }
        *info->thaw_ptr = pmc;
    }
    list_assign(interp, PMC_data(info->id_list), id, pmc, enum_type_PMC);
    /* remember nested aggregates depth first */
    if (pmc->pmc_ext)
        list_unshift(interp, PMC_data(info->todo), pmc, enum_type_PMC);
}


static UINTVAL
id_from_pmc(Parrot_Interp interp, PMC* pmc)
{
    UINTVAL id = 1;     /* first PMC in first arena */
    struct Small_Object_Arena *arena;
    struct Small_Object_Pool *pool;
    ptrdiff_t ptr_diff;

    pmc = (PMC*)PObj_to_ARENA(pmc);
    pool = interp->arena_base->pmc_pool;
    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        ptr_diff = (ptrdiff_t)pmc - (ptrdiff_t)arena->start_objects;
        if (ptr_diff >= 0 && ptr_diff <
                (ptrdiff_t)(arena->used * pool->object_size)) {
            assert(ptr_diff % pool->object_size == 0);
            id += ptr_diff / pool->object_size;
            return id << 2;
        }
        id += arena->total_objects;
    }
    pool = interp->arena_base->constant_pmc_pool;
    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        ptr_diff = (ptrdiff_t)pmc - (ptrdiff_t)arena->start_objects;
        if (ptr_diff >= 0 && ptr_diff <
                (ptrdiff_t)(arena->used * pool->object_size)) {
            assert(ptr_diff % pool->object_size == 0);
            id += ptr_diff / pool->object_size;
            return id << 2;
        }
        id += arena->total_objects;
    }

    internal_exception(1, "Couldn't find PMC in arenas");
    return -1;
}

/*

=item C<static void
add_pmc_next_for_GC(Parrot_Interp interp, PMC *pmc, visit_info *info)>

Remembers the PMC for later processing.

=cut

*/

static void
add_pmc_next_for_GC(Parrot_Interp interp, PMC *pmc, visit_info *info)
{
    if (pmc->pmc_ext) {
        PMC_next_for_GC(info->mark_ptr) = pmc;
        info->mark_ptr = PMC_next_for_GC(pmc) = pmc;
    }
}

/*

=item C<PARROT_INLINE static int
next_for_GC_seen(Parrot_Interp interp, PMC *pmc, visit_info *info,
        UINTVAL *id)>

Remembers next child to visit via the C<next_for_GC pointer> generate a
unique ID per PMC and freeze the ID (not the PMC address) so thaw the
hash-lookup can be replaced by an array lookup then which is a lot
faster.

=cut

*/

PARROT_INLINE static int
next_for_GC_seen(Parrot_Interp interp, PMC *pmc, visit_info *info,
        UINTVAL *id)
{
    int seen = 0;
    if (PMC_IS_NULL(pmc)) {
        *id = 0;
        return 1;
    }

    /*
     * we can only remember PMCs with a next_for_GC pointer
     * which is located in pmc_ext
     */
    if (pmc->pmc_ext) {
        /* already seen? */
        if (PMC_next_for_GC(pmc)) {
            seen = 1;
            goto skip;
        }
        /* put pmc at the end of the list */
        PMC_next_for_GC(info->mark_ptr) = pmc;
        /* make end self-referential */
        info->mark_ptr = PMC_next_for_GC(pmc) = pmc;
    }
skip:
    *id = id_from_pmc(interp, pmc);
    return seen;
}

/*

=item C<static void
add_pmc_todo_list(Parrot_Interp interp, PMC *pmc, visit_info *info)>

Remembers the PMC to be processed later.

=cut

*/

static void
add_pmc_todo_list(Parrot_Interp interp, PMC *pmc, visit_info *info)
{
    list_push(interp, PMC_data(info->todo), pmc, enum_type_PMC);
}

/*

=item C<PARROT_INLINE static int
todo_list_seen(Parrot_Interp interp, PMC *pmc, visit_info *info,
        UINTVAL *id)>

Returns true if the PMC was seen, otherwise it put it on the todo list,
generates an ID (tag) for PMC, offset by 4 as are addresses, low bits
are flags.

=cut

*/

PARROT_INLINE static int
todo_list_seen(Parrot_Interp interp, PMC *pmc, visit_info *info,
        UINTVAL *id)
{
    HashBucket * const b =
        parrot_hash_get_bucket(interp, PMC_struct_val(info->seen), pmc);

    if (b) {
        *id = (UINTVAL) b->value;
        return 1;
    }

    info->id += 4;      /* next id to freeze */
    *id = info->id;
    parrot_hash_put(interp, PMC_struct_val(info->seen), pmc, (void*)*id);
    /* remember containers */
    if (pmc->pmc_ext)
        list_unshift(interp, PMC_data(info->todo), pmc, enum_type_PMC);
    return 0;
}

/*

=item C<static void
visit_next_for_GC(Parrot_Interp interp, PMC* pmc, visit_info* info)>

C<visit_child> callbacks:

Checks if the PMC was seen, generate an ID for it if not, then do the
appropriate action.

=cut

*/

static void
visit_next_for_GC(Parrot_Interp interp, PMC* pmc, visit_info* info)
{
    UINTVAL id;
    const int seen = next_for_GC_seen(interp, pmc, info, &id);

    internal_exception(1, "todo convert to depth first");
    do_action(interp, pmc, info, seen, id);
    /*
     * TODO probe for class methods that override the default.
     * To avoid overhead, we could have an array[class_enums]
     * which (after first find_method) has a bit, if a user
     * callback is there.
     */
    if (!seen)
        (info->visit_action)(interp, pmc, info);
}

/*

=item C<static void
visit_todo_list(Parrot_Interp interp, PMC* pmc, visit_info* info)>

Checks the seen PMC via the todo list.

=cut

*/

static void
visit_todo_list(Parrot_Interp interp, PMC* pmc, visit_info* info)
{
    UINTVAL id;
    int seen;

    if (PMC_IS_NULL(pmc)) {
        seen = 1;
        id = 0;
    }
    else
        seen = todo_list_seen(interp, pmc, info, &id);
    do_action(interp, pmc, info, seen, id);
    if (!seen)
        (info->visit_action)(interp, pmc, info);
}

/*

=item C<static void
visit_todo_list_thaw(Parrot_Interp interp, PMC* old, visit_info* info)>

Callback for thaw - action first.

Todo-list and seen handling is all in C<do_thaw()>.

=cut

*/

static void
visit_todo_list_thaw(Parrot_Interp interp, PMC* old, visit_info* info)
{
    do_thaw(interp, old, info);
}

/*

=item C<static void
visit_loop_next_for_GC(Parrot_Interp interp, PMC *current,
        visit_info *info)>

Put first item on todo list, then run as long as there are items to be
done.

=cut

*/

static void
visit_loop_next_for_GC(Parrot_Interp interp, PMC *current,
        visit_info *info)
{
    visit_next_for_GC(interp, current, info);
    if (current->pmc_ext) {
        PMC *prev = NULL;

        while (current != prev) {
            VTABLE_visit(interp, current, info);
            prev = current;
            current = PMC_next_for_GC(current);
        }
    }
}

/*

=item C<static PMC*
visit_loop_todo_list(Parrot_Interp interp, PMC *current,
        visit_info *info)>

The thaw loop.

=cut

*/

/* XXX This should be in a header file. */
extern void
Parrot_default_thawfinish(Interp* interp, PMC* pmc, visit_info *info);

static void
visit_loop_todo_list(Parrot_Interp interp, PMC *current,
        visit_info *info)
{
    List *todo = PMC_data(info->todo);
    PMC *finish_list_pmc;
    int i, n;
    List *finish_list = NULL;   /* gcc -O3 warning */
    int finished_first = 0;

    const int thawing =  info->what == VISIT_THAW_CONSTANTS ||
            info->what == VISIT_THAW_NORMAL;
    if (thawing) {
        /*
         * create a list that contains PMCs that need thawfinish
         */
        finish_list_pmc = pmc_new(interp, enum_class_Array);
        finish_list = PMC_data(finish_list_pmc);
    }

    (info->visit_pmc_now)(interp, current, info);
    /*
     * can't cache upper limit, visit may append items
     */
again:
    for (; (int)list_length(interp, todo); ) {
        current = *(PMC**)list_shift(interp, todo, enum_type_PMC);
        VTABLE_visit(interp, current, info);
        if (thawing) {
            if (current == info->thaw_result)
                finished_first = 1;
            if (current->vtable && current->vtable->thawfinish !=
                    Parrot_default_thawfinish)
                list_unshift(interp, finish_list, current, enum_type_PMC);
        }
    }

    if (thawing) {
        /*
         * if image isn't consumed, there are some extra data to thaw
         */
        if (info->image->bufused > 0) {
            (info->visit_pmc_now)(interp, NULL, info);
            goto again;
        }
        /*
         * on thawing call thawfinish for each processed PMC
         */
        if (!finished_first) {
            /*
             * the first create PMC might not be in the list,
             * if it has no pmc_ext
             */
            list_unshift(interp, finish_list,
                    info->thaw_result, enum_type_PMC);
        }
        n = (int)list_length(interp, finish_list);
        for (i = 0; i < n ; ++i) {
            current = *(PMC**)list_get(interp, finish_list, i,
                    enum_type_PMC);
            if (!PMC_IS_NULL(current))
                VTABLE_thawfinish(interp, current, info);
        }
    }
}

/*

=item C<static void
create_image(Parrot_Interp interp, PMC *pmc, visit_info *info)>

Allocate image to some estimated size.

=cut

*/

static void
create_image(Parrot_Interp interp, PMC *pmc, visit_info *info)
{
    INTVAL len;
    if (!PMC_IS_NULL(pmc) && (VTABLE_does(interp, pmc,
                string_from_cstring(interp, "array", 0)) ||
        VTABLE_does(interp, pmc,
                string_from_cstring(interp, "hash", 0)))) {
        const INTVAL items = VTABLE_elements(interp, pmc);
        /*
         * TODO check e.g. first item of aggregate and estimate size
         */
        len = items * FREEZE_BYTES_PER_ITEM;
    }
    else
        len = FREEZE_BYTES_PER_ITEM;

    info->image = string_make_empty(interp, enum_stringrep_one, len);
}

/*

=item C<static PMC*
run_thaw(Parrot_Interp interp, STRING* image, visit_enum_type what)>

Performs thawing. C<what> indicates what to be thawed.

Thaw could use the C<next_for_GC> pointers as todo-list too, but this
would need 2 runs through the arenas to clean the C<next_for_GC>
pointers.

For now it seems cheaper to use a list for remembering contained
aggregates. We could of course decide dynamically, which strategy to
use, e.g.: given a big image, the first thawed item is a small
aggregate. This implies, it probably contains (or some big strings) more
nested containers, for which the C<next_for_GC> approach could be a win.

=cut

*/

static PMC*
run_thaw(Parrot_Interp interp, STRING* image, visit_enum_type what)
{
    visit_info info;
    int dod_block = 0;
    const UINTVAL bufused = image->bufused;

    info.image = image;
    /*
     * if we are thawing a lot of PMCs, its cheaper to do
     * a DOD run first and then block DOD - the limit should be
     * chosen so that no more then one DOD run would be triggered
     *
     * XXX
     *
     * md5_3.pir shows a segfault during thawing the config hash
     * info->thaw_ptr becomes invalid - seems that the hash got
     * collected under us.
     */
    if (1 || (string_length(interp, image) > THAW_BLOCK_DOD_SIZE)) {
        Parrot_do_dod_run(interp, 1);
        Parrot_block_DOD(interp);
        Parrot_block_GC(interp);
        dod_block = 1;
    }

    info.what = what;   /* _NORMAL or _CONSTANTS */
    todo_list_init(interp, &info);
    info.visit_pmc_now = visit_todo_list_thaw;
    info.visit_pmc_later = add_pmc_todo_list;

    info.thaw_result = NULL;
    /*
     * run thaw loop
     */
    visit_loop_todo_list(interp, NULL, &info);
    /*
     * thaw does "consume" the image string by incrementing strstart
     * and decrementing bufused - restore that
     */
    LVALUE_CAST(char *, image->strstart) -= bufused;
    image->bufused = bufused;
    assert(image->strstart >= PObj_bufstart(image));

    if (dod_block) {
        Parrot_unblock_DOD(interp);
        Parrot_unblock_GC(interp);
    }
    PackFile_destroy(interp, info.image_io->pf);
    mem_sys_free(info.image_io);
    return info.thaw_result;
}

/*

=back

=head2 Public Interface

=over 4

=item C<STRING*
Parrot_freeze_at_destruct(Parrot_Interp interp, PMC* pmc)>

This function must not consume any resources (except the image itself).
It uses the C<next_for_GC> pointer, so its not reentrant and must not be
interrupted by a DOD run.

=cut

*/

STRING*
Parrot_freeze_at_destruct(Parrot_Interp interp, PMC* pmc)
{
    visit_info info;

    Parrot_block_DOD(interp);
    cleanup_next_for_GC(interp);
    info.what = VISIT_FREEZE_AT_DESTRUCT;
    info.mark_ptr = pmc;
    info.thaw_ptr = NULL;
    info.visit_pmc_now = visit_next_for_GC;
    info.visit_pmc_later = add_pmc_next_for_GC;
    create_image(interp, pmc, &info);
    ft_init(interp, &info);

    visit_loop_next_for_GC(interp, pmc, &info);

    Parrot_unblock_DOD(interp);
    PackFile_destroy(interp, info.image_io->pf);
    mem_sys_free(info.image_io);
    return info.image;
}

/*

=item C<STRING*
Parrot_freeze(Parrot_Interp interp, PMC* pmc)>

Freeze using either method.

=cut

*/

STRING*
Parrot_freeze(Parrot_Interp interp, PMC* pmc)
{
#if FREEZE_USE_NEXT_FOR_GC
    /*
     * we could do a DOD run here before, to free resources
     */
    return Parrot_freeze_at_destruct(interp, pmc);
#else
    /*
     * freeze using a todo list and seen hash
     * Please note that both have to be PMCs, so that trace_system_stack
     * can call mark on the PMCs
     */
    visit_info info;

    info.what = VISIT_FREEZE_NORMAL;
    create_image(interp, pmc, &info);
    todo_list_init(interp, &info);

    visit_loop_todo_list(interp, pmc, &info);

    PackFile_destroy(interp, info.image_io->pf);
    mem_sys_free(info.image_io);
    return info.image;
#endif
}

/*

=item C<PMC*
Parrot_thaw(Parrot_Interp interp, STRING* image)>

Thaw a PMC, called from the C<thaw> opcode.

=cut

*/

PMC*
Parrot_thaw(Parrot_Interp interp, STRING* image)
{
    return run_thaw(interp, image, VISIT_THAW_NORMAL);
}

/*

=item C<PMC*
Parrot_thaw_constants(Parrot_Interp interp, STRING* image)>

Thaw the constants. This is used by PackFile for unpacking PMC
constants.

=cut

*/

PMC*
Parrot_thaw_constants(Parrot_Interp interp, STRING* image)
{
    return run_thaw(interp, image, VISIT_THAW_CONSTANTS);
}

/*

=item C<PMC*
Parrot_clone(Parrot_Interp interp, PMC* pmc)>

There are for sure shortcuts to clone faster, e.g. always thaw the image
immediately or use a special callback. But for now we just thaw a frozen
PMC.

=cut

*/

PMC*
Parrot_clone(Parrot_Interp interp, PMC* pmc)
{
    return Parrot_thaw(interp, Parrot_freeze(interp, pmc));
}

/*

=back

=head1 TODO

The seen-hash version for freezing might go away sometimes.

=head1 SEE ALSO

Lot of discussion on p6i and F<docs/dev/pmc_freeze.pod>.

=head1 HISTORY

Initial version by leo 2003.11.03 - 2003.11.07.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
