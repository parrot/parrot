/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/encoding.c - global encoding functions

head1 DESCRIPTION

These are parrot's generic encoding handling functions

*/

#include "parrot/parrot.h"

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
