/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/charset.c - global charset functions

head1 DESCRIPTION

These are parrot's generic charset handling functions

*/

#include "parrot/parrot.h"

CHARSET *Parrot_new_charset(Interp *interpreter) {
  return mem_sys_allocate(sizeof(CHARSET));
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
