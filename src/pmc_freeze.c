/* pmc_freeze.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Freeze and thaw functionality
 *  Data Structure and Algorithms:
 *     Freeze uses the next_for_GC pointer to remeber seen PMCs.
 *     PMCs are written as IDs (or tags), which are calculated
 *     from their arena address. This PMC number is multiplied
 *     by four. The 2 lo bits indicate a seen PMC or a PMC of the
 *     same type as the previous one respectively.
 *
 *     Thawing PMCs uses a list with (maximum) size of the
 *     amount of PMCs to keep track of retrieved PMCs.
 *
 *     The individual information of PMCs is frozen/thawed by their
 *     vtables.
 *
 *     To avoid recursion, the whole functionality is driven by
 *     pmc->vtable->visit, which is called for the first PMC initially.
 *     Container PMCs call a "todo-callback" for all contained PMCs.
 *     The individual action vtable (freeze/thaw) is then called for
 *     all todo-PMCs.
 *
 *  History:
 *     Initial version by leo 2003.11.03 - 2003.11.07
 *  Notes:
 *     The seen-hash version for freezing might go away sometimes.
 *  References:
 *     Lot of discussion on p6i and docs/dev/pmc_freeze.pod.
 */

#include "parrot/parrot.h"
#include <assert.h>

/*
 * define this to 1 for testing
 */
#define FREEZE_ASCII 0

/*
 * normal freeze can use next_for_GC ptrs or a seen hash
 */
#define FREEZE_USE_NEXT_FOR_GC 1

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
 * image stream functions
 */

/*
 * plain ascii - for testing only:
 * for speed reasons we mess around with the string buffers directly
 * no encoding of strings, no transcoding
 */

static void
str_append(Parrot_Interp interpreter, STRING *s, const void *b, size_t len)
{
    size_t used = s->bufused;
    size_t need_free = s->buflen - used - len;
    /*
     * grow by factor 1.5 or such
     */
    if (need_free <= 16) {
        size_t new_size = (size_t) (s->buflen * 1.5);
        if (new_size < s->buflen - need_free + 512)
            new_size = s->buflen - need_free + 512;
        Parrot_reallocate_string(interpreter, s, new_size);
        assert(s->buflen - used - len >= 15);
    }
    mem_sys_memcopy((void *)((ptrcast_t)s->strstart + used), b, len);
    s->bufused += len;
    s->strlen += len;
}

static void
push_ascii_integer(Parrot_Interp interpreter, IMAGE_IO *io, INTVAL v)
{
    char buffer[128];
    sprintf(buffer, "%d ", (int) v);
    str_append(interpreter, io->image, buffer, strlen(buffer));
}

static void
push_ascii_pmc(Parrot_Interp interpreter, IMAGE_IO *io, PMC* v)
{
    char buffer[128];
    sprintf(buffer, "%p ", v);
    str_append(interpreter, io->image, buffer, strlen(buffer));
}

static INTVAL
shift_ascii_integer(Parrot_Interp interpreter, IMAGE_IO *io)
{
    char *start, *p;
    INTVAL i;

    p = start = (char*)io->image->strstart;
    i = strtoul(p, &p, 10);
    ++p;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    return i;
}

static PMC*
shift_ascii_pmc(Parrot_Interp interpreter, IMAGE_IO *io)
{
    char *start, *p;
    int i;

    p = start = (char*)io->image->strstart;
    i = strtoul(p, &p, 16);
    ++p;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    return (PMC*) i;
}

/*
 * opcode_t io functions
 */

static void
op_append(Parrot_Interp interpreter, STRING *s, opcode_t b, size_t len)
{
    size_t used = s->bufused;
    size_t need_free = s->buflen - used - len;
    /*
     * grow by factor 1.5 or such
     */
    if (need_free <= 16) {
        size_t new_size = (size_t) (s->buflen * 1.5);
        if (new_size < s->buflen - need_free + 512)
            new_size = s->buflen - need_free + 512;
        Parrot_reallocate_string(interpreter, s, new_size);
        assert(s->buflen - used - len >= 15);
    }
    *((opcode_t *)((ptrcast_t)s->strstart + used)) = b;
    s->bufused += len;
    s->strlen += len;
}


