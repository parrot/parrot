/* settings.h
 *  Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Overall settings for Parrot
 *  Data Structure and Algorithms:
 *  History: initial version 2004.08.13
 *  Notes:
 *  References:
 */

#if !defined(PARROT_SETTINGS_H_GUARD)
#define PARROT_SETTINGS_H_GUARD

/*
 * interpreter register layout - only during conversion
 */

#define INDIRECT_REGS 0

/*
 * DOD/GC switches
 */

/* If you are trying to debug GC problems which only occur on large test cases,
 * turning on GC_DEBUG should help make the problem appear with smaller data
 * samples by reducing various numbers, and causing DOD and allocation runs
 * to occur more frequently. It does significantly reduce performance. */
#ifndef DISABLE_GC_DEBUG
#  define DISABLE_GC_DEBUG 0
#endif /* DISABLE_GC_DEBUG */

/* Helpful internal macro for testing whether we are currently
 * debugging garbage collection and memory management. See also the
 * definition of GC_VERBOSE in dod.c. */
#if DISABLE_GC_DEBUG
#  define GC_DEBUG(interp) 0
#else
#  define GC_DEBUG(interp) Interp_flags_TEST((interp), PARROT_GC_DEBUG_FLAG)
#endif /* DISABLE_GC_DEBUG */

/*
 * GC_SUBSYSTEM selection
 */

/*
 * PARROT_GC_MS is the stop-the-world mark and sweep collector
 */
#define PARROT_GC_MS      1

/*
 * PARROT_GC_IMS incremental mark and sweep collector
 */
#define PARROT_GC_IMS     0


/*
 * The mark and sweep collector can run with 2 different setups.
 *
 * ARENA_DOD_FLAGS = 1:
 *
 *    DOD-related flags are in a separate area in the arena structure.
 *    This etup needs aligned arena memory. If aligned memory isn't
 *    provided by the C library, this switch gets turned off in
 *    include/parrot/pobj.h
 *
 * ARENA_DOD_FLAGS = 0
 *
 *    DOD-related flags are in the object header
 */

#define ARENA_DOD_FLAGS 0

/*
 * misc settings
 */

/*
 * JIT/i386 can use the CGP run core for external functions instead
 * of calling the function version of the opcode
 *
 * This is for some reason currently slower, so it's turned off
 */

#define PARROT_I386_JIT_CGP 0

#endif /* PARROT_SETTINGS_H_GUARD */
