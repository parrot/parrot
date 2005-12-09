/* unicode.h
 *  Copyright: 2005 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the unicode charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CHARSET_UNICODE_H_GUARD)
#define PARROT_CHARSET_UNICODE_H_GUARD

/*
 * init function
 */

CHARSET *Parrot_charset_unicode_init(Interp *);


#endif /* PARROT_CHARSET_UNICODE_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