static void
push_opcode_integer(Parrot_Interp interpreter, IMAGE_IO *io, INTVAL v)
{
    op_append(interpreter, io->image, (opcode_t)v, sizeof(opcode_t));
}

static void
push_opcode_pmc(Parrot_Interp interpreter, IMAGE_IO *io, PMC* v)
{
    op_append(interpreter, io->image, (opcode_t)v, sizeof(opcode_t));
}

static INTVAL
shift_opcode_integer(Parrot_Interp interpreter, IMAGE_IO *io)
{
    char *start, *p;
    INTVAL i;
    p = start = (char*)io->image->strstart;
    i = *((opcode_t*) p)++;
    assert(p <= start + io->image->bufused);
    io->image->strstart = p;
    io->image->bufused -= (p - start);
    assert((int)io->image->bufused >= 0);
    return i;
}

static PMC*
shift_opcode_pmc(Parrot_Interp interpreter, IMAGE_IO *io)
{
    return (PMC*) shift_opcode_integer(interpreter, io);
}

/*
 * helper functions
 */

/*
 * custom key_hash and compare functions
 */
static size_t
key_hash_int(Interp *interp, Hash *hash, void *value)
{
    UNUSED(interp);
    UNUSED(hash);
    return (size_t) value;
}

static int
int_compare(Parrot_Interp interp, void *a, void *b)
{
    UNUSED(interp);
    return a != b;
}

static void
pmc_add_ext(Parrot_Interp interpreter, PMC *pmc)
{
    if (pmc->vtable->flags & VTABLE_PMC_NEEDS_EXT)
        add_pmc_ext(interpreter, pmc);
}

/*
 * set all next_for_GC pointers to NULL
 */
static void
cleanup_next_for_GC_pool(Parrot_Interp interpreter,
    struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *arena;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        PMC *p = arena->start_objects;
        UINTVAL i;

        for (i = 0; i < arena->used; i++) {
            if (p->pmc_ext)
                p->next_for_GC = NULL;
            p = (PMC *)((char *)p + sizeof(PMC));
        }
    }
}

static void
cleanup_next_for_GC(Parrot_Interp interpreter)
{
    cleanup_next_for_GC_pool(interpreter,
            interpreter->arena_base->pmc_pool);
    cleanup_next_for_GC_pool(interpreter,
            interpreter->arena_base->constant_pmc_pool);
}

/*
 * this function setup stuff may be replaced by a real PMC
 * in the future
 * TODO add read/write header functions, e.g. vtable->init_pmc
 */

static image_funcs ascii_funcs = {
    push_ascii_integer,
    push_ascii_pmc,
    shift_ascii_integer,
    shift_ascii_pmc
};
static image_funcs opcode_funcs = {
    push_opcode_integer,
    push_opcode_pmc,
    shift_opcode_integer,
    shift_opcode_pmc
};
static IMAGE_IO io_init;

static void
ft_init(Parrot_Interp interpreter, visit_info *info)
{
    info->image_io = &io_init;
    info->image_io->image = info->image;
#if FREEZE_ASCII
    info->image_io->vtable = &ascii_funcs;
#else
    info->image_io->vtable = &opcode_funcs;
#endif
    info->last_type = -1;
    info->id_list = pmc_new(interpreter, enum_class_Array);
    info->id = 0;
}

static void visit_todo_list(Parrot_Interp, PMC*, visit_info* info);

