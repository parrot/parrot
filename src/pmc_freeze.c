/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/pmc_freeze.c - Freeze and thaw functionality

=head1 DESCRIPTION

Thawing PMCs uses a list with (maximum) size of the amount of PMCs to
keep track of retrieved PMCs.

The individual information of PMCs is frozen/thawed by their vtables.

To avoid recursion, the whole functionality is driven by
C<< pmc->vtable->visit >>, which is called for the first PMC initially.
Container PMCs call a "todo-callback" for all contained PMCs. The
individual action vtable (freeze/thaw) is then called for all todo-PMCs.

In the current implementation C<visit_info> is a stand-in for some kind of
serializer PMC which will eventually be written. It associates a Parrot
C<STRING> with a vtable.

=cut

*/

#include "parrot/parrot.h"
#include "pmc/pmc_context.h"
#include "pmc_freeze.str"

/* HEADERIZER HFILE: include/parrot/pmc_freeze.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void create_buffer(PARROT_INTERP,
    ARGIN_NULLOK(PMC *pmc),
    ARGMOD(visit_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*info);

PARROT_INLINE
static void do_action(PARROT_INTERP,
    ARGIN_NULLOK(PMC *pmc),
    ARGIN(visit_info *info),
    int seen,
    UINTVAL id)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_INLINE
static void do_thaw(PARROT_INTERP,
    ARGIN_NULLOK(PMC *pmc),
    ARGIN(visit_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_INLINE
static void freeze_pmc(PARROT_INTERP,
    ARGIN_NULLOK(PMC *pmc),
    ARGIN(visit_info *info),
    int seen,
    UINTVAL id)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_INLINE
static void ensure_buffer_size(PARROT_INTERP, ARGIN(visit_info *io), size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void push_opcode_integer(PARROT_INTERP,
    ARGIN(visit_info *io),
    INTVAL v)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void push_opcode_number(PARROT_INTERP,
    ARGIN(visit_info *io),
    FLOATVAL v)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void push_opcode_string(PARROT_INTERP,
    ARGIN(visit_info *io),
    ARGIN(STRING *v))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* run_thaw(PARROT_INTERP,
    ARGIN(STRING* image),
    visit_enum_type what)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL shift_opcode_integer(SHIM_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(2);

static FLOATVAL shift_opcode_number(SHIM_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* shift_opcode_string(PARROT_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
static PMC* thaw_create_pmc(PARROT_INTERP,
    ARGIN(const visit_info *info),
    INTVAL type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_INLINE
static int thaw_pmc(PARROT_INTERP,
    ARGMOD(visit_info *info),
    ARGOUT(UINTVAL *id),
    ARGOUT(INTVAL *type))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*info)
        FUNC_MODIFIES(*id)
        FUNC_MODIFIES(*type);

static void todo_list_init(PARROT_INTERP, ARGOUT(visit_info *info), ARGIN(STRING *input))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*info);

PARROT_INLINE
static int todo_list_seen(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGMOD(visit_info *info),
    ARGOUT(UINTVAL *id))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*info)
        FUNC_MODIFIES(*id);

static void visit_loop_todo_list(PARROT_INTERP,
    ARGIN_NULLOK(PMC *current),
    ARGIN(visit_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void visit_todo_list(PARROT_INTERP,
    ARGIN_NULLOK(PMC* pmc),
    ARGIN(visit_info* info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void visit_todo_list_thaw(PARROT_INTERP,
    ARGIN_NULLOK(PMC* old),
    ARGIN(visit_info* info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_create_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_do_action __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_do_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_freeze_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_ft_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_ensure_buffer_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_push_opcode_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_push_opcode_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_push_opcode_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io) \
    , PARROT_ASSERT_ARG(v))
#define ASSERT_ARGS_run_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(input))
#define ASSERT_ARGS_shift_opcode_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_shift_opcode_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_shift_opcode_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_thaw_create_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_thaw_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(id) \
    , PARROT_ASSERT_ARG(type))
#define ASSERT_ARGS_todo_list_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_todo_list_seen __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(id))
#define ASSERT_ARGS_visit_loop_todo_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_visit_todo_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_visit_todo_list_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* when thawing a string longer then this size, we first do a GC run and then
 * block GC - the system can't give us more headers */

#define THAW_BLOCK_GC_SIZE 100000

