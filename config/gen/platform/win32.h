/*
** platform.h [win32 version]
*/


/*
** I/O:
*/

#define DEFAULT_OPEN_MODE 0

typedef void* Parrot_WIN32_HANDLE;
typedef HUGEINTVAL Parrot_OFF_T;

#ifndef S_ISREG
#  define S_ISREG(m) ((m & S_IFMT) == S_IFREG)
#endif

#define PARROT_HAS_PLATFORM_INIT_CODE

void Parrot_platform_init_code(void);

#ifdef _MSC_VER
/* These disable certain Level 4 Warnings */
#pragma warning( disable: 4100 ) /* disables 'unreferenced formal parameter'
                                  * warnings */
#pragma warning( disable: 4115 ) /* disables 'named type definition in
                                  * parentheses' warnings triggered in VC98
                                  * include files */
#pragma warning( disable: 4505 ) /* disables 'unreferenced local function has
                                  * been removed' warnings in header files */
#endif /* defined(_MSC_VER) */

/*
** Miscellaneous:
*/



/*
** Dynamic Loading:
*/


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
