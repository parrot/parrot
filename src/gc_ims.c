/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/gc_ims.c - Incremental mark and sweep garbage collection

=head1 DESCRIPTION

The following comments describe a new garbage collection scheme for
Parrot.

The scheme of this algorithm is described in the literature with these
keywords:

 - non-copying, mark & sweep
 - incremental
 - realtime
 - incremental update with write barrier

Further we might try this optimization

 - treadmill optimization or
 - implict reclamation

=head1 Drawbacks of the current mark and sweep collector.

 * can take arbitray time to complete (1s for 1 Meg objects)
 * can't be used in multi-threaded Parrot
 * works fast for plain (non-aggregate) objects but suffers badly
   for nested aggregates or HLL objects
 * the sweep phase takes time proportional to the allocated storeage

=head1 INCREMENTAL GARBAGE COLLECTION

=head2 Terms

=over 4

=item object

An item like a buffer header or a PMC which is managed by Parrot's
dynamic memory system.

=item aggregate

An object that possibly holds references to other objects. For example
an array, hash, or reference PMC.

=item tri-color marking

All objects have one of three colors: white, grey, or black.

At the beginning of a DOD run all objects are white (not yet visited).
During marking objects are greyed (visited - found alive), but their
contents isn't yet scanned. A fully scanned grey object gets finally
colored black. It will not again be rescanned in this DOD run.

Only aggregates can be grey, non-containers are blackened immediately.

Objects on the free-list are sometimes denoted having the color off-white
or ecru.

=item DOD

Dead object detection. Please note that in Parrot src and docs this
stands for the stop-the-world garbage collector that recycles objects.

=item GC

In Parrot tree the copying garbage collector that recycles string and
buffer memory. Configure.pl has a switch to use a malloc library instead,
which makes string and buffer memory non-moving.

=item collector

The DOD and reclamation system.

=item mutator

The normal operation of the program which may or may not change the
collectors view of objects.

=item incremental

Garbage collection and normal program operation is interleaved. This
guarantees short and bounded pause times. Garbage collection doesn't
significantly interrupt program execution, collector and mutator are
running pseudo-parallel.

=item root set

All structures in the interpreter that might point to objects. E.g.
stacks, globals, and of course the registers. All objects the
interpreter works with, are directly or indirectly reachable starting
from the root set.

=item the tri-color invariant

At no time a black object may reference a white one directly. Actually
this is the strong incarnation of the invariant - all paths from black
objects to white objects lead over at least one grey object.

The weak tri-color invariant is: there is at least one such path to a
white object, so that it's reachable.

The strong invariant is the basic idea of mark and sweep too. But as the
mutator isn't running during DOD the invariant is never violated.

Due to this invariant, after the root set has been marked and when all
greyed objects are marked (blackened), the white objects have to be
dead.

=item paint it black

Or, which color do new objects have?

Actually this should be tunable. Or it depends. If objects are born
white and die immediately, they get collected in the same GC cycle. OTOH
when these objects are stored into an existing (black) array, we have to
do more work to keep the tri-color invariant valid.

Anyway, when allocating new objects white, the collector must run more
often or must do more work per increment to make the algorithm stop
somewhen.

=item write barrier

To keep the tri-color invariant valid all pointer stores into black
objects have to be tracked. If a white object would be stored into a
black array, and this object isn't refered to by another object it would
get collected. The write barrier greys the white object, so that it get
scanned later or alternatively greys the aggregate for a rescan. The latter
can be better, if a sequence of such stores would happen.

=back

=head2 Data structure overview

The incremental mark and sweep collector has an additional structure in
the arena_base that keeps track of the collector's state. Pool and arena
structures are unchanged. Only the allocation of new arena blocks is done
much more fine grained in e.g. 8K blocks.

=head2 Implicit reclamation (optional)

=over 4

=item from-space

The graph of all objects found live during the last collection.

=item to-space

The work area of the collector. During marking live objects are "moved"
from the from-space into the to-space. This is the same as the next_for_GC
list used in src/dod.c. The to-space is initially empty. During marking
it gets greyed and finally all reachable objects are black.

=item free-list

New objects are allocated from the free-list. The free-list is adjacent
to the to-space. Allocating a new objects thus means, moving the free
pointer one word forward and paint the new object black.

=back