/* preallocate freeze image for aggregates with this estimation */
#define FREEZE_BYTES_PER_ITEM 9

/* macros/constants to handle packing/unpacking of PMC IDs and flags
 * the 2 LSBs are used for flags, all other bits are used for PMC ID
 */
#define PackID_new(id, flags)       (((UINTVAL)(id) * 4) | ((UINTVAL)(flags) & 3))
#define PackID_get_PMCID(id)        ((UINTVAL)(id) / 4)
#define PackID_set_PMCID(lv, id)    (lv) = PackID_new((id), PackID_get_FLAGS(lv))
#define PackID_get_FLAGS(id)        ((UINTVAL)(id) & 3)
#define PackID_set_FLAGS(lv, flags) (lv) = PackID_new(PackID_get_PMCID(lv), (flags))

enum {
    enum_PackID_normal     = 0,
    enum_PackID_seen       = 1,
    enum_PackID_prev_type  = 2,
    enum_PackID_extra_info = 3
};

/*

=head2 C<opcode_t> IO Functions

=over 4

=item C<static void ensure_buffer_size(PARROT_INTERP, visit_info *io, size_t len)>

Checks the size of the "stream" buffer to see if it can accommodate
C<len> more bytes. If not, expands the buffer.

=cut

*/

PARROT_INLINE
static void
ensure_buffer_size(PARROT_INTERP, ARGIN(visit_info *io), size_t len)
{
    ASSERT_ARGS(ensure_buffer_size)
    Buffer *buf = io->buffer;
    const size_t used      = io->pos - (char*)Buffer_bufstart(buf);
    const int need_free = Buffer_buflen(buf) - used - len;

    /* grow by factor 1.5 or such */
    if (need_free <= 16) {
        size_t new_size = (size_t) (Buffer_buflen(buf) * 1.5);
        if (new_size < Buffer_buflen(buf) - need_free + 512)
            new_size = Buffer_buflen(buf) - need_free + 512;
        Parrot_gc_reallocate_buffer_storage(interp, buf, new_size);
        io->pos = (char *)Buffer_bufstart(buf) + used;

        PARROT_ASSERT(Buffer_buflen(buf) - used - len >= 15);
    }

#ifndef DISABLE_GC_DEBUG
    Parrot_gc_compact_memory_pool(interp);
#endif

}

/*

=item C<static INTVAL get_visit_integer(PARROT_INTERP, visit_info *io)>

XXX TODO!!!

=cut

*/

static INTVAL
get_visit_integer(PARROT_INTERP, visit_info *io) {
    return io->what;
}

/*

=item C<static void push_opcode_integer(PARROT_INTERP, visit_info *io, INTVAL
v)>

Pushes the integer C<v> onto the end of the C<*io> "stream".

XXX assumes sizeof (opcode_t) == sizeof (INTVAL).

=cut

*/

static void
push_opcode_integer(PARROT_INTERP, ARGIN(visit_info *io), INTVAL v)
{
    ASSERT_ARGS(push_opcode_integer)
    size_t len = PF_size_integer() * sizeof (opcode_t);
    ensure_buffer_size(interp, io, len);
    io->pos = (char *)PF_store_integer((opcode_t *)io->pos, v);
}


/*

=item C<static void push_opcode_number(PARROT_INTERP, visit_info *io, FLOATVAL
v)>

Pushes the number C<v> onto the end of the C<*io> "stream".

=cut

*/

static void
push_opcode_number(PARROT_INTERP, ARGIN(visit_info *io), FLOATVAL v)
{
    ASSERT_ARGS(push_opcode_number)
    size_t len = PF_size_number() * sizeof (opcode_t);
    ensure_buffer_size(interp, io, len);
    io->pos = (char *)PF_store_number((opcode_t *)io->pos, &v);
}


/*

=item C<static void push_opcode_string(PARROT_INTERP, visit_info *io, STRING
*v)>

Pushes the string C<*v> onto the end of the C<*io> "stream".

=cut

*/

static void
push_opcode_string(PARROT_INTERP, ARGIN(visit_info *io), ARGIN(STRING *v))
{
    ASSERT_ARGS(push_opcode_string)
    size_t len = PF_size_string(v) * sizeof (opcode_t);
    ensure_buffer_size(interp, io, len);
    io->pos = (char *)PF_store_string((opcode_t *)io->pos, v);
}


