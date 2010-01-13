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
#include "pmc/pmc_callcontext.h"
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
static void ensure_buffer_size(PARROT_INTERP,
    ARGIN(visit_info *io),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL get_visit_integer(PARROT_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_INLINE
static INTVAL INFO_HAS_DATA(ARGIN(visit_info *io))
        __attribute__nonnull__(1);

PARROT_INLINE
static INTVAL OUTPUT_LENGTH(ARGIN(visit_info *io))
        __attribute__nonnull__(1);

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

static INTVAL shift_opcode_integer(SHIM_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(2);

static FLOATVAL shift_opcode_number(SHIM_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* shift_opcode_string(PARROT_INTERP, ARGIN(visit_info *io))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void visit_info_init(PARROT_INTERP,
    ARGOUT(visit_info *info),
    visit_enum_type what,
    ARGIN(STRING *input),
    ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*info);

static void visit_loop_todo_list(PARROT_INTERP,
    ARGIN_NULLOK(PMC *current),
    ARGIN(visit_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void visit_todo_list_freeze(PARROT_INTERP,
    ARGIN_NULLOK(PMC* pmc),
    ARGIN(visit_info* info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_INLINE
static void visit_todo_list_thaw(PARROT_INTERP,
    SHIM(PMC* pmc_not_used),
    ARGIN(visit_info* info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_create_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_ensure_buffer_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_get_visit_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_INFO_HAS_DATA __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_OUTPUT_LENGTH __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(io))
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
#define ASSERT_ARGS_shift_opcode_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_shift_opcode_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_shift_opcode_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io))
#define ASSERT_ARGS_visit_info_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(input) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_visit_loop_todo_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_visit_todo_list_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
};

/*

=head2 C<opcode_t> IO Functions

=over 4

=item C<static void ensure_buffer_size(PARROT_INTERP, visit_info *io, size_t
len)>

Checks the size of the "stream" buffer to see if it can accommodate
C<len> more bytes. If not, expands the buffer.

=cut

*/

#define GET_VISIT_CURSOR(io) \
    ((opcode_t *)(((char *)Buffer_bufstart((io)->buffer) + (io)->pos)))
#define SET_VISIT_CURSOR(io, x) do {\
    (io)->pos = ((char *)(x) - (char *)Buffer_bufstart((io)->buffer)); \
} while (0)
#define INC_VISIT_CURSOR(io, x) do {\
    (io)->pos += (x); \
} while (0)

#define BYTECODE_SHIFT_OK(io) PARROT_ASSERT((io)->pos <= (io)->input_length)


PARROT_INLINE
static void
ensure_buffer_size(PARROT_INTERP, ARGIN(visit_info *io), size_t len)
{
    ASSERT_ARGS(ensure_buffer_size)
    Buffer *buf         = io->buffer;
    const size_t used   = io->pos;
    const int need_free = Buffer_buflen(buf) - used - len;

    /* grow by factor 1.5 or such */
    if (need_free <= 16) {
        size_t new_size = (size_t) (Buffer_buflen(buf) * 1.5);
        if (new_size < Buffer_buflen(buf) - need_free + 512)
            new_size = Buffer_buflen(buf) - need_free + 512;
        Parrot_gc_reallocate_buffer_storage(interp, buf, new_size);

        PARROT_ASSERT(Buffer_buflen(buf) - used - len >= 15);
    }

#ifndef DISABLE_GC_DEBUG
    Parrot_gc_compact_memory_pool(interp);
#endif

}

/*

=item C<static INTVAL OUTPUT_LENGTH(visit_info *io)>

XXX TODO

=cut

*/

PARROT_INLINE
static INTVAL
OUTPUT_LENGTH(ARGIN(visit_info *io)) {
    ASSERT_ARGS(OUTPUT_LENGTH)
    return io->pos;
}

/*

=item C<static INTVAL INFO_HAS_DATA(visit_info *io)>

XXX TODO

=cut

*/

PARROT_INLINE
static INTVAL
INFO_HAS_DATA(ARGIN(visit_info *io)) {
    ASSERT_ARGS(INFO_HAS_DATA)
    return io->pos < io->input_length;
}


/*

=item C<static INTVAL get_visit_integer(PARROT_INTERP, visit_info *io)>

get the flags describing the visit action

=cut

*/

static INTVAL
get_visit_integer(PARROT_INTERP, ARGIN(visit_info *io)) {
    ASSERT_ARGS(get_visit_integer)
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
    SET_VISIT_CURSOR(io, PF_store_integer(GET_VISIT_CURSOR(io), v));
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
    SET_VISIT_CURSOR(io, PF_store_number(GET_VISIT_CURSOR(io), &v));
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
    SET_VISIT_CURSOR(io, PF_store_string(GET_VISIT_CURSOR(io), v));
}

/*

=item C<static void push_opcode_pmc(PARROT_INTERP, visit_info *io, PMC *v)>

Pushes a reference to pmc C<*v> onto the end of the C<*io> "stream". If C<*v>
hasn't been seen yet, it is also pushed onto the todo list.

=cut

*/

static void
push_opcode_pmc(PARROT_INTERP, ARGIN(visit_info *io), ARGIN(PMC *v)) {
    io->thaw_ptr = &v;
    (io->visit_pmc_now)(interp, v, io);
}

/*

=item C<static INTVAL shift_opcode_integer(PARROT_INTERP, visit_info *io)>

Removes and returns an integer from the start of the C<*io> "stream".

=cut

*/

static INTVAL
shift_opcode_integer(SHIM_INTERP, ARGIN(visit_info *io))
{
    ASSERT_ARGS(shift_opcode_integer)
    opcode_t *pos  = GET_VISIT_CURSOR(io);
    const INTVAL i = PF_fetch_integer(io->pf, (const opcode_t **)&pos);
    SET_VISIT_CURSOR(io, pos);
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
    opcode_t *pos     = GET_VISIT_CURSOR(io);
    const FLOATVAL f  = PF_fetch_number(io->pf, (const opcode_t **)&pos);
    SET_VISIT_CURSOR(io, pos);
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
    opcode_t *pos    = GET_VISIT_CURSOR(io);
    STRING * const s = PF_fetch_string(interp, io->pf, (const opcode_t **)&pos);
    SET_VISIT_CURSOR(io, pos);
    BYTECODE_SHIFT_OK(io);
    return s;
}

/*

=item C<static PMC *shift_opcode_pmc(PARROT_INTERP, visit_info *io)>

Removes and returns a reference to a pmc from the start of the C<*io> "stream".

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
shift_opcode_pmc(PARROT_INTERP, ARGIN(visit_info *io)) {
    PMC *result;
    io->thaw_ptr = &result;
    (io->visit_pmc_now)(interp, NULL, io);
    return result;
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
    push_opcode_pmc,
    shift_opcode_integer,
    shift_opcode_string,
    shift_opcode_number,
    shift_opcode_pmc
};

/*

=item C<static void visit_info_init(PARROT_INTERP, visit_info *info,
visit_enum_type what, STRING *input, PMC *pmc)>

Initializes the C<*info> lists.

=cut

*/
#define GROW_TO_16_BYTE_BOUNDARY(size) ((size) + ((size) % 16 ? 16 - (size) % 16 : 0))

static void
visit_info_init(PARROT_INTERP, ARGOUT(visit_info *info),
  visit_enum_type what, ARGIN(STRING *input), ARGIN(PMC *pmc))
{
    ASSERT_ARGS(visit_info_init)
    /* We want to store a 16-byte aligned header, but the actual * header may be shorter. */
    const unsigned int header_length = GROW_TO_16_BYTE_BOUNDARY(PACKFILE_HEADER_BYTES);

    PackFile *pf = info->pf = PackFile_new(interp, 0);
    info->what = what;
    info->vtable = &opcode_funcs;
    info->image_io = info; /* backwards-compat hack */

    if (info->what == VISIT_FREEZE_NORMAL) {
        info->visit_pmc_now  = visit_todo_list_freeze;
        create_buffer(interp, pmc, info);
        ensure_buffer_size(interp, info, header_length);
        mem_sys_memcopy(GET_VISIT_CURSOR(info), pf->header, PACKFILE_HEADER_BYTES);
        INC_VISIT_CURSOR(info, header_length);
    }
    else { /* VISIT_THAW_ */
        int unpacked_length;
        info->visit_pmc_now    = visit_todo_list_thaw;
        info->buffer = (Buffer *)input;
        PARROT_ASSERT(input->_bufstart == input->strstart);
        SET_VISIT_CURSOR(info, Buffer_bufstart(info->buffer));
        info->input_length = input->strlen;

        pf->options |= PFOPT_PMC_FREEZE_ONLY;
        unpacked_length = PackFile_unpack(interp, pf, GET_VISIT_CURSOR(info), info->input_length);
        if (!unpacked_length) {
            PackFile_destroy(interp, info->pf);
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_STRING_REPRESENTATION,
                    "PackFile header failed during unpack");
        }
        else {
            INC_VISIT_CURSOR(info, header_length);
        }
    }

    /* we must use PMCs here so that they get marked properly */
    info->todo        = pmc_new(interp, enum_class_Array);
    info->seen        = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pointer(interp, info->seen, parrot_new_intval_hash(interp));
    info->id_list     = pmc_new(interp, enum_class_Array);
    info->id          = 0;
    info->extra_flags = EXTRA_IS_NULL;

    visit_loop_todo_list(interp, pmc, info);
    PackFile_destroy(interp, info->pf);
}


PARROT_INLINE
static PMC*
id_list_get(PARROT_INTERP, ARGIN(visit_info *info), UINTVAL id) {
    List * const id_list = (List *)PMC_data(info->id_list);
    PMC **pos = (PMC **)Parrot_pmc_array_get(interp, id_list, id, enum_type_PMC);

    if (pos && pos != ((void *)-1))
        return *pos;
    return NULL;
}

/*

=item C<static void visit_todo_list_thaw(PARROT_INTERP, PMC* pmc_not_used,
visit_info* info)>

Callback for thaw - action first.
thaws and return a PMC.

=cut

*/

PARROT_INLINE
static void
visit_todo_list_thaw(PARROT_INTERP, SHIM(PMC* pmc_not_used), ARGIN(visit_info* info))
{
    ASSERT_ARGS(visit_todo_list_thaw)

    UINTVAL  n            = VTABLE_shift_integer(interp, info);
    UINTVAL  id           = PackID_get_PMCID(n);
    int      packid_flags = PackID_get_FLAGS(n);
    PMC     *pmc          = PMCNULL;

    PARROT_ASSERT(info->what == VISIT_THAW_NORMAL);

    switch (packid_flags) {
      case enum_PackID_seen:
        if (id) /* got a non-NULL PMC */
            pmc = id_list_get(interp, info, id);
        break;
      case enum_PackID_normal:
        {
            INTVAL type = VTABLE_shift_integer(interp, info);
            if (type <= 0 || type > interp->n_vtable_max)
                Parrot_ex_throw_from_c_args(interp, NULL, 1, "Unknown PMC type to thaw %d", type);

            pmc = pmc_new_noinit(interp, type);
            VTABLE_thaw(interp, pmc, info);

            {
                List * const todo    = (List *)PMC_data(info->todo);
                List * const id_list = (List *)PMC_data(info->id_list);
                Parrot_pmc_array_assign(interp, id_list, id, pmc, enum_type_PMC);
                /* remember nested aggregates depth first */
                Parrot_pmc_array_unshift(interp, todo, pmc, enum_type_PMC);
            }
        }
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Unknown PMC id args thaw %d", packid_flags);
        break;
    }

    *info->thaw_ptr = pmc;
}


/*

=item C<static void visit_todo_list_freeze(PARROT_INTERP, PMC* pmc, visit_info*
info)>

Checks the seen PMC via the todo list.

=cut

*/

static void
visit_todo_list_freeze(PARROT_INTERP, ARGIN_NULLOK(PMC* pmc), ARGIN(visit_info* info))
{
    ASSERT_ARGS(visit_todo_list_freeze)
    UINTVAL id;
    int packid_type;

    PARROT_ASSERT(info->what == VISIT_FREEZE_NORMAL);

    if (PMC_IS_NULL(pmc)) {
        id   = 0;
        packid_type = enum_PackID_seen;
    }
    else {
        Hash *hash = (Hash *)VTABLE_get_pointer(interp, info->seen);
        HashBucket * const b = parrot_hash_get_bucket(interp, hash, pmc);
        if (b) {
            id = (UINTVAL) b->value;
            packid_type = enum_PackID_seen;
        }
        else {
            info->id++; /* next id to freeze */
            id = info->id;
            packid_type = enum_PackID_normal;
        }
    }

    VTABLE_push_integer(interp, info, PackID_new(id, packid_type));

    if (packid_type == enum_PackID_normal) {
        Hash *hash = (Hash *)VTABLE_get_pointer(interp, info->seen);
        PARROT_ASSERT(pmc);
        VTABLE_push_integer(interp, info,
                PObj_is_object_TEST(pmc) ? enum_class_Object : pmc->vtable->base_type);
        parrot_hash_put(interp, hash, pmc, (void *)id);
        Parrot_pmc_array_unshift(interp, (List *)PMC_data(info->todo), pmc, enum_type_PMC);
        VTABLE_freeze(interp, pmc, info);
    }
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
    List * const todo           = (List *)PMC_data(info->todo);
    const int    thawing        = info->what == VISIT_THAW_NORMAL;

    (info->visit_pmc_now)(interp, current, info);

    /* can't cache upper limit, visit may append items */
    while ((list_item = (PMC **)Parrot_pmc_array_shift(interp, todo, enum_type_PMC))) {
        current = *list_item;
        if (!current)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "NULL current PMC in visit_loop_todo_list");

        PARROT_ASSERT(current->vtable);

        VTABLE_visit(interp, current, info);

        VISIT_PMC(interp, info, PMC_metadata(current));
    }

    if (thawing)
        /* we're done reading the image */
        PARROT_ASSERT(!INFO_HAS_DATA(info));

    if (thawing) {
        /* on thawing call thawfinish for each processed PMC */
        List        *finish_list = (List *)PMC_data(info->id_list);
        const INTVAL n           = Parrot_pmc_array_length(interp, finish_list);
        int          i;

        for (i = 0; i < n ; ++i) {
            current = *(PMC**)Parrot_pmc_array_get(interp, finish_list, i, enum_type_PMC);
            if (!PMC_IS_NULL(current))
                VTABLE_thawfinish(interp, current, info);
        }
    }
}


/*

=item C<static void create_buffer(PARROT_INTERP, PMC *pmc, visit_info *info)>

Allocate buffer to some estimated size.

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
        len = (items ? items : 1) * FREEZE_BYTES_PER_ITEM;
    }
    else
        len = FREEZE_BYTES_PER_ITEM;

    info->buffer = (Buffer *)Parrot_gc_new_bufferlike_header(interp, sizeof (Buffer));
    Parrot_gc_allocate_buffer_storage_aligned(interp, info->buffer, len);
    SET_VISIT_CURSOR(info, Buffer_bufstart(info->buffer));
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
    visit_info info;

    visit_info_init(interp, &info, VISIT_FREEZE_NORMAL, STRINGNULL, pmc);
    return Parrot_str_new_from_buffer(interp, info.buffer, OUTPUT_LENGTH(&info));
}


/*

=item C<PMC* Parrot_thaw(PARROT_INTERP, STRING *image)>

Thaws a PMC.  Called from the C<thaw> opcode.

For now it seems cheaper to use a list for remembering contained
aggregates. We could of course decide dynamically, which strategy to
use, e.g.: given a big image, the first thawed item is a small
aggregate. This implies, it probably contains (or some big strings) more
nested containers, for which another approach could be a win.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw)

    visit_info  info;
    int         gc_block = 0;
    PMC        *result;

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
    if (1 || (Parrot_str_byte_length(interp, image) > THAW_BLOCK_GC_SIZE)) {
        Parrot_block_GC_mark(interp);
        Parrot_block_GC_sweep(interp);
        gc_block = 1;
    }

    info.thaw_ptr = &result;
    visit_info_init(interp, &info, VISIT_THAW_NORMAL, image, PMCNULL);
    BYTECODE_SHIFT_OK(&info);

    if (gc_block) {
        Parrot_unblock_GC_mark(interp);
        Parrot_unblock_GC_sweep(interp);
    }

    return result;
}


/*

=item C<PMC* Parrot_thaw_constants(PARROT_INTERP, STRING *image)>

Thaws constants, used by PackFile for unpacking PMC constants.
This is a lie. It does nothing different from Parrot_thaw at the moment.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw_constants(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw_constants)
    return Parrot_thaw(interp, image);
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