static void
todo_list_init(Parrot_Interp interpreter, visit_info *info)
{
    Hash *hash;
    info->visit_child_function = visit_todo_list;
    /* we must use PMCs here, so that they get marked properly */
    info->todo = pmc_new(interpreter, enum_class_Array);
    info->seen = pmc_new_noinit(interpreter, enum_class_PerlHash);
    new_hash_x(interpreter, &hash, enum_type_ptr, 0, Hash_key_type_int,
            int_compare, key_hash_int, (hash_mark_key_fn) NULL);
    PObj_custom_mark_SET(info->seen);
    PMC_ptr1v(info->seen) = hash;

    ft_init(interpreter, info);
}

/*
 * freeze, thaw a PMC (id)
 *
 * the ASCII representation of the PerlArray
 *   P0 = [P1=666, P2=777, P0]
 * may look like this:
 *   0xdf4 30 3 0xdf8 33 666 0xdf2 777 0xdf5
 * (30 = class_enum_PerlArray, 33 = class_enum_PerlInt, the type of
 * the second PerlInt is suppressed, the repeated P0 has bit 0 set)
 */
PARROT_INLINE static void
freeze_pmc(Parrot_Interp interpreter, PMC *pmc, visit_info *info,
        int seen, UINTVAL id)
{
    IMAGE_IO *io = info->image_io;
    INTVAL type = pmc->vtable->base_type;

    if (seen) {
        id |= 1;         /* mark bit 0 if this PMC is known */
    }
    else if (type == info->last_type) {
        id |= 2;         /* mark bit 1 and don't write type */
    }
    io->vtable->push_pmc(interpreter, io, (PMC*)id);
    if (! (id & 3)) {    /* else write type */
        io->vtable->push_integer(interpreter, io, type);
        info->last_type = type;
    }
}

PARROT_INLINE static int
thaw_pmc(Parrot_Interp interpreter, visit_info *info,
        UINTVAL *id, INTVAL *type)
{
    PMC *n;
    IMAGE_IO *io = info->image_io;
    int seen = 0;

    n = io->vtable->shift_pmc(interpreter, io);
    if ( (UINTVAL) n & 1) {     /* seen PMCs have bit 0 set */
        seen = 1;
    }
    else if ( (UINTVAL) n & 2) { /* prev PMC was same type */
        *type = info->last_type;
    }
    else {                       /* type follows */
        info->last_type = *type = io->vtable->shift_integer(interpreter, io);
        if (*type <= 0 || *type >= enum_class_max)
            internal_exception(1, "Unknown PMC to thaw %d", (int) *type);
    }
    *id = (UINTVAL) n & ~3;
    return seen;
}

/*
 * visit/thaw common action functions:
 * - freeze PMC
 * -
 */
PARROT_INLINE static void
do_action(Parrot_Interp interpreter, PMC *pmc, visit_info *info,
        int seen, UINTVAL id)
{
    switch (info->what) {
        case VISIT_FREEZE_AT_DESTRUCT:
        case VISIT_FREEZE_NORMAL:
            freeze_pmc(interpreter, pmc, info, seen, id);
            info->visit_function = pmc->vtable->freeze;
            break;
        default:
            internal_exception(1, "Illegal action %d", info->what);
            break;
    }
}

PARROT_INLINE static PMC*
thaw_create_pmc(Parrot_Interp interpreter, PMC *pmc, visit_info *info,
        INTVAL type)
{
    if (pmc) { /* first thawed PMC - just attach vtable */
        pmc->vtable = Parrot_base_vtables[type];
        pmc_add_ext(interpreter, pmc);
    }
    else {      /* create a new header */
        switch (info->what) {
            case VISIT_THAW_NORMAL:
                pmc = pmc_new_noinit(interpreter, type);
                break;
            case VISIT_THAW_CONSTANTS:
                pmc = constant_pmc_new_noinit(interpreter, type);
                break;
            default:
                internal_exception(1, "Illegal visit_next type");
                break;
        }
        assert(info->thaw_ptr);
        *info->thaw_ptr = pmc;
    }
    return pmc;
}