/*

=item C<static INTVAL shift_opcode_integer(PARROT_INTERP, visit_info *io)>

Removes and returns an integer from the start of the C<*io> "stream".

=cut

*/

static inline INTVAL OUTPUT_LENGTH(visit_info *io) {
  return (io->pos - ((char *)Buffer_bufstart(io->buffer)));
}
static inline INTVAL INFO_HAS_DATA(visit_info *io) {
  return (io->pos < (((char *)Buffer_bufstart(io->buffer)) + io->input_length));
}
#define BYTECODE_SHIFT_OK(io) PARROT_ASSERT((io)->pos <= (((char *)Buffer_bufstart((io)->buffer)) + (io)->input_length))

static INTVAL
shift_opcode_integer(SHIM_INTERP, ARGIN(visit_info *io))
{
    ASSERT_ARGS(shift_opcode_integer)
    const INTVAL i = PF_fetch_integer(NULL, (const opcode_t **)&io->pos);
    BYTECODE_SHIFT_OK(io);
    return i;
}


/*

=item C<static FLOATVAL shift_opcode_number(PARROT_INTERP, visit_info *io)>

Removes and returns an number from the start of the C<*io> "stream".

=cut

*/

static FLOATVAL
shift_opcode_number(SHIM_INTERP, ARGIN(visit_info *io))
{
    ASSERT_ARGS(shift_opcode_number)
    const FLOATVAL f  = PF_fetch_number(NULL, (const opcode_t **)&io->pos);
    BYTECODE_SHIFT_OK(io);
    return f;
}


/*

=item C<static STRING* shift_opcode_string(PARROT_INTERP, visit_info *io)>

Removes and returns a string from the start of the C<*io> "stream".

=cut

*/


PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
shift_opcode_string(PARROT_INTERP, ARGIN(visit_info *io))
{
    ASSERT_ARGS(shift_opcode_string)
    STRING * const s = PF_fetch_string(interp, NULL, (const opcode_t **)&io->pos);
    BYTECODE_SHIFT_OK(io);
    return s;
}


/*

=back

=head2 Helper Functions

=over 4

=cut

*/

/*
 * this function setup stuff may be replaced by a real PMC
 * in the future
 * TODO add read/write header functions, e.g. vtable->init_pmc
 */

static image_funcs opcode_funcs = {
    get_visit_integer,
    push_opcode_integer,
    push_opcode_string,
    push_opcode_number,
    shift_opcode_integer,
    shift_opcode_string,
    shift_opcode_number
};

/*

=item C<static void todo_list_init(PARROT_INTERP, visit_info *info)>

Initializes the C<*info> lists.

=cut

*/

static void
todo_list_init(PARROT_INTERP, ARGOUT(visit_info *info), ARGIN(STRING *input))
{
    ASSERT_ARGS(todo_list_init)
    /* We want to store a 16-byte aligned header, but the actual
     * header may be shorter. */
    const unsigned int header_length = PACKFILE_HEADER_BYTES +
        (PACKFILE_HEADER_BYTES % 16 ?
         16 - PACKFILE_HEADER_BYTES % 16 : 0);

    PackFile *pf = PackFile_new(interp, 0);
    info->visit_pmc_now   = visit_todo_list;

    /* we must use PMCs here so that they get marked properly */
    info->todo = pmc_new(interp, enum_class_Array);
    info->seen = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pointer(interp, info->seen, parrot_new_intval_hash(interp));

    info->image_io = info; /* backwards-compat hack */

    info->vtable = &opcode_funcs;

    if (info->what == VISIT_FREEZE_NORMAL
    ||  info->what == VISIT_FREEZE_AT_DESTRUCT) {
        ensure_buffer_size(interp, info, header_length);
        mem_sys_memcopy(info->pos, pf->header, PACKFILE_HEADER_BYTES);
        info->pos += header_length;
    }
    else {
        if (Parrot_str_byte_length(interp, input) < header_length) {
            PackFile_destroy(interp, pf);
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_STRING_REPRESENTATION,
                "bad string to thaw");
        }

        /* TT #749: use the validation logic from Packfile_unpack */
        if (pf->header->bc_major != PARROT_PBC_MAJOR
        ||  pf->header->bc_minor != PARROT_PBC_MINOR) {
            PackFile_destroy(interp, pf);
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_STRING_REPRESENTATION,
                    "can't thaw a PMC from Parrot %d.%d", pf->header->bc_major,
                    pf->header->bc_minor);
        }

        info->buffer = (Buffer *)input;
        PARROT_ASSERT(input->_bufstart == input->strstart);
        info->pos = Buffer_bufstart(info->buffer);
        info->input_length = input->strlen;
        mem_sys_memcopy(pf->header, info->pos, PACKFILE_HEADER_BYTES);

        PackFile_assign_transforms(pf);

        info->pos += header_length;
    }

    PackFile_destroy(interp, pf);

    info->last_type   = -1;
    info->id_list     = pmc_new(interp, enum_class_Array);
    info->id          = 0;
    info->extra_flags = EXTRA_IS_NULL;
}


