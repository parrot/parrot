/* iso_8859_1.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the iso_8859-1 charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CHARSET_ISO_8859_1_H_GUARD)
#define PARROT_CHARSET_ISO_8859_1_H_GUARD

STRING *charset_cvt_iso_8859_1_to_ascii(Interp *, STRING *src, STRING *dest);

CHARSET *Parrot_charset_iso_8859_1_init(Interp *);

#endif /* PARROT_CHARSET_ISO_8859_1_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
