/* pmc_freeze.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     PMC freeze and thaw interface
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_PMC_FREEZE_H_GUARD)
#define      PARROT_PMC_FREEZE_H_GUARD

struct _visit_info;
typedef void (*visit_child_f)(Parrot_Interp, PMC*, struct _visit_info*);
typedef void (*visit_f)(Parrot_Interp, PMC*, struct _visit_info*);

typedef enum {
    VISIT_FREEZE_NORMAL,
    VISIT_FREEZE_AT_DESTRUCT,
    VISIT_FREEZE_SIZE,
    VISIT_THAW_NORMAL,
    VISIT_THAW_CONSTANTS,
    VISIT_CLONE,
    VISIT_DESTRUCTION_ORDER
} visit_enum_type;

struct _image_io;
#define IMAGE_IO struct _image_io
typedef void    (*push_integer_f)       (Parrot_Interp, IMAGE_IO*, INTVAL);
typedef void    (*push_pmc_f)           (Parrot_Interp, IMAGE_IO*, PMC*);
typedef INTVAL  (*shift_integer_f)      (Parrot_Interp, IMAGE_IO*);
typedef PMC*    (*shift_pmc_f)          (Parrot_Interp, IMAGE_IO*);

typedef struct _image_funcs {
    push_integer_f      push_integer;
    push_pmc_f          push_pmc;
    shift_integer_f     shift_integer;
    shift_pmc_f         shift_pmc;
} image_funcs;

typedef struct _image_io {
    STRING *image;
    image_funcs *vtable;
} image_io;

typedef struct _visit_info {
    visit_child_f       visit_child_function;
    visit_f             visit_function; /* freeze, thaw ... */
    visit_enum_type     what;
    STRING*             image;
    PMC*                mark_ptr;
    PMC**               thaw_ptr;       /* where to thaw aa new PMC */
    INTVAL              last_type;
    PMC*                seen;           /* seen hash */
    PMC*                todo;           /* todo list */
    PMC*                id_list;        /* used by thaw */
    UINTVAL             id;             /* freze ID of PMC */
    IMAGE_IO            *image_io;
} visit_info;

/*
 * public interfaces
 */
STRING* Parrot_freeze(Parrot_Interp, PMC*);
STRING* Parrot_freeze_at_destruct(Parrot_Interp, PMC*);

PMC*    Parrot_thaw(Parrot_Interp, STRING*);
PMC*    Parrot_thaw_constants(Parrot_Interp, STRING*);

PMC*    Parrot_clone(Parrot_Interp, PMC*);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
