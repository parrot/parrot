/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/encoding.c - global encoding functions

head1 DESCRIPTION

These are parrot's generic encoding handling functions

*/

#include "parrot/parrot.h"

/* Yep, this needs to be a char * parameter -- it's tough to load in
   encodings and such for strings if we can't be sure we've got enough
   info set up to actually build strings... */
ENCODING *Parrot_load_encoding(Interp *intepreter, const char *encoding_name) {
    return NULL;
}

ENCODING *Parrot_new_encoding(Interp *interpreter) {
  return mem_sys_allocate(sizeof(ENCODING));
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