PARROT_INLINE static PMC*
do_thaw(Parrot_Interp interpreter, PMC* pmc, visit_info *info, int *seen)
{
    UINTVAL id;
    INTVAL type;
    PMC ** b;
    int must_have_seen = thaw_pmc(interpreter, info, &id, &type);

    b = list_get(interpreter, PMC_data(info->id_list), id >> 2,
            enum_type_PMC);
    if (b == (void*)-1)
        b = NULL;
    else if (b) {
        pmc = *(PMC**)b;
        if (!pmc)
            b = NULL;
    }
    if (b) {
        *seen = 1;
#if FREEZE_USE_NEXT_FOR_GC
        /*
         * the next_for_GC method doesn't keep track of repeated scalars
         * and such, as these are lacking the next_for_GC pointer, so
         * these are just duplicated with their data.
         * But we track these when thawing, so that we don't create dups
         */
        if (!must_have_seen) {
            /* so we must consume the bytecode */
            VTABLE_thaw(interpreter, pmc, info);
        }
#else
        assert(must_have_seen);
#endif
        *info->thaw_ptr = pmc;
        return pmc;
    }

    assert(!must_have_seen);
    *seen = 0;
    pmc = thaw_create_pmc(interpreter, pmc, info, type);

    info->visit_function = pmc->vtable->thaw;
    list_assign(interpreter, PMC_data(info->id_list), id >> 2, pmc,
            enum_type_PMC);
    /* remember nested aggregates depth first */
    if (pmc->pmc_ext)
        list_push(interpreter, PMC_data(info->todo), pmc, enum_type_PMC);
    return pmc;
}