/*

=item C<static void freeze_pmc(PARROT_INTERP, PMC *pmc, visit_info *info, int
seen, UINTVAL id)>

Freeze PMC, setting type, seen, and "same-as-last" indicators as
appropriate.

=cut

*/

PARROT_INLINE
static void
freeze_pmc(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc), ARGIN(visit_info *info),
        int seen, UINTVAL id)
{
    ASSERT_ARGS(freeze_pmc)
    INTVAL           type;

    if (PMC_IS_NULL(pmc)) {
        /* NULL + seen bit */
        VTABLE_push_integer(interp, info, PackID_new(NULL, enum_PackID_seen));
        return;
    }

    type = pmc->vtable->base_type;

    if (PObj_is_object_TEST(pmc))
        type = enum_class_Object;

    if (seen) {
        if (info->extra_flags) {
            PackID_set_FLAGS(id, enum_PackID_extra_info);
            VTABLE_push_integer(interp, info, id);
            VTABLE_push_integer(interp, info, info->extra_flags);
            return;
        }

        PackID_set_FLAGS(id, enum_PackID_seen);
    }
    else if (type == info->last_type)
        PackID_set_FLAGS(id, enum_PackID_prev_type);

    VTABLE_push_integer(interp, info, id);

    if (PackID_get_FLAGS(id) == enum_PackID_normal) {
        /* write type */
        VTABLE_push_integer(interp, info, type);
        info->last_type = type;
    }
}


/*

=item C<static int thaw_pmc(PARROT_INTERP, visit_info *info, UINTVAL *id, INTVAL
*type)>

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

PARROT_INLINE
static int
thaw_pmc(PARROT_INTERP, ARGMOD(visit_info *info),
        ARGOUT(UINTVAL *id), ARGOUT(INTVAL *type))
{
    ASSERT_ARGS(thaw_pmc)
    UINTVAL          n    = VTABLE_shift_integer(interp, info);
    int              seen = 0;

    info->extra_flags     = EXTRA_IS_NULL;

    switch (PackID_get_FLAGS(n)) {
      case enum_PackID_extra_info:
        /* pmc has extra data */
        info->extra_flags = VTABLE_shift_integer(interp, info);
        break;
      case enum_PackID_seen:
        seen = 1;
        break;
      case enum_PackID_prev_type:
        /* prev PMC was same type */
        *type = info->last_type;
        break;
      default:
        /* type follows */
        {
            *type           = VTABLE_shift_integer(interp, info);
            info->last_type = *type;

            if (*type <= 0)
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "Unknown PMC type to thaw %d", (int) *type);

            /* that ought to be a class */
            if (*type >= interp->n_vtable_max || !interp->vtables[*type])
                *type = enum_class_Class;
        }
        break;
    }

    *id = n;
    return seen;
}


/*

=item C<static void do_action(PARROT_INTERP, PMC *pmc, visit_info *info, int
seen, UINTVAL id)>

Called from C<visit_todo_list()> to perform the action specified in
C<< info->what >>.

Currently only C<VISIT_FREEZE_NORMAL> and C<VISIT_FREEZE_AT_DESTRUCT> are
implemented.

=cut

*/

