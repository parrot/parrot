/* oo_private.h
 *  Copyright (C) 2007-2008, Parrot Foundation.
 *  Overview:
 *     Structs, typedefs and macros for the Class, Object, and PMCProxy PMCs.
 *     This header file is only included by files within the OO subsystem.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_OO_PRIVATE_H_GUARD
#define PARROT_OO_PRIVATE_H_GUARD

#include "parrot/parrot.h"

/*
 * Class private flags
 */
typedef enum {
    CLASS_instantiated_FLAG      = PObj_private0_FLAG,
    CLASS_is_anon_FLAG           = PObj_private1_FLAG,
    CLASS_has_alien_parents_FLAG = PObj_private2_FLAG
} class_flags_enum;

#define CLASS_get_FLAGS(o) (PObj_get_FLAGS(o))
#define CLASS_flag_TEST(flag, o) (CLASS_get_FLAGS(o) & CLASS_ ## flag ## _FLAG)
#define CLASS_flag_SET(flag, o) (CLASS_get_FLAGS(o) |= CLASS_ ## flag ## _FLAG)
#define CLASS_flag_CLEAR(flag, o) (CLASS_get_FLAGS(o) &= ~(UINTVAL)(CLASS_ ## flag ## _FLAG))

/* Mark if the class has been instantiated */
#define CLASS_instantiated_TEST(o)  CLASS_flag_TEST(instantiated, (o))
#define CLASS_instantiated_SET(o)   CLASS_flag_SET(instantiated, (o))
#define CLASS_instantiated_CLEAR(o) CLASS_flag_CLEAR(instantiated, (o))

/* Mark if the class is anonymous */
#define CLASS_is_anon_TEST(o)  CLASS_flag_TEST(is_anon, (o))
#define CLASS_is_anon_SET(o)   CLASS_flag_SET(is_anon, (o))
#define CLASS_is_anon_CLEAR(o) CLASS_flag_CLEAR(is_anon, (o))

/* Mark if the class has parents from a different object model (for
 * example, a PMC). */
#define CLASS_has_alien_parents_TEST(o)  CLASS_flag_TEST(has_alien_parents, (o))
#define CLASS_has_alien_parents_SET(o)   CLASS_flag_SET(has_alien_parents, (o))
#define CLASS_has_alien_parents_CLEAR(o) CLASS_flag_CLEAR(has_alien_parents, (o))

#endif /* PARROT_OO_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
