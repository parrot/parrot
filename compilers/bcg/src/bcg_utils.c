/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation.
 */

/*

=head1 NAME

bcg_utils.c

=head1 DESCRIPTION

RT#48264

=head2 Methods

=over 4

=cut

*/

#include "bcg_utils.h"
#include "bcg.h"
#include "parrot/parrot.h"

/*

=item C<bcg_hash *
bcg_hash_create(BCG_info * bcg_info)>

RT#48260: Not yet documented!!!

=cut

*/

bcg_hash *
bcg_hash_create(BCG_info * bcg_info)
{
    bcg_hash *hash;

    parrot_new_cstring_hash(bcg_info->interp, &hash);
    return hash;
}

/*

=item C<void
bcg_hash_destroy(BCG_info * bcg_info, bcg_hash * hash)>

RT#48260: Not yet documented!!!

=cut

*/

void
bcg_hash_destroy(BCG_info * bcg_info, bcg_hash * hash)
{
    parrot_hash_destroy(bcg_info->interp, hash);
}

/*

=item C<void
bcg_hash_put(BCG_info * bcg_info, bcg_hash * hash, char *key, void *value)>

RT#48260: Not yet documented!!!

=cut

*/

void
bcg_hash_put(BCG_info * bcg_info, bcg_hash * hash, char *key, void *value)
{
    parrot_hash_put(bcg_info->interp, hash, key, value);
}

/*

=item C<void *
bcg_hash_get(BCG_info * bcg_info, bcg_hash * hash, char *key)>

RT#48260: Not yet documented!!!

=cut

*/

void *
bcg_hash_get(BCG_info * bcg_info, bcg_hash * hash, char *key)
{
    DECL_CONST_CAST_OF(char);

    return parrot_hash_get(bcg_info->interp, hash, const_cast(key));
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