PARROT_INLINE
static void
do_action(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc), ARGIN(visit_info *info),
        int seen, UINTVAL id)
{
    ASSERT_ARGS(do_action)
    switch (info->what) {
      case VISIT_FREEZE_AT_DESTRUCT:
      case VISIT_FREEZE_NORMAL:
        freeze_pmc(interp, pmc, info, seen, id);
        if (pmc)
            info->visit_action = pmc->vtable->freeze;
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Illegal action %ld",
                (long)info->what);
    }
}


/*

=item C<static PMC* thaw_create_pmc(PARROT_INTERP, const visit_info *info,
INTVAL type)>

Called from C<do_thaw()> to attach the vtable etc. to C<*pmc>.

=cut

*/

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
static PMC*
thaw_create_pmc(PARROT_INTERP, ARGIN(const visit_info *info),
        INTVAL type)
{
    ASSERT_ARGS(thaw_create_pmc)
    PMC *pmc;
    switch (info->what) {
      case VISIT_THAW_NORMAL:
        pmc = pmc_new_noinit(interp, type);
        break;
      case VISIT_THAW_CONSTANTS:
        pmc = constant_pmc_new_noinit(interp, type);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "Illegal visit_next type");
    }

    return pmc;
}


/*

=item C<static void do_thaw(PARROT_INTERP, PMC *pmc, visit_info *info)>

Called by C<visit_todo_list_thaw()> to thaw and return a PMC.

C<seen> is false if this is the first time the PMC has been encountered.

=cut

*/

PARROT_INLINE
static void
do_thaw(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc), ARGIN(visit_info *info))
{
    ASSERT_ARGS(do_thaw)
    PMC **pos;

    /* set below, but avoid compiler warning */
    UINTVAL id             = 0;
    INTVAL  type           = 0;
    int     must_have_seen = thaw_pmc(interp, info, &id, &type);

    id = PackID_get_PMCID(id);

    if (!id) {
        /* got a NULL PMC */
        pmc = PMCNULL;
        if (!info->thaw_result)
            info->thaw_result = pmc;
        else
            *info->thaw_ptr = pmc;
        return;
    }

    pos = (PMC **)Parrot_pmc_array_get(interp, (List *)PMC_data(info->id_list),
        id, enum_type_PMC);

    if (pos == (void *)-1)
        pos = NULL;
    else if (pos) {
        pmc = *(PMC **)pos;
        if (!pmc)
            pos = NULL;
    }

    if (pos) {
        if (info->extra_flags == EXTRA_IS_PROP_HASH) {
            interp->vtables[enum_class_default]->thaw(interp, pmc, info);
            return;
        }

        /* else maybe VTABLE_thaw ... but there is no other extra stuff */

        PARROT_ASSERT(must_have_seen);

        *info->thaw_ptr = pmc;
        return;
    }

    PARROT_ASSERT(!must_have_seen);
    pmc = thaw_create_pmc(interp, info, type);

    VTABLE_thaw(interp, pmc, info);

    if (info->extra_flags == EXTRA_CLASS_EXISTS) {
        pmc               = (PMC *)info->extra;
        info->extra       = NULL;
        info->extra_flags = 0;
    }

    if (!info->thaw_result)
        info->thaw_result = pmc;
    else
        *info->thaw_ptr = pmc;


    Parrot_pmc_array_assign(interp, (List *)PMC_data(info->id_list), id, pmc, enum_type_PMC);

    /* remember nested aggregates depth first */
    Parrot_pmc_array_unshift(interp, (List *)PMC_data(info->todo), pmc, enum_type_PMC);
}

/*

=item C<static int todo_list_seen(PARROT_INTERP, PMC *pmc, visit_info *info,
UINTVAL *id)>

Returns true if the PMC was seen, otherwise it put it on the todo list.
Generates an ID (tag) for PMC, offset by 4 as are addresses.  Low bits are
flags.

=cut

*/

PARROT_INLINE
static int
todo_list_seen(PARROT_INTERP, ARGIN(PMC *pmc), ARGMOD(visit_info *info),
        ARGOUT(UINTVAL *id))
{
    ASSERT_ARGS(todo_list_seen)
    HashBucket * const b =
        parrot_hash_get_bucket(interp,
                (Hash *)VTABLE_get_pointer(interp, info->seen), pmc);

    if (b) {
        *id = (UINTVAL) b->value;
        return 1;
    }

    /* next id to freeze */
    info->id++;
    *id = PackID_new(info->id, enum_PackID_normal);

    parrot_hash_put(interp,
            (Hash *)VTABLE_get_pointer(interp, info->seen), pmc, (void *)*id);

    /* remember containers */
    Parrot_pmc_array_unshift(interp, (List *)PMC_data(info->todo), pmc, enum_type_PMC);

    return 0;
}