All objects get two additional pointers (forward, backward) and are
arranged like in this scheme:


    <-- allocation direction         marking -->
            |                          |
  [w] <--> [w] <--> [b] <--> [b] <--> [g] <--> [g] <--> [w] <-> [w]

            ^        ^                 ^                 ^
            |        |                 |                 |
   free-list-ptr     to-space          scan-pointer      from-space

Objects get "moved" during collection by rearranging the doubly-linked
object pointers. At the end of a DOD run (when the last grey object is
blackened), the from-space and the free-list are merged serving
as the new free-list of the next DOD cycle. This operation is just a few
pointer manipulations that replaces the sweep phase of a mark and sweep
collector.

=head2 Phases of operation

=over 4

=item a) initialization

After interpreter creation the DOD system is initialized by marking
parts of the root set (globals, internal structures).

=item b) program operation

For each bunch of allocated objects (A) the collector does k.A work, for
some constant k > 1. As new objects are allocated black the number of
whites is reduced steadily. This means that the throttle factor k could
be less then one too, but this could highly increase average memory usage.

To keep the memory usage limited k > 1 must hold.

=item c) near the end of a DOD cycle

The rest of the root set is scanned i.e. the registers. By defering
scanning of registers all temporaries that might have exist somewhen
just stay unscanned - they will be collected in the this DOD cycle, if
we allocate new objects white or in the next DOD cycle.

=item d) finishing a DOD cycle

The current sweep of the whole arena is done, or with implicit reclamation:

Garbage gets appened to the free-list by merging the unscanned
from-space with the free-list, these objects are all considered white.
All other items are in the to-space and are black. These objects
constitute the from-space of the new collection cycle.

Now he meaning of the black bit is reversed effectively setting the new
from-space to white.

The next DOD cycle is initialized in one step a) and the new cycle starts.

Alternatively the mutator could run and allocate objects for some time,
without starting the collector again, if there are plenty of free objects on
all free-lists.

=item e) collect buffer memory

Finally, we might trigger a collect run on string and buffer memory if
there is an impending shortage of resources. While the copying compactor
is rather independend of the collector that cleans object headers, its
more efficient to collect buffer memory when the live information is
accurate. This avoids copying of dead buffer memory.

=back

=head2 Comparison with our current mark and sweep collector

  MS  ... mark and sweep (stop-the-world)
  IMS ... incremental mark and sweep
  IMIR .. incremental mark implicit reclamation

                       MS                 IMS               IMIR
  ------------------------------------------------------------------------
  operation            stop-the-world     incremental       incremental
  time per DOD cycle   unbounded          bounded           bounded
  size overhead        1.125 words    1)  1.125 words       2 words
  time overhead        O(2*live + dead)   O(2*live + dead)  O(live)   2)

Notes:

  1) with ARENA_DOD_FLAGS for aggregates; only one nibble for
     non-aggregates, 32-bit system assumed

  2) it should be possible to mark containers at once by using the
     information of the from-space pointers and tracking changes
     to the aggregate.

=head2 Implementation details and unsorted remarks

=over 4

=item the object graph

The MS and IMS scheme use the next_for_GC pointer for keeping track of
references. This interfers with the freeze functionality, which can use
the same pointer to keep track of visited objects.

IMIR has a dedicated pointer pair to build the object graph.

=item Greying objects

Greying objects is done depth-first. This has much better cache locality
then visiting an object again much later. In the picture above this means
that grey objects are inserted at the left end of the mark chain immediately
to the right of the object that gets blackened.

=item big aggregates

Greying has to be done in increments. Big aggregates can't have a mark
vtable that oould run arbitrarly long. This means that the DOD system
must know the layout of arrays, hashes, and objects. This is currently
true for arrays and objects but not for hashes. But the latter need some
refactoring of internals anyway.

To avoid visiting all aggregate elements, it could be better to track
the graph of old aggregates by using a write barrier for all writes into
the array. This would basically create a generational collector. The old
generation (the aggregate) isn't scanned. But changes to this "old
generation" are tracked and reflected in the collectors graph of
objects.

=item timely destruction

The interpreter arena has a count of currently active objects that need
timely destruction. When during scope exit an high priority sweep is
triggered, we have basically two cases:

1) all of these objects were already seen by this DOD run - the scope
exit can continue.

2) Not all objects were seen - they might be alive or not. This means
that the DOD cycle must run to the end to decide, if these objects are
alive (or again until all are found alive).