#if ARENA_DOD_FLAGS
static UINTVAL
id_from_pmc(Parrot_Interp interpreter, PMC* pmc)
{
    UINTVAL id = 1;     /* first PMC in first arena */
    struct Small_Object_Arena *arena, *pmc_arena;
    struct Small_Object_Pool *pool;

    pool = interpreter->arena_base->pmc_pool;
    pmc_arena = GET_ARENA( (PObj*) pmc);

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        if (arena == pmc_arena) {
            id += GET_OBJ_N(arena, (PObj*) pmc);
            return id << 2;     /* lo bits are flags */
        }
        id += arena->total_objects;
    }
    pool = interpreter->arena_base->constant_pmc_pool;
    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        if (arena == pmc_arena) {
            id += GET_OBJ_N(arena, (PObj*) pmc);
            return id << 2;
        }
        id += arena->total_objects;
    }
    internal_exception(1, "Couldn't find PMC in arenas");
    return -1;
}
#else
static UINTVAL
id_from_pmc(Parrot_Interp interpreter, PMC* pmc)
{
    UINTVAL id = 1;     /* first PMC in first arena */
    struct Small_Object_Arena *arena;
    struct Small_Object_Pool *pool;
    ptrdiff_t ptr_diff;

    pool = interpreter->arena_base->pmc_pool;
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
    pool = interpreter->arena_base->constant_pmc_pool;
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
#endif

/*
 * remember next child to visit via the next_for_GC pointer
 *   generate a unique ID per PMC and freeze the ID not the PMC addr
 *   so thaw the hash-lookup can be replaced by an array lookup then
 *   which is a lot faster
 */
PARROT_INLINE static int
next_for_GC_seen(Parrot_Interp interpreter, PMC *pmc, visit_info *info,
        UINTVAL *id)
{
    int seen = 0;
    /*
     * we can only remember PMCs with a next_for_GC pointer
     * which is located in pmc_ext
     */
    if (pmc->pmc_ext) {
        /* already seen? */
        if (pmc->next_for_GC) {
            seen = 1;
            goto skip;
        }
        /* put pmc at the end of the list */
        info->mark_ptr->next_for_GC = pmc;
        /* make end self-referential */
        info->mark_ptr = pmc->next_for_GC = pmc;
    }
skip:
    *id = id_from_pmc(interpreter, pmc);
    return seen;
}

/*
 * return true if PMC was seen, else put in on the todo list
 * generate ID (tag) for PMC, offset by 4 as are addresses, lo bits
 * are flags
 */
PARROT_INLINE static int
todo_list_seen(Parrot_Interp interpreter, PMC *pmc, visit_info *info,
        UINTVAL *id)
{
    HashBucket *b = hash_get_bucket(interpreter, PMC_ptr1v(info->seen), pmc);

    if (b) {
        *id = (UINTVAL) b->value;
        return 1;
    }

    info->id += 4;      /* next id to freeze */
    *id = info->id;
    hash_put(interpreter, PMC_ptr1v(info->seen), pmc, (void*)*id);
    /* remember containers */
    if (pmc->pmc_ext)
        list_push(interpreter, PMC_data(info->todo), pmc, enum_type_PMC);
    return 0;
}

/*
 * visit_child callbacks:
 * check if PMC was seen, generate ID for it
 * then do the appropriate action
 */

static void
visit_next_for_GC(Parrot_Interp interpreter, PMC* pmc, visit_info* info)
{
    UINTVAL id;
    int seen = next_for_GC_seen(interpreter, pmc, info, &id);
    do_action(interpreter, pmc, info, seen, id);
    /*
     * TODO probe for class methods that override the default.
     * To avoid overhead, we could have an array[class_enums]
     * which (after first find_method) has a bit, if a user
     * callback is there.
     */
    if (!seen)
        (info->visit_function)(interpreter, pmc, info);
}

/*
 * check seen via the todo list
 */
static void
visit_todo_list(Parrot_Interp interpreter, PMC* pmc, visit_info* info)
{
    UINTVAL id;
    int seen = todo_list_seen(interpreter, pmc, info, &id);
    do_action(interpreter, pmc, info, seen, id);
    if (!seen)
        (info->visit_function)(interpreter, pmc, info);
}

/*
 * callback for thaw - action first, todo-list and seen handling
 * is all in do_thaw
 */
static void
visit_todo_list_thaw(Parrot_Interp interpreter, PMC* old, visit_info* info)
{
    int seen;
    PMC* pmc = do_thaw(interpreter, old, info, &seen);
    if (!seen)
        (info->visit_function)(interpreter, pmc, info);
}

/*
 * work loops:
 * put first item on todo list
 * run as long as there are itens to be done
 */

static void
visit_loop_next_for_GC(Parrot_Interp interpreter, PMC *current,
        visit_info *info)
{
    PMC *prev = NULL;

    visit_next_for_GC(interpreter, current, info);
    if (current->pmc_ext) {
        for ( ; current != prev; current = current->next_for_GC) {
            VTABLE_visit(interpreter, current, info);
            prev = current;
        }
    }
}

static void
visit_loop_todo_list(Parrot_Interp interpreter, PMC *current,
        visit_info *info)
{
    List *todo = PMC_data(info->todo);
    (info->visit_child_function)(interpreter, current, info);
    while (list_length(interpreter, todo)) {
        current = *(PMC**)list_shift(interpreter, todo, enum_type_PMC);
        VTABLE_visit(interpreter, current, info);
    }
}

/*
 * allocate image to some estimated size
 */
static void
create_image(Parrot_Interp interpreter, PMC *pmc, visit_info *info)
{
    INTVAL len = FREEZE_BYTES_PER_ITEM;
    if (VTABLE_does(interpreter, pmc,
                string_from_cstring(interpreter, "array", 0)) ||
        VTABLE_does(interpreter, pmc,
                string_from_cstring(interpreter, "hash", 0))) {
        INTVAL items = VTABLE_elements(interpreter, pmc);
        /*
         * TODO check e.g. first item of aggregate and estimate size
         */
        len = items * FREEZE_BYTES_PER_ITEM;
    }

    info->image = string_make(interpreter, NULL, len, NULL, 0, NULL);
}

/*
 * run_thaw - helper func
 *
 * thaw could use the next_for_GC pointers as todo-list too,
 * but this would need 2 runs through the arenas to clean the
 * next_for_GC pointers.
 * For now it seems cheaper to use a list for remembering contained
 * aggregates. We could of course decide dynamically, which strategy
 * to use, e.g.: given a big image, the first thawed item is a small
 * aggregate. This implies, it probably contains[1] more nested containers,
 * for which the next_for_GC approach could be a win.
 * [1] or some big strings :)
 */

static PMC*
run_thaw(Parrot_Interp interpreter, STRING* image, visit_enum_type what)
{
    visit_info info;
    PMC *n = NULL;
    int dod_block = 0;

    info.image = image;
    if (string_length(image) > THAW_BLOCK_DOD_SIZE) {
        Parrot_do_dod_run(interpreter, 1);
        Parrot_block_DOD(interpreter);
        Parrot_block_GC(interpreter);
        dod_block = 1;
    }

    info.what = what;   /* _NORMAL or _CONSTANTS */
    todo_list_init(interpreter, &info);
    info.visit_child_function = visit_todo_list_thaw;

    n = new_pmc_header(interpreter);
    visit_loop_todo_list(interpreter, n, &info);

    if (dod_block) {
        Parrot_unblock_DOD(interpreter);
        Parrot_unblock_GC(interpreter);
    }
    return n;
}
/*
 * public interface
 */

/*
 * freeze_at_destruct must not consume any resources
 * (except the image itself)
 * It uses the next_for_GC pointer, so its not reentrant and must
 * not be interrupted by a DOD run
 */
STRING*
Parrot_freeze_at_destruct(Parrot_Interp interpreter, PMC* pmc)
{
    visit_info info;

    Parrot_block_DOD(interpreter);
    cleanup_next_for_GC(interpreter);
    info.what = VISIT_FREEZE_AT_DESTRUCT;
    info.mark_ptr = pmc;
    info.visit_child_function = visit_next_for_GC;
    create_image(interpreter, pmc, &info);
    ft_init(interpreter, &info);

    visit_loop_next_for_GC(interpreter, pmc, &info);

    cleanup_next_for_GC(interpreter);
    Parrot_unblock_DOD(interpreter);
    return info.image;
}

/*
 * freeze using either method
 */
STRING*
Parrot_freeze(Parrot_Interp interpreter, PMC* pmc)
{
#if FREEZE_USE_NEXT_FOR_GC
    /*
     * we could do a DOD run here before, to free resources
     */
    return Parrot_freeze_at_destruct(interpreter, pmc);
#else
    /*
     * freeze using a todo list and seen hash
     * Please note that both have to be PMCs, so that trace_system_stack
     * can call mark on the PMCs
     */
    visit_info info;

    info.what = VISIT_FREEZE_NORMAL;
    create_image(interpreter, pmc, &info);
    todo_list_init(interpreter, &info);

    visit_loop_todo_list(interpreter, pmc, &info);

    return info.image;
#endif
}

/*
 * thaw a PMC, called from the thaw opcode
 */
PMC*
Parrot_thaw(Parrot_Interp interpreter, STRING* image)
{
    return run_thaw(interpreter, image, VISIT_THAW_NORMAL);
}

/*
 * thaw constants - used by packfile for unpacking PMC constants
 */
PMC*
Parrot_thaw_constants(Parrot_Interp interpreter, STRING* image)
{
    return run_thaw(interpreter, image, VISIT_THAW_CONSTANTS);
}


/*
 * there are for sure shortcuts to clone faster, e.g. allways
 * thaw the image immediately or use a special callback
 *
 * for now we just do:
 */
PMC*
Parrot_clone(Parrot_Interp interpreter, PMC* pmc)
{
    return Parrot_thaw(interpreter, Parrot_freeze(interpreter, pmc));
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