/*

=item C<static void visit_todo_list(PARROT_INTERP, PMC* pmc, visit_info* info)>

Checks the seen PMC via the todo list.

=cut

*/

static void
visit_todo_list(PARROT_INTERP, ARGIN_NULLOK(PMC* pmc), ARGIN(visit_info* info))
{
    ASSERT_ARGS(visit_todo_list)
    int     seen;
    UINTVAL id = 0;

    if (PMC_IS_NULL(pmc)) {
        seen = 1;
        id   = 0;
    }
    else
        seen = todo_list_seen(interp, pmc, info, &id);

    do_action(interp, pmc, info, seen, id);

    if (!seen)
        (info->visit_action)(interp, pmc, info);
}


/*

=item C<static void visit_todo_list_thaw(PARROT_INTERP, PMC* old, visit_info*
info)>

Callback for thaw - action first.

Todo-list and seen handling is all in C<do_thaw()>.

=cut

*/

static void
visit_todo_list_thaw(PARROT_INTERP, ARGIN_NULLOK(PMC* old), ARGIN(visit_info* info))
{
    ASSERT_ARGS(visit_todo_list_thaw)
    do_thaw(interp, old, info);
}


/*

=item C<static void visit_loop_todo_list(PARROT_INTERP, PMC *current, visit_info
*info)>

The thaw loop.

=cut

*/

static void
visit_loop_todo_list(PARROT_INTERP, ARGIN_NULLOK(PMC *current),
        ARGIN(visit_info *info))
{
    ASSERT_ARGS(visit_loop_todo_list)
    PMC        **list_item;
    List        *finish_list    = NULL;
    List * const todo           = (List *)PMC_data(info->todo);
    int          finished_first = 0;
    const int    thawing        = info->what == VISIT_THAW_CONSTANTS
                               || info->what == VISIT_THAW_NORMAL;
    int          i;

    /* create a list that contains PMCs that need thawfinish */
    if (thawing) {
        PMC * const finish_list_pmc = pmc_new(interp, enum_class_Array);
        finish_list                 = (List *)PMC_data(finish_list_pmc);
    }

    (info->visit_pmc_now)(interp, current, info);

    /* can't cache upper limit, visit may append items */
again:
    while ((list_item = (PMC **)Parrot_pmc_array_shift(interp, todo, enum_type_PMC))) {
        current = *list_item;
        if (!current)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "NULL current PMC in visit_loop_todo_list");

        PARROT_ASSERT(current->vtable);

        /* Workaround for thawing constants. Clear constant flag */
        /* See src/packfile.c:3999 */
        if (thawing)
            PObj_constant_CLEAR(current);

        VTABLE_visit(interp, current, info);

        if (thawing) {
            if (current == info->thaw_result)
                finished_first = 1;
            if (current->vtable->thawfinish != interp->vtables[enum_class_default]->thawfinish)
                Parrot_pmc_array_unshift(interp, finish_list, current, enum_type_PMC);
        }
    }

    if (thawing) {
        INTVAL n;
        /* if image isn't consumed, there are some extra data to thaw */
        if (INFO_HAS_DATA(info)) {
            (info->visit_pmc_now)(interp, NULL, info);
            goto again;
        }

        /* on thawing call thawfinish for each processed PMC */
        if (!finished_first)
            Parrot_pmc_array_unshift(interp, finish_list, info->thaw_result, enum_type_PMC);

        n = Parrot_pmc_array_length(interp, finish_list);

        for (i = 0; i < n ; ++i) {
            current = *(PMC**)Parrot_pmc_array_get(interp, finish_list, i, enum_type_PMC);
            if (!PMC_IS_NULL(current))
                VTABLE_thawfinish(interp, current, info);
        }
    }
}


/*

=item C<static void create_image(PARROT_INTERP, PMC *pmc, visit_info *info)>

Allocate image to some estimated size.

=cut

*/

