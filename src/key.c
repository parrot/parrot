/* key.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The base vtable calling functions.
 *  Data Structure and Algorithms:
 *     See include/parrot/key.h.
 *  History:
 *     Initial version by Jeff G. on 2001.12.05
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/*=for api key key_new

Return a pointer to a new KEY structure

=cut
*/

KEY *
key_new(Interp *interpreter)
{
    KEY *key = mem_sys_allocate(sizeof(KEY));

    UNUSED(interpreter);

    key->atom.type = enum_key_undef;
    key->next = NULL;

    return key;
}

/*=for api key key_clone

Return a copy of the KEY <key>.

=cut
*/

KEY *
key_clone(Interp *interpreter, KEY *key)
{
    KEY *new_key = NULL;
    if (key == NULL) return NULL;
    new_key = key_new(interpreter);
    new_key->atom = key->atom;
    new_key->next = key_clone(interpreter, key->next);
    return new_key;
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
