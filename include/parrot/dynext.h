/* dynext.h
*
* $Id$
*
*   Parrot dynamic extensions
*/

#if !defined(DYNEXT_H_GUARD)
#define DYNEXT_H_GUARD

typedef enum  {
    DYNEXT_NONE,
    DYNEXT_SETUP_PMC,
    DYNEXT_INIT_PMC,
    DYNEXT_SETUP_OPLIB,
    DYNEXT_INIT_OPLIB
} dynex_enum_action_t;

typedef enum  {
    DYNEXT_INIT_OK,
    DYNEXT_INIT_EXISTS,
    DYNEXT_INIT_ERR
} dynex_enum_err_t;

typedef struct {
    INTVAL class_enum;
    STRING *class_name;
    PMC *initializer;
    INTVAL *class_max;
    VTABLE **base_vtable;
} dynext_pmc_info_t;

/* dynamic PMC loading */
int Parrot_load_pmc(Interp *interpreter, STRING *lib, PMC *initializer);
/* callbacks for these */
int Parrot_dynext_setup_pmc(Interp *, dynext_pmc_info_t *);
int Parrot_dynext_init_pmc (Interp *, dynext_pmc_info_t *);

#endif