static void
create_buffer(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc), ARGMOD(visit_info *info))
{
    ASSERT_ARGS(create_buffer)
    STRING *array = CONST_STRING(interp, "array");
    STRING *hash  = CONST_STRING(interp, "hash");
    INTVAL  len;

    if (!PMC_IS_NULL(pmc)
    && (VTABLE_does(interp, pmc, array) || VTABLE_does(interp, pmc, hash))) {
        const INTVAL items = VTABLE_elements(interp, pmc);
        /* TODO check e.g. first item of aggregate and estimate size */
        len = items * FREEZE_BYTES_PER_ITEM;
    }
    else
        len = FREEZE_BYTES_PER_ITEM;

    info->buffer = (Buffer *)Parrot_gc_new_bufferlike_header(interp, sizeof(Buffer));
    Parrot_gc_allocate_buffer_storage_aligned(interp, info->buffer, len); 
    info->pos = (char *)Buffer_bufstart(info->buffer);
}


/*

=item C<static PMC* run_thaw(PARROT_INTERP, STRING* image, visit_enum_type
what)>

Performs thawing. C<what> indicates what to be thawed.

For now it seems cheaper to use a list for remembering contained
aggregates. We could of course decide dynamically, which strategy to
use, e.g.: given a big image, the first thawed item is a small
aggregate. This implies, it probably contains (or some big strings) more
nested containers, for which another approach could be a win.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
run_thaw(PARROT_INTERP, ARGIN(STRING* input), visit_enum_type what)
{
    ASSERT_ARGS(run_thaw)
    visit_info    info;
    int           gc_block = 0;

    /*
     * if we are thawing a lot of PMCs, it's cheaper to do
     * a GC run first and then block GC - the limit should be
     * chosen so that no more then one GC run would be triggered
     *
     * XXX
     *
     * md5_3.pir shows a segfault during thawing the config hash
     * info->thaw_ptr becomes invalid - seems that the hash got
     * collected under us.
     */
    if (1 || (Parrot_str_byte_length(interp, input) > THAW_BLOCK_GC_SIZE)) {
        Parrot_block_GC_mark(interp);
        Parrot_block_GC_sweep(interp);
        gc_block = 1;
    }

    /* _NORMAL or _CONSTANTS */
    info.what = what;

    todo_list_init(interp, &info, input);
    info.visit_pmc_now   = visit_todo_list_thaw;

    info.thaw_result = NULL;

    /* run thaw loop */
    visit_loop_todo_list(interp, NULL, &info);

    BYTECODE_SHIFT_OK(&info);

    if (gc_block) {
        Parrot_unblock_GC_mark(interp);
        Parrot_unblock_GC_sweep(interp);
    }

    return info.thaw_result;
}


/*

=back

=head2 Public Interface

=over 4

=item C<STRING* Parrot_freeze(PARROT_INTERP, PMC *pmc)>

Freeze using either method.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_freeze(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_freeze)
    /*
     * freeze using a todo list and seen hash
     * Please note that both have to be PMCs, so that trace_system_stack
     * can call mark on the PMCs
     */
    visit_info info;
    STRING *result;

    info.what = VISIT_FREEZE_NORMAL;
    create_buffer(interp, pmc, &info);
    todo_list_init(interp, &info, NULL);

    visit_loop_todo_list(interp, pmc, &info);

    result = Parrot_str_new_init(interp, (char *)Buffer_bufstart(info.buffer), OUTPUT_LENGTH(&info),
      Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    return result;
}


/*

=item C<PMC* Parrot_thaw(PARROT_INTERP, STRING *image)>

Thaws a PMC.  Called from the C<thaw> opcode.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw)
    return run_thaw(interp, image, VISIT_THAW_NORMAL);
}


/*

=item C<PMC* Parrot_thaw_constants(PARROT_INTERP, STRING *image)>

Thaws constants, used by PackFile for unpacking PMC constants.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw_constants(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw_constants)
    return run_thaw(interp, image, VISIT_THAW_CONSTANTS);
}


/*

=item C<PMC* Parrot_clone(PARROT_INTERP, PMC *pmc)>

There are for sure shortcuts to clone faster, e.g. always thaw the image
immediately or use a special callback.  For now we just thaw a frozen PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_clone(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_clone)
    return VTABLE_clone(interp, pmc);
}


/*

=back

=head1 TODO

The seen-hash version for freezing might go away sometime.

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
