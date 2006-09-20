#define DEFAULT_OPEN_MODE 0

typedef void* Parrot_WIN32_HANDLE;
typedef HUGEINTVAL Parrot_OFF_T;

#ifndef S_ISREG
#  define S_ISREG(m) ((m & S_IFMT) == S_IFREG)
#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
