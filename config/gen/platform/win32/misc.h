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