To increase performance its likely that we need some additional
information that keeps track of the location of such objects and just
try to mark paths to objects that need timely destruction.

=item concurrent or parallel collection

As the described algorithm is already incremental its well-suited for
parallel collection in a multi-threaded Parrot. The work of greying
objects can be done in parallel by atomically handling a bunch of
objects to another thread. After doing some increments of marking, these
objects then get returned to the shared to-space. The parallel
collection is finished when the last object is blackened and all threads
have reached the thread barrier rendevous point. (Please note the very
different meaning of barrier here).

But also a single-threaded Parrot can vastly take advantage by running
increments of the collection during waiting for I/O completion or during
a sleep opcode.

=back

=head1 FUNCTIONS

=over 4

=cut

*/

#include "parrot/parrot.h"

typedef enum {
    GC_IMS_INITIAL,
    GC_IMS_RE_INIT,
    GC_IMS_MARKING,
    GC_IMS_SWEEP,
    GC_IMS_COLLECT,
    GC_IMS_FINISHED
} gc_ims_state_enum;

typedef struct {
    gc_ims_state_enum   state;
    size_t      allocations;    /* get_free_object count */
    size_t      alloc_trigger;  /* after this number of allocations a gc
                                   increment is triggered */
    double      throttle;       /* throttle * allocations increment work */
    size_t      increments;     /* increment count */
} Gc_ims_private;

static void parrot_gc_ims_run_increment(Interp*);

static void
gc_ims_add_free_object(Interp *interpreter,
        struct Small_Object_Pool *pool, void *to_add)
{
    *(void **)to_add = pool->free_list;
    pool->free_list = to_add;
}


static void *
gc_ims_get_free_object(Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    void *ptr;
    Gc_ims_private *g_ims;

    /* if we don't have any objects */
    if (!pool->free_list)
        (*pool->alloc_objects) (interpreter, pool);
    ptr = pool->free_list;
    pool->free_list = *(void **)ptr;
    PObj_on_free_list_CLEAR((PObj*) ptr);
    --pool->num_free_objects;
#if ! DISABLE_GC_DEBUG
    if (GC_DEBUG(interpreter))
        PObj_version((Buffer*)ptr) = interpreter->arena_base->dod_runs;
#endif
    g_ims = interpreter->arena_base->gc_private;
    if (++g_ims->allocations >= g_ims->alloc_trigger)
        parrot_gc_ims_run_increment(interpreter);
    return ptr;
}

static void
gc_ims_alloc_objects(Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *new_arena;
    size_t size;
    UINTVAL start, end;

    /* Setup memory for the new objects */
    new_arena = mem_sys_allocate(sizeof(struct Small_Object_Arena));
    size = pool->object_size * pool->objects_per_alloc;
    /* could be mem_sys_allocate too, but calloc is fast */
    new_arena->start_objects = mem_sys_allocate_zeroed(size);

    Parrot_append_arena_in_pool(interpreter, pool, new_arena, size);

    start = 0;
    end = pool->objects_per_alloc;
    Parrot_add_to_free_list(interpreter, pool, new_arena, start, end);
}

/*

=item C<void Parrot_gc_ims_init(Interp* interpreter)>

Initialize the state structures of the gc system. Called immediately before
creation of memory pools. This function must set the function pointers
for C<add_free_object_fn>, C<get_free_object_fn>, C<alloc_objects_fn>, and
C<more_objects_fn>.

=cut

*/

void
Parrot_gc_ims_init(Interp* interpreter)
{
    interpreter->arena_base->gc_private =
        mem_sys_allocate_zeroed(sizeof(Gc_ims_private));
    /* TODO deallocate */
    add_free_object_fn = gc_ims_add_free_object;
    get_free_object_fn = gc_ims_get_free_object;
    alloc_objects_fn   = gc_ims_alloc_objects;
}

/*

=item C<static void parrot_gc_ims_run_increment(Interp* interpreter)>

Run one increment of collection. This function is triggered by object
allocation.

=cut

*/

static void
parrot_gc_ims_run_increment(Interp* interpreter)
{
}


/*

=back

=head1 SEE ALSO

F<src/dod.c>, F<include/parrot/dod.h>, F<include/parrot/pobj.h>,

=head1 HISTORY

Initial version by leo (2004.08.12 - 2004.08.15)

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4 tw=72:
*/
