# 1 "src/pmc/integer.c"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/pmc/integer.c"
# 14 "src/pmc/integer.c"
# 1 "./include/parrot/parrot.h" 1
# 26 "./include/parrot/parrot.h"
# 1 "./include/parrot/core_types.h" 1
# 10 "./include/parrot/core_types.h"
typedef struct PMC PMC;
typedef PMC *Parrot_PMC;

struct parrot_string_t;
typedef struct parrot_string_t *Parrot_String;

struct parrot_interp_t;
typedef struct parrot_interp_t *Parrot_Interp;

typedef Parrot_PMC Parrot_PackFile;
# 27 "./include/parrot/parrot.h" 2
# 36 "./include/parrot/parrot.h"
# 1 "./include/parrot/config.h" 1
# 34 "./include/parrot/config.h"
typedef long Parrot_Int;
typedef unsigned long Parrot_UInt;
typedef double Parrot_Float;
typedef long Parrot_Opcode;
typedef void * Parrot_Pointer;

typedef signed char Parrot_Int1;
typedef unsigned char Parrot_UInt1;
typedef short Parrot_Int2;
typedef unsigned short Parrot_UInt2;
typedef int Parrot_Int4;
typedef unsigned int Parrot_UInt4;

typedef long Parrot_Int8;
typedef unsigned long Parrot_UInt8;


typedef float Parrot_Float4;
typedef double Parrot_Float8;
# 111 "./include/parrot/config.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 147 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef int wchar_t;
# 112 "./include/parrot/config.h" 2
# 120 "./include/parrot/config.h"
typedef Parrot_Int INTVAL;
typedef Parrot_UInt UINTVAL;
typedef Parrot_Float FLOATVAL;

typedef long long HUGEINTVAL;
typedef unsigned long long UHUGEINTVAL;
typedef long double HUGEFLOATVAL;
# 141 "./include/parrot/config.h"
typedef Parrot_Opcode opcode_t;
typedef unsigned long ptrcast_t;

typedef struct _vtable VTABLE;
typedef void DPOINTER;


# 1 "./include/parrot/pbcversion.h" 1
# 149 "./include/parrot/config.h" 2
# 161 "./include/parrot/config.h"
# 1 "./include/parrot/has_header.h" 1
# 162 "./include/parrot/config.h" 2
# 1 "./include/parrot/feature.h" 1
# 53 "./include/parrot/feature.h"
# 1 "/usr/include/execinfo.h" 1 3 4
# 21 "/usr/include/execinfo.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 374 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 385 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 386 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 375 "/usr/include/features.h" 2 3 4
# 398 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 399 "/usr/include/features.h" 2 3 4
# 22 "/usr/include/execinfo.h" 2 3 4





extern int backtrace (void **__array, int __size) __attribute__ ((__nonnull__ (1)));




extern char **backtrace_symbols (void *const *__array, int __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern void backtrace_symbols_fd (void *const *__array, int __size, int __fd)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


# 54 "./include/parrot/feature.h" 2







# 1 "/usr/include/dlfcn.h" 1 3 4
# 24 "/usr/include/dlfcn.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 25 "/usr/include/dlfcn.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/dlfcn.h" 1 3 4
# 57 "/usr/include/x86_64-linux-gnu/bits/dlfcn.h" 3 4



extern void _dl_mcount_wrapper_check (void *__selfpc) __attribute__ ((__nothrow__ , __leaf__));


# 28 "/usr/include/dlfcn.h" 2 3 4
# 44 "/usr/include/dlfcn.h" 3 4
typedef long int Lmid_t;











extern void *dlopen (const char *__file, int __mode) __attribute__ ((__nothrow__));



extern int dlclose (void *__handle) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void *dlsym (void *__restrict __handle,
      const char *__restrict __name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern void *dlmopen (Lmid_t __nsid, const char *__file, int __mode) __attribute__ ((__nothrow__));



extern void *dlvsym (void *__restrict __handle,
       const char *__restrict __name,
       const char *__restrict __version)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));





extern char *dlerror (void) __attribute__ ((__nothrow__ , __leaf__));





typedef struct
{
  const char *dli_fname;
  void *dli_fbase;
  const char *dli_sname;
  void *dli_saddr;
} Dl_info;



extern int dladdr (const void *__address, Dl_info *__info)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int dladdr1 (const void *__address, Dl_info *__info,
      void **__extra_info, int __flags) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




enum
  {

    RTLD_DL_SYMENT = 1,


    RTLD_DL_LINKMAP = 2
  };







extern int dlinfo (void *__restrict __handle,
     int __request, void *__restrict __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));


enum
  {

    RTLD_DI_LMID = 1,



    RTLD_DI_LINKMAP = 2,

    RTLD_DI_CONFIGADDR = 3,






    RTLD_DI_SERINFO = 4,
    RTLD_DI_SERINFOSIZE = 5,



    RTLD_DI_ORIGIN = 6,

    RTLD_DI_PROFILENAME = 7,
    RTLD_DI_PROFILEOUT = 8,




    RTLD_DI_TLS_MODID = 9,





    RTLD_DI_TLS_DATA = 10,

    RTLD_DI_MAX = 10
  };




typedef struct
{
  char *dls_name;
  unsigned int dls_flags;
} Dl_serpath;



typedef struct
{
  size_t dls_size;
  unsigned int dls_cnt;
  Dl_serpath dls_serpath[1];
} Dl_serinfo;




# 62 "./include/parrot/feature.h" 2
# 163 "./include/parrot/config.h" 2
# 37 "./include/parrot/parrot.h" 2


# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 33 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 64 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 65 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 43 "/usr/include/stdlib.h" 2 3 4
# 67 "/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 235 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 236 "/usr/include/stdlib.h" 2 3 4



extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));

extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));

extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
# 305 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;





typedef __ino64_t ino_t;




typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;







typedef __off64_t off_t;




typedef __off64_t off64_t;




typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 132 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 91 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 103 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 133 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 147 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 194 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };
# 44 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4
# 54 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4


__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 58 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4

# 223 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;
# 248 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt_t;



typedef __fsblkcnt64_t fsblkcnt_t;



typedef __fsfilcnt64_t fsfilcnt_t;





typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 124 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;

  } __data;
# 211 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 315 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 493 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





extern char *secure_getenv (const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;






extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 623 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __asm__ ("" "mkstemp64")
     __attribute__ ((__nonnull__ (1))) ;





extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 645 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __asm__ ("" "mkstemps64")
                     __attribute__ ((__nonnull__ (1))) ;





extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 663 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 677 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __asm__ ("" "mkostemp64")
     __attribute__ ((__nonnull__ (1))) ;





extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 698 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags) __asm__ ("" "mkostemps64")

     __attribute__ ((__nonnull__ (1))) ;





extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;









extern int system (const char *__command) ;






extern char *canonicalize_file_name (const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 734 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;






typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);





extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 812 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));






extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));








extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 899 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;





extern void setkey (const char *__key) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));



extern int unlockpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));




extern char *ptsname (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 956 "/usr/include/stdlib.h" 2 3 4
# 968 "/usr/include/stdlib.h" 3 4

# 40 "./include/parrot/parrot.h" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 29 "/usr/include/stdio.h" 3 4




# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 154 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 177 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 245 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 293 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 302 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 338 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);







extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 434 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 464 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 108 "/usr/include/stdio.h" 3 4




typedef _G_fpos64_t fpos_t;



typedef _G_fpos64_t fpos64_t;
# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));



# 198 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void) __asm__ ("" "tmpfile64") ;






extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
# 227 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 262 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);




# 283 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename, const char *__restrict __modes) __asm__ ("" "fopen64")

  ;
extern FILE *freopen (const char *__restrict __filename, const char *__restrict __modes, FILE *__restrict __stream) __asm__ ("" "freopen64")


  ;







extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 594 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 640 "/usr/include/stdio.h" 3 4

# 649 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 665 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 726 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 737 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 781 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off64_t __off, int __whence) __asm__ ("" "fseeko64")

                  ;
extern __off64_t ftello (FILE *__stream) __asm__ ("" "ftello64");








# 806 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos) __asm__ ("" "fgetpos64")
                                          ;
extern int fsetpos (FILE *__stream, const fpos_t *__pos) __asm__ ("" "fsetpos64")
                                                          ;








extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);




extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;








extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 873 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 943 "/usr/include/stdio.h" 3 4

# 41 "./include/parrot/parrot.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 1 3 4
# 42 "./include/parrot/parrot.h" 2
# 1 "/usr/include/errno.h" 1 3 4
# 31 "/usr/include/errno.h" 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/errno.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4



# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 5 "/usr/include/asm-generic/errno.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 2 3 4
# 1 "/usr/include/linux/errno.h" 2 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/errno.h" 2 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 36 "/usr/include/errno.h" 2 3 4
# 54 "/usr/include/errno.h" 3 4
extern char *program_invocation_name, *program_invocation_short_name;




# 68 "/usr/include/errno.h" 3 4
typedef int error_t;
# 43 "./include/parrot/parrot.h" 2
# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 33 "/usr/include/string.h" 2 3 4
# 44 "/usr/include/string.h" 3 4


extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 96 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 110 "/usr/include/string.h" 3 4
extern void *rawmemchr (const void *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 121 "/usr/include/string.h" 3 4
extern void *memrchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 166 "/usr/include/string.h" 3 4
extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 211 "/usr/include/string.h" 3 4

# 236 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 263 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 277 "/usr/include/string.h" 3 4
extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 315 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 342 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 373 "/usr/include/string.h" 3 4
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));







extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 438 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;





extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 489 "/usr/include/string.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 517 "/usr/include/string.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int ffsl (long int __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));





extern int strcasecmp_l (const char *__s1, const char *__s2,
    __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));





extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 604 "/usr/include/string.h" 3 4
extern char *basename (const char *__filename) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 644 "/usr/include/string.h" 3 4

# 44 "./include/parrot/parrot.h" 2
# 1 "/usr/include/ctype.h" 1 3 4
# 28 "/usr/include/ctype.h" 3 4

# 46 "/usr/include/ctype.h" 3 4
enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
# 79 "/usr/include/ctype.h" 3 4
extern const unsigned short int **__ctype_b_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 104 "/usr/include/ctype.h" 3 4






extern int isalnum (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha (int) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int islower (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint (int) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit (int) __attribute__ ((__nothrow__ , __leaf__));



extern int tolower (int __c) __attribute__ ((__nothrow__ , __leaf__));


extern int toupper (int __c) __attribute__ ((__nothrow__ , __leaf__));








extern int isblank (int) __attribute__ ((__nothrow__ , __leaf__));






extern int isctype (int __c, int __mask) __attribute__ ((__nothrow__ , __leaf__));






extern int isascii (int __c) __attribute__ ((__nothrow__ , __leaf__));



extern int toascii (int __c) __attribute__ ((__nothrow__ , __leaf__));



extern int _toupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int _tolower (int) __attribute__ ((__nothrow__ , __leaf__));
# 271 "/usr/include/ctype.h" 3 4
extern int isalnum_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int islower_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));

extern int isblank_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));



extern int __tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));


extern int __toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
# 347 "/usr/include/ctype.h" 3 4

# 45 "./include/parrot/parrot.h" 2
# 53 "./include/parrot/parrot.h"
# 1 "/usr/include/unistd.h" 1 3 4
# 27 "/usr/include/unistd.h" 3 4

# 202 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h" 1 3 4
# 203 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/environments.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/environments.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/environments.h" 2 3 4
# 207 "/usr/include/unistd.h" 2 3 4
# 226 "/usr/include/unistd.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 227 "/usr/include/unistd.h" 2 3 4
# 267 "/usr/include/unistd.h" 3 4
typedef __intptr_t intptr_t;






typedef __socklen_t socklen_t;
# 287 "/usr/include/unistd.h" 3 4
extern int access (const char *__name, int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int euidaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int eaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;
# 337 "/usr/include/unistd.h" 3 4
extern __off64_t lseek (int __fd, __off64_t __offset, int __whence) __asm__ ("" "lseek64") __attribute__ ((__nothrow__ , __leaf__))

             ;





extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     __attribute__ ((__nothrow__ , __leaf__));






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 388 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes, __off64_t __offset) __asm__ ("" "pread64")

                    ;
extern ssize_t pwrite (int __fd, const void *__buf, size_t __nbytes, __off64_t __offset) __asm__ ("" "pwrite64")

                     ;
# 404 "/usr/include/unistd.h" 3 4
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int pipe2 (int __pipedes[2], int __flags) __attribute__ ((__nothrow__ , __leaf__)) ;
# 432 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__ , __leaf__));
# 444 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ , __leaf__));






extern int usleep (__useconds_t __useconds);
# 469 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;



extern int chdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;
# 511 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *get_current_dir_name (void) __attribute__ ((__nothrow__ , __leaf__));







extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ , __leaf__));




extern int dup3 (int __fd, int __fd2, int __flags) __attribute__ ((__nothrow__ , __leaf__));



extern char **__environ;

extern char **environ;





extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int execvpe (const char *__file, char *const __argv[],
      char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern int nice (int __inc) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/x86_64-linux-gnu/bits/confname.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 610 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__ , __leaf__));


extern long int sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__));



extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__));




extern __pid_t getpid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t getppid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));

extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));






extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__ , __leaf__));
# 660 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) __attribute__ ((__nothrow__ , __leaf__));






extern __pid_t setsid (void) __attribute__ ((__nothrow__ , __leaf__));



extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));



extern __uid_t getuid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __uid_t geteuid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __gid_t getgid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __gid_t getegid (void) __attribute__ ((__nothrow__ , __leaf__));




extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__ , __leaf__)) ;



extern int group_member (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__));






extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;






extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;





extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     __attribute__ ((__nothrow__ , __leaf__));



extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     __attribute__ ((__nothrow__ , __leaf__));



extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     __attribute__ ((__nothrow__ , __leaf__)) ;



extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     __attribute__ ((__nothrow__ , __leaf__)) ;






extern __pid_t fork (void) __attribute__ ((__nothrow__));







extern __pid_t vfork (void) __attribute__ ((__nothrow__ , __leaf__));





extern char *ttyname (int __fd) __attribute__ ((__nothrow__ , __leaf__));



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) __attribute__ ((__nothrow__ , __leaf__));





extern int ttyslot (void) __attribute__ ((__nothrow__ , __leaf__));




extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern int rmdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ , __leaf__));


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__ , __leaf__));






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 871 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/getopt.h" 1 3 4
# 57 "/usr/include/getopt.h" 3 4
extern char *optarg;
# 71 "/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 150 "/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__ , __leaf__));
# 872 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) __attribute__ ((__nothrow__ , __leaf__)) ;





extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) __attribute__ ((__nothrow__ , __leaf__));


extern int revoke (const char *__file) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int acct (const char *__name) __attribute__ ((__nothrow__ , __leaf__));



extern char *getusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void setusershell (void) __attribute__ ((__nothrow__ , __leaf__));





extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__ , __leaf__)) ;






extern int chroot (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));







extern int fsync (int __fd);





extern int syncfs (int __fd) __attribute__ ((__nothrow__ , __leaf__));






extern long int gethostid (void);


extern void sync (void) __attribute__ ((__nothrow__ , __leaf__));





extern int getpagesize (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int getdtablesize (void) __attribute__ ((__nothrow__ , __leaf__));
# 997 "/usr/include/unistd.h" 3 4
extern int truncate (const char *__file, __off64_t __length) __asm__ ("" "truncate64") __attribute__ ((__nothrow__ , __leaf__))

                  __attribute__ ((__nonnull__ (1))) ;





extern int truncate64 (const char *__file, __off64_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 1019 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off64_t __length) __asm__ ("" "ftruncate64") __attribute__ ((__nothrow__ , __leaf__))
                        ;





extern int ftruncate64 (int __fd, __off64_t __length) __attribute__ ((__nothrow__ , __leaf__)) ;
# 1037 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) __attribute__ ((__nothrow__ , __leaf__)) ;





extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ , __leaf__));
# 1058 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__ , __leaf__));
# 1084 "/usr/include/unistd.h" 3 4
extern int lockf (int __fd, int __cmd, __off64_t __len) __asm__ ("" "lockf64")
                       ;





extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
# 1112 "/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);







extern char *crypt (const char *__key, const char *__salt)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern void encrypt (char *__glibc_block, int __edflag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern void swab (const void *__restrict __from, void *__restrict __to,
    ssize_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 1151 "/usr/include/unistd.h" 3 4

# 54 "./include/parrot/parrot.h" 2
# 62 "./include/parrot/parrot.h"
# 1 "/usr/include/x86_64-linux-gnu/sys/mman.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/sys/mman.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/sys/mman.h" 2 3 4
# 41 "/usr/include/x86_64-linux-gnu/sys/mman.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mman.h" 1 3 4
# 45 "/usr/include/x86_64-linux-gnu/bits/mman.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mman-linux.h" 1 3 4
# 45 "/usr/include/x86_64-linux-gnu/bits/mman.h" 2 3 4
# 42 "/usr/include/x86_64-linux-gnu/sys/mman.h" 2 3 4





# 61 "/usr/include/x86_64-linux-gnu/sys/mman.h" 3 4
extern void * mmap (void *__addr, size_t __len, int __prot, int __flags, int __fd, __off64_t __offset) __asm__ ("" "mmap64") __attribute__ ((__nothrow__ , __leaf__))


                ;





extern void *mmap64 (void *__addr, size_t __len, int __prot,
       int __flags, int __fd, __off64_t __offset) __attribute__ ((__nothrow__ , __leaf__));




extern int munmap (void *__addr, size_t __len) __attribute__ ((__nothrow__ , __leaf__));




extern int mprotect (void *__addr, size_t __len, int __prot) __attribute__ ((__nothrow__ , __leaf__));







extern int msync (void *__addr, size_t __len, int __flags);




extern int madvise (void *__addr, size_t __len, int __advice) __attribute__ ((__nothrow__ , __leaf__));



extern int posix_madvise (void *__addr, size_t __len, int __advice) __attribute__ ((__nothrow__ , __leaf__));




extern int mlock (const void *__addr, size_t __len) __attribute__ ((__nothrow__ , __leaf__));


extern int munlock (const void *__addr, size_t __len) __attribute__ ((__nothrow__ , __leaf__));




extern int mlockall (int __flags) __attribute__ ((__nothrow__ , __leaf__));



extern int munlockall (void) __attribute__ ((__nothrow__ , __leaf__));







extern int mincore (void *__start, size_t __len, unsigned char *__vec)
     __attribute__ ((__nothrow__ , __leaf__));
# 133 "/usr/include/x86_64-linux-gnu/sys/mman.h" 3 4
extern void *mremap (void *__addr, size_t __old_len, size_t __new_len,
       int __flags, ...) __attribute__ ((__nothrow__ , __leaf__));



extern int remap_file_pages (void *__start, size_t __size, int __prot,
        size_t __pgoff, int __flags) __attribute__ ((__nothrow__ , __leaf__));




extern int shm_open (const char *__name, int __oflag, mode_t __mode);


extern int shm_unlink (const char *__name);


# 63 "./include/parrot/parrot.h" 2






# 1 "/usr/include/x86_64-linux-gnu/sys/time.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/sys/time.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/sys/time.h" 2 3 4
# 37 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4

# 55 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4
struct timezone
  {
    int tz_minuteswest;
    int tz_dsttime;
  };

typedef struct timezone *__restrict __timezone_ptr_t;
# 71 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4
extern int gettimeofday (struct timeval *__restrict __tv,
    __timezone_ptr_t __tz) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int settimeofday (const struct timeval *__tv,
    const struct timezone *__tz)
     __attribute__ ((__nothrow__ , __leaf__));





extern int adjtime (const struct timeval *__delta,
      struct timeval *__olddelta) __attribute__ ((__nothrow__ , __leaf__));




enum __itimer_which
  {

    ITIMER_REAL = 0,


    ITIMER_VIRTUAL = 1,



    ITIMER_PROF = 2

  };



struct itimerval
  {

    struct timeval it_interval;

    struct timeval it_value;
  };




typedef enum __itimer_which __itimer_which_t;






extern int getitimer (__itimer_which_t __which,
        struct itimerval *__value) __attribute__ ((__nothrow__ , __leaf__));




extern int setitimer (__itimer_which_t __which,
        const struct itimerval *__restrict __new,
        struct itimerval *__restrict __old) __attribute__ ((__nothrow__ , __leaf__));




extern int utimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int lutimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int futimes (int __fd, const struct timeval __tvp[2]) __attribute__ ((__nothrow__ , __leaf__));






extern int futimesat (int __fd, const char *__file,
        const struct timeval __tvp[2]) __attribute__ ((__nothrow__ , __leaf__));
# 189 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4

# 70 "./include/parrot/parrot.h" 2



# 1 "/usr/include/time.h" 1 3 4
# 29 "/usr/include/time.h" 3 4








# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 38 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 86 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timex.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/timex.h" 3 4
struct timex
{
  unsigned int modes;
  __syscall_slong_t offset;
  __syscall_slong_t freq;
  __syscall_slong_t maxerror;
  __syscall_slong_t esterror;
  int status;
  __syscall_slong_t constant;
  __syscall_slong_t precision;
  __syscall_slong_t tolerance;
  struct timeval time;
  __syscall_slong_t tick;
  __syscall_slong_t ppsfreq;
  __syscall_slong_t jitter;
  int shift;
  __syscall_slong_t stabil;
  __syscall_slong_t jitcnt;
  __syscall_slong_t calcnt;
  __syscall_slong_t errcnt;
  __syscall_slong_t stbcnt;

  int tai;


  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32;
};
# 87 "/usr/include/x86_64-linux-gnu/bits/time.h" 2 3 4




extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) __attribute__ ((__nothrow__ , __leaf__));


# 42 "/usr/include/time.h" 2 3 4
# 131 "/usr/include/time.h" 3 4


struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;
# 186 "/usr/include/time.h" 3 4



extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));





extern char *strptime (const char *__restrict __s,
         const char *__restrict __fmt, struct tm *__tp)
     __attribute__ ((__nothrow__ , __leaf__));







extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));



extern char *strptime_l (const char *__restrict __s,
    const char *__restrict __fmt, struct tm *__tp,
    __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));






extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));





extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));





extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));







extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));



extern int daylight;
extern long int timezone;





extern int stime (const time_t *__when) __attribute__ ((__nothrow__ , __leaf__));
# 319 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 334 "/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ , __leaf__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));





extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 403 "/usr/include/time.h" 3 4
extern int getdate_err;
# 412 "/usr/include/time.h" 3 4
extern struct tm *getdate (const char *__string);
# 426 "/usr/include/time.h" 3 4
extern int getdate_r (const char *__restrict __string,
        struct tm *__restrict __resbufp);



# 74 "./include/parrot/parrot.h" 2



# 1 "/usr/include/fcntl.h" 1 3 4
# 28 "/usr/include/fcntl.h" 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 3 4
struct flock
  {
    short int l_type;
    short int l_whence;




    __off64_t l_start;
    __off64_t l_len;

    __pid_t l_pid;
  };


struct flock64
  {
    short int l_type;
    short int l_whence;
    __off64_t l_start;
    __off64_t l_len;
    __pid_t l_pid;
  };



# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/uio.h" 1 3 4
# 43 "/usr/include/x86_64-linux-gnu/bits/uio.h" 3 4
struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
# 39 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 2 3 4
# 241 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
enum __pid_type
  {
    F_OWNER_TID = 0,
    F_OWNER_PID,
    F_OWNER_PGRP,
    F_OWNER_GID = F_OWNER_PGRP
  };


struct f_owner_ex
  {
    enum __pid_type type;
    __pid_t pid;
  };
# 311 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
struct file_handle
{
  unsigned int handle_bytes;
  int handle_type;

  unsigned char f_handle[0];
};
# 341 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4





extern ssize_t readahead (int __fd, __off64_t __offset, size_t __count)
    __attribute__ ((__nothrow__ , __leaf__));






extern int sync_file_range (int __fd, __off64_t __offset, __off64_t __count,
       unsigned int __flags);






extern ssize_t vmsplice (int __fdout, const struct iovec *__iov,
    size_t __count, unsigned int __flags);





extern ssize_t splice (int __fdin, __off64_t *__offin, int __fdout,
         __off64_t *__offout, size_t __len,
         unsigned int __flags);





extern ssize_t tee (int __fdin, int __fdout, size_t __len,
      unsigned int __flags);
# 388 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
extern int fallocate (int __fd, int __mode, __off64_t __offset, __off64_t __len) __asm__ ("" "fallocate64")

                     ;





extern int fallocate64 (int __fd, int __mode, __off64_t __offset,
   __off64_t __len);




extern int name_to_handle_at (int __dfd, const char *__name,
         struct file_handle *__handle, int *__mnt_id,
         int __flags) __attribute__ ((__nothrow__ , __leaf__));





extern int open_by_handle_at (int __mountdirfd, struct file_handle *__handle,
         int __flags);




# 61 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 2 3 4
# 36 "/usr/include/fcntl.h" 2 3 4
# 68 "/usr/include/fcntl.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
struct stat
  {
    __dev_t st_dev;




    __ino_t st_ino;







    __nlink_t st_nlink;
    __mode_t st_mode;

    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;

    __dev_t st_rdev;




    __off_t st_size;



    __blksize_t st_blksize;

    __blkcnt_t st_blocks;
# 91 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 106 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];
# 115 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
  };



struct stat64
  {
    __dev_t st_dev;

    __ino64_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;






    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;





    __blksize_t st_blksize;
    __blkcnt64_t st_blocks;







    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 164 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];



  };
# 69 "/usr/include/fcntl.h" 2 3 4
# 137 "/usr/include/fcntl.h" 3 4
extern int fcntl (int __fd, int __cmd, ...);
# 149 "/usr/include/fcntl.h" 3 4
extern int open (const char *__file, int __oflag, ...) __asm__ ("" "open64")
     __attribute__ ((__nonnull__ (1)));





extern int open64 (const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 174 "/usr/include/fcntl.h" 3 4
extern int openat (int __fd, const char *__file, int __oflag, ...) __asm__ ("" "openat64")
                    __attribute__ ((__nonnull__ (2)));





extern int openat64 (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 195 "/usr/include/fcntl.h" 3 4
extern int creat (const char *__file, mode_t __mode) __asm__ ("" "creat64")
                  __attribute__ ((__nonnull__ (1)));





extern int creat64 (const char *__file, mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 242 "/usr/include/fcntl.h" 3 4
extern int posix_fadvise (int __fd, __off64_t __offset, __off64_t __len, int __advise) __asm__ ("" "posix_fadvise64") __attribute__ ((__nothrow__ , __leaf__))

                      ;





extern int posix_fadvise64 (int __fd, off64_t __offset, off64_t __len,
       int __advise) __attribute__ ((__nothrow__ , __leaf__));
# 263 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate (int __fd, __off64_t __offset, __off64_t __len) __asm__ ("" "posix_fallocate64")

                           ;





extern int posix_fallocate64 (int __fd, off64_t __offset, off64_t __len);
# 282 "/usr/include/fcntl.h" 3 4

# 78 "./include/parrot/parrot.h" 2



# 1 "/usr/include/x86_64-linux-gnu/sys/stat.h" 1 3 4
# 103 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h" 1 3 4
# 106 "/usr/include/x86_64-linux-gnu/sys/stat.h" 2 3 4
# 217 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int stat (const char *__restrict __file, struct stat *__restrict __buf) __asm__ ("" "stat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (1, 2)));
extern int fstat (int __fd, struct stat *__buf) __asm__ ("" "fstat64") __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));






extern int stat64 (const char *__restrict __file,
     struct stat64 *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int fstat64 (int __fd, struct stat64 *__buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 243 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int fstatat (int __fd, const char *__restrict __file, struct stat *__restrict __buf, int __flag) __asm__ ("" "fstatat64") __attribute__ ((__nothrow__ , __leaf__))


                 __attribute__ ((__nonnull__ (2, 3)));






extern int fstatat64 (int __fd, const char *__restrict __file,
        struct stat64 *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 267 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int lstat (const char *__restrict __file, struct stat *__restrict __buf) __asm__ ("" "lstat64") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (1, 2)));





extern int lstat64 (const char *__restrict __file,
      struct stat64 *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ , __leaf__));





extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
       int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;






extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ , __leaf__));




extern __mode_t getumask (void) __attribute__ ((__nothrow__ , __leaf__));



extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));






extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int mknodat (int __fd, const char *__path, __mode_t __mode,
      __dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern int utimensat (int __fd, const char *__path,
        const struct timespec __times[2],
        int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern int futimens (int __fd, const struct timespec __times[2]) __attribute__ ((__nothrow__ , __leaf__));
# 410 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf) __asm__ ("" "__fxstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (3)));
extern int __xstat (int __ver, const char *__filename, struct stat *__stat_buf) __asm__ ("" "__xstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat (int __ver, const char *__filename, struct stat *__stat_buf) __asm__ ("" "__lxstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat (int __ver, int __fildes, const char *__filename, struct stat *__stat_buf, int __flag) __asm__ ("" "__fxstatat64") __attribute__ ((__nothrow__ , __leaf__))


                    __attribute__ ((__nonnull__ (3, 4)));
# 432 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int __fxstat64 (int __ver, int __fildes, struct stat64 *__stat_buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int __xstat64 (int __ver, const char *__filename,
        struct stat64 *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat64 (int __ver, const char *__filename,
         struct stat64 *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat64 (int __ver, int __fildes, const char *__filename,
    struct stat64 *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));

extern int __xmknod (int __ver, const char *__path, __mode_t __mode,
       __dev_t *__dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int __xmknodat (int __ver, int __fd, const char *__path,
         __mode_t __mode, __dev_t *__dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 5)));
# 534 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4

# 82 "./include/parrot/parrot.h" 2



# 1 "/usr/include/setjmp.h" 1 3 4
# 27 "/usr/include/setjmp.h" 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 30 "/usr/include/setjmp.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 31 "/usr/include/setjmp.h" 2 3 4



struct __jmp_buf_tag
  {




    __jmp_buf __jmpbuf;
    int __mask_was_saved;
    __sigset_t __saved_mask;
  };




typedef struct __jmp_buf_tag jmp_buf[1];



extern int setjmp (jmp_buf __env) __attribute__ ((__nothrow__));






extern int __sigsetjmp (struct __jmp_buf_tag __env[1], int __savemask) __attribute__ ((__nothrow__));



extern int _setjmp (struct __jmp_buf_tag __env[1]) __attribute__ ((__nothrow__));










extern void longjmp (struct __jmp_buf_tag __env[1], int __val)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));







extern void _longjmp (struct __jmp_buf_tag __env[1], int __val)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));







typedef struct __jmp_buf_tag sigjmp_buf[1];
# 102 "/usr/include/setjmp.h" 3 4
extern void siglongjmp (sigjmp_buf __env, int __val)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
# 112 "/usr/include/setjmp.h" 3 4

# 86 "./include/parrot/parrot.h" 2
typedef jmp_buf Parrot_jump_buff;



# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 1 3 4
# 34 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 1 3 4
# 168 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 143 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 1 3 4
# 160 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 2 3 4
# 161 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 144 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/posix2_lim.h" 1 3 4
# 148 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 2 3 4
# 152 "/usr/include/limits.h" 2 3 4
# 169 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 2 3 4
# 8 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/syslimits.h" 2 3 4
# 35 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 2 3 4
# 91 "./include/parrot/parrot.h" 2
# 104 "./include/parrot/parrot.h"
typedef void STRING_FUNCS;
typedef struct parrot_interp_t Interp;
# 191 "./include/parrot/parrot.h"
typedef void (*funcptr_t)(void);
# 224 "./include/parrot/parrot.h"
# 1 "/usr/include/libintl.h" 1 3 4
# 34 "/usr/include/libintl.h" 3 4





extern char *gettext (const char *__msgid)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (1)));



extern char *dgettext (const char *__domainname, const char *__msgid)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (2)));
extern char *__dgettext (const char *__domainname, const char *__msgid)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (2)));



extern char *dcgettext (const char *__domainname,
   const char *__msgid, int __category)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (2)));
extern char *__dcgettext (const char *__domainname,
     const char *__msgid, int __category)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (2)));




extern char *ngettext (const char *__msgid1, const char *__msgid2,
         unsigned long int __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (1))) __attribute__ ((__format_arg__ (2)));



extern char *dngettext (const char *__domainname, const char *__msgid1,
   const char *__msgid2, unsigned long int __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));



extern char *dcngettext (const char *__domainname, const char *__msgid1,
    const char *__msgid2, unsigned long int __n,
    int __category)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));





extern char *textdomain (const char *__domainname) __attribute__ ((__nothrow__ , __leaf__));



extern char *bindtextdomain (const char *__domainname,
        const char *__dirname) __attribute__ ((__nothrow__ , __leaf__));



extern char *bind_textdomain_codeset (const char *__domainname,
          const char *__codeset) __attribute__ ((__nothrow__ , __leaf__));
# 121 "/usr/include/libintl.h" 3 4

# 225 "./include/parrot/parrot.h" 2
# 240 "./include/parrot/parrot.h"
typedef struct _hash Hash;
typedef struct PackFile_ByteCode PackFile_ByteCode;

# 1 "./include/parrot/settings.h" 1
# 244 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/enums.h" 1
# 14 "./include/parrot/enums.h"
typedef enum {
    NO_STACK_ENTRY_TYPE = 0,
    STACK_ENTRY_MARK = 1,
    STACK_ENTRY_DESTINATION = 2,
    STACK_ENTRY_ACTION = 3,
    STACK_ENTRY_PMC = 4
} Stack_entry_type;

typedef enum {
    NO_STACK_ENTRY_FLAGS = 0,
    STACK_ENTRY_CLEANUP_FLAG = 1 << 0
} Stack_entry_flags;

typedef enum {
    NO_STACK_CHUNK_FLAGS = 0,
    STACK_CHUNK_COW_FLAG = 1 << 0
} Stack_chunk_flags;



typedef enum {
    ITERATE_FROM_START,
    ITERATE_FROM_START_KEYS,
    ITERATE_GET_NEXT,
    ITERATE_GET_PREV,
    ITERATE_FROM_END
} Iterator_action_t;




typedef enum {

    PARROT_ARG_INTVAL = 0x0000,
    PARROT_ARG_STRING = 0x0001,
    PARROT_ARG_PMC = 0x0002,
    PARROT_ARG_FLOATVAL = 0x0003,
    PARROT_ARG_TYPE_MASK = 0x000f,

    PARROT_ARG_CONSTANT = 0x0010,

    PARROT_ARG_FLATTEN = 0x0020,
    PARROT_ARG_SLURPY_ARRAY = PARROT_ARG_FLATTEN,

    PARROT_ARG_OPTIONAL = 0x0080,
    PARROT_ARG_OPT_FLAG = 0x0100,
    PARROT_ARG_NAME = 0x0200,
    PARROT_ARG_LOOKAHEAD = 0x0400,
    PARROT_ARG_INVOCANT = 0x0800,
    PARROT_ARG_CALL_SIG = 0x1000


} Call_bits_enum_t;
# 245 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/platform_interface.h" 1
# 11 "./include/parrot/platform_interface.h"
# 1 "./include/parrot/interpreter.h" 1
# 14 "./include/parrot/interpreter.h"
typedef enum {
    PARROT_NO_FLAGS = 0x00,
    PARROT_BOUNDS_FLAG = 0x04,
    PARROT_PROFILE_FLAG = 0x08,
    PARROT_GC_DEBUG_FLAG = 0x10,

    PARROT_EXTERN_CODE_FLAG = 0x100,
    PARROT_DESTROY_FLAG = 0x200,

    PARROT_IS_THREAD = 0x1000,
    PARROT_THR_FLAG_NEW_PMC = 0x2000,
    PARROT_THR_THREAD_POOL = 0x4000

} Parrot_Interp_flag;



typedef enum {
    PARROT_NO_DEBUG = 0x00,
    PARROT_MEM_STAT_DEBUG_FLAG = 0x01,
    PARROT_BACKTRACE_DEBUG_FLAG = 0x02,
    PARROT_JIT_DEBUG_FLAG = 0x04,
    PARROT_START_DEBUG_FLAG = 0x08,
    PARROT_THREAD_DEBUG_FLAG = 0x10,
    PARROT_EVAL_DEBUG_FLAG = 0x20,
    PARROT_REG_DEBUG_FLAG = 0x40,
    PARROT_CTX_DESTROY_DEBUG_FLAG = 0x80,
    PARROT_ALL_DEBUG_FLAGS = 0xffff
} Parrot_debug_flags;



typedef enum {
    PARROT_NO_TRACE = 0x00,
    PARROT_TRACE_OPS_FLAG = 0x01,
    PARROT_TRACE_FIND_METH_FLAG = 0x02,
    PARROT_TRACE_SUB_CALL_FLAG = 0x04,
    PARROT_ALL_TRACE_FLAGS = 0xffff
} Parrot_trace_flags;


typedef enum {
    PARROT_IMCC_DEBUG_NONE = 0x0000,
    PARROT_IMCC_VERBOSE = 0x0001,
    PARROT_IMCC_DEBUG_PARSER = 0x0004,
    PARROT_IMCC_DEBUG_IMC = 0x0008,
    PARROT_IMCC_DEBUG_CFG = 0x0010,
    PARROT_IMCC_DEBUG_OPT1 = 0x0020,
    PARROT_IMCC_DEBUG_OPT2 = 0x0040,
    PARROT_IMCC_DEBUG_SPILL = 0x0080,
    PARROT_IMCC_DEBUG_AST = 0x0100,
    PARROT_IMCC_DEBUG_PBC = 0x1000,
    PARROT_IMCC_DEBUG_PBC_CONST = 0x2000,
    PARROT_IMCC_DEBUG_PBC_FIXUP = 0x4000,
    PARROT_IMCC_DEBUG_ALL = 0xffff
} Parrot_imcc_dflags;

typedef enum {
    PARROT_IMCC_OPT_NONE = 0x000,
    PARROT_IMCC_OPT_PRE = 0x001,
    PARROT_IMCC_OPT_CFG = 0x002,
    PARROT_IMCC_OPT_SUB = 0x004,
    PARROT_IMCC_OPT_PASM = 0x100,
} Parrot_imcc_opt_flags;


typedef enum {
    PARROT_SLOW_CORE,
    PARROT_FUNCTION_CORE = PARROT_SLOW_CORE,
    PARROT_FAST_CORE = 0x01,
    PARROT_EXEC_CORE = 0x20,
    PARROT_GC_DEBUG_CORE = 0x40,
    PARROT_DEBUGGER_CORE = 0x80,
    PARROT_PROFILING_CORE = 0x160,
    PARROT_SUBPROF_SUB_CORE = 0x200,
    PARROT_SUBPROF_HLL_CORE = 0x201,
    PARROT_SUBPROF_OPS_CORE = 0x202
} Parrot_Run_core_t;



typedef enum {
    PARROT_CLONE_CODE = 0x1,


    PARROT_CLONE_GLOBALS = 0x2,
    PARROT_CLONE_RUNOPS = 0x4,
    PARROT_CLONE_INTERP_FLAGS = 0x8,

    PARROT_CLONE_HLL = 0x10,
    PARROT_CLONE_CLASSES = 0x20,
    PARROT_CLONE_LIBRARIES = 0x40,

    PARROT_CLONE_CC = 0x80,





    PARROT_CLONE_DEFAULT = 0x7f
} Parrot_clone_flags;







struct parrot_interp_t;
# 136 "./include/parrot/interpreter.h"
typedef Parrot_Interp_flag Interp_flags;
typedef Parrot_Run_core_t Run_Cores;
# 154 "./include/parrot/interpreter.h"
# 1 "./include/parrot/context.h" 1
# 10 "./include/parrot/context.h"
# 1 "./include/parrot/string.h" 1
# 19 "./include/parrot/string.h"
# 1 "./include/parrot/compiler.h" 1
# 20 "./include/parrot/string.h" 2
# 1 "./include/parrot/pobj.h" 1
# 19 "./include/parrot/pobj.h"
typedef struct pobj_t {
    Parrot_UInt flags;
} PObj;



typedef struct buffer_t {
    Parrot_UInt flags;
    void * _bufstart;

    size_t _buflen;
} Parrot_Buffer;

typedef enum Forward_flag {
    Buffer_moved_FLAG = 1 << 0,
    Buffer_shared_FLAG = 1 << 1
} Forward_flags;
# 84 "./include/parrot/pobj.h"
struct parrot_string_t {
    Parrot_UInt flags;
    void * _bufstart;
    size_t _buflen;
    char *strstart;

    UINTVAL bufused;
    UINTVAL strlen;
    UINTVAL hashval;


    const struct _str_vtable *encoding;
};



struct PMC {
    Parrot_UInt flags;
    VTABLE *vtable;
    DPOINTER *data;
    PMC *_metadata;



};
# 118 "./include/parrot/pobj.h"
typedef enum PObj_enum {






    PObj_private0_FLAG = ((UINTVAL)1 << (0)),
    PObj_private1_FLAG = ((UINTVAL)1 << (1)),
    PObj_private2_FLAG = ((UINTVAL)1 << (2)),
    PObj_private3_FLAG = ((UINTVAL)1 << (3)),
    PObj_private4_FLAG = ((UINTVAL)1 << (4)),
    PObj_private5_FLAG = ((UINTVAL)1 << (5)),
    PObj_private6_FLAG = ((UINTVAL)1 << (6)),
    PObj_private7_FLAG = ((UINTVAL)1 << (7)),



    PObj_is_string_FLAG = ((UINTVAL)1 << (8)),

    PObj_is_PMC_FLAG = ((UINTVAL)1 << (9)),

    PObj_is_string_copy_FLAG = ((UINTVAL)1 << (10)),

    PObj_is_PMC_shared_FLAG = ((UINTVAL)1 << (11)),

    PObj_is_shared_FLAG = ((UINTVAL)1 << (11)),



    PObj_constant_FLAG = ((UINTVAL)1 << (12)),

    PObj_external_FLAG = ((UINTVAL)1 << (13)),

    PObj_sysmem_FLAG = ((UINTVAL)1 << (14)),



    PObj_is_COWable_FLAG = ((UINTVAL)1 << (15)),


    b_PObj_live_FLAG = ((UINTVAL)1 << (16)),

    b_PObj_on_free_list_FLAG = ((UINTVAL)1 << (17)),



    PObj_custom_mark_FLAG = ((UINTVAL)1 << (18)),

    PObj_custom_destroy_FLAG = ((UINTVAL)1 << (19)),

    PObj_report_FLAG = ((UINTVAL)1 << (20)),


    PObj_is_new_FLAG = ((UINTVAL)1 << (21)),


    PObj_GC_generation_0_FLAG = ((UINTVAL)1 << (22)),
    PObj_GC_generation_1_FLAG = ((UINTVAL)1 << (23)),
    PObj_GC_generation_2_FLAG = ((UINTVAL)1 << (24)),


    PObj_GC_on_dirty_list_FLAG = ((UINTVAL)1 << (25)),


    PObj_GC_need_write_barrier_FLAG = ((UINTVAL)1 << (26)),


    PObj_GC_soil_root_FLAG = ((UINTVAL)1 << (27)),


    PObj_GC_all_generation_FLAGS = PObj_GC_generation_0_FLAG
                                 | PObj_GC_generation_1_FLAG
                                 | PObj_GC_generation_2_FLAG,

    PObj_GC_all_FLAGS = PObj_GC_all_generation_FLAGS
                                 | PObj_GC_on_dirty_list_FLAG
                                 | PObj_GC_need_write_barrier_FLAG,



    PObj_needs_early_gc_FLAG = ((UINTVAL)1 << (28)),


    PObj_is_class_FLAG = ((UINTVAL)1 << (29)),

    PObj_is_object_FLAG = ((UINTVAL)1 << (30))

} PObj_flags;
# 21 "./include/parrot/string.h" 2
# 1 "./include/parrot/cclass.h" 1
# 15 "./include/parrot/cclass.h"
typedef enum {
enum_cclass_any = 0xffff,
enum_cclass_none = 0x0000,
enum_cclass_uppercase = 0x0001,
enum_cclass_lowercase = 0x0002,
enum_cclass_alphabetic = 0x0004,
enum_cclass_numeric = 0x0008,
enum_cclass_hexadecimal = 0x0010,
enum_cclass_whitespace = 0x0020,
enum_cclass_printing = 0x0040,
enum_cclass_graphical = 0x0080,
enum_cclass_blank = 0x0100,
enum_cclass_control = 0x0200,
enum_cclass_punctuation = 0x0400,
enum_cclass_alphanumeric = 0x0800,
enum_cclass_newline = 0x1000,
enum_cclass_word = 0x2000
} PARROT_CCLASS_FLAGS;
# 22 "./include/parrot/string.h" 2
# 85 "./include/parrot/string.h"
typedef struct parrot_string_t STRING;


typedef struct string_iterator_t {
    UINTVAL bytepos;
    UINTVAL charpos;
} String_iter;

typedef struct _Parrot_String_Bounds {
    UINTVAL bytes;
    INTVAL chars;
    INTVAL delim;
} Parrot_String_Bounds;


typedef STRING * (*str_vtable_to_encoding_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_chr_t)(Parrot_Interp interp, UINTVAL codepoint);

typedef INTVAL (*str_vtable_equal_t)(Parrot_Interp interp, const STRING *lhs,
                                            const STRING *rhs);
typedef INTVAL (*str_vtable_compare_t)(Parrot_Interp interp, const STRING *lhs,
                                            const STRING *rhs);
typedef INTVAL (*str_vtable_index_t)(Parrot_Interp interp, const STRING *src,
                                            const STRING *search_string, INTVAL offset);
typedef INTVAL (*str_vtable_rindex_t)(Parrot_Interp interp, const STRING *src,
                                            const STRING *search_string, INTVAL offset);
typedef size_t (*str_vtable_hash_t)(Parrot_Interp interp, const STRING *s, size_t hashval);

typedef void (*str_vtable_scan_t)(Parrot_Interp interp, STRING *src);
typedef INTVAL (*str_vtable_partial_scan_t)(Parrot_Interp interp, const char *buf,
                                            Parrot_String_Bounds *bounds);
typedef UINTVAL (*str_vtable_ord_t)(Parrot_Interp interp, const STRING *src, INTVAL offset);
typedef STRING * (*str_vtable_substr_t)(Parrot_Interp interp, const STRING *src,
                                            INTVAL offset, INTVAL count);


typedef INTVAL (*str_vtable_is_cclass_t)(Parrot_Interp interp, INTVAL,
                                            const STRING *src, UINTVAL offset);
typedef INTVAL (*str_vtable_find_cclass_t)(Parrot_Interp interp, INTVAL,
                                            const STRING *src, UINTVAL offset,
                                            UINTVAL count);
typedef INTVAL (*str_vtable_find_not_cclass_t)(Parrot_Interp interp, INTVAL,
                                            const STRING *src, UINTVAL offset,
                                            UINTVAL count);


typedef STRING * (*str_vtable_get_graphemes_t)(Parrot_Interp interp, const STRING *src,
                                            UINTVAL offset, UINTVAL count);
typedef STRING * (*str_vtable_compose_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_decompose_t)(Parrot_Interp interp, const STRING *src);


typedef STRING * (*str_vtable_upcase_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_downcase_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_titlecase_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_upcase_first_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_downcase_first_t)(Parrot_Interp interp, const STRING *src);
typedef STRING * (*str_vtable_titlecase_first_t)(Parrot_Interp interp, const STRING *src);


typedef UINTVAL (*str_vtable_iter_get_t)(Parrot_Interp interp, const STRING *str,
                    const String_iter *i, INTVAL offset);
typedef void (*str_vtable_iter_skip_t)(Parrot_Interp interp, const STRING *str,
                    String_iter *i, INTVAL skip);
typedef UINTVAL (*str_vtable_iter_get_and_advance_t)(Parrot_Interp interp,
                    const STRING *str, String_iter *i);
typedef void (*str_vtable_iter_set_and_advance_t)(Parrot_Interp interp, STRING *str,
                    String_iter *i, UINTVAL c);

struct _str_vtable {
    int num;
    const char *name;
    STRING *name_str;
    UINTVAL bytes_per_unit;
    UINTVAL max_bytes_per_codepoint;

    str_vtable_to_encoding_t to_encoding;
    str_vtable_chr_t chr;

    str_vtable_equal_t equal;
    str_vtable_compare_t compare;
    str_vtable_index_t index;
    str_vtable_rindex_t rindex;
    str_vtable_hash_t hash;

    str_vtable_scan_t scan;
    str_vtable_partial_scan_t partial_scan;
    str_vtable_ord_t ord;
    str_vtable_substr_t substr;

    str_vtable_is_cclass_t is_cclass;
    str_vtable_find_cclass_t find_cclass;
    str_vtable_find_not_cclass_t find_not_cclass;

    str_vtable_get_graphemes_t get_graphemes;
    str_vtable_compose_t compose;
    str_vtable_decompose_t decompose;

    str_vtable_upcase_t upcase;
    str_vtable_downcase_t downcase;
    str_vtable_titlecase_t titlecase;
    str_vtable_upcase_first_t upcase_first;
    str_vtable_downcase_first_t downcase_first;
    str_vtable_titlecase_first_t titlecase_first;

    str_vtable_iter_get_t iter_get;
    str_vtable_iter_skip_t iter_skip;
    str_vtable_iter_get_and_advance_t iter_get_and_advance;
    str_vtable_iter_set_and_advance_t iter_set_and_advance;
};

typedef struct _str_vtable STR_VTABLE;
# 11 "./include/parrot/context.h" 2


struct PackFile_ConstTable;

typedef union {
    PMC **regs_p;
    STRING **regs_s;
} Regs_ps;

typedef union {
    FLOATVAL *regs_n;
    INTVAL *regs_i;
} Regs_ni;

# 1 "./include/pmc/pmc_callcontext.h" 1
# 18 "./include/pmc/pmc_callcontext.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_CallContext_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_CallContext_ro_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_CallContext_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_CallContext_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_CallContext_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_CallContext_get_isa(Parrot_Interp interp, Hash* isa);


typedef struct Parrot_CallContext_attributes {
    PMC * caller_ctx;
    void * registers;
    Regs_ni bp;
    Regs_ps bp_ps;
    UINTVAL n_regs_used[4];
    PMC * lex_pad;
    PMC * outer_ctx;
    PMC * current_sub;
    PMC * handlers;
    PMC * current_cont;
    PMC * current_namespace;
    opcode_t * current_pc;
    PMC * current_sig;
    FLOATVAL * num_constants;
    STRING ** str_constants;
    PMC ** pmc_constants;
    INTVAL current_HLL;
    UINTVAL warns;
    UINTVAL errors;
    UINTVAL trace_flags;
    UINTVAL recursion_depth;
    struct Pcc_cell * positionals;
    INTVAL num_positionals;
    INTVAL allocated_positionals;
    PMC * type_tuple;
    STRING * short_sig;
    PMC * arg_flags;
    PMC * return_flags;
    Hash * hash;
    PMC * continuation;
} Parrot_CallContext_attributes;
# 26 "./include/parrot/context.h" 2

typedef struct Parrot_CallContext_attributes Parrot_Context;
# 69 "./include/parrot/context.h"
__attribute__ ((visibility("default")))
UINTVAL Parrot_pcc_dec_recursion_depth_func(Parrot_Interp interp, PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_errors_off_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_errors_on_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_pcc_errors_test_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_caller_ctx_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
Parrot_Context* Parrot_pcc_get_context_struct_func(Parrot_Interp interp,
    PMC *ctx);

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_continuation_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_handlers_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
INTVAL Parrot_pcc_get_HLL_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_lex_pad_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_namespace_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

FLOATVAL Parrot_pcc_get_num_constant_func(Parrot_Interp interp,
    const PMC *ctx,
    INTVAL idx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
FLOATVAL * Parrot_pcc_get_num_constants_func(Parrot_Interp interp,
    const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_outer_ctx_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

opcode_t* Parrot_pcc_get_pc_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_pmc_constant_func(Parrot_Interp interp,
    const PMC *ctx,
    INTVAL idx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
PMC ** Parrot_pcc_get_pmc_constants_func(Parrot_Interp interp,
    const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_pcc_get_recursion_depth_func(Parrot_Interp interp,
    const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_signature_func(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
STRING ** Parrot_pcc_get_str_constants_func(Parrot_Interp interp,
    const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

STRING* Parrot_pcc_get_string_constant_func(Parrot_Interp interp,
    const PMC *ctx,
    INTVAL idx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
UINTVAL Parrot_pcc_inc_recursion_depth_func(Parrot_Interp interp, PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_caller_ctx_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *caller_ctx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

void Parrot_pcc_set_constants_func(Parrot_Interp interp,
    PMC *ctx,
    const struct PackFile_ConstTable *ct)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_continuation_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *_continuation)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_handlers_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *handlers)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_HLL_func(Parrot_Interp interp, PMC *ctx, INTVAL hll)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_lex_pad_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *lex_pad)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_namespace_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *_namespace)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_outer_ctx_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *outer_ctx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_pc_func(Parrot_Interp interp,
    const PMC *ctx,
    opcode_t *pc)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
UINTVAL Parrot_pcc_set_recursion_depth_func(Parrot_Interp interp,
    const PMC *ctx,
    const int new_depth)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_signature_func(Parrot_Interp interp,
    PMC *ctx,
    PMC *sig_object)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_trace_flags_off_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_trace_flags_on_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_pcc_trace_flags_test_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_warnings_off_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
UINTVAL Parrot_pcc_warnings_on_func(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_pcc_warnings_test_func(Parrot_Interp interp,
    const PMC *ctx,
    UINTVAL flags)
        __attribute__((__nonnull__(2)));
# 155 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/parrot.h" 1
# 156 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/warnings.h" 1
# 12 "./include/parrot/warnings.h"
typedef enum {
    PARROT_WARNINGS_ALL_FLAG = 0xFF,
    PARROT_WARNINGS_NONE_FLAG = 0x00,
    PARROT_WARNINGS_UNDEF_FLAG = 0x01,
    PARROT_WARNINGS_IO_FLAG = 0x02,
    PARROT_WARNINGS_PLATFORM_FLAG = 0x04,
    PARROT_WARNINGS_DYNEXT_FLAG = 0x08,
    PARROT_WARNINGS_DEPRECATED_FLAG = 0x10,
    PARROT_WARNINGS_EXPERIMENTAL_FLAG = 0x20
} Warnings_classes;


typedef Warnings_classes Parrot_warnclass;





typedef enum {
    PARROT_ERRORS_NONE_FLAG = 0x00,
    PARROT_ERRORS_OVERFLOW_FLAG = 0x02,
    PARROT_ERRORS_PARAM_COUNT_FLAG = 0x04,
    PARROT_ERRORS_RESULT_COUNT_FLAG = 0x08,
    PARROT_ERRORS_ALL_FLAG = 0xFF
} Errors_classes;
# 55 "./include/parrot/warnings.h"
__attribute__ ((visibility("default")))

INTVAL
Parrot_warn(Parrot_Interp interp,
    INTVAL warnclass,
    const char *message,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_warn_deprecated(Parrot_Interp interp, const char *message)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_warn_experimental(Parrot_Interp interp, const char *message)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void print_pbc_location(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 157 "./include/parrot/interpreter.h" 2

# 1 "./include/parrot/op.h" 1
# 18 "./include/parrot/op.h"
typedef enum {
    PARROT_INLINE_OP,
    PARROT_FUNCTION_OP
} op_type_t;

typedef enum {
    PARROT_ARG_IC = PARROT_ARG_INTVAL | PARROT_ARG_CONSTANT,
    PARROT_ARG_NC = PARROT_ARG_FLOATVAL | PARROT_ARG_CONSTANT,
    PARROT_ARG_PC = PARROT_ARG_PMC | PARROT_ARG_CONSTANT,
    PARROT_ARG_SC = PARROT_ARG_STRING | PARROT_ARG_CONSTANT,
    PARROT_ARG_NAME_SC = PARROT_ARG_NAME | PARROT_ARG_STRING | PARROT_ARG_CONSTANT,

    PARROT_ARG_KEYED = 0x20,
    PARROT_ARG_KC = PARROT_ARG_PC | PARROT_ARG_KEYED,
    PARROT_ARG_KIC = PARROT_ARG_IC | PARROT_ARG_KEYED,

    PARROT_ARG_I = PARROT_ARG_INTVAL,
    PARROT_ARG_N = PARROT_ARG_FLOATVAL,
    PARROT_ARG_P = PARROT_ARG_PMC,
    PARROT_ARG_S = PARROT_ARG_STRING,
    PARROT_ARG_K = PARROT_ARG_P | PARROT_ARG_KEYED,
    PARROT_ARG_KI = PARROT_ARG_I | PARROT_ARG_KEYED
} arg_type_t;

typedef enum {
    PARROT_ARGDIR_IGNORED,

    PARROT_ARGDIR_IN,
    PARROT_ARGDIR_OUT,
    PARROT_ARGDIR_INOUT
} arg_dir_t;


typedef enum {
    PARROT_JUMP_RELATIVE = 1
} op_jump_t;



typedef opcode_t *(*op_func_t)(opcode_t *, Parrot_Interp interp);
# 67 "./include/parrot/op.h"
typedef struct op_info_t {
    const char *name;
    const char *full_name;
    const char *func_name;
    unsigned short jump;
    short op_count;
    arg_type_t types[16];
    arg_dir_t dirs[16];
    char labels[16];
    struct op_lib_t *lib;
} op_info_t;
# 159 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/oplib.h" 1
# 22 "./include/parrot/oplib.h"
typedef struct op_lib_t {
    const char *name;
    const char *suffix;
    int core_type;
    int flags;
    int bc_major_version;
    int bc_minor_version;
    opcode_t op_count;
    op_info_t *op_info_table;
    op_func_t *op_func_table;
    int (*_op_code)(Parrot_Interp interp, const char * name, int full);
} op_lib_t;

typedef enum {
    OP_FUNC_IS_ALLOCATED = 0x01,
    OP_INFO_IS_ALLOCATED = 0x02
} op_lib_flags_enum;


typedef op_lib_t *(*oplib_init_f)(Parrot_Interp interp, long init);
# 160 "./include/parrot/interpreter.h" 2

# 1 "./include/parrot/debugger.h" 1
# 19 "./include/parrot/debugger.h"
enum {
    PDB_NO_RUN = 1 << 0,
    PDB_SRC_LOADED = 1 << 1,
    PDB_RUNNING = 1 << 2,
    PDB_STOPPED = 1 << 3,
    PDB_BREAK = 1 << 4,
    PDB_EXIT = 1 << 5,
    PDB_ENTER = 1 << 6,
    PDB_GCDEBUG = 1 << 7,
    PDB_TRACING = 1 << 8,
    PDB_ECHO = 1 << 9
};

enum {
    PDB_cond_int = 1 << 0,
    PDB_cond_num = 1 << 1,
    PDB_cond_str = 1 << 2,
    PDB_cond_pmc = 1 << 3,
    PDB_cond_gt = 1 << 4,
    PDB_cond_ge = 1 << 5,
    PDB_cond_eq = 1 << 6,
    PDB_cond_ne = 1 << 7,
    PDB_cond_le = 1 << 8,
    PDB_cond_lt = 1 << 9,
    PDB_cond_const = 1 << 10,
    PDB_cond_notnull = 1 << 11
};
# 57 "./include/parrot/debugger.h"
typedef struct PDB_condition *PDB_condition_ptr;

typedef struct PDB_condition {
    unsigned short type;
    unsigned char reg;
    unsigned char dummy;
    void *value;
    PDB_condition_ptr next;
} PDB_condition_t;
# 75 "./include/parrot/debugger.h"
typedef struct PDB_label *PDB_label_ptr;

typedef struct PDB_label {
    const opcode_t *opcode;
    long number;
    PDB_label_ptr next;
} PDB_label_t;
# 93 "./include/parrot/debugger.h"
typedef struct PDB_line *PDB_line_ptr;

typedef struct PDB_line {
    opcode_t *opcode;
    ptrdiff_t source_offset;
    unsigned long number;
    PDB_label_t *label;
    PDB_line_ptr next;
} PDB_line_t;
# 115 "./include/parrot/debugger.h"
typedef struct PDB_file *PDB_file_ptr;

typedef struct PDB_file {
    char *sourcefilename;
    char *source;
    size_t size;
    unsigned long list_line;
    PDB_line_t *line;
    PDB_label_t *label;
    PDB_file_ptr next;
} PDB_file_t;
# 138 "./include/parrot/debugger.h"
typedef struct PDB_breakpoint *PDB_breakpoint_ptr;

typedef struct PDB_breakpoint {
    unsigned long id;
    opcode_t *pc;
    unsigned long line;
    long skip;
    PDB_condition_t *condition;
    PDB_breakpoint_ptr prev;
    PDB_breakpoint_ptr next;
} PDB_breakpoint_t;
# 165 "./include/parrot/debugger.h"
typedef struct PDB {
    PDB_file_t *file;
    PDB_breakpoint_t *breakpoint;
    PDB_condition_t *watchpoint;
    unsigned long breakpoint_skip;
    char *cur_command;
    char *last_command;
    opcode_t *cur_opcode;
    int state;
    Interp *debugee;
    Interp *debugger;
    unsigned long tracing;
    FILE *script_file;
    unsigned long script_line;
} PDB_t;





__attribute__ ((visibility("default")))
void Parrot_debugger_break(Parrot_Interp interp, opcode_t * cur_opcode)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_debugger_destroy(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_debugger_init(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_debugger_load(Parrot_Interp interp,
    const STRING *filename)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_debugger_start(Parrot_Interp interp,
    opcode_t * cur_opcode)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void PDB_backtrace(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void PDB_load_source(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void PDB_print(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void PDB_script_file(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))

STRING * Parrot_dbg_get_exception_backtrace(Parrot_Interp interp,
    PMC * exception)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

long PDB_add_label(Parrot_Interp interp,
    PDB_file_t *file,
    const opcode_t *cur_opcode,
    opcode_t offset)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void PDB_assign(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
char PDB_break(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__((__warn_unused_result__))
char PDB_check_condition(Parrot_Interp interp,
    const PDB_condition_t *condition)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


PDB_condition_t * PDB_cond(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_continue(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));

void PDB_delete_breakpoint(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_delete_condition(Parrot_Interp interp,
    PDB_breakpoint_t *breakpoint)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void PDB_disable_breakpoint(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_disassemble(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));

size_t PDB_disassemble_op(Parrot_Interp interp,
    char *dest,
    size_t space,
    const op_info_t *info,
    const opcode_t *op,
    PDB_file_t *file,
    const opcode_t *code_start,
    int full_name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
       
        ;

void PDB_enable_breakpoint(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
char * PDB_escape(Parrot_Interp interp, const char *string, UINTVAL length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_eval(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));


__attribute__((__warn_unused_result__))
PDB_breakpoint_t * PDB_find_breakpoint(Parrot_Interp interp,
    const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_free_file(Parrot_Interp interp, PDB_file_t *file)
        __attribute__((__nonnull__(1)));

void PDB_get_command(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
char PDB_hasinstruction(const char *c)
        __attribute__((__nonnull__(1)));

void PDB_help(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_info(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void PDB_init(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));

void PDB_list(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_next(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));

char PDB_program_end(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


int
PDB_run_command(Parrot_Interp interp,
    const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PDB_set_break(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));

void PDB_skip_breakpoint(Parrot_Interp interp, unsigned long i)
        __attribute__((__nonnull__(1)));

void PDB_trace(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)));

int PDB_unescape(char *string)
        __attribute__((__nonnull__(1)))
        ;

void PDB_watchpoint(Parrot_Interp interp, const char *command)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 162 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/multidispatch.h" 1
# 22 "./include/parrot/multidispatch.h"
typedef PMC* (*mmd_f_p_ppp)(Parrot_Interp interp, PMC *, PMC *, PMC *);
typedef PMC* (*mmd_f_p_pip)(Parrot_Interp interp, PMC *, INTVAL, PMC *);
typedef PMC* (*mmd_f_p_pnp)(Parrot_Interp interp, PMC *, FLOATVAL, PMC *);
typedef PMC* (*mmd_f_p_psp)(Parrot_Interp interp, PMC *, STRING *, PMC *);

typedef void (*mmd_f_v_pp)(Parrot_Interp interp, PMC *, PMC *);
typedef void (*mmd_f_v_pi)(Parrot_Interp interp, PMC *, INTVAL);
typedef void (*mmd_f_v_pn)(Parrot_Interp interp, PMC *, FLOATVAL);
typedef void (*mmd_f_v_ps)(Parrot_Interp interp, PMC *, STRING *);

typedef INTVAL (*mmd_f_i_pp)(Parrot_Interp interp, PMC *, PMC *);

typedef struct _MMD_init {
    INTVAL func_nr;
    INTVAL left, right;
    funcptr_t func_ptr;
} MMD_init;

typedef struct _MMD_table {
    funcptr_t *mmd_funcs;
    UINTVAL x;
    UINTVAL y;
} MMD_table;

typedef struct _multi_func_list {



    STRING *multi_name;
    STRING *short_sig;
    STRING *full_sig;
    STRING *ns_name;
    funcptr_t func_ptr;
} multi_func_list;






__attribute__ ((visibility("default")))
void Parrot_mmd_add_multi_from_c_args(Parrot_Interp interp,
    const char *sub_name,
    const char *short_sig,
    const char *long_sig,
    funcptr_t multi_func_ptr)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)));

__attribute__ ((visibility("default")))
void Parrot_mmd_add_multi_from_long_sig(Parrot_Interp interp,
    STRING *sub_name,
    STRING *long_sig,
    PMC *sub_obj)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))
void Parrot_mmd_add_multi_list_from_c_args(Parrot_Interp interp,
    const multi_func_list *mmd_info,
    INTVAL elements)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC* Parrot_mmd_build_type_tuple_from_sig_obj(Parrot_Interp interp,
    PMC *sig_obj)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

PMC * Parrot_mmd_cache_create(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_mmd_cache_lookup_by_types(Parrot_Interp interp,
    PMC *cache,
    const char *name,
    PMC *types)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_mmd_cache_lookup_by_values(Parrot_Interp interp,
    PMC *cache,
    const char *name,
    PMC *values)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
void Parrot_mmd_cache_mark(Parrot_Interp interp, PMC *cache)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_mmd_cache_store_by_types(Parrot_Interp interp,
    PMC *cache,
    const char *name,
    PMC *types,
    PMC *chosen)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
        ;

__attribute__ ((visibility("default")))
void Parrot_mmd_cache_store_by_values(Parrot_Interp interp,
    PMC *cache,
    const char *name,
    PMC *values,
    PMC *chosen)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
        ;

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_mmd_find_multi_from_long_sig(Parrot_Interp interp,
    STRING *name,
    STRING *long_sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_mmd_find_multi_from_sig_obj(Parrot_Interp interp,
    STRING *name,
    PMC *invoke_sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

void Parrot_mmd_multi_dispatch_from_c_args(Parrot_Interp interp,
    const char *name,
    const char *sig,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_mmd_sort_manhattan_by_sig_pmc(Parrot_Interp interp,
    PMC *candidates,
    PMC *invoke_sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));
# 163 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/call.h" 1
# 25 "./include/parrot/call.h"
typedef struct parrot_runloop_t {
    struct parrot_runloop_t *prev;

    opcode_t *handler_start;
    int id;
    PMC *exception;


    Parrot_jump_buff resume;
} parrot_runloop_t;

typedef parrot_runloop_t Parrot_runloop;

typedef enum {
    CALLSIGNATURE_is_exception_FLAG = PObj_private0_FLAG
} callsignature_flags_enum;
# 58 "./include/parrot/call.h"
__attribute__ ((visibility("default")))
INTVAL Parrot_pcc_do_run_ops(Parrot_Interp interp, PMC *sub_obj)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_invoke_from_sig_object(Parrot_Interp interp,
    PMC *sub_obj,
    PMC *call_object)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_invoke_method_from_c_args(Parrot_Interp interp,
    PMC* pmc,
    STRING *method_name,
    const char *signature,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pcc_invoke_sub_from_c_args(Parrot_Interp interp,
    PMC *sub_obj,
    const char *sig,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_pcc_new_call_object(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 125 "./include/parrot/call.h"
__attribute__ ((visibility("default")))
void free_runloop_jump_point(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void new_runloop_jump_point(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void destroy_runloop_jump_points(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void reset_runloop_id_counter(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void runops(Parrot_Interp interp, size_t offs)
        __attribute__((__nonnull__(1)));
# 158 "./include/parrot/call.h"
__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_pcc_build_call_from_c_args(Parrot_Interp interp,
    PMC *signature,
    const char *sig,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_pcc_build_call_from_varargs(Parrot_Interp interp,
    PMC *signature,
    const char *sig,
    va_list *args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_pcc_build_sig_object_from_op(Parrot_Interp interp,
    PMC *signature,
    PMC *raw_sig,
    opcode_t *raw_args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_pcc_build_sig_object_from_varargs(Parrot_Interp interp,
    PMC *obj,
    const char *sig,
    va_list args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_fill_params_from_c_args(Parrot_Interp interp,
    PMC *call_object,
    const char *signature,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pcc_fill_params_from_op(Parrot_Interp interp,
    PMC *call_object,
    PMC *raw_sig,
    opcode_t *raw_params,
    Errors_classes direction)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pcc_fill_params_from_varargs(Parrot_Interp interp,
    PMC *call_object,
    const char *signature,
    va_list *args,
    Errors_classes direction)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

__attribute__ ((visibility("default")))
void Parrot_pcc_set_call_from_c_args(Parrot_Interp interp,
    PMC *signature,
    const char *sig,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_call_from_varargs(Parrot_Interp interp,
    PMC *signature,
    const char *sig,
    va_list *args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

void Parrot_pcc_merge_signature_for_tailcall(Parrot_Interp interp,
    PMC *parent,
    PMC *tailcall)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;


void Parrot_pcc_parse_signature_string(Parrot_Interp interp,
    STRING *signature,
    PMC **arg_flags,
    PMC **return_flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

void Parrot_pcc_split_signature_string(
    const char *signature,
    const char **arg_sig,
    const char **return_sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;
# 370 "./include/parrot/call.h"
__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

FLOATVAL * Parrot_pcc_get_FLOATVAL_reg(Parrot_Interp interp,
    const PMC *ctx,
    UINTVAL idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

INTVAL * Parrot_pcc_get_INTVAL_reg(Parrot_Interp interp,
    const PMC *ctx,
    UINTVAL idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC ** Parrot_pcc_get_PMC_reg(Parrot_Interp interp, PMC *ctx, UINTVAL idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

Regs_ni* Parrot_pcc_get_regs_ni(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

Regs_ps* Parrot_pcc_get_regs_ps(Parrot_Interp interp, PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_pcc_get_regs_used(Parrot_Interp interp,
    const PMC *ctx,
    int type)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

STRING ** Parrot_pcc_get_STRING_reg(Parrot_Interp interp,
    PMC *ctx,
    UINTVAL idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC* Parrot_pcc_get_sub(Parrot_Interp interp, const PMC *ctx)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_reuse_continuation(Parrot_Interp interp,
    PMC *call_context,
    opcode_t *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_context_func(Parrot_Interp interp, PMC *ctx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

void Parrot_pcc_set_regs_ni(Parrot_Interp interp,
    PMC *ctx,
    Regs_ni *bp)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

void Parrot_pcc_set_regs_ps(Parrot_Interp interp,
    PMC *ctx,
    Regs_ps *bp_ps)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pcc_set_sub(Parrot_Interp interp,
    PMC *ctx,
    PMC *sub)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pop_context(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_push_context(Parrot_Interp interp, const UINTVAL *n_regs_used)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void create_initial_context(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


__attribute__((__warn_unused_result__))
PMC * Parrot_alloc_context(Parrot_Interp interp,
    const UINTVAL *number_regs_used,
    PMC *old)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
PMC * Parrot_pcc_allocate_empty_context(Parrot_Interp interp,
    PMC *old)
        __attribute__((__nonnull__(1)));

void Parrot_pcc_allocate_registers(Parrot_Interp interp,
    PMC *pmcctx,
    const UINTVAL *number_regs_used)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

void Parrot_pcc_free_registers(Parrot_Interp interp, PMC *pmcctx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


PMC * Parrot_pcc_init_context(Parrot_Interp interp,
    PMC *ctx,
    PMC *old)
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))

PMC * Parrot_pcc_unproxy_context(Parrot_Interp interp, PMC * proxy)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
PMC * Parrot_set_new_context(Parrot_Interp interp,
    const UINTVAL *number_regs_used)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 164 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/gc_api.h" 1
# 37 "./include/parrot/gc_api.h"
typedef struct _Parrot_GC_Init_Args {
    void *stacktop;
    const char *system;
    Parrot_Float4 nursery_size;
    Parrot_Int dynamic_threshold;
    Parrot_Int min_threshold;
    Parrot_UInt numthreads;
} Parrot_GC_Init_Args;

typedef enum _gc_sys_type_enum {
    MS,
    INF,
    MS2,
    GMS
} gc_sys_type_enum;


typedef enum {
    POOL_PMC = 0x01,
    POOL_BUFFER = 0x02,
    POOL_CONST = 0x04,
    POOL_ALL = 0x07
} pool_iter_enum;

struct Memory_Block;
struct Var_Size_Pool;
struct Fixed_Size_Pool;
struct Fixed_Size_Arena;
struct Memory_Pools;

typedef enum {
    GC_TRACE_FULL = 1,
    GC_TRACE_ROOT_ONLY = 2,
    GC_TRACE_SYSTEM_ONLY = 3
} Parrot_gc_trace_type;

typedef int (*pool_iter_fn)(Parrot_Interp interp, struct Memory_Pools *,
                struct Fixed_Size_Pool *, int, void*);
typedef void (*add_free_object_fn_type)(Parrot_Interp interp, struct Memory_Pools *,
                struct Fixed_Size_Pool *, void *);
typedef void * (*get_free_object_fn_type)(Parrot_Interp interp, struct Memory_Pools *,
                struct Fixed_Size_Pool *);
typedef void (*alloc_objects_fn_type)(Parrot_Interp interp, struct Memory_Pools *,
                struct Fixed_Size_Pool *);
typedef void (*gc_object_fn_type)(Parrot_Interp interp, struct Memory_Pools *,
                struct Fixed_Size_Pool *, PObj *);



typedef enum {
    TOTAL_MEM_ALLOC = 1,
    TOTAL_MEM_USED,
    GC_MARK_RUNS,
    GC_COLLECT_RUNS,
    ACTIVE_PMCS,
    ACTIVE_BUFFERS,
    TOTAL_PMCS,
    TOTAL_BUFFERS,
    HEADER_ALLOCS_SINCE_COLLECT,
    MEM_ALLOCS_SINCE_COLLECT,
    TOTAL_COPIED,
    IMPATIENT_PMCS,
    GC_LAZY_MARK_RUNS,
    EXTENDED_PMCS,
    CURRENT_RUNCORE,
    PARROT_INTSIZE,
    PARROT_FLOATSIZE,
    PARROT_POINTERSIZE,
    PARROT_INTMAX,
    PARROT_INTMIN,


    CURRENT_CTX,
    CURRENT_SUB,
    CURRENT_CONT,
    CURRENT_LEXPAD,
    CURRENT_TASK,


    EXECUTABLE_FULLNAME,
    EXECUTABLE_BASENAME,
    RUNTIME_PREFIX,
    GC_SYS_NAME,
    PARROT_OS,
    PARROT_OS_VERSION,
    PARROT_OS_VERSION_NUMBER,
    CPU_ARCH,
    CPU_TYPE
} Interpinfo_enum;
# 141 "./include/parrot/gc_api.h"
__attribute__ ((visibility("default")))
void Parrot_block_GC_mark(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_block_GC_mark_locked(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_block_GC_sweep(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
int Parrot_gc_active_pmcs(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
int Parrot_gc_active_sized_buffers(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_allocate_buffer_storage_aligned(Parrot_Interp interp,
    Parrot_Buffer *buffer,
    size_t size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

void * Parrot_gc_allocate_fixed_size_storage(Parrot_Interp interp, size_t size)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

void * Parrot_gc_allocate_memory_chunk(Parrot_Interp interp, size_t size)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

void * Parrot_gc_allocate_memory_chunk_with_interior_pointers(Parrot_Interp interp,
    size_t size)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

void * Parrot_gc_allocate_pmc_attributes(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_allocate_string_storage(Parrot_Interp interp,
    STRING *str,
    size_t size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_compact_memory_pool(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_completely_unblock(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
size_t Parrot_gc_count_collect_runs(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
size_t Parrot_gc_count_lazy_mark_runs(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
size_t Parrot_gc_count_mark_runs(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_destroy_child_interp(
    Interp *dest_interp,
    Interp *source_interp)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_finalize(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_free_bufferlike_header(Parrot_Interp interp,
    Parrot_Buffer *obj,
    size_t size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_free_fixed_size_storage(Parrot_Interp interp,
    size_t size,
    void *data)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

void Parrot_gc_free_memory_chunk(Parrot_Interp interp, void *data)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_free_pmc_attributes(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_free_pmc_header(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_free_string_header(Parrot_Interp interp, STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
size_t Parrot_gc_headers_alloc_since_last_collect(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
UINTVAL Parrot_gc_impatient_pmcs(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_initialize(Parrot_Interp interp, Parrot_GC_Init_Args *args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_gc_mark_and_sweep(Parrot_Interp interp, UINTVAL flags)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_mark_PMC_alive_fun(Parrot_Interp interp, PMC *obj)
        __attribute__((__nonnull__(1)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_mark_PObj_alive(Parrot_Interp interp, PObj *obj)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_mark_STRING_alive_fun(Parrot_Interp interp,
    STRING *obj)
        __attribute__((__nonnull__(1)))
        ;

__attribute__ ((visibility("default")))
size_t Parrot_gc_mem_alloc_since_last_collect(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
Parrot_Buffer * Parrot_gc_new_bufferlike_header(Parrot_Interp interp, size_t size)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_gc_new_pmc_header(Parrot_Interp interp, UINTVAL flags)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_gc_new_string_header(Parrot_Interp interp, UINTVAL flags)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_pmc_needs_early_collection(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_gc_reallocate_buffer_storage(Parrot_Interp interp,
    Parrot_Buffer *buffer,
    size_t newsize)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

void * Parrot_gc_reallocate_memory_chunk(Parrot_Interp interp,
    void *data,
    size_t newsize)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

void * Parrot_gc_reallocate_memory_chunk_with_interior_pointers(Parrot_Interp interp,
    void *data,
    size_t newsize,
    size_t oldsize)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_reallocate_string_storage(Parrot_Interp interp,
    STRING *str,
    size_t newsize)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

STRING * Parrot_gc_sys_name(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
UINTVAL Parrot_gc_total_copied(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
size_t Parrot_gc_total_memory_allocated(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
size_t Parrot_gc_total_memory_used(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
int Parrot_gc_total_pmcs(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
int Parrot_gc_total_sized_buffers(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_gc_write_barrier(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
unsigned int Parrot_is_blocked_GC_mark(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
unsigned int Parrot_is_blocked_GC_sweep(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_unblock_GC_mark(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_unblock_GC_mark_locked(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_unblock_GC_sweep(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 165 "./include/parrot/interpreter.h" 2
# 1 "./include/parrot/thread.h" 1
# 20 "./include/parrot/thread.h"
# 1 "./include/parrot/thr_pthread.h" 1
# 17 "./include/parrot/thr_pthread.h"
# 1 "/usr/include/pthread.h" 1 3 4
# 23 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 28 "/usr/include/sched.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 29 "/usr/include/sched.h" 2 3 4
# 41 "/usr/include/sched.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/sched.h" 1 3 4
# 72 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
struct sched_param
  {
    int __sched_priority;
  };





extern int clone (int (*__fn) (void *__arg), void *__child_stack,
    int __flags, void *__arg, ...) __attribute__ ((__nothrow__ , __leaf__));


extern int unshare (int __flags) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getcpu (void) __attribute__ ((__nothrow__ , __leaf__));


extern int setns (int __fd, int __nstype) __attribute__ ((__nothrow__ , __leaf__));











struct __sched_param
  {
    int __sched_priority;
  };
# 118 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 201 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4


extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
  __attribute__ ((__nothrow__ , __leaf__));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ , __leaf__));


# 42 "/usr/include/sched.h" 2 3 4







extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_yield (void) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ , __leaf__));
# 116 "/usr/include/sched.h" 3 4
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
         const cpu_set_t *__cpuset) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
         cpu_set_t *__cpuset) __attribute__ ((__nothrow__ , __leaf__));



# 24 "/usr/include/pthread.h" 2 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/pthread.h" 2 3 4



enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL



  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 125 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 166 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 201 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 239 "/usr/include/pthread.h" 3 4





extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);




extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) __attribute__ ((__nothrow__ , __leaf__));







extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
     const struct timespec *__abstime);






extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ , __leaf__));



extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
     size_t __cpusetsize,
     const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_attr_getaffinity_np (const pthread_attr_t *__attr,
     size_t __cpusetsize,
     cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));


extern int pthread_getattr_default_np (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_setattr_default_np (const pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));







extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));




extern int pthread_getname_np (pthread_t __target_thread, char *__buf,
          size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int pthread_setname_np (pthread_t __target_thread, const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern int pthread_getconcurrency (void) __attribute__ ((__nothrow__ , __leaf__));


extern int pthread_setconcurrency (int __level) __attribute__ ((__nothrow__ , __leaf__));







extern int pthread_yield (void) __attribute__ ((__nothrow__ , __leaf__));




extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
       const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));


extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
       cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
# 505 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 517 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 551 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};
# 691 "/usr/include/pthread.h" 3 4
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
     ;
# 703 "/usr/include/pthread.h" 3 4
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
  ;
# 726 "/usr/include/pthread.h" 3 4
extern void __pthread_register_cancel_defer (__pthread_unwind_buf_t *__buf)
     ;
# 739 "/usr/include/pthread.h" 3 4
extern void __pthread_unregister_cancel_restore (__pthread_unwind_buf_t *__buf)
  ;



extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;



struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __attribute__ ((__nothrow__));





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 817 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int pthread_mutexattr_getrobust_np (const pthread_mutexattr_t *__attr,
        int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
        int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 899 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 1011 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 1055 "/usr/include/pthread.h" 3 4
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 1122 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 1156 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) __attribute__ ((__nothrow__ , __leaf__));
# 1170 "/usr/include/pthread.h" 3 4

# 18 "./include/parrot/thr_pthread.h" 2
# 64 "./include/parrot/thr_pthread.h"
typedef pthread_mutex_t Parrot_mutex;
typedef pthread_cond_t Parrot_cond;
typedef pthread_t Parrot_thread;

typedef void (*Cleanup_Handler)(void *);
# 21 "./include/parrot/thread.h" 2





# 1 "./include/parrot/atomic.h" 1
# 25 "./include/parrot/atomic.h"
# 1 "./include/parrot/atomic/fallback.h" 1
# 15 "./include/parrot/atomic/fallback.h"
typedef struct Parrot_atomic_pointer {
    void *val;
    Parrot_mutex lock;
} Parrot_atomic_pointer;

typedef struct Parrot_atomic_integer {
    INTVAL val;
    Parrot_mutex lock;
} Parrot_atomic_integer;
# 26 "./include/parrot/atomic.h" 2
# 27 "./include/parrot/thread.h" 2







typedef enum {
    THREAD_STATE_JOINABLE,
    THREAD_STATE_DETACHED = 0x01,
    THREAD_STATE_JOINED = 0x02,
    THREAD_STATE_FINISHED = 0x04,
    THREAD_STATE_NOT_STARTED = 0x08,
    THREAD_STATE_SUSPENDED_GC = 0x10,
    THREAD_STATE_GC_WAKEUP = 0x20,



    THREAD_STATE_SUSPEND_GC_REQUESTED = 0x40

} thread_state_enum;





typedef struct _Thread_data {
    Parrot_thread thread;
    INTVAL state;
    UINTVAL tid;
    Parrot_Interp main_interp;






    Parrot_mutex interp_lock;




    Parrot_cond interp_cond;
} Thread_data;
# 93 "./include/parrot/thread.h"
extern Parrot_mutex interpreter_array_mutex;
extern Interp ** interpreter_array;
extern size_t n_interpreters;

typedef enum {
    THREAD_GC_STAGE_NONE,
    THREAD_GC_STAGE_MARK,
    THREAD_GC_STAGE_SWEEP = THREAD_GC_STAGE_NONE
} thread_gc_stage_enum;

typedef struct _Shared_gc_info {
    thread_gc_stage_enum gc_stage;
    Parrot_cond gc_cond;
    int num_reached;

    Parrot_atomic_integer gc_block_level;
} Shared_gc_info;


extern Shared_gc_info *shared_gc_info;




void Parrot_clone_code(Parrot_Interp d, Parrot_Interp s);
int Parrot_get_num_threads(Parrot_Interp interp);
int Parrot_set_num_threads(Parrot_Interp interp, INTVAL number_of_threads);

PMC * Parrot_thread_create(Parrot_Interp interp, INTVAL type, INTVAL clone_flags)
        __attribute__((__nonnull__(1)));


PMC* Parrot_thread_create_local_sub(Parrot_Interp interp,
    Parrot_Interp const thread,
    PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


PMC* Parrot_thread_create_local_task(Parrot_Interp interp,
    Parrot_Interp const thread_interp,
    PMC *task)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


PMC* Parrot_thread_create_proxy(Parrot_Interp interp,
    Parrot_Interp const thread,
    PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

int Parrot_thread_get_free_threads_array_index(Parrot_Interp interp);

Interp** Parrot_thread_get_threads_array(Parrot_Interp interp);

void Parrot_thread_init_threads_array(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_thread_insert_thread(Parrot_Interp interp,
    Interp* thread,
    int index)
        __attribute__((__nonnull__(2)));


PMC * Parrot_thread_make_local_copy(Parrot_Interp interp,
    Parrot_Interp from,
    PMC *arg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

void Parrot_thread_notify_thread(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_thread_notify_threads(Parrot_Interp interp);
int Parrot_thread_run(Parrot_Interp interp,
    PMC *thread_interp_pmc,
    PMC *sub,
    PMC *arg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void Parrot_thread_schedule_task(Parrot_Interp interp,
    Interp *thread_interp,
    PMC *task)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


PMC * Parrot_thread_transfer_sub(
    Parrot_Interp destination,
    Parrot_Interp source,
    PMC *sub)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void Parrot_thread_wait_for_notification(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 166 "./include/parrot/interpreter.h" 2

typedef struct warnings_t {
    Warnings_classes classes;
} *Warnings;

struct _Caches;
# 184 "./include/parrot/interpreter.h"
struct _handler_node_t;


struct parrot_interp_t {
    PMC *ctx;

    struct GC_Subsystem *gc_sys;


    PMC *gc_registry;

    PMC *class_hash;
    VTABLE **vtables;
    int n_vtable_max;
    int n_vtable_alloced;

    struct _ParrotIOData *piodata;

    op_func_t *evc_func_table;
    size_t evc_func_table_size;

    int n_libs;
    op_lib_t **all_op_libs;

    INTVAL flags;



    UINTVAL debug_flags;

    struct runcore_t *run_core;
    struct runcore_t **cores;
    UINTVAL num_cores;

    INTVAL resume_flag;
    size_t resume_offset;

    PackFile_ByteCode *code;

    Hash *op_hash;

    PDB_t *pdb;

    void *lo_var_ptr;


    Interp *parent_interpreter;


    INTVAL world_inited;

    UINTVAL hash_seed;

    PMC *iglobals;
# 250 "./include/parrot/interpreter.h"
    PMC *HLL_info;
    PMC *HLL_namespace;
    PMC *HLL_entries;

    PMC *root_namespace;
    PMC *scheduler;
    PMC *cur_task;

    PMC *op_mmd_cache;

    struct _Caches * caches;

    STRING **const_cstring_table;
    Hash *const_cstring_hash;

    struct _handler_node_t *exit_handler_list;
    int sleeping;

    struct parrot_runloop_t *current_runloop;
    struct parrot_runloop_t *runloop_jmp_free_list;

    int current_runloop_level;
    int current_runloop_id;
    int runloop_id_counter;

    UINTVAL last_alarm;
    FLOATVAL quantum_done;

    struct _Thread_data *thread_data;
    int wake_up;
    Parrot_cond sleep_cond;
    Parrot_mutex sleep_mutex;

    UINTVAL recursion_limit;



    PMC *current_cont;
    Parrot_jump_buff *api_jmp_buf;
    PMC * final_exception;
    INTVAL exit_code;
};





typedef enum {
    RESUME_NONE = 0x00,
    RESUME_RESTART = 0x01,
    RESUME_INITIAL = 0x04
} resume_flag_enum;


typedef enum {
    IGLOBALS_CLASSNAME_HASH,
    IGLOBALS_COMPREG_HASH,
    IGLOBALS_ARGV_LIST,
    IGLOBALS_NCI_FUNCS,
    IGLOBALS_NCI_FB_CB,
    IGLOBALS_NCI_FB_UD,
    IGLOBALS_INTERPRETER,
    IGLOBALS_DYN_LIBS,
    IGLOBALS_CONFIG_HASH,
    IGLOBALS_LIB_PATHS,
    IGLOBALS_PBC_LIBS,
    IGLOBALS_EXECUTABLE,
    IGLOBALS_LOADED_PBCS,

    IGLOBALS_SIZE
} iglobals_enum;


extern __attribute__ ((visibility("default"))) STRING *STRINGNULL;


extern __attribute__ ((visibility("default"))) PMC *PMCNULL;
# 350 "./include/parrot/interpreter.h"
typedef opcode_t *(*native_func_t)(Parrot_Interp interp,
                                   opcode_t * cur_opcode,
                                   opcode_t * start_code);

typedef PMC *(*Parrot_compiler_func_t)(Parrot_Interp interp,
                                       const char * program);




__attribute__ ((visibility("default")))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
Parrot_Interp Parrot_interp_allocate_interpreter(
    Interp *parent,
    INTVAL flags);

__attribute__ ((visibility("default")))
void Parrot_interp_clear_debug(Parrot_Interp interp, UINTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_clear_flag(Parrot_Interp interp, INTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_clear_trace(Parrot_Interp interp, UINTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

PMC * Parrot_interp_compile_file(Parrot_Interp interp,
    PMC *compiler,
    STRING *fullname)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
Parrot_PMC Parrot_interp_compile_string(Parrot_Interp interp,
    PMC *compiler,
    STRING *code)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_interp_destroy(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_interp_get_compiler(Parrot_Interp interp, STRING *type)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

Interp * Parrot_interp_get_from_pmc(PMC * interp_pmc)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_interp_info(Parrot_Interp interp, INTVAL what)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_interp_info_p(Parrot_Interp interp, INTVAL what)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING* Parrot_interp_info_s(Parrot_Interp interp, INTVAL what)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_init_stacktop(Parrot_Interp interp, void *stack_top)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

Parrot_Interp Parrot_interp_initialize_interpreter(Parrot_Interp interp,
    Parrot_GC_Init_Args *args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
Parrot_Interp Parrot_interp_make_interpreter(
    Interp *parent,
    INTVAL flags);

__attribute__ ((visibility("default")))
void Parrot_interp_mark_method_writes(Parrot_Interp interp,
    int type,
    const char *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
Parrot_Interp Parrot_interp_new(Parrot_Interp parent);

__attribute__ ((visibility("default")))
void Parrot_interp_register_native_pcc_method_in_ns(Parrot_Interp interp,
    const int type,
    void *func,
    STRING *name,
    STRING *signature)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)));

__attribute__ ((visibility("default")))
void Parrot_interp_register_nci_method(Parrot_Interp interp,
    const int type,
    void *func,
    const char *name,
    const char *proto)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_compiler(Parrot_Interp interp,
    STRING *type,
    PMC *compiler)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_debug(Parrot_Interp interp, UINTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_executable_name(Parrot_Interp interp,
    STRING * const name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_flag(Parrot_Interp interp, INTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_run_core(Parrot_Interp interp, Parrot_Run_core_t core)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_trace(Parrot_Interp interp, UINTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_interp_set_warnings(Parrot_Interp interp, Parrot_warnclass wc)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
Parrot_UInt Parrot_interp_test_debug(Parrot_Interp interp, UINTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
Parrot_Int Parrot_interp_test_flag(Parrot_Interp interp, INTVAL flag)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
Parrot_UInt Parrot_interp_test_trace(Parrot_Interp interp, UINTVAL flag)
        __attribute__((__nonnull__(1)));

void Parrot_interp_clear_emergency_interpreter(void);

Interp* Parrot_interp_get_emergency_interpreter(void);

void Parrot_interp_really_destroy(Parrot_Interp interp, int exit_code, void *arg)
        __attribute__((__nonnull__(1)));
# 631 "./include/parrot/interpreter.h"
__attribute__ ((visibility("default")))
void Parrot_callback_C(
    char *external_data,
    PMC *user_data)
        __attribute__((__nonnull__(1)))
        ;

__attribute__ ((visibility("default")))
void Parrot_callback_D(
    PMC *user_data,
    char *external_data)
        __attribute__((__nonnull__(1)))
       
        ;

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC* Parrot_make_cb(Parrot_Interp interp,
    PMC* sub,
    PMC* user_data,
    STRING *cb_signature)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
void Parrot_run_callback(Parrot_Interp interp,
    PMC* user_data,
    void* external_data)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;
# 686 "./include/parrot/interpreter.h"
PMC * clone_interpreter(Parrot_Interp self, INTVAL flags);
# 12 "./include/parrot/platform_interface.h" 2

# 1 "/usr/include/math.h" 1 3 4
# 28 "/usr/include/math.h" 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/huge_val.h" 1 3 4
# 33 "/usr/include/math.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h" 1 3 4
# 35 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h" 1 3 4
# 36 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/inf.h" 1 3 4
# 39 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/nan.h" 1 3 4
# 42 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 3 4
typedef float float_t;
typedef double double_t;
# 46 "/usr/include/math.h" 2 3 4
# 69 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern void sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__))
                                                           ;





extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));







extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern double exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double pow10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow10 (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));






extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));






extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));








extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));




extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 70 "/usr/include/math.h" 2 3 4
# 88 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern void sincosf (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__))
                                                           ;





extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));







extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern float exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float pow10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __pow10f (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));






extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));






extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));








extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));




extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 89 "/usr/include/math.h" 2 3 4
# 132 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern void sincosl (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosl (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__))
                                                           ;





extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));







extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern long double exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double pow10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __pow10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));








extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));






extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));








extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));








extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));




extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 133 "/usr/include/math.h" 2 3 4
# 148 "/usr/include/math.h" 3 4
extern int signgam;
# 189 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 301 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 326 "/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);
# 488 "/usr/include/math.h" 3 4

# 14 "./include/parrot/platform_interface.h" 2


# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/limits.h" 1 3 4
# 17 "./include/parrot/platform_interface.h" 2
# 54 "./include/parrot/platform_interface.h"
void Parrot_platform_init_code(void);





STRING *Parrot_platform_strerror(Parrot_Interp interp, INTVAL error);
# 72 "./include/parrot/platform_interface.h"
typedef INTVAL PIOHANDLE;
typedef off_t PIOOFF_T;


PIOHANDLE Parrot_io_internal_std_os_handle(Parrot_Interp interp, INTVAL fileno);
PIOHANDLE Parrot_io_internal_open(Parrot_Interp interp, STRING *path, INTVAL flags);
PIOHANDLE Parrot_io_internal_dup(Parrot_Interp interp, PIOHANDLE handle);
INTVAL Parrot_io_internal_close(Parrot_Interp interp, PIOHANDLE handle);
INTVAL Parrot_io_internal_is_tty(Parrot_Interp interp, PIOHANDLE fd);
__attribute__((__const__)) __attribute__((__warn_unused_result__))
INTVAL Parrot_io_internal_getblksize(PIOHANDLE fd);
INTVAL Parrot_io_internal_flush(Parrot_Interp interp, PIOHANDLE os_handle);
size_t Parrot_io_internal_read(Parrot_Interp interp, PIOHANDLE os_handle, char *buf, size_t len);
size_t Parrot_io_internal_write(Parrot_Interp interp, PIOHANDLE os_handle,
        const char *buf, size_t len);
PIOOFF_T Parrot_io_internal_seek(Parrot_Interp interp, PIOHANDLE os_handle,
        PIOOFF_T offset, INTVAL whence);
PIOOFF_T Parrot_io_internal_tell(Parrot_Interp interp, PIOHANDLE os_handle);
PIOHANDLE Parrot_io_internal_open_pipe(Parrot_Interp interp, STRING *command, INTVAL flags,
        INTVAL *pid_out);
INTVAL Parrot_io_internal_pipe(Parrot_Interp interp, PIOHANDLE *reader,
        PIOHANDLE *writer);

__attribute__ ((visibility("default")))
INTVAL Parrot_io_internal_async(Parrot_Interp interp, PMC *pmc, INTVAL async);





PMC *Parrot_io_internal_getaddrinfo(Parrot_Interp interp, STRING *addr, INTVAL port,
        INTVAL protocol, INTVAL family, INTVAL passive);
INTVAL Parrot_io_internal_addr_match(Parrot_Interp interp, PMC *sa, INTVAL family, INTVAL type,
            INTVAL protocol);
STRING *Parrot_io_internal_getnameinfo(Parrot_Interp interp, const void *addr, INTVAL addr_len);
INTVAL Parrot_io_internal_getprotobyname(Parrot_Interp interp, STRING *name);
PIOHANDLE Parrot_io_internal_socket(Parrot_Interp interp, int fam, int type, int proto);
void Parrot_io_internal_connect(Parrot_Interp interp, PIOHANDLE handle, void *addr,
        INTVAL addr_len);
void Parrot_io_internal_bind(Parrot_Interp interp, PIOHANDLE handle, void *addr, INTVAL addr_len);
void Parrot_io_internal_listen(Parrot_Interp interp, PIOHANDLE handle, INTVAL sec);
PIOHANDLE Parrot_io_internal_accept(Parrot_Interp interp, PIOHANDLE handle, PMC * remote_addr);
INTVAL Parrot_io_internal_send(Parrot_Interp interp, PIOHANDLE handle, const char *buf,
        size_t len);
INTVAL Parrot_io_internal_recv(Parrot_Interp interp, PIOHANDLE handle, char *buf, size_t len);
INTVAL Parrot_io_internal_poll(Parrot_Interp interp, PIOHANDLE handle, int which, int sec, int usec);
INTVAL Parrot_io_internal_close_socket(Parrot_Interp interp, PIOHANDLE handle);
# 156 "./include/parrot/platform_interface.h"
typedef struct _Parrot_Stat_Buf {
    INTVAL type;
    HUGEINTVAL size;
    INTVAL uid;
    INTVAL gid;
    INTVAL dev;
    HUGEINTVAL inode;
    INTVAL mode;
    INTVAL n_links;
    INTVAL block_size;
    INTVAL blocks;

    struct timespec create_time;
    struct timespec access_time;
    struct timespec modify_time;
    struct timespec change_time;
} Parrot_Stat_Buf;

__attribute__ ((visibility("default")))
STRING *Parrot_file_getcwd(Parrot_Interp interp);

__attribute__ ((visibility("default")))
void Parrot_file_mkdir(Parrot_Interp interp, STRING *path, INTVAL mode);

__attribute__ ((visibility("default")))
void Parrot_file_chdir(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
void Parrot_file_rmdir(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
void Parrot_file_unlink(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
void Parrot_file_stat(Parrot_Interp interp, STRING *path, Parrot_Stat_Buf *buf);

__attribute__ ((visibility("default")))
void Parrot_file_lstat(Parrot_Interp interp, STRING *path, Parrot_Stat_Buf *buf);

__attribute__ ((visibility("default")))
void Parrot_file_fstat(Parrot_Interp interp, PIOHANDLE handle, Parrot_Stat_Buf *buf);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_stat_intval(Parrot_Interp interp, STRING *path, INTVAL thing);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_lstat_intval(Parrot_Interp interp, STRING * path, INTVAL thing);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_fstat_intval(Parrot_Interp interp, PIOHANDLE os_handle, INTVAL thing);

__attribute__ ((visibility("default")))
void Parrot_file_symlink(Parrot_Interp interp, STRING *from, STRING *to);

__attribute__ ((visibility("default")))
STRING *Parrot_file_readlink(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
void Parrot_file_link(Parrot_Interp interp, STRING *from, STRING *to);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_umask(Parrot_Interp interp, INTVAL mask);

__attribute__ ((visibility("default")))
void Parrot_file_chroot(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
PMC *Parrot_file_readdir(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
void Parrot_file_rename(Parrot_Interp interp, STRING *from, STRING *to);

__attribute__ ((visibility("default")))
void Parrot_file_chmod(Parrot_Interp interp, STRING *path, INTVAL mode);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_can_read(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_can_write(Parrot_Interp interp, STRING *path);

__attribute__ ((visibility("default")))
INTVAL Parrot_file_can_execute(Parrot_Interp interp, STRING *path);





extern int Parrot_signbit(double x);
# 263 "./include/parrot/platform_interface.h"
void *Parrot_memalign(size_t align, size_t size);
void *Parrot_memalign_if_possible(size_t align, size_t size);
void Parrot_free_memalign(void *);
# 277 "./include/parrot/platform_interface.h"
typedef enum Parrot_proc_exec_enum {





    PARROT_EXEC_STDIN = 0x01,
    PARROT_EXEC_STDOUT = 0x02,
    PARROT_EXEC_STDERR = 0x04
} Parrot_proc_exec_flags;

__attribute__ ((visibility("default")))
INTVAL Parrot_Run_OS_Command(Interp*, STRING *);

__attribute__ ((visibility("default")))
INTVAL Parrot_Run_OS_Command_Argv(Interp*, PMC *);

__attribute__ ((visibility("default")))
UINTVAL Parrot_getpid(void);

INTVAL Parrot_proc_exec(Interp *, STRING *command, INTVAL flags, PIOHANDLE *handles);
INTVAL Parrot_proc_waitpid(Interp *, INTVAL pid);





__attribute__ ((visibility("default")))
void Parrot_sleep(unsigned int seconds);

__attribute__ ((visibility("default")))
void Parrot_usleep(unsigned int microseconds);
void Parrot_floatval_sleep(FLOATVAL time);

__attribute__ ((visibility("default")))
INTVAL Parrot_intval_time(void);

__attribute__ ((visibility("default")))
FLOATVAL Parrot_floatval_time(void);

__attribute__ ((visibility("default")))
struct tm * Parrot_gmtime_r(const time_t *, struct tm *);

__attribute__ ((visibility("default")))
struct tm * Parrot_localtime_r(const time_t *, struct tm *);

__attribute__ ((visibility("default")))
char* Parrot_asctime_r(const struct tm*, char *);





__attribute__ ((visibility("default")))
void Parrot_setenv(Parrot_Interp interp, STRING *name, STRING *value);

__attribute__ ((visibility("default")))
void Parrot_unsetenv(Parrot_Interp interp, STRING *name);

__attribute__ ((visibility("default")))
STRING * Parrot_getenv(Parrot_Interp interp, STRING *name);
# 351 "./include/parrot/platform_interface.h"
typedef enum Parrot_dlopen_enum {





    Parrot_dlopen_global_FLAG = 0x01
} Parrot_dlopen_flags;


void *Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags);
const char *Parrot_dlerror(void);
void *Parrot_dlsym(void *handle, const char *symbol);
int Parrot_dlclose(void *handle);




void Parrot_init_platform_encoding(Parrot_Interp interp);
size_t Parrot_str_platform_strlen(Parrot_Interp interp, const char *s);







void * new_sys_timer_ms(void);
void start_sys_timer_ms(void *handle, int ms);
void stop_sys_timer_ms(void *handle);
int get_sys_timer_ms(void *handle);
# 396 "./include/parrot/platform_interface.h"
__attribute__ ((visibility("default")))
UHUGEINTVAL Parrot_hires_get_time(void);

__attribute__ ((visibility("default")))
__attribute__((__const__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_hires_get_tick_duration(void);





__attribute__ ((visibility("default")))
UINTVAL Parrot_get_user_id(void);





__attribute__ ((visibility("default")))
size_t Parrot_sysmem_amount(Interp*);





__attribute__ ((visibility("default")))
INTVAL Parrot_get_entropy(Parrot_Interp interp);




__attribute__ ((visibility("default")))
STRING *Parrot_get_cpu_type(Parrot_Interp interp);

__attribute__ ((visibility("default")))
INTVAL Parrot_get_num_cpus(Parrot_Interp interp);
# 246 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/global_setup.h" 1
# 18 "./include/parrot/global_setup.h"
void Parrot_gbl_register_core_pmcs(Parrot_Interp interp, PMC *registry)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_gbl_initialize_core_pmcs(Parrot_Interp interp, int pass)
        __attribute__((__nonnull__(1)));




void init_world(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_gbl_init_world_once(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_gbl_set_config_hash_internal(
    const unsigned char* parrot_config,
    unsigned int parrot_config_size)
        __attribute__((__nonnull__(1)));

void Parrot_set_config_hash_pmc(Parrot_Interp interp, PMC *config)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 247 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/caches.h" 1
# 22 "./include/parrot/caches.h"
typedef struct _meth_cache_entry {
    void * strstart;
    PMC * pmc;
    struct _meth_cache_entry *next;
} Meth_cache_entry;




typedef struct _Caches {
    UINTVAL mc_size;
    Meth_cache_entry ***idx;

} Caches;
# 248 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/datatypes.h" 1
# 19 "./include/parrot/datatypes.h"
typedef enum {
    enum_type_undef = 0,
    enum_first_type = 1,

    enum_type_INTVAL = 1,
    enum_type_FLOATVAL,
    enum_type_STRING,
    enum_type_PMC,

    enum_type_char,
    enum_type_short,
    enum_type_int,
    enum_type_long,
    enum_type_longlong,

    enum_type_uchar,
    enum_type_ushort,
    enum_type_uint,
    enum_type_ulong,
    enum_type_ulonglong,

    enum_type_float,
    enum_type_double,
    enum_type_longdouble,

    enum_type_int8,
    enum_type_int16,
    enum_type_int32,
    enum_type_int64,

    enum_type_bit,
    enum_type_uint1 = enum_type_bit,
    enum_type_uint4,
    enum_type_uint8,
    enum_type_uint16,
    enum_type_uint32,
    enum_type_uint64,

    enum_type_void,

    enum_type_ptr,
    enum_type_cstr,
    enum_type_struct_ptr,
    enum_type_struct,
    enum_type_union,
    enum_type_func_ptr,

    enum_type_sized,

    enum_last_type,

    enum_type_ref_flag = 0x40
} PARROT_DATA_TYPE;


struct _data_types {
    const char *name;
    size_t size;
    size_t align;
};
# 88 "./include/parrot/datatypes.h"
extern const struct _data_types data_types[];
# 192 "./include/parrot/datatypes.h"
__attribute__ ((visibility("default")))
FLOATVAL Parrot_dt_divide_floatval_by_zero(Parrot_Interp interp, FLOATVAL num);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_dt_get_datatype_enum(Parrot_Interp interp, STRING *type_name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_dt_get_datatype_name(Parrot_Interp interp, INTVAL type)
        __attribute__((__nonnull__(1)));
# 250 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/encoding.h" 1
# 16 "./include/parrot/encoding.h"
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_ascii_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_latin1_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_binary_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_utf8_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_utf16_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_ucs2_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_ucs4_encoding_ptr;

extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_default_encoding_ptr;
extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_platform_encoding_ptr;


extern __attribute__ ((visibility("default"))) STR_VTABLE *Parrot_null_encoding_ptr;





__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))

const STR_VTABLE * Parrot_default_encoding(Parrot_Interp interp);

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))

const char * Parrot_encoding_c_name(Parrot_Interp interp,
    INTVAL number_of_encoding);

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))

STRING* Parrot_encoding_name(Parrot_Interp interp, INTVAL number_of_encoding);

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
INTVAL Parrot_encoding_number(Parrot_Interp interp,
    const STRING *encodingname)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
INTVAL Parrot_encoding_number_of_str(Parrot_Interp interp,
    const STRING *src)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_encodings_init(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))

const STR_VTABLE * Parrot_find_encoding(Parrot_Interp interp,
    const char *encodingname)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))

const STR_VTABLE * Parrot_find_encoding_by_string(Parrot_Interp interp,
    STRING *encodingname)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))

const STR_VTABLE* Parrot_get_encoding(Parrot_Interp interp,
    INTVAL number_of_encoding);

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))

const STR_VTABLE * Parrot_load_encoding(Parrot_Interp interp,
    const char *encodingname)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
INTVAL Parrot_make_default_encoding(Parrot_Interp interp,
    const char *encodingname,
    STR_VTABLE *encoding)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

STR_VTABLE * Parrot_new_encoding(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
INTVAL Parrot_register_encoding(Parrot_Interp interp, STR_VTABLE *encoding)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_deinit_encodings(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_str_internal_register_encoding_names(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 251 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/hash.h" 1
# 10 "./include/parrot/hash.h"
typedef enum {
    enum_hash_undef,
    enum_hash_int = enum_type_INTVAL,
    enum_hash_num = enum_type_FLOATVAL,
    enum_hash_string = enum_type_STRING,
    enum_hash_pmc = enum_type_PMC,
    enum_hash_ptr = enum_type_ptr
} HashEntryType;



typedef UINTVAL BucketIndex;






typedef enum {
    Hash_key_type_int,
    Hash_key_type_cstring,
    Hash_key_type_STRING,
    Hash_key_type_PMC,
    Hash_key_type_ptr,
    Hash_key_type_PMC_ptr,
    Hash_key_type_STRING_enc
} Hash_key_type;


typedef struct _hashbucket {
    struct _hashbucket *next;
    void *key;
    void *value;
} HashBucket;

struct _hash {

    HashBucket *buckets;


    HashBucket **index;


    HashBucket *free_list;


    UINTVAL entries;


    UINTVAL mask;


    Hash_key_type key_type;


    PARROT_DATA_TYPE entry_type;


    size_t seed;

};
# 111 "./include/parrot/hash.h"
typedef void (*value_free)(void *);



enum ORDERED_HASH_ITEM_PART {
    ORDERED_HASH_ITEM_KEY = 0,
    ORDERED_HASH_ITEM_VALUE = 1,
    ORDERED_HASH_ITEM_PREV = 2,
    ORDERED_HASH_ITEM_NEXT = 3,
    ORDERED_HASH_ITEM_MAX = 4
};




__attribute__ ((visibility("default")))
void Parrot_hash_clone(Parrot_Interp interp,
    const Hash *hash,
    Hash *dest)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
Hash * Parrot_hash_create(Parrot_Interp interp,
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_hash_delete(Parrot_Interp interp,
    Hash *hash,
    void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_hash_destroy(Parrot_Interp interp, Hash *hash)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_hash_dump(Parrot_Interp interp, const Hash *hash)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_hash_exists(Parrot_Interp interp,
    const Hash *hash,
    const void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

void * Parrot_hash_get(Parrot_Interp interp,
    const Hash *hash,
    const void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

HashBucket * Parrot_hash_get_bucket(Parrot_Interp interp,
    const Hash *hash,
    const void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_hash_mark(Parrot_Interp interp, Hash *hash)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

Hash* Parrot_hash_new(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

Hash* Parrot_hash_new_cstring_hash(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

Hash* Parrot_hash_new_intval_hash(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

Hash * Parrot_hash_new_pointer_hash(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))


HashBucket* Parrot_hash_put(Parrot_Interp interp,
    Hash *hash,
    void *key,
    void *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
INTVAL Parrot_hash_size(Parrot_Interp interp, const Hash *hash)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_hash_update(Parrot_Interp interp,
    Hash *hash,
    Hash *other)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__((__hot__))
__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
size_t Parrot_hash_buffer(
    const unsigned char *buf,
    size_t len,
    size_t hashval);

void Parrot_hash_chash_destroy(Parrot_Interp interp, Hash *hash)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void Parrot_hash_chash_destroy_values(Parrot_Interp interp,
    Hash *hash,
    value_free func)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void Parrot_hash_clone_prunable(Parrot_Interp interp,
    const Hash *hash,
    Hash *dest,
    int deep)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;


__attribute__((__warn_unused_result__))
Hash * Parrot_hash_create_sized(Parrot_Interp interp,
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type,
    UINTVAL size)
        __attribute__((__nonnull__(1)));

void Parrot_hash_flatten_hash_into(
     Parrot_Interp interp,
    PMC * const dest,
    PMC * const src,
    INTVAL overwrite)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

void Parrot_hash_freeze(Parrot_Interp interp,
    const Hash *hash,
    PMC *info)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;


void* Parrot_hash_key_from_int(Parrot_Interp interp,
    const Hash *hash,
    INTVAL key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


void* Parrot_hash_key_from_pmc(Parrot_Interp interp,
    const Hash *hash,
    PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


void* Parrot_hash_key_from_string(Parrot_Interp interp,
    const Hash *hash,
    STRING *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

INTVAL Parrot_hash_key_to_int(Parrot_Interp interp,
    const Hash *hash,
    void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


PMC* Parrot_hash_key_to_pmc(Parrot_Interp interp,
    const Hash * const hash,
    void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


STRING* Parrot_hash_key_to_string(Parrot_Interp interp,
    const Hash *hash,
    void *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
size_t Parrot_hash_pointer(
    const void * const p,
    size_t hashval);


__attribute__((__warn_unused_result__))
Hash * Parrot_hash_thaw(Parrot_Interp interp, PMC *info)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;


void* Parrot_hash_value_from_int(Parrot_Interp interp,
    const Hash *hash,
    INTVAL value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


void* Parrot_hash_value_from_number(Parrot_Interp interp,
    const Hash *hash,
    FLOATVAL value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


void* Parrot_hash_value_from_pmc(Parrot_Interp interp,
    const Hash *hash,
    PMC *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


void* Parrot_hash_value_from_string(Parrot_Interp interp,
    const Hash *hash,
    STRING *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

INTVAL Parrot_hash_value_to_int(Parrot_Interp interp,
    const Hash *hash,
    void *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

FLOATVAL Parrot_hash_value_to_number(Parrot_Interp interp,
    const Hash *hash,
    void *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


PMC* Parrot_hash_value_to_pmc(Parrot_Interp interp,
    const Hash *hash,
    void *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


STRING* Parrot_hash_value_to_string(Parrot_Interp interp,
    const Hash *hash,
    void *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 253 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/pmc_freeze.h" 1
# 14 "./include/parrot/pmc_freeze.h"
# 1 "./include/parrot/packfile.h" 1
# 65 "./include/parrot/packfile.h"
typedef enum {
    PF_DIR_SEG = 0,
    PF_UNKNOWN_SEG = 1,
    PF_CONST_SEG = 2,
    PF_BYTEC_SEG = 3,
    PF_DEBUG_SEG = 4,
    PF_ANNOTATIONS_SEG = 5,

    PF_MAX_SEG = 6
} pack_file_types;
# 92 "./include/parrot/packfile.h"
typedef struct PackFile_Header {

    unsigned char magic[8];


    unsigned char wordsize;
    unsigned char byteorder;
    unsigned char floattype;


    unsigned char major;
    unsigned char minor;
    unsigned char patch;


    unsigned char bc_major;
    unsigned char bc_minor;


    unsigned char uuid_type;
    unsigned char uuid_size;


    unsigned char *uuid_data;


    opcode_t dir_format;
} PackFile_Header;







typedef struct PackFile_Segment * (*PackFile_Segment_new_func_t)(Parrot_Interp interp);

typedef void (*PackFile_Segment_destroy_func_t)
    (Parrot_Interp interp, struct PackFile_Segment *segp);

typedef size_t (*PackFile_Segment_packed_size_func_t)
    (Parrot_Interp interp, struct PackFile_Segment *segp);

typedef opcode_t * (*PackFile_Segment_pack_func_t)
    (Parrot_Interp interp, struct PackFile_Segment *segp, opcode_t *dest);

typedef const opcode_t * (*PackFile_Segment_unpack_func_t)
    (Parrot_Interp interp, struct PackFile_Segment *segp, const opcode_t *packed);

typedef void (*PackFile_Segment_dump_func_t)
    (Parrot_Interp interp, const struct PackFile_Segment *);

typedef struct PackFile_funcs {
    PackFile_Segment_new_func_t new_seg;
    PackFile_Segment_destroy_func_t destroy;
    PackFile_Segment_packed_size_func_t packed_size;
    PackFile_Segment_pack_func_t pack;
    PackFile_Segment_unpack_func_t unpack;
    PackFile_Segment_dump_func_t dump;
} PackFile_funcs;

typedef struct PackFile_Segment {
    struct PackFile * pf;
    struct PackFile_Directory * dir;


    UINTVAL type;
    STRING *name;
    size_t op_count;
    size_t file_offset;


    opcode_t itype;
    opcode_t id;
    size_t size;
    opcode_t *data;
} PackFile_Segment;

typedef INTVAL (*PackFile_map_segments_func_t)(Parrot_Interp interp,
        PackFile_Segment *seg, void *user_data);

typedef struct PackFile_ConstTagPair {
    opcode_t tag_idx;
    opcode_t const_idx;
} PackFile_ConstTagPair;

typedef struct PackFile_ConstTable {
    PackFile_Segment base;
    struct {
        opcode_t const_count;
        FLOATVAL *constants;
    } num;
    struct {
        opcode_t const_count;
        STRING **constants;
    } str;
    struct {
        opcode_t const_count;
        PMC **constants;
    } pmc;
    PackFile_ByteCode *code;
    Hash *string_hash;
    Hash *pmc_hash;
    PackFile_ConstTagPair *tag_map;
    opcode_t ntags;
} PackFile_ConstTable;

typedef struct PackFile_ByteCode_OpMappingEntry {
    op_lib_t *lib;
    opcode_t n_ops;
    opcode_t *lib_ops;
    opcode_t *table_ops;
} PackFile_ByteCode_OpMappingEntry;

typedef struct PackFile_ByteCode_OpMapping {
    opcode_t n_libs;
    PackFile_ByteCode_OpMappingEntry *libs;
} PackFile_ByteCode_OpMapping;

struct PackFile_ByteCode {
    PackFile_Segment base;
    struct PackFile_Debug *debugs;
    PackFile_ConstTable *const_table;
    INTVAL main_sub;
    struct PackFile_Annotations *annotations;
    PackFile_ByteCode_OpMapping op_mapping;
    size_t op_count;
    op_func_t *op_func_table;
    op_func_t *save_func_table;
    op_info_t **op_info_table;
    size_t n_libdeps;
    STRING **libdeps;
};

typedef struct PackFile_DebugFilenameMapping {
    opcode_t offset;
    opcode_t filename;
} PackFile_DebugFilenameMapping;

typedef struct PackFile_Debug {
    PackFile_Segment base;
    opcode_t num_mappings;
    PackFile_DebugFilenameMapping *mappings;
    PackFile_ByteCode *code;
} PackFile_Debug;







typedef enum {
    PF_ANNOTATION_KEY_TYPE_INT = 1,
    PF_ANNOTATION_KEY_TYPE_STR = 2,
    PF_ANNOTATION_KEY_TYPE_PMC = 3
} pf_ann_key_type_t;



typedef struct PackFile_Annotations_Key {
    UINTVAL name;
    pf_ann_key_type_t type;
    UINTVAL start;
    UINTVAL len;
} PackFile_Annotations_Key;

typedef struct PackFile_Annotations {
    PackFile_Segment base;
    PackFile_ByteCode *code;
    opcode_t num_keys;
    PackFile_Annotations_Key *keys;
} PackFile_Annotations;

typedef struct PackFile_Directory {
    PackFile_Segment base;
    size_t num_segments;
    PackFile_Segment **segments;
} PackFile_Directory;


typedef opcode_t (*packfile_fetch_op_t)(const unsigned char *);
typedef INTVAL (*packfile_fetch_iv_t)(const unsigned char *);
typedef void (*packfile_fetch_nv_t)(unsigned char *, const unsigned char *);

typedef struct PackFile {

    PackFile_Directory directory;
    PackFile_Directory *dirp;
    const opcode_t *src;
    size_t size;
    INTVAL is_mmap_ped;

    PackFile_Header *header;


    PackFile_funcs PackFuncs[PF_MAX_SEG];

    PackFile_ByteCode *cur_cs;

    PMC *view;

    INTVAL options;
    INTVAL need_wordsize;
    INTVAL need_endianize;

    packfile_fetch_op_t fetch_op;
    packfile_fetch_iv_t fetch_iv;
    packfile_fetch_nv_t fetch_nv;
} PackFile;


typedef enum {
    PBC_MAIN = 1,
    PBC_LOADED = 2,
    PBC_IMMEDIATE = 8,
    PBC_POSTCOMP = 16,
    PBC_INIT = 32
} pbc_action_enum_t;





void PackFile_assign_transforms(PackFile *pf)
        __attribute__((__nonnull__(1)))
        ;

__attribute__((__warn_unused_result__))

STRING * PF_fetch_buf(Parrot_Interp interp,
    PackFile *pf,
    const opcode_t **cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

char * PF_fetch_cstring(Parrot_Interp interp,
    PackFile *pf,
    const opcode_t **cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__((__warn_unused_result__))
INTVAL PF_fetch_integer(PackFile *pf, const opcode_t **stream)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
FLOATVAL PF_fetch_number(
    PackFile *pf,
    const opcode_t **stream)
        __attribute__((__nonnull__(2)));


opcode_t PF_fetch_opcode(
    const PackFile *pf,
    const opcode_t **stream)
        __attribute__((__nonnull__(2)))
        ;

__attribute__((__warn_unused_result__))

STRING * PF_fetch_string(Parrot_Interp interp,
    PackFile *pf,
    const opcode_t **cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
size_t PF_size_buf(const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
size_t PF_size_cstring(const char *s)
        __attribute__((__nonnull__(1)));

__attribute__((__const__)) __attribute__((__warn_unused_result__))
size_t PF_size_integer(void);

__attribute__((__const__)) __attribute__((__warn_unused_result__))
size_t PF_size_number(void);

__attribute__((__const__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
size_t PF_size_opcode(void);

__attribute__((__pure__)) __attribute__((__warn_unused_result__))
size_t PF_size_string(const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__((__const__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
size_t PF_size_strlen(const UINTVAL len);

__attribute__((__warn_unused_result__))

opcode_t* PF_store_buf(opcode_t *cursor, const STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__((__warn_unused_result__))

opcode_t* PF_store_cstring(opcode_t *cursor, const char *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__((__warn_unused_result__))

opcode_t* PF_store_integer(opcode_t *cursor, INTVAL val)
        __attribute__((__nonnull__(1)))
        ;

__attribute__((__warn_unused_result__))

opcode_t* PF_store_number(
    opcode_t *cursor,
    const FLOATVAL *val)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__((__warn_unused_result__))

opcode_t* PF_store_opcode(opcode_t *cursor, opcode_t val)
        __attribute__((__nonnull__(1)))
        ;

__attribute__((__warn_unused_result__))

opcode_t* PF_store_string(opcode_t *cursor, const STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;
# 482 "./include/parrot/packfile.h"
__attribute__ ((visibility("default")))
void PackFile_ConstTable_dump(Parrot_Interp interp,
    const PackFile_ConstTable *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 497 "./include/parrot/packfile.h"
__attribute__ ((visibility("default")))
void do_sub_pragmas(Parrot_Interp interp,
    PMC *pfpmc,
    pbc_action_enum_t action,
    PMC *eval_pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void PackFile_add_segment(Parrot_Interp interp,
    PackFile_Directory *dir,
    PackFile_Segment *seg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))
void PackFile_Annotations_add_entry(Parrot_Interp interp,
    PackFile_Annotations *self,
    opcode_t offset,
    opcode_t key,
    opcode_t type,
    opcode_t value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void PackFile_destroy(Parrot_Interp interp, PackFile *pf)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile_Segment * PackFile_find_segment(Parrot_Interp interp,
    PackFile_Directory *dir,
    const STRING *name,
    int sub_dir)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void PackFile_fixup_subs(Parrot_Interp interp,
    pbc_action_enum_t what,
    PMC *eval)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
INTVAL PackFile_map_segments(Parrot_Interp interp,
    const PackFile_Directory *dir,
    PackFile_map_segments_func_t callback,
    void *user_data)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile * PackFile_new(Parrot_Interp interp, INTVAL is_mapped)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
opcode_t PackFile_unpack(Parrot_Interp interp,
    PackFile *self,
    const opcode_t *packed,
    size_t packed_size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
void Parrot_debug_add_mapping(Parrot_Interp interp,
    PackFile_Debug *debug,
    opcode_t offset,
    STRING *filename)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_debug_pc_to_filename(Parrot_Interp interp,
    const PackFile_Debug *debug,
    opcode_t pc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_load_bytecode(Parrot_Interp interp,
    Parrot_String file_str)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_load_language(Parrot_Interp interp, STRING *lang_name)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile_Debug * Parrot_new_debug_seg(Parrot_Interp interp,
    PackFile_ByteCode *cs,
    size_t size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile_ByteCode * Parrot_pf_create_default_segments(Parrot_Interp interp,
    PMC * const pf_pmc,
    STRING * file_name,
    int add)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

PackFile * Parrot_pf_deserialize(Parrot_Interp interp, STRING *str)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pf_destroy(Parrot_Interp interp, PackFile *pf)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pf_execute_bytecode_program(Parrot_Interp interp,
    PMC *pbc,
    PMC *args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))

PackFile_Annotations * Parrot_pf_get_annotations_segment(Parrot_Interp interp,
    PackFile *pf,
    PackFile_ByteCode *bc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
       
        ;

__attribute__ ((visibility("default")))

PMC * Parrot_pf_get_packfile_pmc(Parrot_Interp interp,
    PackFile *pf,
    STRING *path)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

STRING * Parrot_pf_get_version_string(Parrot_Interp interp, PMC * pbc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

PMC * Parrot_pf_load_bytecode_search(Parrot_Interp interp, STRING *file)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile * Parrot_pf_new(Parrot_Interp interp, INTVAL is_mapped)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_pf_prepare_packfile_init(Parrot_Interp interp,
    PMC * const pfpmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pf_prepare_packfile_load(Parrot_Interp interp,
    PMC * const pfpmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

PackFile * Parrot_pf_read_pbc_file(Parrot_Interp interp,
    STRING * const fullname)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_pf_serialize(Parrot_Interp interp, PackFile * const pf)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
INTVAL Parrot_pf_serialized_size(Parrot_Interp interp, PackFile *pf)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pf_set_current_packfile(Parrot_Interp interp, PMC *pbc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

PMC * Parrot_pf_single_sub_by_tag(Parrot_Interp interp,
    PMC * pfpmc,
    STRING * flag)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

PMC * Parrot_pf_subs_by_tag(Parrot_Interp interp,
    PMC * pfpmc,
    STRING * flag)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pf_tag_constant(Parrot_Interp interp,
    PackFile_ConstTable *ct,
    const int tag_idx,
    const int const_idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pf_write_pbc_file(Parrot_Interp interp,
    PMC *pf_pmc,
    STRING *filename)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))


PackFile_ByteCode * Parrot_switch_to_cs(Parrot_Interp interp,
    PackFile_ByteCode *new_cs,
    int really)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


PMC * PackFile_Annotations_lookup(Parrot_Interp interp,
    PackFile_Annotations *self,
    opcode_t offset,
    STRING *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
PMC * Parrot_pf_all_subs(Parrot_Interp interp, PMC *pfpmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
PMC * Parrot_pf_all_tagged_pmcs(Parrot_Interp interp, PMC * pfpmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
PMC * Parrot_pf_all_tags_list(Parrot_Interp interp, PMC * pfpmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PackFile_ByteCode * Parrot_pf_get_current_code_segment(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__((__pure__)) __attribute__((__warn_unused_result__))

PMC * Parrot_pf_get_current_packfile(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


PMC * Parrot_pf_get_packfile_main_sub(Parrot_Interp interp, PMC * pbc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_pf_mark_packfile(Parrot_Interp interp, PackFile * pf)
        __attribute__((__nonnull__(1)))
        ;
# 947 "./include/parrot/packfile.h"
__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

opcode_t * PackFile_ConstTable_pack(Parrot_Interp interp,
    PackFile_Segment *seg,
    opcode_t *cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))
size_t PackFile_ConstTable_pack_size(Parrot_Interp interp,
    PackFile_Segment *seg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
int PackFile_ConstTable_rlookup_num(Parrot_Interp interp,
    const PackFile_ConstTable *ct,
    FLOATVAL n)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
int PackFile_ConstTable_rlookup_pmc(Parrot_Interp interp,
    PackFile_ConstTable *ct,
    PMC *v,
    INTVAL *constno,
    INTVAL *idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
       
        ;

__attribute__ ((visibility("default")))
int PackFile_ConstTable_rlookup_str(Parrot_Interp interp,
    const PackFile_ConstTable *ct,
    STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void PackFile_pack(Parrot_Interp interp,
    PackFile *self,
    opcode_t *cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))
size_t PackFile_pack_size(Parrot_Interp interp, PackFile *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;
# 1045 "./include/parrot/packfile.h"
__attribute__ ((visibility("default")))

PackFile_Segment * PackFile_Annotations_new(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void PackFile_ConstTable_clear(Parrot_Interp interp,
    PackFile_ConstTable *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

const opcode_t * PackFile_ConstTable_unpack(Parrot_Interp interp,
    PackFile_Segment *seg,
    const opcode_t *cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
void PackFile_funcs_register(Parrot_Interp interp,
    PackFile *pf,
    UINTVAL type,
    const PackFile_funcs funcs)
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void PackFile_Segment_destroy(Parrot_Interp interp, PackFile_Segment *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void PackFile_Segment_dump(Parrot_Interp interp,
    const PackFile_Segment *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile_Segment * PackFile_Segment_new(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PackFile_Segment * PackFile_Segment_new_seg(Parrot_Interp interp,
    PackFile_Directory *dir,
    UINTVAL type,
    STRING *name,
    int add)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

opcode_t * PackFile_Segment_pack(Parrot_Interp interp,
    PackFile_Segment *self,
    opcode_t *cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
size_t PackFile_Segment_packed_size(Parrot_Interp interp,
    PackFile_Segment *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

const opcode_t * PackFile_Segment_unpack(Parrot_Interp interp,
    PackFile_Segment *self,
    const opcode_t *cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void default_dump_header(Parrot_Interp interp, const PackFile_Segment *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void PackFile_Annotations_destroy(Parrot_Interp interp,
    PackFile_Segment *seg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void PackFile_Annotations_dump(Parrot_Interp interp,
    const PackFile_Segment *seg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))

opcode_t * PackFile_Annotations_pack(Parrot_Interp interp,
    PackFile_Segment *seg,
    opcode_t *cursor)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
size_t PackFile_Annotations_packed_size(Parrot_Interp interp,
    PackFile_Segment *seg)
        __attribute__((__nonnull__(2)))
        ;


const opcode_t * PackFile_Annotations_unpack(Parrot_Interp interp,
    PackFile_Segment *seg,
    const opcode_t *cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void pf_register_standard_funcs(Parrot_Interp interp, PackFile *pf)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;
# 15 "./include/parrot/pmc_freeze.h" 2

typedef enum {
    VISIT_HOW_PMC_TO_VISITOR = 0x00,
    VISIT_HOW_VISITOR_TO_PMC = 0x01,
    VISIT_HOW_PMC_TO_PMC = 0x02,
    VISIT_HOW_VISITOR_TO_VISITOR = 0x03
} visit_how_enum_t;



typedef enum {
    VISIT_WHAT_PMC = 0x04,
    VISIT_WHAT_STRING = 0x08,
    VISIT_WHAT_FLOATVAL = 0x10,
    VISIT_WHAT_INTVAL = 0x20
} visit_what_enum_t;
# 40 "./include/parrot/pmc_freeze.h"
typedef enum {
    EXTRA_IS_NULL,
    EXTRA_IS_PROP_HASH
} extra_flags_enum;
# 108 "./include/parrot/pmc_freeze.h"
__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_clone(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING* Parrot_freeze(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

opcode_t * Parrot_freeze_pbc(Parrot_Interp interp,
    PMC *pmc,
    const PackFile_ConstTable *pf,
    opcode_t *cursor,
    Hash **seen)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
       
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
UINTVAL Parrot_freeze_pbc_size(Parrot_Interp interp,
    PMC *pmc,
    const PackFile_ConstTable *pf,
    Hash **seen)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_freeze_strings(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_thaw(Parrot_Interp interp, STRING *image)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_thaw_constants(Parrot_Interp interp, STRING *image)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_thaw_pbc(Parrot_Interp interp,
    PackFile_ConstTable *ct,
    const opcode_t **cursor)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void Parrot_pf_verify_image_string(Parrot_Interp interp, STRING *image)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 254 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/vtable.h" 1
# 14 "./include/parrot/vtable.h"
typedef PMC* (*absolute_method_t)(Parrot_Interp interp, PMC *pmc, PMC* dest);
typedef PMC* (*add_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef void (*add_attribute_method_t)(Parrot_Interp interp, PMC *pmc, STRING* name, PMC* type);
typedef PMC* (*add_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value, PMC* dest);
typedef PMC* (*add_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef void (*add_method_method_t)(Parrot_Interp interp, PMC *pmc, STRING* method_name, PMC* sub_pmc);
typedef void (*add_parent_method_t)(Parrot_Interp interp, PMC *pmc, PMC* parent);
typedef void (*add_role_method_t)(Parrot_Interp interp, PMC *pmc, PMC* role);
typedef void (*add_vtable_override_method_t)(Parrot_Interp interp, PMC *pmc, STRING* vtable_name, PMC* sub_pmc);
typedef void (*assign_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*assign_string_native_method_t)(Parrot_Interp interp, PMC *pmc, STRING* value);
typedef PMC* (*clone_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*clone_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* args);
typedef INTVAL (*cmp_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef INTVAL (*cmp_num_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef PMC* (*cmp_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef INTVAL (*cmp_string_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef PMC* (*concatenate_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*concatenate_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* value, PMC* dest);
typedef void (*decrement_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*defined_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*defined_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef INTVAL (*defined_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef INTVAL (*defined_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef void (*delete_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef void (*delete_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef void (*delete_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef void (*destroy_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*divide_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*divide_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value, PMC* dest);
typedef PMC* (*divide_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef INTVAL (*does_method_t)(Parrot_Interp interp, PMC *pmc, STRING* role);
typedef INTVAL (*does_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* role);
typedef INTVAL (*elements_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*exists_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef INTVAL (*exists_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef INTVAL (*exists_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef PMC* (*find_method_method_t)(Parrot_Interp interp, PMC *pmc, STRING* method_name);
typedef PMC* (*floor_divide_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*floor_divide_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value, PMC* dest);
typedef PMC* (*floor_divide_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef void (*freeze_method_t)(Parrot_Interp interp, PMC *pmc, PMC* info);
typedef PMC* (*get_attr_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, STRING* idx);
typedef PMC* (*get_attr_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* idx);
typedef INTVAL (*get_bool_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*get_class_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*get_integer_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*get_integer_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef INTVAL (*get_integer_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef INTVAL (*get_integer_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef PMC* (*get_iter_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*get_namespace_method_t)(Parrot_Interp interp, PMC *pmc);
typedef FLOATVAL (*get_number_method_t)(Parrot_Interp interp, PMC *pmc);
typedef FLOATVAL (*get_number_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef FLOATVAL (*get_number_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef FLOATVAL (*get_number_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef PMC* (*get_pmc_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*get_pmc_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef PMC* (*get_pmc_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef PMC* (*get_pmc_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef void* (*get_pointer_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void* (*get_pointer_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef void* (*get_pointer_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef void* (*get_pointer_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef STRING* (*get_repr_method_t)(Parrot_Interp interp, PMC *pmc);
typedef STRING* (*get_string_method_t)(Parrot_Interp interp, PMC *pmc);
typedef STRING* (*get_string_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key);
typedef STRING* (*get_string_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key);
typedef STRING* (*get_string_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key);
typedef INTVAL (*hashvalue_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*i_absolute_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*i_add_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_add_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*i_add_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*i_concatenate_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_concatenate_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* value);
typedef void (*i_divide_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_divide_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*i_divide_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*i_floor_divide_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_floor_divide_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*i_floor_divide_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*i_modulus_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_modulus_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*i_modulus_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*i_multiply_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_multiply_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*i_multiply_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*i_neg_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*i_repeat_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_repeat_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*i_subtract_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*i_subtract_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*i_subtract_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*increment_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*init_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*init_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL initializer);
typedef void (*init_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* initializer);
typedef PMC* (*inspect_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*inspect_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* what);
typedef PMC* (*instantiate_method_t)(Parrot_Interp interp, PMC *pmc, PMC* sig);
typedef opcode_t* (*invoke_method_t)(Parrot_Interp interp, PMC *pmc, void* next);
typedef INTVAL (*is_equal_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef INTVAL (*is_equal_num_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef INTVAL (*is_equal_string_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef INTVAL (*is_same_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef INTVAL (*isa_method_t)(Parrot_Interp interp, PMC *pmc, STRING* _class);
typedef INTVAL (*isa_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* _class);
typedef void (*mark_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*modulus_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*modulus_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value, PMC* dest);
typedef PMC* (*modulus_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef void (*morph_method_t)(Parrot_Interp interp, PMC *pmc, PMC* type);
typedef PMC* (*multiply_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*multiply_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value, PMC* dest);
typedef PMC* (*multiply_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef STRING* (*name_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*neg_method_t)(Parrot_Interp interp, PMC *pmc, PMC* dest);
typedef FLOATVAL (*pop_float_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*pop_integer_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*pop_pmc_method_t)(Parrot_Interp interp, PMC *pmc);
typedef STRING* (*pop_string_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*push_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*push_integer_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*push_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*push_string_method_t)(Parrot_Interp interp, PMC *pmc, STRING* value);
typedef void (*remove_attribute_method_t)(Parrot_Interp interp, PMC *pmc, STRING* name);
typedef void (*remove_method_method_t)(Parrot_Interp interp, PMC *pmc, STRING* method_name);
typedef void (*remove_parent_method_t)(Parrot_Interp interp, PMC *pmc, PMC* parent);
typedef void (*remove_role_method_t)(Parrot_Interp interp, PMC *pmc, PMC* role);
typedef void (*remove_vtable_override_method_t)(Parrot_Interp interp, PMC *pmc, STRING* vtable_name);
typedef PMC* (*repeat_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*repeat_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef void (*set_attr_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, STRING* idx, PMC* value);
typedef void (*set_attr_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* idx, PMC* value);
typedef void (*set_bool_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*set_integer_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, INTVAL value);
typedef void (*set_integer_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key, INTVAL value);
typedef void (*set_integer_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key, INTVAL value);
typedef void (*set_integer_native_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*set_number_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, FLOATVAL value);
typedef void (*set_number_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key, FLOATVAL value);
typedef void (*set_number_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key, FLOATVAL value);
typedef void (*set_number_native_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*set_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*set_pmc_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, PMC* value);
typedef void (*set_pmc_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key, PMC* value);
typedef void (*set_pmc_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key, PMC* value);
typedef void (*set_pointer_method_t)(Parrot_Interp interp, PMC *pmc, void* value);
typedef void (*set_pointer_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, void* value);
typedef void (*set_pointer_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key, void* value);
typedef void (*set_pointer_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key, void* value);
typedef void (*set_string_keyed_method_t)(Parrot_Interp interp, PMC *pmc, PMC* key, STRING* value);
typedef void (*set_string_keyed_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL key, STRING* value);
typedef void (*set_string_keyed_str_method_t)(Parrot_Interp interp, PMC *pmc, STRING* key, STRING* value);
typedef void (*set_string_native_method_t)(Parrot_Interp interp, PMC *pmc, STRING* value);
typedef FLOATVAL (*shift_float_method_t)(Parrot_Interp interp, PMC *pmc);
typedef INTVAL (*shift_integer_method_t)(Parrot_Interp interp, PMC *pmc);
typedef PMC* (*shift_pmc_method_t)(Parrot_Interp interp, PMC *pmc);
typedef STRING* (*shift_string_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*splice_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, INTVAL offset, INTVAL count);
typedef STRING* (*substr_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL offset, INTVAL length);
typedef PMC* (*subtract_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value, PMC* dest);
typedef PMC* (*subtract_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value, PMC* dest);
typedef PMC* (*subtract_int_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value, PMC* dest);
typedef void (*thaw_method_t)(Parrot_Interp interp, PMC *pmc, PMC* info);
typedef void (*thawfinish_method_t)(Parrot_Interp interp, PMC *pmc, PMC* info);
typedef INTVAL (*type_method_t)(Parrot_Interp interp, PMC *pmc);
typedef void (*unshift_float_method_t)(Parrot_Interp interp, PMC *pmc, FLOATVAL value);
typedef void (*unshift_integer_method_t)(Parrot_Interp interp, PMC *pmc, INTVAL value);
typedef void (*unshift_pmc_method_t)(Parrot_Interp interp, PMC *pmc, PMC* value);
typedef void (*unshift_string_method_t)(Parrot_Interp interp, PMC *pmc, STRING* value);
typedef void (*visit_method_t)(Parrot_Interp interp, PMC *pmc, PMC* info);

typedef enum {
    VTABLE_IS_CONST_FLAG = 0x001,
    VTABLE_HAS_CONST_TOO = 0x002,
    VTABLE_PMC_NEEDS_EXT = 0x004,
    VTABLE_DATA_IS_PMC = 0x008,
    VTABLE_PMC_IS_SINGLETON = 0x010,
    VTABLE_IS_SHARED_FLAG = 0x020,
    VTABLE_IS_CONST_PMC_FLAG = 0x040,
    VTABLE_HAS_READONLY_FLAG = 0x080,
    VTABLE_IS_READONLY_FLAG = 0x100
} vtable_flags_t;

typedef struct _vtable {
    PMC *_namespace;
    INTVAL base_type;
    STRING *whoami;
    UINTVAL flags;
    STRING *provides_str;
    Hash *isa_hash;
    PMC *pmc_class;

    PMC *mro;
    const char *attribute_defs;
    struct _vtable *ro_variant_vtable;



    absolute_method_t absolute;
    add_method_t add;
    add_attribute_method_t add_attribute;
    add_float_method_t add_float;
    add_int_method_t add_int;
    add_method_method_t add_method;
    add_parent_method_t add_parent;
    add_role_method_t add_role;
    add_vtable_override_method_t add_vtable_override;
    assign_pmc_method_t assign_pmc;
    assign_string_native_method_t assign_string_native;
    clone_method_t clone;
    clone_pmc_method_t clone_pmc;
    cmp_method_t cmp;
    cmp_num_method_t cmp_num;
    cmp_pmc_method_t cmp_pmc;
    cmp_string_method_t cmp_string;
    concatenate_method_t concatenate;
    concatenate_str_method_t concatenate_str;
    decrement_method_t decrement;
    defined_method_t defined;
    defined_keyed_method_t defined_keyed;
    defined_keyed_int_method_t defined_keyed_int;
    defined_keyed_str_method_t defined_keyed_str;
    delete_keyed_method_t delete_keyed;
    delete_keyed_int_method_t delete_keyed_int;
    delete_keyed_str_method_t delete_keyed_str;
    destroy_method_t destroy;
    divide_method_t divide;
    divide_float_method_t divide_float;
    divide_int_method_t divide_int;
    does_method_t does;
    does_pmc_method_t does_pmc;
    elements_method_t elements;
    exists_keyed_method_t exists_keyed;
    exists_keyed_int_method_t exists_keyed_int;
    exists_keyed_str_method_t exists_keyed_str;
    find_method_method_t find_method;
    floor_divide_method_t floor_divide;
    floor_divide_float_method_t floor_divide_float;
    floor_divide_int_method_t floor_divide_int;
    freeze_method_t freeze;
    get_attr_keyed_method_t get_attr_keyed;
    get_attr_str_method_t get_attr_str;
    get_bool_method_t get_bool;
    get_class_method_t get_class;
    get_integer_method_t get_integer;
    get_integer_keyed_method_t get_integer_keyed;
    get_integer_keyed_int_method_t get_integer_keyed_int;
    get_integer_keyed_str_method_t get_integer_keyed_str;
    get_iter_method_t get_iter;
    get_namespace_method_t get_namespace;
    get_number_method_t get_number;
    get_number_keyed_method_t get_number_keyed;
    get_number_keyed_int_method_t get_number_keyed_int;
    get_number_keyed_str_method_t get_number_keyed_str;
    get_pmc_method_t get_pmc;
    get_pmc_keyed_method_t get_pmc_keyed;
    get_pmc_keyed_int_method_t get_pmc_keyed_int;
    get_pmc_keyed_str_method_t get_pmc_keyed_str;
    get_pointer_method_t get_pointer;
    get_pointer_keyed_method_t get_pointer_keyed;
    get_pointer_keyed_int_method_t get_pointer_keyed_int;
    get_pointer_keyed_str_method_t get_pointer_keyed_str;
    get_repr_method_t get_repr;
    get_string_method_t get_string;
    get_string_keyed_method_t get_string_keyed;
    get_string_keyed_int_method_t get_string_keyed_int;
    get_string_keyed_str_method_t get_string_keyed_str;
    hashvalue_method_t hashvalue;
    i_absolute_method_t i_absolute;
    i_add_method_t i_add;
    i_add_float_method_t i_add_float;
    i_add_int_method_t i_add_int;
    i_concatenate_method_t i_concatenate;
    i_concatenate_str_method_t i_concatenate_str;
    i_divide_method_t i_divide;
    i_divide_float_method_t i_divide_float;
    i_divide_int_method_t i_divide_int;
    i_floor_divide_method_t i_floor_divide;
    i_floor_divide_float_method_t i_floor_divide_float;
    i_floor_divide_int_method_t i_floor_divide_int;
    i_modulus_method_t i_modulus;
    i_modulus_float_method_t i_modulus_float;
    i_modulus_int_method_t i_modulus_int;
    i_multiply_method_t i_multiply;
    i_multiply_float_method_t i_multiply_float;
    i_multiply_int_method_t i_multiply_int;
    i_neg_method_t i_neg;
    i_repeat_method_t i_repeat;
    i_repeat_int_method_t i_repeat_int;
    i_subtract_method_t i_subtract;
    i_subtract_float_method_t i_subtract_float;
    i_subtract_int_method_t i_subtract_int;
    increment_method_t increment;
    init_method_t init;
    init_int_method_t init_int;
    init_pmc_method_t init_pmc;
    inspect_method_t inspect;
    inspect_str_method_t inspect_str;
    instantiate_method_t instantiate;
    invoke_method_t invoke;
    is_equal_method_t is_equal;
    is_equal_num_method_t is_equal_num;
    is_equal_string_method_t is_equal_string;
    is_same_method_t is_same;
    isa_method_t isa;
    isa_pmc_method_t isa_pmc;
    mark_method_t mark;
    modulus_method_t modulus;
    modulus_float_method_t modulus_float;
    modulus_int_method_t modulus_int;
    morph_method_t morph;
    multiply_method_t multiply;
    multiply_float_method_t multiply_float;
    multiply_int_method_t multiply_int;
    name_method_t name;
    neg_method_t neg;
    pop_float_method_t pop_float;
    pop_integer_method_t pop_integer;
    pop_pmc_method_t pop_pmc;
    pop_string_method_t pop_string;
    push_float_method_t push_float;
    push_integer_method_t push_integer;
    push_pmc_method_t push_pmc;
    push_string_method_t push_string;
    remove_attribute_method_t remove_attribute;
    remove_method_method_t remove_method;
    remove_parent_method_t remove_parent;
    remove_role_method_t remove_role;
    remove_vtable_override_method_t remove_vtable_override;
    repeat_method_t repeat;
    repeat_int_method_t repeat_int;
    set_attr_keyed_method_t set_attr_keyed;
    set_attr_str_method_t set_attr_str;
    set_bool_method_t set_bool;
    set_integer_keyed_method_t set_integer_keyed;
    set_integer_keyed_int_method_t set_integer_keyed_int;
    set_integer_keyed_str_method_t set_integer_keyed_str;
    set_integer_native_method_t set_integer_native;
    set_number_keyed_method_t set_number_keyed;
    set_number_keyed_int_method_t set_number_keyed_int;
    set_number_keyed_str_method_t set_number_keyed_str;
    set_number_native_method_t set_number_native;
    set_pmc_method_t set_pmc;
    set_pmc_keyed_method_t set_pmc_keyed;
    set_pmc_keyed_int_method_t set_pmc_keyed_int;
    set_pmc_keyed_str_method_t set_pmc_keyed_str;
    set_pointer_method_t set_pointer;
    set_pointer_keyed_method_t set_pointer_keyed;
    set_pointer_keyed_int_method_t set_pointer_keyed_int;
    set_pointer_keyed_str_method_t set_pointer_keyed_str;
    set_string_keyed_method_t set_string_keyed;
    set_string_keyed_int_method_t set_string_keyed_int;
    set_string_keyed_str_method_t set_string_keyed_str;
    set_string_native_method_t set_string_native;
    shift_float_method_t shift_float;
    shift_integer_method_t shift_integer;
    shift_pmc_method_t shift_pmc;
    shift_string_method_t shift_string;
    splice_method_t splice;
    substr_method_t substr;
    subtract_method_t subtract;
    subtract_float_method_t subtract_float;
    subtract_int_method_t subtract_int;
    thaw_method_t thaw;
    thawfinish_method_t thawfinish;
    type_method_t type;
    unshift_float_method_t unshift_float;
    unshift_integer_method_t unshift_integer;
    unshift_pmc_method_t unshift_pmc;
    unshift_string_method_t unshift_string;
    visit_method_t visit;
    UINTVAL attr_size;
} _vtable;
# 922 "./include/parrot/vtable.h"
static const char * const Parrot_vtable_slot_names[] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",


        "absolute",
        "add",
        "add_attribute",
        "add_float",
        "add_int",
        "add_method",
        "add_parent",
        "add_role",
        "add_vtable_override",
        "assign_pmc",
        "assign_string_native",
        "clone",
        "clone_pmc",
        "cmp",
        "cmp_num",
        "cmp_pmc",
        "cmp_string",
        "concatenate",
        "concatenate_str",
        "decrement",
        "defined",
        "defined_keyed",
        "defined_keyed_int",
        "defined_keyed_str",
        "delete_keyed",
        "delete_keyed_int",
        "delete_keyed_str",
        "destroy",
        "divide",
        "divide_float",
        "divide_int",
        "does",
        "does_pmc",
        "elements",
        "exists_keyed",
        "exists_keyed_int",
        "exists_keyed_str",
        "find_method",
        "floor_divide",
        "floor_divide_float",
        "floor_divide_int",
        "freeze",
        "get_attr_keyed",
        "get_attr_str",
        "get_bool",
        "get_class",
        "get_integer",
        "get_integer_keyed",
        "get_integer_keyed_int",
        "get_integer_keyed_str",
        "get_iter",
        "get_namespace",
        "get_number",
        "get_number_keyed",
        "get_number_keyed_int",
        "get_number_keyed_str",
        "get_pmc",
        "get_pmc_keyed",
        "get_pmc_keyed_int",
        "get_pmc_keyed_str",
        "get_pointer",
        "get_pointer_keyed",
        "get_pointer_keyed_int",
        "get_pointer_keyed_str",
        "get_repr",
        "get_string",
        "get_string_keyed",
        "get_string_keyed_int",
        "get_string_keyed_str",
        "hashvalue",
        "i_absolute",
        "i_add",
        "i_add_float",
        "i_add_int",
        "i_concatenate",
        "i_concatenate_str",
        "i_divide",
        "i_divide_float",
        "i_divide_int",
        "i_floor_divide",
        "i_floor_divide_float",
        "i_floor_divide_int",
        "i_modulus",
        "i_modulus_float",
        "i_modulus_int",
        "i_multiply",
        "i_multiply_float",
        "i_multiply_int",
        "i_neg",
        "i_repeat",
        "i_repeat_int",
        "i_subtract",
        "i_subtract_float",
        "i_subtract_int",
        "increment",
        "init",
        "init_int",
        "init_pmc",
        "inspect",
        "inspect_str",
        "instantiate",
        "invoke",
        "is_equal",
        "is_equal_num",
        "is_equal_string",
        "is_same",
        "isa",
        "isa_pmc",
        "mark",
        "modulus",
        "modulus_float",
        "modulus_int",
        "morph",
        "multiply",
        "multiply_float",
        "multiply_int",
        "name",
        "neg",
        "pop_float",
        "pop_integer",
        "pop_pmc",
        "pop_string",
        "push_float",
        "push_integer",
        "push_pmc",
        "push_string",
        "remove_attribute",
        "remove_method",
        "remove_parent",
        "remove_role",
        "remove_vtable_override",
        "repeat",
        "repeat_int",
        "set_attr_keyed",
        "set_attr_str",
        "set_bool",
        "set_integer_keyed",
        "set_integer_keyed_int",
        "set_integer_keyed_str",
        "set_integer_native",
        "set_number_keyed",
        "set_number_keyed_int",
        "set_number_keyed_str",
        "set_number_native",
        "set_pmc",
        "set_pmc_keyed",
        "set_pmc_keyed_int",
        "set_pmc_keyed_str",
        "set_pointer",
        "set_pointer_keyed",
        "set_pointer_keyed_int",
        "set_pointer_keyed_str",
        "set_string_keyed",
        "set_string_keyed_int",
        "set_string_keyed_str",
        "set_string_native",
        "shift_float",
        "shift_integer",
        "shift_pmc",
        "shift_string",
        "splice",
        "substr",
        "subtract",
        "subtract_float",
        "subtract_int",
        "thaw",
        "thawfinish",
        "type",
        "unshift_float",
        "unshift_integer",
        "unshift_pmc",
        "unshift_string",
        "visit",
    ((void *)0)
};
# 255 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/exceptions.h" 1
# 24 "./include/parrot/exceptions.h"
typedef enum {
    EXCEPTION_BAD_BUFFER_SIZE = 0x00000,
    EXCEPTION_MISSING_ENCODING_NAME,
    EXCEPTION_INVALID_STRING_REPRESENTATION,
    EXCEPTION_ICU_ERROR,
    EXCEPTION_UNIMPLEMENTED,

    EXCEPTION_NULL_REG_ACCESS,
    EXCEPTION_NO_REG_FRAMES,
    EXCEPTION_SUBSTR_OUT_OF_STRING,
    EXCEPTION_ORD_OUT_OF_STRING,
    EXCEPTION_MALFORMED_UTF8,
    EXCEPTION_MALFORMED_UTF16,
    EXCEPTION_MALFORMED_UTF32,
    EXCEPTION_INVALID_CHARACTER,
    EXCEPTION_INVALID_CHARTYPE,
    EXCEPTION_INVALID_ENCODING,
    EXCEPTION_INVALID_CHARCLASS,
    EXCEPTION_NEG_REPEAT,
    EXCEPTION_NEG_SUBSTR,
    EXCEPTION_NEG_SLEEP,
    EXCEPTION_NEG_CHOP,
    EXCEPTION_INVALID_OPERATION,
    EXCEPTION_ARG_OP_NOT_HANDLED,
    EXCEPTION_KEY_NOT_FOUND,
    EXCEPTION_JIT_UNAVAILABLE,
    EXCEPTION_EXEC_UNAVAILABLE,
    EXCEPTION_INTERP_ERROR,
    EXCEPTION_PARROT_USAGE_ERROR,
    EXCEPTION_PIO_ERROR,
    EXCEPTION_PARROT_POINTER_ERROR,
    EXCEPTION_DIV_BY_ZERO,
    EXCEPTION_PIO_NOT_IMPLEMENTED,
    EXCEPTION_ALLOCATION_ERROR,
    EXCEPTION_INTERNAL_PANIC,
    EXCEPTION_OUT_OF_BOUNDS,
    EXCEPTION_JIT_ERROR,
    EXCEPTION_EXEC_ERROR,
    EXCEPTION_ILL_INHERIT,
    EXCEPTION_NO_PREV_CS,
    EXCEPTION_NO_CLASS,
    EXCEPTION_LEX_NOT_FOUND,
    EXCEPTION_PAD_NOT_FOUND,
    EXCEPTION_ATTRIB_NOT_FOUND,
    EXCEPTION_GLOBAL_NOT_FOUND,
    EXCEPTION_EXTERNAL_ERROR,
    EXCEPTION_METHOD_NOT_FOUND,
    EXCEPTION_VTABLE_NOT_FOUND,
    EXCEPTION_WRITE_TO_CONSTCLASS,
    EXCEPTION_NOSPAWN,
    EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
    EXCEPTION_ERR_OVERFLOW,
    EXCEPTION_LOSSY_CONVERSION,
    EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT,
    EXCEPTION_UNEXPECTED_NULL,
    EXCEPTION_LIBRARY_ERROR,
    EXCEPTION_LIBRARY_NOT_LOADED,
    EXCEPTION_SYNTAX_ERROR,
    EXCEPTION_MALFORMED_PACKFILE,
    EXCEPTION_DIE,
    EXCEPTION_ALL = 0x0ffff,

    CONTROL_RETURN = 0x10000,
    CONTROL_OK,
    CONTROL_BREAK,
    CONTROL_CONTINUE,
    CONTROL_ERROR,
    CONTROL_TAKE,
    CONTROL_LEAVE,
    CONTROL_EXIT,
    CONTROL_LOOP_NEXT,
    CONTROL_LOOP_LAST,
    CONTROL_LOOP_REDO,
    CONTROL_ALL = 0x1ffff,

    EXCEPTION_TYPE_ALL_MASK = 0xffff
} exception_type_enum;





typedef enum {
    EXCEPT_normal = 0,
    EXCEPT_warning = 1,
    EXCEPT_error = 2,
    EXCEPT_severe = 3,
    EXCEPT_fatal = 4,
    EXCEPT_doomed = 5,
    EXCEPT_exit = 6
} exception_severity;






__attribute__ ((visibility("default")))

void Parrot_assert(
    INTVAL condition,
    const char *condition_string,
    const char *file,
    unsigned int line)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_confess(
    const char *cond,
    const char *file,
    unsigned int line)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_ex_add_c_handler(Parrot_Interp interp, Parrot_runloop *jp)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

PMC * Parrot_ex_build_exception(Parrot_Interp interp,
    INTVAL severity,
    long error,
    STRING *msg)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ex_get_current_handler(Parrot_Interp interp, PMC *expmc)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_ex_mark_unhandled(Parrot_Interp interp, PMC *exception)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_ex_rethrow_from_c(Parrot_Interp interp, PMC *exception)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

opcode_t * Parrot_ex_rethrow_from_op(Parrot_Interp interp, PMC *exception)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_ex_throw_from_c(Parrot_Interp interp, PMC *exception)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_ex_throw_from_c_args(Parrot_Interp interp,
    void *ret_addr,
    int exitcode,
    const char *format,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))

opcode_t * Parrot_ex_throw_from_op(Parrot_Interp interp,
    PMC *exception,
    void *dest)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

opcode_t * Parrot_ex_throw_from_op_args(Parrot_Interp interp,
    void *dest,
    int ex_type,
    const char *format,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(4)));

__attribute__((__noreturn__))
__attribute__((__cold__))
void die_from_exception(Parrot_Interp interp, PMC *exception)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


STRING * Parrot_ex_build_complete_backtrace_string(Parrot_Interp interp,
    PMC * ex)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_print_backtrace(void);
# 257 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/memory.h" 1
# 13 "./include/parrot/memory.h"
# 1 "/usr/include/assert.h" 1 3 4
# 14 "./include/parrot/memory.h" 2
# 77 "./include/parrot/memory.h"
__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

void * mem_sys_allocate(size_t size);

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

void * mem_sys_allocate_zeroed(size_t size);

__attribute__ ((visibility("default")))
void mem_sys_free(void *from);

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

void * mem_sys_realloc(void *from, size_t size);

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

void * mem_sys_realloc_zeroed(
    void *from,
    size_t size,
    size_t old_size);

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

char * mem_sys_strdup(const char *src)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

char * mem_sys_strndup(const char *src, size_t size)
        __attribute__((__nonnull__(1)));
# 259 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/io.h" 1
# 85 "./include/parrot/io.h"
typedef enum {
    PIO_PF_LOCAL = 0,
    PIO_PF_UNIX = 1,
    PIO_PF_INET = 2,
    PIO_PF_INET6 = 3,
    PIO_PF_MAX = 4
} Socket_Protocol_Family;

typedef enum {
    PIO_SOCK_PACKET = 0,
    PIO_SOCK_STREAM = 1,
    PIO_SOCK_DGRAM = 2,
    PIO_SOCK_RAW = 3,
    PIO_SOCK_RDM = 4,
    PIO_SOCK_SEQPACKET = 5,
    PIO_SOCK_MAX = 6
} Socket_Socket_Type;

typedef enum {
    PIO_PROTO_TCP = 6,
    PIO_PROTO_UDP = 17
} Socket_Protocol;


extern PIOOFF_T piooffsetzero;

typedef struct _ParrotIOData ParrotIOData;


typedef struct _io_buffer {
    INTVAL flags;
    size_t raw_reads;
    size_t buffer_size;
    const STR_VTABLE *encoding;
    char *buffer_ptr;
    char *buffer_start;
    char *buffer_end;
} IO_BUFFER;
# 134 "./include/parrot/io.h"
typedef INTVAL (*io_vtable_read_b) (Parrot_Interp interp, PMC *handle,
                                                char * buffer, size_t byte_length);
typedef INTVAL (*io_vtable_write_b) (Parrot_Interp interp, PMC *handle,
                                                char * buffer, size_t byte_length);
typedef INTVAL (*io_vtable_flush) (Parrot_Interp interp, PMC *handle);
typedef INTVAL (*io_vtable_is_eof) (Parrot_Interp interp, PMC *handle);
typedef void (*io_vtable_set_eof) (Parrot_Interp interp, PMC *handle, INTVAL is_set);
typedef PIOOFF_T (*io_vtable_tell) (Parrot_Interp interp, PMC *handle);
typedef PIOOFF_T (*io_vtable_seek) (Parrot_Interp interp, PMC *handle,
                                                PIOOFF_T offset, INTVAL whence);
typedef void (*io_vtable_adv_position) (Parrot_Interp interp, PMC *handle, size_t len);
typedef void (*io_vtable_set_position) (Parrot_Interp interp, PMC *handle, PIOOFF_T pos);
typedef PIOOFF_T (*io_vtable_get_position) (Parrot_Interp interp, PMC *handle);
typedef INTVAL (*io_vtable_open) (Parrot_Interp interp, PMC *handle,
                                                STRING *path, INTVAL flags,
                                                STRING *mode);
typedef INTVAL (*io_vtable_is_open) (Parrot_Interp interp, PMC *handle);
typedef INTVAL (*io_vtable_close) (Parrot_Interp interp, PMC *handle);
typedef void (*io_vtable_set_flags) (Parrot_Interp interp, PMC *handle, INTVAL flags);
typedef INTVAL (*io_vtable_get_flags) (Parrot_Interp interp, PMC *handle);
typedef size_t (*io_vtable_total_size) (Parrot_Interp interp, PMC *handle);
typedef PIOHANDLE (*io_vtable_get_piohandle)(Parrot_Interp interp, PMC *handle);
typedef const STR_VTABLE *(*io_vtable_get_encoding) (Parrot_Interp interp, PMC *handle);

typedef struct _io_vtable {
    const char * name;
    INTVAL number;
    INTVAL flags;
    io_vtable_read_b read_b;
    io_vtable_write_b write_b;
    io_vtable_flush flush;
    io_vtable_is_eof is_eof;
    io_vtable_set_eof set_eof;
    io_vtable_open open;
    io_vtable_is_open is_open;
    io_vtable_close close;
    io_vtable_tell tell;
    io_vtable_seek seek;
    io_vtable_adv_position adv_position;
    io_vtable_set_position set_position;
    io_vtable_get_position get_position;
    io_vtable_get_flags get_flags;
    io_vtable_set_flags set_flags;
    io_vtable_get_encoding get_encoding;
    io_vtable_total_size total_size;
    io_vtable_get_piohandle get_piohandle;
} IO_VTABLE;
# 212 "./include/parrot/io.h"
__attribute__ ((visibility("default")))
INTVAL Parrot_io_close(Parrot_Interp interp, PMC *handle, INTVAL autoflush)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
INTVAL Parrot_io_close_handle(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_io_eof(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

INTVAL
Parrot_io_eprintf(
    Parrot_Interp interp,
    const char *s,
    ...)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_fdopen(Parrot_Interp interp,
    PMC *pmc,
    PIOHANDLE fd,
    STRING *sflags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_fdopen_flags(Parrot_Interp interp,
    PMC *filehandle,
    PIOHANDLE fd,
    INTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_io_finish(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
size_t Parrot_io_flush(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_io_flush_handle(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

INTVAL
Parrot_io_fprintf(Parrot_Interp interp,
    PMC *pmc,
    const char *s,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOHANDLE Parrot_io_getfd(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_io_getprotobyname(Parrot_Interp interp, STRING * name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_io_init(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_io_is_async(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_io_is_closed(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_io_is_tty_handle(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_make_offset(INTVAL offset);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_make_offset32(INTVAL hi, INTVAL lo);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_open(Parrot_Interp interp,
    PMC *pmc,
    STRING *path,
    STRING *mode)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_open_handle(Parrot_Interp interp,
    PMC *pmc,
    STRING *path,
    STRING *mode)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_io_peek(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
INTVAL Parrot_io_poll(Parrot_Interp interp,
    PMC *pmc,
    INTVAL which,
    INTVAL sec,
    INTVAL usec)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

INTVAL
Parrot_io_pprintf(Parrot_Interp interp,
    PIOHANDLE os_handle,
    const char *s,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

INTVAL
Parrot_io_printf(Parrot_Interp interp,
    const char *s,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
INTVAL Parrot_io_putps(Parrot_Interp interp, PMC *pmc, STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))
INTVAL Parrot_io_puts(Parrot_Interp interp, PMC *pmc, const char *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

PMC * Parrot_io_read_byte_buffer_pmc(Parrot_Interp interp,
    PMC *handle,
    PMC *buffer,
    size_t byte_length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
       
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_io_read_s(Parrot_Interp interp, PMC *handle, size_t length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_io_readall_s(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_io_readline(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_io_readline_s(Parrot_Interp interp,
    PMC *handle,
    STRING * terminator)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_io_reads(Parrot_Interp interp, PMC *pmc, size_t length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

STRING * Parrot_io_recv_handle(Parrot_Interp interp, PMC *pmc, size_t len)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_seek(Parrot_Interp interp,
    PMC *handle,
    PIOOFF_T offset,
    INTVAL w)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_seek_handle(Parrot_Interp interp,
    PMC *handle,
    PIOOFF_T offset,
    INTVAL w)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_socket(Parrot_Interp interp,
    PMC *socket,
    INTVAL fam,
    INTVAL type,
    INTVAL proto)
        __attribute__((__nonnull__(1)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_socket_accept(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_io_socket_bind(Parrot_Interp interp,
    PMC *pmc,
    PMC *address)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))
void Parrot_io_socket_connect(Parrot_Interp interp,
    PMC *pmc,
    PMC *address)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

INTVAL Parrot_io_socket_handle(Parrot_Interp interp,
    PMC *socket,
    INTVAL fam,
    INTVAL type,
    INTVAL proto)
        __attribute__((__nonnull__(1)))
        ;

__attribute__ ((visibility("default")))
void Parrot_io_socket_initialize(Parrot_Interp interp, PMC *socket)
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_io_socket_listen(Parrot_Interp interp,
    PMC *pmc,
    INTVAL backlog)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_socket_new(Parrot_Interp interp, INTVAL flags)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_STDERR(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_stdhandle(Parrot_Interp interp,
    INTVAL fileno,
    PMC *newhandle)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_STDIN(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_io_STDOUT(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_tell(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_tell_handle(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
size_t Parrot_io_write_b(Parrot_Interp interp,
    PMC *handle,
    const void *buffer,
    size_t byte_length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
INTVAL Parrot_io_write_s(Parrot_Interp interp,
    PMC *handle,
    STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void io_setup_vtables(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


__attribute__((__warn_unused_result__))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
const IO_VTABLE * Parrot_io_allocate_new_vtable(Parrot_Interp interp,
    const char *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
INTVAL Parrot_io_buffer_size(Parrot_Interp interp,
    PMC *handle,
    INTVAL size,
    INTVAL has_size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;


__attribute__((__warn_unused_result__))
STRING * Parrot_io_get_buffer_mode(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__((__warn_unused_result__))
INTVAL Parrot_io_get_flags(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
PIOHANDLE Parrot_io_get_os_handle(Parrot_Interp interp, PMC *handle)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
PIOHANDLE Parrot_io_get_standard_piohandle(Parrot_Interp interp, INTVAL idx)
        __attribute__((__nonnull__(1)));

__attribute__((__warn_unused_result__))

const IO_VTABLE * Parrot_io_get_vtable(Parrot_Interp interp,
    INTVAL idx,
    const char * name)
        __attribute__((__nonnull__(1)));

__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_make_offset_pmc(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void Parrot_io_mark(Parrot_Interp interp, ParrotIOData *piodata)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
STRING * Parrot_io_reencode_string_for_handle(Parrot_Interp interp,
    PMC *handle,
    STRING *str)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_io_set_buffer_mode(Parrot_Interp interp,
    PMC *handle,
    STRING *mode)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

void Parrot_io_set_flags(Parrot_Interp interp, PMC *handle, INTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

INTVAL Parrot_io_write_byte_buffer_pmc(Parrot_Interp interp,
    PMC * handle,
    PMC *buffer,
    size_t byte_length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;
# 910 "./include/parrot/io.h"
__attribute__((__warn_unused_result__))
size_t io_buffer_find_num_characters(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC *handle,
    const IO_VTABLE *vtable,
    const STR_VTABLE *encoding,
    Parrot_String_Bounds *bounds,
    size_t num_chars)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
        __attribute__((__nonnull__(6)))
       
       
        ;

__attribute__((__warn_unused_result__))
size_t io_buffer_find_string_marker(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC *handle,
    const IO_VTABLE *vtable,
    const STR_VTABLE *encoding,
    Parrot_String_Bounds *bounds,
    STRING * delim,
    INTVAL *have_delim)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
        __attribute__((__nonnull__(6)))
        __attribute__((__nonnull__(7)))
        __attribute__((__nonnull__(8)))
       
       
       
        ;

void Parrot_io_buffer_add_to_handle(Parrot_Interp interp,
    PMC *handle,
    INTVAL idx,
    size_t length,
    INTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void Parrot_io_buffer_advance_position(Parrot_Interp interp,
    IO_BUFFER *buffer,
    size_t len)
        __attribute__((__nonnull__(1)))
        ;


__attribute__((__warn_unused_result__))
IO_BUFFER * Parrot_io_buffer_allocate(Parrot_Interp interp,
    PMC *owner,
    INTVAL flags,
    const STR_VTABLE *encoding,
    size_t init_size)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void Parrot_io_buffer_clear(Parrot_Interp interp, IO_BUFFER *buffer)
        ;

__attribute__((__warn_unused_result__))
size_t Parrot_io_buffer_content_size(Parrot_Interp interp,
    IO_BUFFER *buffer)
        __attribute__((__nonnull__(2)));

size_t Parrot_io_buffer_fill(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC * handle,
    const IO_VTABLE *vtable)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

size_t Parrot_io_buffer_flush(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC * handle,
    const IO_VTABLE *vtable)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

void Parrot_io_buffer_free(Parrot_Interp interp, IO_BUFFER *buffer)
        __attribute__((__nonnull__(1)));

void Parrot_io_buffer_mark(Parrot_Interp interp, IO_BUFFER *buffer)
        ;

UINTVAL Parrot_io_buffer_peek(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC * handle,
    const IO_VTABLE *vtable)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

size_t Parrot_io_buffer_read_b(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC *handle,
    const IO_VTABLE *vtable,
    char *s,
    size_t length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
       
        ;

void Parrot_io_buffer_remove_from_handle(Parrot_Interp interp,
    PMC *handle,
    INTVAL idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

size_t Parrot_io_buffer_resize(Parrot_Interp interp,
    IO_BUFFER *buffer,
    size_t new_size)
        __attribute__((__nonnull__(2)))
        ;

PIOOFF_T Parrot_io_buffer_seek(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC *handle,
    const IO_VTABLE *vtable,
    PIOOFF_T offset,
    INTVAL w)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

__attribute__((__warn_unused_result__))
PIOOFF_T Parrot_io_buffer_tell(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC *handle,
    const IO_VTABLE * vtable)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        ;

size_t Parrot_io_buffer_write_b(Parrot_Interp interp,
    IO_BUFFER *buffer,
    PMC * handle,
    const IO_VTABLE *vtable,
    char *s,
    size_t length)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
       
        ;
# 261 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/pmc.h" 1
# 14 "./include/parrot/pmc.h"
# 1 "./include/parrot/core_pmcs.h" 1
# 10 "./include/parrot/core_pmcs.h"
enum {
    enum_class_default,
    enum_class_Null,
    enum_class_Env,
    enum_class_Key,
    enum_class_UnManagedStruct,
    enum_class_ManagedStruct,
    enum_class_Exception,
    enum_class_ParrotLibrary,
    enum_class_ParrotInterpreter,
    enum_class_LexPad,
    enum_class_Timer,
    enum_class_Pointer,
    enum_class_Sub,
    enum_class_Coroutine,
    enum_class_EventHandler,
    enum_class_Continuation,
    enum_class_ExceptionHandler,
    enum_class_NCI,
    enum_class_BigInt,
    enum_class_BigNum,
    enum_class_Complex,
    enum_class_FixedIntegerArray,
    enum_class_ResizableIntegerArray,
    enum_class_Iterator,
    enum_class_ArrayIterator,
    enum_class_HashIterator,
    enum_class_OrderedHashIterator,
    enum_class_StringIterator,
    enum_class_FixedStringArray,
    enum_class_ResizableStringArray,
    enum_class_Hash,
    enum_class_LexInfo,
    enum_class_NameSpace,
    enum_class_OrderedHash,
    enum_class_OpLib,
    enum_class_Opcode,
    enum_class_CallContext,
    enum_class_AddrRegistry,
    enum_class_Alarm,
    enum_class_ByteBuffer,
    enum_class_Capture,
    enum_class_Class,
    enum_class_PMCProxy,
    enum_class_Exporter,
    enum_class_FixedBooleanArray,
    enum_class_ResizableBooleanArray,
    enum_class_FixedFloatArray,
    enum_class_ResizableFloatArray,
    enum_class_FixedPMCArray,
    enum_class_ResizablePMCArray,
    enum_class_MultiSub,
    enum_class_Handle,
    enum_class_FileHandle,
    enum_class_Socket,
    enum_class_StringHandle,
    enum_class_HashIteratorKey,
    enum_class_ImageIOFreeze,
    enum_class_ImageIOSize,
    enum_class_ImageIOStrings,
    enum_class_ImageIOThaw,
    enum_class_IMCCompiler,
    enum_class_MappedByteArray,
    enum_class_NativePCCMethod,
    enum_class_Object,
    enum_class_OS,
    enum_class_Packfile,
    enum_class_PackfileAnnotation,
    enum_class_PackfileOpMap,
    enum_class_PackfileSegment,
    enum_class_PackfileAnnotations,
    enum_class_PackfileConstantTable,
    enum_class_PackfileDirectory,
    enum_class_PackfileRawSegment,
    enum_class_PackfileBytecodeSegment,
    enum_class_PackfileDebug,
    enum_class_PackfileView,
    enum_class_PMCList,
    enum_class_Proxy,
    enum_class_Ptr,
    enum_class_PtrBuf,
    enum_class_PtrObj,
    enum_class_Role,
    enum_class_scalar,
    enum_class_Float,
    enum_class_Integer,
    enum_class_String,
    enum_class_Boolean,
    enum_class_Scheduler,
    enum_class_SchedulerMessage,
    enum_class_Sockaddr,
    enum_class_StringBuilder,
    enum_class_StructView,
    enum_class_Task,
    enum_class_Callback,
    enum_class_Undef,
    enum_class_core_max
};
# 15 "./include/parrot/pmc.h" 2







__attribute__ ((visibility("default")))

PMC * Parrot_pmc_box_c_string_array(Parrot_Interp interp,
    int count,
    const char **s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__hot__))

PMC* Parrot_pmc_box_integer(Parrot_Interp interp, INTVAL value)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__hot__))

PMC* Parrot_pmc_box_number(Parrot_Interp interp, FLOATVAL value)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__hot__))

PMC * Parrot_pmc_box_string(Parrot_Interp interp, STRING *string)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_pmc_create_mro(Parrot_Interp interp, INTVAL type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_pmc_delprop(Parrot_Interp interp, PMC *pmc, STRING *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_pmc_destroy(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pmc_gc_register(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_pmc_gc_unregister(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
INTVAL Parrot_pmc_get_type(Parrot_Interp interp, PMC *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_pmc_get_type_str(Parrot_Interp interp, STRING *name)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

PMC * Parrot_pmc_getprop(Parrot_Interp interp, PMC *pmc, STRING *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

PMC * Parrot_pmc_getprops(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
__attribute__((__hot__))
INTVAL Parrot_pmc_is_null(Parrot_Interp interp, const PMC *pmc);

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_pmc_new(Parrot_Interp interp, INTVAL base_type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_pmc_new_from_type(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

PMC * Parrot_pmc_new_init(Parrot_Interp interp,
    INTVAL base_type,
    PMC *init)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

PMC * Parrot_pmc_new_init_int(Parrot_Interp interp, INTVAL base_type, INTVAL init)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

PMC * Parrot_pmc_new_noinit(Parrot_Interp interp, INTVAL base_type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

Parrot_PMC Parrot_pmc_null(void);

__attribute__ ((visibility("default")))
INTVAL Parrot_pmc_register_new_type(Parrot_Interp interp, STRING *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))


PMC * Parrot_pmc_reuse(Parrot_Interp interp,
    PMC *pmc,
    INTVAL new_type,
    UINTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))


PMC * Parrot_pmc_reuse_by_class(Parrot_Interp interp,
    PMC *pmc,
    PMC *class_,
    UINTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))


PMC * Parrot_pmc_reuse_init(Parrot_Interp interp,
    PMC *pmc,
    INTVAL new_type,
    PMC *init,
    UINTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
void Parrot_pmc_setprop(Parrot_Interp interp,
    PMC *pmc,
    STRING *key,
    PMC *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)));

void Parrot_pmc_free_temporary(Parrot_Interp interp, PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

INTVAL Parrot_pmc_get_new_vtable_index(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


PMC * Parrot_pmc_new_temporary(Parrot_Interp interp, INTVAL base_type)
        __attribute__((__nonnull__(1)));

INTVAL Parrot_pmc_type_does(Parrot_Interp interp,
    const STRING *role,
    INTVAL type)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 263 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/string_funcs.h" 1
# 27 "./include/parrot/string_funcs.h"
__attribute__ ((visibility("default")))

STRING * Parrot_str_bitwise_and(Parrot_Interp interp,
    const STRING *s1,
    const STRING *s2)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_bitwise_not(Parrot_Interp interp,
    const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_bitwise_or(Parrot_Interp interp,
    const STRING *s1,
    const STRING *s2)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_bitwise_xor(Parrot_Interp interp,
    const STRING *s1,
    const STRING *s2)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_boolean(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
UINTVAL Parrot_str_byte_length(Parrot_Interp interp, const STRING *s);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING* Parrot_str_change_encoding(Parrot_Interp interp,
    STRING *src,
    INTVAL encoding_nr)
        __attribute__((__nonnull__(1)))
        ;

__attribute__ ((visibility("default")))

STRING * Parrot_str_chopn(Parrot_Interp interp, const STRING *s, INTVAL n)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_str_chr(Parrot_Interp interp, UINTVAL character)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_compare(Parrot_Interp interp,
    const STRING *s1,
    const STRING *s2)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_str_compose(Parrot_Interp interp, const STRING *src)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_concat(Parrot_Interp interp,
    const STRING *a,
    const STRING *b)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_str_copy(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

const char * Parrot_str_cstring(Parrot_Interp interp, const STRING *str)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
STRING * Parrot_str_downcase(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_equal(Parrot_Interp interp,
    const STRING *s1,
    const STRING *s2)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_escape(Parrot_Interp interp, const STRING *src)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_escape_truncate(Parrot_Interp interp,
    const STRING *src,
    UINTVAL limit)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_find_cclass(Parrot_Interp interp,
    INTVAL flags,
    const STRING *s,
    UINTVAL offset,
    UINTVAL count)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_find_index(Parrot_Interp interp,
    const STRING *src,
    const STRING *search,
    INTVAL start)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_find_not_cclass(Parrot_Interp interp,
    INTVAL flags,
    const STRING *s,
    UINTVAL offset,
    UINTVAL count)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_find_reverse_index(Parrot_Interp interp,
    const STRING *src,
    const STRING *search,
    INTVAL start)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_str_finish(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_format_data(Parrot_Interp interp,
    const char *format,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_str_free_cstring(char *p);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_str_from_int(Parrot_Interp interp, INTVAL i)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_str_from_num(Parrot_Interp interp, FLOATVAL f)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_from_platform_cstring(Parrot_Interp interp,
    const char *c)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_str_gc_register(Parrot_Interp interp, STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_str_gc_unregister(Parrot_Interp interp, STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_indexed(Parrot_Interp interp, const STRING *s, INTVAL idx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_str_init(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_is_cclass(Parrot_Interp interp,
    INTVAL flags,
    const STRING *s,
    UINTVAL offset)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__hot__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
INTVAL Parrot_str_is_null(Parrot_Interp interp, const STRING *s);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING* Parrot_str_join(Parrot_Interp interp,
    STRING *j,
    PMC *ar)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_length(Parrot_Interp interp, const STRING *s);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

STRING * Parrot_str_new(Parrot_Interp interp,
    const char *buffer,
    const UINTVAL len)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_str_new_constant(Parrot_Interp interp, const char *buffer)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

STRING * Parrot_str_new_from_buffer(Parrot_Interp interp,
    Parrot_Buffer *buffer,
    const UINTVAL len)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_str_new_init(Parrot_Interp interp,
    const char *buffer,
    UINTVAL len,
    const STR_VTABLE *encoding,
    UINTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(4)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_new_noinit(Parrot_Interp interp, UINTVAL capacity)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_not_equal(Parrot_Interp interp,
    const STRING *s1,
    const STRING *s2)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_str_pin(Parrot_Interp interp, STRING *s)
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))


__attribute__((__pure__)) __attribute__((__warn_unused_result__))
const STR_VTABLE * Parrot_str_rep_compatible(Parrot_Interp interp,
    const STRING *a,
    const STRING *b)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_repeat(Parrot_Interp interp,
    const STRING *s,
    UINTVAL num)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_str_replace(Parrot_Interp interp,
    const STRING *src,
    INTVAL offset,
    INTVAL length,
    const STRING *rep)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(5)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_reverse(Parrot_Interp interp, const STRING *src)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_str_split(Parrot_Interp interp,
    const STRING *delim,
    const STRING *str)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_str_substr(Parrot_Interp interp,
    const STRING *src,
    INTVAL offset,
    INTVAL length)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
STRING * Parrot_str_titlecase(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

char * Parrot_str_to_cstring(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

char * Parrot_str_to_encoded_cstring(Parrot_Interp interp,
    const STRING *s,
    const STR_VTABLE *enc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
size_t Parrot_str_to_hashval(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_str_to_int(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
FLOATVAL Parrot_str_to_num(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
char * Parrot_str_to_platform_cstring(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_unescape(Parrot_Interp interp,
    const char *cstring,
    char delimiter,
    const char *enc_char)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

STRING * Parrot_str_unescape_string(Parrot_Interp interp,
    const STRING *src,
    const STR_VTABLE *encoding,
    UINTVAL flags)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_str_unpin(Parrot_Interp interp, STRING *s)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
STRING * Parrot_str_upcase(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__((__warn_unused_result__))

STRING * Parrot_str_clone(Parrot_Interp interp, const STRING *s)
        __attribute__((__nonnull__(1)));

__attribute__((__warn_unused_result__))

STRING * Parrot_str_extract_chars(Parrot_Interp interp,
    const char *buffer,
    UINTVAL len,
    INTVAL chars,
    const STR_VTABLE *encoding)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(5)));

__attribute__((__warn_unused_result__))

STRING * Parrot_str_from_int_base(Parrot_Interp interp,
    char *tc,
    HUGEINTVAL num,
    unsigned int base)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__((__warn_unused_result__))

STRING* Parrot_str_from_uint(Parrot_Interp interp,
    char *tc,
    UHUGEINTVAL num,
    unsigned int base,
    int minus)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

INTVAL Parrot_str_iter_index(Parrot_Interp interp,
    const STRING *src,
    String_iter *start,
    String_iter *end,
    const STRING *search)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
       
        ;


__attribute__((__warn_unused_result__))
STRING * Parrot_str_iter_substr(Parrot_Interp interp,
    const STRING *str,
    const String_iter *l,
    const String_iter *r)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__((__warn_unused_result__))

STRING * Parrot_str_new_from_cstring(Parrot_Interp interp,
    const char *buffer,
    STRING *encodingname)
        __attribute__((__nonnull__(1)));
# 684 "./include/parrot/string_funcs.h"
__attribute__ ((visibility("default")))
int Parrot_eprintf(Parrot_Interp interp, const char *s, ...)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
int Parrot_fprintf(Parrot_Interp interp,
    Parrot_PMC pio,
    const char *s,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
int Parrot_printf(Parrot_Interp interp, const char *s, ...)
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_psprintf(Parrot_Interp interp,
    STRING *pat,
    PMC *ary)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

int
Parrot_secret_snprintf(
    char *buffer,
    size_t len,
    const char *format,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
void Parrot_snprintf(Parrot_Interp interp,
    char *targ,
    size_t len,
    const char *pat,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_sprintf_c(Parrot_Interp interp, const char *pat, ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_sprintf_s(Parrot_Interp interp, STRING *pat, ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
int Parrot_vfprintf(Parrot_Interp interp,
    Parrot_PMC pio,
    const char *s,
    va_list args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_vsnprintf(Parrot_Interp interp,
    char *targ,
    size_t len,
    const char *pat,
    va_list args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        ;

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_vsprintf_c(Parrot_Interp interp,
    const char *pat,
    va_list args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_vsprintf_s(Parrot_Interp interp, STRING *pat, va_list args)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 265 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/misc.h" 1
# 34 "./include/parrot/misc.h"
typedef int (*reg_move_func)(Parrot_Interp interp, unsigned char d, unsigned char s, void *);




__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
INTVAL Parrot_util_byte_index(Parrot_Interp interp,
    const STRING *base,
    const STRING *search,
    UINTVAL start_offset)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
INTVAL Parrot_util_byte_rindex(Parrot_Interp interp,
    const STRING *base,
    const STRING *search,
    UINTVAL start_offset)
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
FLOATVAL Parrot_util_float_rand(INTVAL how_random);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_util_int_rand(INTVAL how_random);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_util_range_rand(INTVAL from, INTVAL to, INTVAL how_random);

__attribute__ ((visibility("default")))
void Parrot_util_srand(INTVAL seed);

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_util_tm_to_array(Parrot_Interp interp, const struct tm *tm)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_util_uint_rand(INTVAL how_random);

__attribute__((__const__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
FLOATVAL Parrot_util_floatval_mod(FLOATVAL n2, FLOATVAL n3);

__attribute__((__const__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
INTVAL Parrot_util_intval_mod(INTVAL i2, INTVAL i3);

void Parrot_util_quicksort(Parrot_Interp interp,
    void **data,
    UINTVAL n,
    PMC *cmp,
    const char * cmp_signature)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(4)))
        __attribute__((__nonnull__(5)))
        ;
# 266 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/sub.h" 1
# 16 "./include/parrot/sub.h"
typedef enum {

    SUB_FLAG_CORO_FF = PObj_private0_FLAG,
    SUB_FLAG_C_HANDLER = PObj_private0_FLAG,
    SUB_FLAG_TAILCALL = PObj_private2_FLAG,
    SUB_FLAG_GENERATOR = PObj_private3_FLAG,



    SUB_FLAG_IS_OUTER = PObj_private1_FLAG,
    SUB_FLAG_PF_ANON = PObj_private3_FLAG,
    SUB_FLAG_PF_MAIN = PObj_private4_FLAG,
    SUB_FLAG_PF_LOAD = PObj_private5_FLAG,
    SUB_FLAG_PF_IMMEDIATE = PObj_private6_FLAG,
    SUB_FLAG_PF_POSTCOMP = PObj_private7_FLAG,

    SUB_FLAG_PF_MASK = SUB_FLAG_PF_ANON
                          | SUB_FLAG_PF_LOAD
                          | SUB_FLAG_PF_IMMEDIATE
                          | SUB_FLAG_PF_POSTCOMP
} sub_flags_enum;
# 53 "./include/parrot/sub.h"
typedef enum {
    SUB_COMP_FLAG_BIT_0 = ((UINTVAL)1 << (0)),
    SUB_COMP_FLAG_BIT_1 = ((UINTVAL)1 << (1)),
    SUB_COMP_FLAG_VTABLE = SUB_COMP_FLAG_BIT_1,
    SUB_COMP_FLAG_BIT_2 = ((UINTVAL)1 << (2)),
    SUB_COMP_FLAG_METHOD = SUB_COMP_FLAG_BIT_2,
    SUB_COMP_FLAG_BIT_3 = ((UINTVAL)1 << (3)),
    SUB_COMP_FLAG_BIT_4 = ((UINTVAL)1 << (4)),
    SUB_COMP_FLAG_BIT_5 = ((UINTVAL)1 << (5)),
    SUB_COMP_FLAG_BIT_6 = ((UINTVAL)1 << (6)),
    SUB_COMP_FLAG_BIT_7 = ((UINTVAL)1 << (7)),
    SUB_COMP_FLAG_BIT_8 = ((UINTVAL)1 << (8)),
    SUB_COMP_FLAG_BIT_9 = ((UINTVAL)1 << (9)),
    SUB_COMP_FLAG_BIT_10 = ((UINTVAL)1 << (10)),
    SUB_COMP_FLAG_PF_INIT = SUB_COMP_FLAG_BIT_10,
    SUB_COMP_FLAG_BIT_11 = ((UINTVAL)1 << (11)),
    SUB_COMP_FLAG_NSENTRY = SUB_COMP_FLAG_BIT_11,
    SUB_COMP_FLAG_BIT_12 = ((UINTVAL)1 << (12)),
    SUB_COMP_FLAG_BIT_13 = ((UINTVAL)1 << (13)),
    SUB_COMP_FLAG_BIT_14 = ((UINTVAL)1 << (14)),
    SUB_COMP_FLAG_BIT_15 = ((UINTVAL)1 << (15)),
    SUB_COMP_FLAG_BIT_16 = ((UINTVAL)1 << (16)),
    SUB_COMP_FLAG_BIT_17 = ((UINTVAL)1 << (17)),
    SUB_COMP_FLAG_BIT_18 = ((UINTVAL)1 << (18)),
    SUB_COMP_FLAG_BIT_19 = ((UINTVAL)1 << (19)),
    SUB_COMP_FLAG_BIT_20 = ((UINTVAL)1 << (20)),
    SUB_COMP_FLAG_BIT_21 = ((UINTVAL)1 << (21)),
    SUB_COMP_FLAG_BIT_22 = ((UINTVAL)1 << (22)),
    SUB_COMP_FLAG_BIT_23 = ((UINTVAL)1 << (23)),
    SUB_COMP_FLAG_BIT_24 = ((UINTVAL)1 << (24)),
    SUB_COMP_FLAG_BIT_25 = ((UINTVAL)1 << (25)),
    SUB_COMP_FLAG_BIT_26 = ((UINTVAL)1 << (26)),
    SUB_COMP_FLAG_BIT_27 = ((UINTVAL)1 << (27)),
    SUB_COMP_FLAG_BIT_28 = ((UINTVAL)1 << (28)),
    SUB_COMP_FLAG_BIT_29 = ((UINTVAL)1 << (29)),
    SUB_COMP_FLAG_BIT_30 = ((UINTVAL)1 << (30)),
    SUB_COMP_FLAG_MASK = SUB_COMP_FLAG_VTABLE | SUB_COMP_FLAG_METHOD
                                | SUB_COMP_FLAG_NSENTRY | SUB_COMP_FLAG_PF_INIT
} sub_comp_flags_enum;
# 116 "./include/parrot/sub.h"
typedef struct Parrot_sub_arginfo {
    Parrot_UInt2 pos_required;
    Parrot_UInt2 pos_optional;
    Parrot_UInt2 named_required;
    Parrot_UInt2 named_optional;
    Parrot_UInt1 pos_slurpy;
    Parrot_UInt1 named_slurpy;
} Parrot_sub_arginfo;
# 138 "./include/parrot/sub.h"
typedef struct Parrot_Sub_attributes Parrot_sub;
typedef struct Parrot_Coroutine_attributes Parrot_coro;
typedef struct Parrot_Continuation_attributes Parrot_cont;



typedef struct Parrot_Context_info {
    STRING *subname;
    STRING *nsname;
    STRING *fullname;
    STRING *file;
    opcode_t *address;
    int pc;
    int line;
} Parrot_Context_info;




__attribute__ ((visibility("default")))

void * Parrot_get_sub_pmc_from_subclass(Parrot_Interp interp, PMC *subclass)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_sub_capture_lex(Parrot_Interp interp, PMC *sub_pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
int Parrot_sub_context_get_info(Parrot_Interp interp,
    PMC *ctx,
    Parrot_Context_info *info)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING* Parrot_sub_Context_infostr(Parrot_Interp interp,
    PMC *ctx,
    int is_top)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING* Parrot_sub_full_sub_name(Parrot_Interp interp, PMC* sub_pmc)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC* Parrot_sub_new_closure(Parrot_Interp interp, PMC *sub_pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_sub_continuation_check(Parrot_Interp interp, const PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_sub_continuation_rewind_environment(Parrot_Interp interp,
    PMC *pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__warn_unused_result__))
PMC* Parrot_sub_find_dynamic_pad(Parrot_Interp interp,
    STRING *lex_name,
    PMC *ctx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


__attribute__((__warn_unused_result__))
PMC* Parrot_sub_find_pad(Parrot_Interp interp,
    STRING *lex_name,
    PMC *ctx)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


STRING * Parrot_sub_get_filename_from_pc(Parrot_Interp interp,
    PMC *subpmc,
    opcode_t *pc)
        __attribute__((__nonnull__(1)));

INTVAL Parrot_sub_get_line_from_pc(Parrot_Interp interp,
    PMC *subpmc,
    opcode_t *pc)
        __attribute__((__nonnull__(1)));
# 267 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/key.h" 1
# 24 "./include/parrot/key.h"
typedef enum {
    KEY_integer_FLAG = PObj_private0_FLAG,
    KEY_string_FLAG = PObj_private2_FLAG,
    KEY_pmc_FLAG = PObj_private3_FLAG,
    KEY_register_FLAG = PObj_private4_FLAG,

    KEY_type_FLAGS = KEY_integer_FLAG |
                              KEY_string_FLAG |
                              KEY_pmc_FLAG |
                              KEY_register_FLAG

} KEY_flags;
# 60 "./include/parrot/key.h"
__attribute__ ((visibility("default")))


PMC * Parrot_key_append(Parrot_Interp interp, PMC *key1, PMC *key2)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_key_integer(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_key_mark(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_key_new(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_key_new_cstring(Parrot_Interp interp, const char *value)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_key_new_integer(Parrot_Interp interp, INTVAL value)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_key_new_string(Parrot_Interp interp, STRING *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_key_next(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_key_pmc(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_key_set_integer(Parrot_Interp interp, PMC *key, INTVAL value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_key_set_register(Parrot_Interp interp,
    PMC *key,
    INTVAL value,
    INTVAL flag)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

__attribute__ ((visibility("default")))
void Parrot_key_set_string(Parrot_Interp interp,
    PMC *key,
    STRING *value)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        ;

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
STRING * Parrot_key_set_to_string(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_key_string(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
__attribute__((__warn_unused_result__))
INTVAL Parrot_key_type(Parrot_Interp interp, const PMC *key)
        __attribute__((__nonnull__(2)));
# 269 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/exit.h" 1
# 17 "./include/parrot/exit.h"
typedef void (*exit_handler_f)(Parrot_Interp interp, int , void *);

typedef struct _handler_node_t {
    exit_handler_f function;
    void *arg;
    struct _handler_node_t *next;
} handler_node_t;
# 46 "./include/parrot/exit.h"
__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_x_exit(Parrot_Interp interp, int status)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_x_jump_out(Parrot_Interp interp, int status);

__attribute__ ((visibility("default")))
void Parrot_x_on_exit(Parrot_Interp interp,
    exit_handler_f function,
    void *arg)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_x_panic_and_exit(
    Parrot_Interp interp,
    const char *message,
    const char *file,
    unsigned int line);

__attribute__((__cold__))

void Parrot_x_execute_on_exit_handlers(Parrot_Interp interp, int status)
        __attribute__((__nonnull__(1)));

__attribute__((__noreturn__))
__attribute__((__cold__))
void Parrot_x_force_error_exit(
    Parrot_Interp interp,
    int exitcode,
    const char * format,
    ...)
        __attribute__((__nonnull__(3)));
# 270 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/nci.h" 1
# 16 "./include/parrot/nci.h"
typedef PMC *(*nci_fb_func_t)(Parrot_Interp interp, PMC *user_data, PMC *signature);
typedef void (*nci_thunk_t)(Parrot_Interp interp, PMC *, PMC *);
typedef void (*native_pcc_method_t)(Parrot_Interp interp, PMC *);

void Parrot_nci_load_core_thunks(Parrot_Interp interp);
void Parrot_nci_load_extra_thunks(Parrot_Interp interp);





PMC * build_call_func(Parrot_Interp interp, PMC *sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 40 "./include/parrot/nci.h"
void Parrot_nci_libffi_register(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 51 "./include/parrot/nci.h"

__attribute__ ((visibility("default")))
PMC * Parrot_nci_parse_signature(Parrot_Interp interp, STRING *sig_str)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))

STRING * Parrot_nci_describe_sig(Parrot_Interp interp, PMC *sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_nci_sig_to_pcc(Parrot_Interp interp,
    PMC *sig_pmc,
    STRING **params_sig,
    STRING **ret_sig)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;
# 271 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/scheduler.h" 1
# 21 "./include/parrot/scheduler.h"
__attribute__ ((visibility("default")))
void Parrot_cx_begin_execution(Parrot_Interp interp,
    PMC *main,
    PMC *argv)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_cx_check_alarms(Parrot_Interp interp, PMC *scheduler)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__ ((visibility("default")))
opcode_t* Parrot_cx_run_scheduler(Parrot_Interp interp,
    PMC *scheduler,
    opcode_t *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_cx_schedule_immediate(Parrot_Interp interp, PMC *task_or_sub)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

opcode_t * Parrot_cx_schedule_sleep(Parrot_Interp interp,
    FLOATVAL time,
    opcode_t *next)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_cx_schedule_task(Parrot_Interp interp, PMC *task_or_sub)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_cx_send_message(Parrot_Interp interp,
    STRING *messagetype,
    PMC *payload)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

PMC* Parrot_cx_stop_task(Parrot_Interp interp, opcode_t *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_cx_check_quantum(Parrot_Interp interp, PMC *scheduler)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


opcode_t* Parrot_cx_check_scheduler(Parrot_Interp interp, opcode_t *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));


__attribute__((__pure__)) __attribute__((__warn_unused_result__))
PMC* Parrot_cx_current_task(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_cx_disable_preemption(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_cx_enable_preemption(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_cx_init_scheduler(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_cx_next_task(Parrot_Interp interp, PMC *scheduler)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_cx_outer_runloop(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


opcode_t* Parrot_cx_preempt_task(Parrot_Interp interp,
    PMC *scheduler,
    opcode_t *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

void Parrot_cx_runloop_wake(Parrot_Interp interp, PMC *scheduler)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_cx_schedule_alarm(Parrot_Interp interp, PMC *alarm)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void Parrot_cx_set_scheduler_alarm(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 186 "./include/parrot/scheduler.h"
typedef enum {
    PARROT_TIMER_SEC,
    PARROT_TIMER_USEC,
    PARROT_TIMER_NSEC,
    PARROT_TIMER_REPEAT,
    PARROT_TIMER_INTERVAL,
    PARROT_TIMER_RUNNING,
    PARROT_TIMER_HANDLER,
    PARROT_TIMER_MAX,
    PARROT_ALARM_TIME,
    PARROT_ALARM_TASK
} parrot_timer_enum_t;
# 273 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/oo.h" 1
# 16 "./include/parrot/oo.h"
typedef enum {
    PCD_PARENTS,
    PCD_CLASS_NAME,
    PCD_ATTRIBUTES,
    PCD_CLASS_ATTRIBUTES,
    PCD_OBJECT_VTABLE,
    PCD_MAX
} PARROT_CLASS_DATA_ENUM;
# 46 "./include/parrot/oo.h"
__attribute__ ((visibility("default")))
void Parrot_ComposeRole(Parrot_Interp interp,
    PMC *role,
    PMC *exclude,
    int got_exclude,
    PMC *alias,
    int got_alias,
    PMC *methods_hash,
    PMC *roles_list)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(5)))
        __attribute__((__nonnull__(7)))
        __attribute__((__nonnull__(8)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_ComputeMRO_C3(Parrot_Interp interp, PMC *_class)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_find_method_direct(Parrot_Interp interp,
    PMC *_class,
    STRING *method_name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_find_method_with_cache(Parrot_Interp interp,
    PMC *_class,
    STRING *method_name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
INTVAL Parrot_get_vtable_index(Parrot_Interp interp, const STRING *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))

const char * Parrot_get_vtable_name(Parrot_Interp interp, INTVAL idx);

__attribute__ ((visibility("default")))
void Parrot_invalidate_method_cache(Parrot_Interp interp,
    STRING *_class)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_oo_find_vtable_override(Parrot_Interp interp,
    PMC *classobj,
    STRING *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_oo_find_vtable_override_for_class(Parrot_Interp interp,
    PMC *classobj,
    STRING *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_oo_get_class(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC * Parrot_oo_get_class_str(Parrot_Interp interp, STRING *name)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

PMC * Parrot_oo_new_class_pmc(Parrot_Interp interp, PMC *classtype)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

void destroy_object_cache(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void init_object_cache(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void mark_object_cache(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));


PMC * Parrot_oo_clone_object(Parrot_Interp interp,
    PMC *pmc,
    PMC *dest)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;

void Parrot_oo_extract_methods_from_namespace(Parrot_Interp interp,
    PMC *self,
    PMC *ns)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));


__attribute__((__warn_unused_result__))
PMC * Parrot_oo_newclass_from_str(Parrot_Interp interp, STRING *name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__((__warn_unused_result__))
INTVAL Parrot_oo_register_type(Parrot_Interp interp,
    PMC *name,
    PMC *_namespace)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));
# 274 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/vtables.h" 1
# 14 "./include/parrot/vtables.h"
__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

VTABLE * Parrot_vtbl_clone_vtable(Parrot_Interp interp,
    const VTABLE *base_vtable)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_vtbl_destroy_vtable(Parrot_Interp interp,
    VTABLE *vtable)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_vtbl_initialize_core_vtables(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__malloc__)) __attribute__((__warn_unused_result__))

VTABLE * Parrot_vtbl_new_vtable(Parrot_Interp interp);

void Parrot_vtbl_alloc_vtables(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_vtbl_free_vtables(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_vtbl_mark_vtables(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

void Parrot_vtbl_realloc_vtables(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 275 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/library.h" 1
# 14 "./include/parrot/library.h"
typedef enum {
    PARROT_RUNTIME_FT_LIBRARY = 0x0001,
    PARROT_RUNTIME_FT_INCLUDE = 0x0002,
    PARROT_RUNTIME_FT_DYNEXT = 0x0004,
    PARROT_RUNTIME_FT_LANG = 0x0010,
    PARROT_RUNTIME_FT_PBC = 0x0020,
    PARROT_RUNTIME_FT_PASM = 0x0100,
    PARROT_RUNTIME_FT_PIR = 0x0200,
    PARROT_RUNTIME_FT_PAST = 0x0400,
    PARROT_RUNTIME_FT_SOURCE = 0x0F00
} enum_runtime_ft;


typedef enum {
    PARROT_LIB_PATH_INCLUDE,
    PARROT_LIB_PATH_LIBRARY,
    PARROT_LIB_PATH_DYNEXT,
    PARROT_LIB_PATH_LANG,
    PARROT_LIB_DYN_EXTS,

    PARROT_LIB_PATH_SIZE
} enum_lib_paths;





__attribute__ ((visibility("default")))

STRING * Parrot_get_runtime_path(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_lib_add_path(Parrot_Interp interp,
    STRING *path_str,
    enum_lib_paths which)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_lib_add_path_from_cstring(Parrot_Interp interp,
    const char *path,
    enum_lib_paths which)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING* Parrot_lib_search_paths_as_string(Parrot_Interp interp,
    enum_runtime_ft type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_lib_update_paths_from_config_hash(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

__attribute__((__malloc__)) __attribute__((__warn_unused_result__))
char* Parrot_locate_runtime_file(Parrot_Interp interp,
    const char *file_name,
    enum_runtime_ft type)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING* Parrot_locate_runtime_file_str(Parrot_Interp interp,
    STRING *file,
    enum_runtime_ft type)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))


STRING * parrot_split_path_ext(Parrot_Interp interp,
    STRING *in,
    STRING **wo_ext,
    STRING **ext)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
        __attribute__((__nonnull__(4)))
       
        ;

void parrot_init_library_paths(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 277 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/namespace.h" 1
# 17 "./include/parrot/namespace.h"
__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_find_current_namespace_global(Parrot_Interp interp,
    STRING *globalname)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_find_global_from_op(Parrot_Interp interp,
    PMC *ns,
    STRING *globalname,
    void *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_find_named_item(Parrot_Interp interp,
    STRING *name,
    void *next)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_find_namespace_global(Parrot_Interp interp,
    PMC *ns,
    STRING *globalname)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_get_global(Parrot_Interp interp,
    PMC *ns,
    STRING *globalname)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_get_name(Parrot_Interp interp, PMC *_namespace)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_get_namespace_keyed(Parrot_Interp interp,
    PMC *base_ns,
    PMC *pmc_key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_get_namespace_keyed_str(Parrot_Interp interp,
    PMC *base_ns,
    STRING *str_key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__pure__)) __attribute__((__warn_unused_result__))
Parrot_PMC Parrot_ns_get_root_namespace(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_make_namespace_autobase(Parrot_Interp interp, PMC *key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_make_namespace_keyed(Parrot_Interp interp,
    PMC *base_ns,
    PMC *pmc_key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_ns_make_namespace_keyed_str(Parrot_Interp interp,
    PMC *base_ns,
    STRING *str_key)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_ns_set_global(Parrot_Interp interp,
    PMC *ns,
    STRING *globalname,
    PMC *val)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_ns_store_global(Parrot_Interp interp,
    PMC *ns,
    STRING *globalname,
    PMC *val)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_ns_store_sub(Parrot_Interp interp, PMC *sub_pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));
# 278 "./include/parrot/parrot.h" 2
# 1 "./include/parrot/hll.h" 1
# 19 "./include/parrot/hll.h"
__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_hll_get_ctx_HLL_namespace(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
INTVAL Parrot_hll_get_ctx_HLL_type(Parrot_Interp interp, INTVAL core_type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))
INTVAL Parrot_hll_get_HLL_id(Parrot_Interp interp, STRING *hll_name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

STRING * Parrot_hll_get_HLL_name(Parrot_Interp interp, INTVAL id)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC* Parrot_hll_get_HLL_namespace(Parrot_Interp interp, int hll_id)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
INTVAL Parrot_hll_get_HLL_type(Parrot_Interp interp,
    INTVAL hll_id,
    INTVAL core_type)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
void Parrot_hll_regenerate_HLL_namespaces(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

INTVAL
Parrot_hll_register_HLL(Parrot_Interp interp,
    STRING *hll_name)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)));

__attribute__ ((visibility("default")))
void Parrot_hll_register_HLL_type(Parrot_Interp interp,
    INTVAL hll_id,
    INTVAL core_type,
    INTVAL hll_type)
        __attribute__((__nonnull__(1)));

void Parrot_hll_init_HLL(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));
# 102 "./include/parrot/hll.h"
typedef enum HLL_enum_t {
    e_HLL_name,
    e_HLL_typemap,
    e_HLL_id,
    e_HLL_MAX
} HLL_enum_t;
# 279 "./include/parrot/parrot.h" 2

# 1 "./include/parrot/disassemble.h" 1
# 16 "./include/parrot/disassemble.h"
typedef enum {
    enum_DIS_BARE = 1,
    enum_DIS_HEADER = 2
} Parrot_disassemble_options;




__attribute__ ((visibility("default")))
void Parrot_disassemble(Parrot_Interp interp,
    const char *outfile,
    Parrot_disassemble_options options)
        __attribute__((__nonnull__(1)));
# 281 "./include/parrot/parrot.h" 2
# 15 "src/pmc/integer.c" 2
# 1 "./include/parrot/extend.h" 1
# 39 "./include/parrot/extend.h"
# 1 "./include/parrot/extend_vtable.h" 1
# 15 "./include/parrot/extend_vtable.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 16 "./include/parrot/extend_vtable.h" 2

__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_absolute( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_add( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_add_attribute( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String name, Parrot_PMC type );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_add_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_add_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_add_method( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String method_name, Parrot_PMC sub_pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_add_parent( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC parent );
__attribute__ ((visibility("default"))) void Parrot_PMC_add_role( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC role );
__attribute__ ((visibility("default"))) void Parrot_PMC_add_vtable_override( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String vtable_name, Parrot_PMC sub_pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_assign_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_assign_string_native( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String value );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_clone( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_clone_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC args );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_cmp( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_cmp_num( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_cmp_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_cmp_string( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_concatenate( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_concatenate_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_decrement( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_defined( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_defined_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_defined_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_defined_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) void Parrot_PMC_delete_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) void Parrot_PMC_delete_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) void Parrot_PMC_delete_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_divide( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_divide_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_divide_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_does( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String role );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_does_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC role );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_elements( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_exists_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_exists_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_exists_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_find_method( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String method_name );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_floor_divide( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_floor_divide_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_floor_divide_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_freeze( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC info );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_attr_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, Parrot_String idx );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_attr_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String idx );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_get_bool( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_class( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_get_integer( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_get_integer_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_get_integer_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_get_integer_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_iter( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_namespace( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Float Parrot_PMC_get_number( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Float Parrot_PMC_get_number_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) Parrot_Float Parrot_PMC_get_number_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) Parrot_Float Parrot_PMC_get_number_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_pmc( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_pmc_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_pmc_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_get_pmc_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) void* Parrot_PMC_get_pointer( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void* Parrot_PMC_get_pointer_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) void* Parrot_PMC_get_pointer_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) void* Parrot_PMC_get_pointer_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_get_repr( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_get_string( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_get_string_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_get_string_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_get_string_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_hashvalue( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_absolute( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_add( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_add_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_add_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_concatenate( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_concatenate_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_divide( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_divide_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_divide_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_floor_divide( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_floor_divide_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_floor_divide_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_modulus( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_modulus_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_modulus_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_multiply( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_multiply_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_multiply_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_neg( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_repeat( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_repeat_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_subtract( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_subtract_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_i_subtract_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_increment( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_init( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_init_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int initializer );
__attribute__ ((visibility("default"))) void Parrot_PMC_init_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC initializer );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_inspect( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_inspect_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String what );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_instantiate( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC sig );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_is_equal( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_is_equal_num( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_is_equal_string( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_is_same( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_isa( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String _class );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_isa_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC _class );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_modulus( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_modulus_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_modulus_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_morph( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC type );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_multiply( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_multiply_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_multiply_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_name( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_neg( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_Float Parrot_PMC_pop_float( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_pop_integer( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_pop_pmc( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_pop_string( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_push_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_push_integer( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_push_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_push_string( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String value );
__attribute__ ((visibility("default"))) void Parrot_PMC_remove_attribute( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String name );
__attribute__ ((visibility("default"))) void Parrot_PMC_remove_method( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String method_name );
__attribute__ ((visibility("default"))) void Parrot_PMC_remove_parent( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC parent );
__attribute__ ((visibility("default"))) void Parrot_PMC_remove_role( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC role );
__attribute__ ((visibility("default"))) void Parrot_PMC_remove_vtable_override( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String vtable_name );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_repeat( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_repeat_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_attr_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, Parrot_String idx, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_attr_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String idx, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_bool( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_integer_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_integer_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_integer_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_integer_native( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_number_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_number_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_number_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_number_native( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pmc_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pmc_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pmc_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pointer( Parrot_Interp interp, Parrot_PMC pmc, void* value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pointer_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, void* value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pointer_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key, void* value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_pointer_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key, void* value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_string_keyed( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC key, Parrot_String value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_string_keyed_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int key, Parrot_String value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_string_keyed_str( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String key, Parrot_String value );
__attribute__ ((visibility("default"))) void Parrot_PMC_set_string_native( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String value );
__attribute__ ((visibility("default"))) Parrot_Float Parrot_PMC_shift_float( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_shift_integer( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_shift_pmc( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_shift_string( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_splice( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_Int offset, Parrot_Int count );
__attribute__ ((visibility("default"))) Parrot_String Parrot_PMC_substr( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int offset, Parrot_Int length );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_subtract( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_subtract_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) Parrot_PMC Parrot_PMC_subtract_int( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value, Parrot_PMC dest );
__attribute__ ((visibility("default"))) void Parrot_PMC_thaw( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC info );
__attribute__ ((visibility("default"))) void Parrot_PMC_thawfinish( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC info );
__attribute__ ((visibility("default"))) Parrot_Int Parrot_PMC_type( Parrot_Interp interp, Parrot_PMC pmc );
__attribute__ ((visibility("default"))) void Parrot_PMC_unshift_float( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Float value );
__attribute__ ((visibility("default"))) void Parrot_PMC_unshift_integer( Parrot_Interp interp, Parrot_PMC pmc, Parrot_Int value );
__attribute__ ((visibility("default"))) void Parrot_PMC_unshift_pmc( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC value );
__attribute__ ((visibility("default"))) void Parrot_PMC_unshift_string( Parrot_Interp interp, Parrot_PMC pmc, Parrot_String value );
__attribute__ ((visibility("default"))) void Parrot_PMC_visit( Parrot_Interp interp, Parrot_PMC pmc, Parrot_PMC info );
# 40 "./include/parrot/extend.h" 2




__attribute__ ((visibility("default")))
void Parrot_ext_call(Parrot_Interp interp,
    Parrot_PMC sub_pmc,
    const char *signature,
    ...)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)));

__attribute__ ((visibility("default")))
void Parrot_ext_try(Parrot_Interp interp,
    void (*cfunction)(Parrot_Interp, void *)
                          ,
    void (*chandler)(Parrot_Interp, PMC *, void *)

                          ,
    void *data)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
Parrot_Int Parrot_PMC_typenum(Parrot_Interp interp,
    const char *_class)
        __attribute__((__nonnull__(1)));
# 16 "src/pmc/integer.c" 2
# 1 "./include/parrot/dynext.h" 1
# 14 "./include/parrot/dynext.h"
typedef PMC *(*dynext_load_func)(Parrot_Interp interp);
typedef void (*dynext_init_func)(Parrot_Interp interp, PMC *);




__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_dyn_clone_lib_into(
    Interp *d,
    Interp *s,
    PMC *lib_pmc)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        __attribute__((__nonnull__(3)))
       
        ;

__attribute__ ((visibility("default")))

void * Parrot_dyn_dlsym_str(Parrot_Interp interp,
    void *handle,
    const STRING *symbol)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))

PMC * Parrot_dyn_init_lib(Parrot_Interp interp,
    dynext_load_func load_func,
    dynext_init_func init_func)
        __attribute__((__nonnull__(1)));

__attribute__ ((visibility("default")))
__attribute__((__warn_unused_result__))

PMC * Parrot_dyn_load_lib(Parrot_Interp interp,
    STRING *lib,
    PMC *parameters)
        __attribute__((__nonnull__(1)));
# 17 "src/pmc/integer.c" 2
# 1 "./include/pmc/pmc_fixedintegerarray.h" 1
# 18 "./include/pmc/pmc_fixedintegerarray.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_FixedIntegerArray_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_FixedIntegerArray_ro_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_FixedIntegerArray_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_FixedIntegerArray_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_FixedIntegerArray_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_FixedIntegerArray_get_isa(Parrot_Interp interp, Hash* isa);


typedef struct Parrot_FixedIntegerArray_attributes {
    INTVAL size;
    INTVAL * int_array;
} Parrot_FixedIntegerArray_attributes;
# 18 "src/pmc/integer.c" 2
# 1 "./include/pmc/pmc_integer.h" 1
# 18 "./include/pmc/pmc_integer.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_Integer_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_Integer_ro_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_Integer_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_Integer_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_Integer_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_Integer_get_isa(Parrot_Interp interp, Hash* isa);


typedef struct Parrot_Integer_attributes {
    INTVAL iv;
} Parrot_Integer_attributes;
# 19 "src/pmc/integer.c" 2
# 1 "./include/pmc/pmc_scalar.h" 1
# 18 "./include/pmc/pmc_scalar.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_scalar_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_scalar_ro_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_scalar_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_scalar_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_scalar_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_scalar_get_isa(Parrot_Interp interp, Hash* isa);
# 20 "src/pmc/integer.c" 2
# 1 "./include/pmc/pmc_default.h" 1
# 18 "./include/pmc/pmc_default.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_default_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_default_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_default_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_default_get_isa(Parrot_Interp interp, Hash* isa);
# 21 "src/pmc/integer.c" 2
# 1 "src/pmc/integer.str" 1
# 22 "src/pmc/integer.c" 2
# 1 "./include/pmc/pmc_continuation.h" 1
# 18 "./include/pmc/pmc_continuation.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_Continuation_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_Continuation_ro_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_Continuation_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_Continuation_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_Continuation_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_Continuation_get_isa(Parrot_Interp interp, Hash* isa);


typedef struct Parrot_Continuation_attributes {
    PackFile_ByteCode * seg;
    opcode_t * address;
    PMC * to_ctx;
    PMC * to_call_object;
    PMC * from_ctx;
    INTVAL runloop_id;
    INTVAL invoked;
} Parrot_Continuation_attributes;
# 23 "src/pmc/integer.c" 2
# 1 "./include/pmc/pmc_callcontext.h" 1
# 24 "src/pmc/integer.c" 2
# 1 "./src/pmc/integer.pmc"
# 21 "./src/pmc/integer.pmc"
# 1 "./include/pmc/pmc_bigint.h" 1
# 18 "./include/pmc/pmc_bigint.h"
__attribute__ ((visibility("default"))) VTABLE* Parrot_BigInt_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_BigInt_ro_update_vtable(VTABLE*);
__attribute__ ((visibility("default"))) VTABLE* Parrot_BigInt_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) VTABLE* Parrot_BigInt_ro_get_vtable(Parrot_Interp interp);
__attribute__ ((visibility("default"))) PMC* Parrot_BigInt_get_mro(Parrot_Interp interp, PMC* mro);
__attribute__ ((visibility("default"))) Hash* Parrot_BigInt_get_isa(Parrot_Interp interp, Hash* isa);


typedef struct Parrot_BigInt_attributes {
    struct BIGINT * bi;
} Parrot_BigInt_attributes;
# 22 "./src/pmc/integer.pmc" 2





static void maybe_throw_overflow_error(Parrot_Interp interp)
        __attribute__((__nonnull__(1)));



static PMC* upgrade_self_to_bignum(Parrot_Interp interp, PMC *self)
        __attribute__((__nonnull__(1)))
        __attribute__((__nonnull__(2)))
        ;
# 57 "./src/pmc/integer.pmc"
static void
maybe_throw_overflow_error(Parrot_Interp interp)
{
   




    if ((((Parrot_Context *)(((interp)->ctx))->data)->errors & ((PARROT_ERRORS_OVERFLOW_FLAG))))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_ERR_OVERFLOW,
            "Integer overflow");
}
# 80 "./src/pmc/integer.pmc"


static PMC*
upgrade_self_to_bignum(Parrot_Interp interp, PMC *self)
{
   



    const INTVAL a = (self)->vtable->get_integer(interp, self);
    Parrot_pmc_reuse(interp, self, enum_class_BigInt, 0);
    (self)->vtable->set_integer_native(interp, self, a);
    return self;
}
# 118 "./src/pmc/integer.c"
static PMC * Parrot_Integer_absolute(Parrot_Interp interp, PMC *_self, PMC *dest);
static PMC * Parrot_Integer_add(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_add_int(Parrot_Interp interp, PMC *_self, INTVAL b, PMC *dest);
static PMC * Parrot_Integer_clone(Parrot_Interp interp, PMC *_self);
static INTVAL Parrot_Integer_cmp(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_cmp_num(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_decrement(Parrot_Interp interp, PMC *_self);
static PMC * Parrot_Integer_divide(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_floor_divide(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_floor_divide_float(Parrot_Interp interp, PMC *_self, FLOATVAL value, PMC *dest_unused __attribute__((__unused__)));
static PMC * Parrot_Integer_floor_divide_int(Parrot_Interp interp, PMC *_self, INTVAL value, PMC *dest_unused __attribute__((__unused__)));
static void Parrot_Integer_freeze(Parrot_Interp interp, PMC *_self, PMC *info);
static INTVAL Parrot_Integer_get_bool(Parrot_Interp interp, PMC *_self);
static INTVAL Parrot_Integer_get_integer(Parrot_Interp interp, PMC *_self);
static FLOATVAL Parrot_Integer_get_number(Parrot_Interp interp, PMC *_self);
static void * Parrot_Integer_get_pointer(Parrot_Interp interp, PMC *_self);
static STRING * Parrot_Integer_get_repr(Parrot_Interp interp, PMC *_self);
static STRING * Parrot_Integer_get_string(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_i_absolute(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_i_add(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_i_add_float(Parrot_Interp interp, PMC *_self, FLOATVAL value);
static void Parrot_Integer_i_add_int(Parrot_Interp interp, PMC *_self, INTVAL b);
static void Parrot_Integer_i_divide(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_i_floor_divide(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_i_floor_divide_float(Parrot_Interp interp, PMC *_self, FLOATVAL value);
static void Parrot_Integer_i_floor_divide_int(Parrot_Interp interp, PMC *_self, INTVAL value);
static void Parrot_Integer_i_modulus(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_i_modulus_float(Parrot_Interp interp, PMC *_self, FLOATVAL value);
static void Parrot_Integer_i_modulus_int(Parrot_Interp interp, PMC *_self, INTVAL value);
static void Parrot_Integer_i_multiply(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_i_multiply_float(Parrot_Interp interp, PMC *_self, FLOATVAL value);
static void Parrot_Integer_i_multiply_int(Parrot_Interp interp, PMC *_self, INTVAL b);
static void Parrot_Integer_i_neg(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_i_subtract(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_i_subtract_float(Parrot_Interp interp, PMC *_self, FLOATVAL value);
static void Parrot_Integer_i_subtract_int(Parrot_Interp interp, PMC *_self, INTVAL b);
static void Parrot_Integer_increment(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_init(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_init_int(Parrot_Interp interp, PMC *_self, INTVAL init);
static void Parrot_Integer_init_pmc(Parrot_Interp interp, PMC *_self, PMC *init);
static INTVAL Parrot_Integer_is_equal(Parrot_Interp interp, PMC *_self, PMC *value);
static PMC * Parrot_Integer_modulus(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_modulus_float(Parrot_Interp interp, PMC *_self, FLOATVAL value, PMC *dest_unused __attribute__((__unused__)));
static PMC * Parrot_Integer_modulus_int(Parrot_Interp interp, PMC *_self, INTVAL value, PMC *dest_unused __attribute__((__unused__)));
static PMC * Parrot_Integer_multiply(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multiply_int(Parrot_Interp interp, PMC *_self, INTVAL b, PMC *dest);
static PMC * Parrot_Integer_neg(Parrot_Interp interp, PMC *_self, PMC *dest_unused __attribute__((__unused__)));
static void Parrot_Integer_set_bool(Parrot_Interp interp, PMC *_self, INTVAL value);
static void Parrot_Integer_set_integer_native(Parrot_Interp interp, PMC *_self, INTVAL value);
static void Parrot_Integer_set_number_native(Parrot_Interp interp, PMC *_self, FLOATVAL value);
static void Parrot_Integer_set_pmc(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_set_string_native(Parrot_Interp interp, PMC *_self, STRING *value);
static PMC * Parrot_Integer_subtract(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_subtract_int(Parrot_Interp interp, PMC *_self, INTVAL b, PMC *dest);
static void Parrot_Integer_thaw(Parrot_Interp interp, PMC *_self, PMC *info);
static PMC * Parrot_Integer_multi_add_Integer_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_add_Complex_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_add_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_add_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static void Parrot_Integer_multi_i_add_Integer(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_add_Complex(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_add_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static PMC * Parrot_Integer_multi_subtract_Integer_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_subtract_Complex_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_subtract_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_subtract_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static void Parrot_Integer_multi_i_subtract_Integer(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_subtract_Complex(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_subtract_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static PMC * Parrot_Integer_multi_multiply_Integer_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_multiply_Complex_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_multiply_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_multiply_String_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_multiply_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)));
static PMC * Parrot_Integer_multi_divide_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_divide_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)));
static void Parrot_Integer_multi_i_divide_BigInt(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_divide_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static PMC * Parrot_Integer_multi_floor_divide_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_floor_divide_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)));
static void Parrot_Integer_multi_i_floor_divide_BigInt(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_floor_divide_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static PMC * Parrot_Integer_multi_modulus_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest);
static PMC * Parrot_Integer_multi_modulus_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)));
static void Parrot_Integer_multi_i_modulus_BigInt(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_multi_i_modulus_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_multi_cmp_String(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_multi_cmp_Float(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_multi_cmp_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_multi_cmp_num_String(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_multi_cmp_num_Float(Parrot_Interp interp, PMC *_self, PMC *value);
static INTVAL Parrot_Integer_multi_cmp_num_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value);
static void Parrot_Integer_nci_get_as_base(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_nci_set_random(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_add_Integer_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_add_Complex_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_add_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_add_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_add_Integer_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_add_Complex_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_add_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_subtract_Integer_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_subtract_Complex_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_subtract_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_subtract_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_subtract_Integer_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_subtract_Complex_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_subtract_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_multiply_Integer_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_multiply_Complex_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_multiply_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_multiply_String_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_multiply_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_divide_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_divide_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_divide_BigInt_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_divide_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_floor_divide_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_floor_divide_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_floor_divide_BigInt_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_floor_divide_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_modulus_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_modulus_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_modulus_BigInt_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_i_modulus_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_cmp_String_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_cmp_Float_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_cmp_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_cmp_num_String_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_cmp_num_Float_pcc(Parrot_Interp interp, PMC *_self);
static void Parrot_Integer_multi_cmp_num_DEFAULT_pcc(Parrot_Interp interp, PMC *_self);
void Parrot_Integer_class_init(Parrot_Interp interp, int, int);
void Parrot_Integer_ro_class_init(Parrot_Interp interp, int, int);
static PMC *
Parrot_Integer_absolute(Parrot_Interp interp, PMC *_self, PMC *dest)
{
# 1226 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);

    if (a != (-9223372036854775807L - 1L))
        return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
                                               abs(a));
    else {
        PMC *promoted;
        maybe_throw_overflow_error(interp);
        promoted = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (promoted)->vtable->neg(interp, promoted, dest);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 269 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_add(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_Integer:
            return Parrot_Integer_multi_add_Integer_PMC(interp, _self, value, dest);
            break;
        case enum_class_Complex:
            return Parrot_Integer_multi_add_Complex_PMC(interp, _self, value, dest);
            break;
        case enum_class_BigInt:
            return Parrot_Integer_multi_add_BigInt_PMC(interp, _self, value, dest);
            break;
        case enum_class_core_max:
            {
                PMC *retval = PMCNULL;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "add", "PPP->P", _self, value, dest, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_add_DEFAULT_PMC(interp, _self, value, dest);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static PMC *
Parrot_Integer_add_int(Parrot_Interp interp, PMC *_self, INTVAL b, PMC *dest)
{
# 383 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a + b;

    if ((c^a) >= 0 || (c^b) >= 0)
        return Parrot_pmc_new_init_int(interp,
                (_self)->vtable->type(interp, _self), c);
    else {
        PMC *temp;
        maybe_throw_overflow_error(interp);
        temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (temp)->vtable->add_int(interp, temp, b, dest);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 320 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_clone(Parrot_Interp interp, PMC *_self)
{
# 144 "./src/pmc/integer.pmc"
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);

    return Parrot_pmc_new_init_int(interp, _self->vtable->base_type,
        (_self)->vtable->get_integer(interp, _self));
# 330 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_cmp(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_String:
            return Parrot_Integer_multi_cmp_String(interp, _self, value);
            break;
        case enum_class_Float:
            return Parrot_Integer_multi_cmp_Float(interp, _self, value);
            break;
        case enum_class_core_max:
            {
                INTVAL retval;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "cmp", "PP->I", _self, value, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_cmp_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static INTVAL
Parrot_Integer_cmp_num(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_String:
            return Parrot_Integer_multi_cmp_num_String(interp, _self, value);
            break;
        case enum_class_Float:
            return Parrot_Integer_multi_cmp_num_Float(interp, _self, value);
            break;
        case enum_class_core_max:
            {
                INTVAL retval;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "cmp_num", "PP->I", _self, value, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_cmp_num_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static void
Parrot_Integer_decrement(Parrot_Interp interp, PMC *_self)
{
# 1199 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a - 1;

    if ((c^a) >= 0 || (c^~1) >= 0)
        (_self)->vtable->set_integer_native(interp, _self, c);
    else {
        Parrot_pmc_reuse(interp, _self, enum_class_BigInt, 0);
        (_self)->vtable->set_integer_native(interp, _self, a);
        (_self)->vtable->decrement(interp, _self);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 404 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_divide(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_BigInt:
            return Parrot_Integer_multi_divide_BigInt_PMC(interp, _self, value, dest);
            break;
        case enum_class_core_max:
            {
                PMC *retval = PMCNULL;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "divide", "PPP->P", _self, value, dest, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_divide_DEFAULT_PMC(interp, _self, value, dest);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static PMC *
Parrot_Integer_floor_divide(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_BigInt:
            return Parrot_Integer_multi_floor_divide_BigInt_PMC(interp, _self, value, dest);
            break;
        case enum_class_core_max:
            {
                PMC *retval = PMCNULL;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "floor_divide", "PPP->P", _self, value, dest, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_floor_divide_DEFAULT_PMC(interp, _self, value, dest);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static PMC *
Parrot_Integer_floor_divide_float(Parrot_Interp interp, PMC *_self, FLOATVAL value, PMC *dest_unused __attribute__((__unused__)))
{
# 842 "./src/pmc/integer.pmc"
    FLOATVAL f;

    if (((value) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    f = floor((_self)->vtable->get_number(interp, _self) / value);
    return Parrot_pmc_new_init_int(interp,
            (_self)->vtable->type(interp, _self), (INTVAL)f);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 470 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_floor_divide_int(Parrot_Interp interp, PMC *_self, INTVAL value, PMC *dest_unused __attribute__((__unused__)))
{
# 829 "./src/pmc/integer.pmc"
    FLOATVAL f;

    if (value == 0)
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    f = floor((_self)->vtable->get_number(interp, _self) / value);
    return Parrot_pmc_new_init_int(interp,
           (_self)->vtable->type(interp, _self), (INTVAL)f);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 486 "./src/pmc/integer.c"
}
static void
Parrot_Integer_freeze(Parrot_Interp interp, PMC *_self, PMC *info)
{
# 1290 "./src/pmc/integer.pmc"

    interp->vtables[enum_class_default]->freeze(interp, _self, info);
    (info)->vtable->push_integer(interp, info, (_self)->vtable->get_integer(interp, _self));
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 496 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_get_bool(Parrot_Interp interp, PMC *_self)
{
# 229 "./src/pmc/integer.pmc"

    INTVAL iv;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (iv) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (iv) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);
    return iv ? 1 : 0;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 507 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_get_integer(Parrot_Interp interp, PMC *_self)
{
# 213 "./src/pmc/integer.pmc"

    INTVAL iv;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (iv) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (iv) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);
    return iv;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 518 "./src/pmc/integer.c"
}
static FLOATVAL
Parrot_Integer_get_number(Parrot_Interp interp, PMC *_self)
{
# 245 "./src/pmc/integer.pmc"

    INTVAL iv;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (iv) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (iv) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);
    return (FLOATVAL)iv;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 529 "./src/pmc/integer.c"
}
static void *
Parrot_Integer_get_pointer(Parrot_Interp interp, PMC *_self)
{
# 159 "./src/pmc/integer.pmc"

        if (0) (void)(interp) ;
    return &(((Parrot_Integer_attributes *) (_self)->data)->iv);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 539 "./src/pmc/integer.c"
}
static STRING *
Parrot_Integer_get_repr(Parrot_Interp interp, PMC *_self)
{
# 267 "./src/pmc/integer.pmc"
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);

    return Parrot_str_from_int(interp, (_self)->vtable->get_integer(interp, _self));
# 548 "./src/pmc/integer.c"
}
static STRING *
Parrot_Integer_get_string(Parrot_Interp interp, PMC *_self)
{
# 263 "./src/pmc/integer.pmc"
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);

    return Parrot_str_from_int(interp, (_self)->vtable->get_integer(interp, _self));
# 557 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_absolute(Parrot_Interp interp, PMC *_self)
{
# 1241 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);

    if (a != (-9223372036854775807L - 1L))
        (_self)->vtable->set_integer_native(interp, _self, abs(a));
    else {
        maybe_throw_overflow_error(interp);
        _self = upgrade_self_to_bignum(interp, _self);
        (_self)->vtable->i_neg(interp, _self);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 574 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_add(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_Integer:
            Parrot_Integer_multi_i_add_Integer(interp, _self, value);
            break;
        case enum_class_Complex:
            Parrot_Integer_multi_i_add_Complex(interp, _self, value);
            break;
        case enum_class_core_max:
            Parrot_mmd_multi_dispatch_from_c_args(interp, "i_add", "PP->", _self, value);
            break;
        default:
            Parrot_Integer_multi_i_add_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static void
Parrot_Integer_i_add_float(Parrot_Interp interp, PMC *_self, FLOATVAL value)
{
# 448 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    (_self)->vtable->set_number_native(interp, _self, a + value);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 608 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_add_int(Parrot_Interp interp, PMC *_self, INTVAL b)
{
# 434 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a + b;

    if ((c^a) >= 0 || (c^b) >= 0)
        (_self)->vtable->set_integer_native(interp, _self, c);
    else {
        maybe_throw_overflow_error(interp);
        _self = upgrade_self_to_bignum(interp, _self);
        (_self)->vtable->i_add_int(interp, _self, b);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 626 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_divide(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_BigInt:
            Parrot_Integer_multi_i_divide_BigInt(interp, _self, value);
            break;
        case enum_class_core_max:
            Parrot_mmd_multi_dispatch_from_c_args(interp, "i_divide", "PP->", _self, value);
            break;
        default:
            Parrot_Integer_multi_i_divide_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static void
Parrot_Integer_i_floor_divide(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_BigInt:
            Parrot_Integer_multi_i_floor_divide_BigInt(interp, _self, value);
            break;
        case enum_class_core_max:
            Parrot_mmd_multi_dispatch_from_c_args(interp, "i_floor_divide", "PP->", _self, value);
            break;
        default:
            Parrot_Integer_multi_i_floor_divide_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static void
Parrot_Integer_i_floor_divide_float(Parrot_Interp interp, PMC *_self, FLOATVAL value)
{
# 886 "./src/pmc/integer.pmc"

    FLOATVAL f;

    if (((value) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    f = floor((_self)->vtable->get_number(interp, _self) / value);
    (_self)->vtable->set_integer_native(interp, _self, (INTVAL)f);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 684 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_floor_divide_int(Parrot_Interp interp, PMC *_self, INTVAL value)
{
# 874 "./src/pmc/integer.pmc"

    FLOATVAL f;

    if (value == 0)
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    f = floor((_self)->vtable->get_number(interp, _self) / value);
    (_self)->vtable->set_integer_native(interp, _self, (INTVAL)f);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 700 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_modulus(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_BigInt:
            Parrot_Integer_multi_i_modulus_BigInt(interp, _self, value);
            break;
        case enum_class_core_max:
            Parrot_mmd_multi_dispatch_from_c_args(interp, "i_modulus", "PP->", _self, value);
            break;
        default:
            Parrot_Integer_multi_i_modulus_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static void
Parrot_Integer_i_modulus_float(Parrot_Interp interp, PMC *_self, FLOATVAL value)
{
# 995 "./src/pmc/integer.pmc"

    if (((value) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "int modulus by zero");

    (_self)->vtable->set_integer_native(interp, _self, Parrot_util_intval_mod((_self)->vtable->get_integer(interp, _self) , (INTVAL)value))
                                                                                      ;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 735 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_modulus_int(Parrot_Interp interp, PMC *_self, INTVAL value)
{
# 985 "./src/pmc/integer.pmc"

    if (value == 0)
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "int modulus by zero");

    (_self)->vtable->set_integer_native(interp, _self, Parrot_util_intval_mod((_self)->vtable->get_integer(interp, _self) , value))
                                                                              ;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 749 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_multiply(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 692 "./src/pmc/integer.pmc"




    (_self)->vtable->set_number_native(interp, _self, (_self)->vtable->get_integer(interp, _self) * (value)->vtable->get_number(interp, value))
                                                                                 ;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 762 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_multiply_float(Parrot_Interp interp, PMC *_self, FLOATVAL value)
{
# 716 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    (_self)->vtable->set_number_native(interp, _self, a * value);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 772 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_multiply_int(Parrot_Interp interp, PMC *_self, INTVAL b)
{
# 701 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a * b;
    const double cf = (double)a * (double)b;

    if ((double) c == cf)
        (_self)->vtable->set_integer_native(interp, _self, c);
    else {
        maybe_throw_overflow_error(interp);
        upgrade_self_to_bignum(interp, _self);
        (_self)->vtable->i_multiply_int(interp, _self, b);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 791 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_neg(Parrot_Interp interp, PMC *_self)
{
# 1032 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);

    if (a != (-9223372036854775807L - 1L))
        (_self)->vtable->set_integer_native(interp, _self, -a);
    else {
        maybe_throw_overflow_error(interp);
        _self = upgrade_self_to_bignum(interp, _self);
        (_self)->vtable->set_integer_native(interp, _self, 0);
        (_self)->vtable->i_subtract_int(interp, _self, a);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 809 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_subtract(Parrot_Interp interp, PMC *_self, PMC *value)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_Integer:
            Parrot_Integer_multi_i_subtract_Integer(interp, _self, value);
            break;
        case enum_class_Complex:
            Parrot_Integer_multi_i_subtract_Complex(interp, _self, value);
            break;
        case enum_class_core_max:
            Parrot_mmd_multi_dispatch_from_c_args(interp, "i_subtract", "PP->", _self, value);
            break;
        default:
            Parrot_Integer_multi_i_subtract_DEFAULT(interp, _self, value);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static void
Parrot_Integer_i_subtract_float(Parrot_Interp interp, PMC *_self, FLOATVAL value)
{
# 602 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    (_self)->vtable->set_number_native(interp, _self, a - value);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 843 "./src/pmc/integer.c"
}
static void
Parrot_Integer_i_subtract_int(Parrot_Interp interp, PMC *_self, INTVAL b)
{
# 588 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a - b;

    if ((c^a) >= 0 || (c^~b) >= 0)
        (_self)->vtable->set_integer_native(interp, _self, c);
    else {
        maybe_throw_overflow_error(interp);
        _self = upgrade_self_to_bignum(interp, _self);
        (_self)->vtable->i_subtract_int(interp, _self, b);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 861 "./src/pmc/integer.c"
}
static void
Parrot_Integer_increment(Parrot_Interp interp, PMC *_self)
{
# 1172 "./src/pmc/integer.pmc"

    INTVAL volatile a;
    INTVAL volatile c;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (a) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (a) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);
    c = a + 1;


    if ((c^a) >= 0 || (c^1) >= 0)
        do { if ((((_self)->flags) & PObj_is_object_FLAG)) { PMC * const attr_value = Parrot_pmc_new_init_int(interp, enum_class_Integer, c); (_self)->vtable->set_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv"), attr_value); } else ((Parrot_Integer_attributes *)(_self)->data)->iv = (c); } while (0);
    else {
        Parrot_pmc_reuse(interp, _self, enum_class_BigInt, 0);
        (_self)->vtable->set_integer_native(interp, _self, a);
        (_self)->vtable->increment(interp, _self);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 882 "./src/pmc/integer.c"
}
static void
Parrot_Integer_init(Parrot_Interp interp, PMC *_self)
{
# 112 "./src/pmc/integer.pmc"

    Parrot_Integer_attributes * const attrs =
        (Parrot_Integer_attributes *)(_self)->data;

    attrs->iv = 0;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 894 "./src/pmc/integer.c"
}
static void
Parrot_Integer_init_int(Parrot_Interp interp, PMC *_self, INTVAL init)
{
# 126 "./src/pmc/integer.pmc"

    Parrot_Integer_attributes * const attrs =
        (Parrot_Integer_attributes *)(_self)->data;

    attrs->iv = init;
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 906 "./src/pmc/integer.c"
}
static void
Parrot_Integer_init_pmc(Parrot_Interp interp, PMC *_self, PMC *init)
{
# 119 "./src/pmc/integer.pmc"

    Parrot_Integer_attributes * const attrs =
        (Parrot_Integer_attributes *)(_self)->data;

    attrs->iv = (init)->vtable->get_integer(interp, init);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 918 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_is_equal(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1055 "./src/pmc/integer.pmc"

    INTVAL retval;

    switch (value->vtable->base_type) {
      case enum_class_BigInt:
      {
        PMC const *temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt,
            (_self)->vtable->get_integer(interp, _self));
        Parrot_mmd_multi_dispatch_from_c_args(interp,
                "is_equal", "PP->I", temp, value, &retval);
        return retval;
      }
        break;
      default:
        return ((_self)->vtable->get_integer(interp, _self)
            == (value)->vtable->get_integer(interp, value));
        break;
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 943 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_modulus(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_BigInt:
            return Parrot_Integer_multi_modulus_BigInt_PMC(interp, _self, value, dest);
            break;
        case enum_class_core_max:
            {
                PMC *retval = PMCNULL;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "modulus", "PPP->P", _self, value, dest, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_modulus_DEFAULT_PMC(interp, _self, value, dest);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static PMC *
Parrot_Integer_modulus_float(Parrot_Interp interp, PMC *_self, FLOATVAL value, PMC *dest_unused __attribute__((__unused__)))
{
# 955 "./src/pmc/integer.pmc"
    if (((value) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "int modulus by zero");

    return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
            Parrot_util_intval_mod((_self)->vtable->get_integer(interp, _self), (INTVAL)value));
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 981 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_modulus_int(Parrot_Interp interp, PMC *_self, INTVAL value, PMC *dest_unused __attribute__((__unused__)))
{
# 944 "./src/pmc/integer.pmc"
    if (value == 0)
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "int modulus by zero");

    return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
            Parrot_util_intval_mod((_self)->vtable->get_integer(interp, _self), value));
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 994 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multiply(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_Integer:
            return Parrot_Integer_multi_multiply_Integer_PMC(interp, _self, value, dest);
            break;
        case enum_class_Complex:
            return Parrot_Integer_multi_multiply_Complex_PMC(interp, _self, value, dest);
            break;
        case enum_class_BigInt:
            return Parrot_Integer_multi_multiply_BigInt_PMC(interp, _self, value, dest);
            break;
        case enum_class_String:
            return Parrot_Integer_multi_multiply_String_PMC(interp, _self, value, dest);
            break;
        case enum_class_core_max:
            {
                PMC *retval = PMCNULL;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "multiply", "PPP->P", _self, value, dest, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_multiply_DEFAULT_PMC(interp, _self, value, dest);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static PMC *
Parrot_Integer_multiply_int(Parrot_Interp interp, PMC *_self, INTVAL b, PMC *dest)
{
# 661 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a * b;
    const double cf = (double)a * (double)b;

    if ((double) c == cf)
        return Parrot_pmc_new_init_int(interp,
                (_self)->vtable->type(interp, _self), c);
    else {
        PMC *temp;
        maybe_throw_overflow_error(interp);
        temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (temp)->vtable->multiply_int(interp, temp, b, dest);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1049 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_neg(Parrot_Interp interp, PMC *_self, PMC *dest_unused __attribute__((__unused__)))
{
# 1017 "./src/pmc/integer.pmc"
    const INTVAL a = (_self)->vtable->get_integer(interp, _self);

    if (a != (-9223372036854775807L - 1L))
        return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
                                               -a);
    else {
        PMC *promoted;
        maybe_throw_overflow_error(interp);
        promoted = Parrot_pmc_new_init_int(interp, enum_class_BigInt, 0);
        return (promoted)->vtable->subtract_int(interp, promoted, a, promoted);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1067 "./src/pmc/integer.c"
}
static void
Parrot_Integer_set_bool(Parrot_Interp interp, PMC *_self, INTVAL value)
{
# 311 "./src/pmc/integer.pmc"

    Parrot_pmc_reuse(interp, _self,
        Parrot_hll_get_ctx_HLL_type(interp, enum_class_Boolean), 0);
    (_self)->vtable->set_bool(interp, _self, value);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1078 "./src/pmc/integer.c"
}
static void
Parrot_Integer_set_integer_native(Parrot_Interp interp, PMC *_self, INTVAL value)
{
# 282 "./src/pmc/integer.pmc"

    do { if ((((_self)->flags) & PObj_is_object_FLAG)) { PMC * const attr_value = Parrot_pmc_new_init_int(interp, enum_class_Integer, value); (_self)->vtable->set_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv"), attr_value); } else ((Parrot_Integer_attributes *)(_self)->data)->iv = (value); } while (0);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1087 "./src/pmc/integer.c"
}
static void
Parrot_Integer_set_number_native(Parrot_Interp interp, PMC *_self, FLOATVAL value)
{
# 304 "./src/pmc/integer.pmc"

    Parrot_pmc_reuse(interp, _self,
        Parrot_hll_get_ctx_HLL_type(interp, enum_class_Float), 0);
    (_self)->vtable->set_number_native(interp, _self, value);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1098 "./src/pmc/integer.c"
}
static void
Parrot_Integer_set_pmc(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 174 "./src/pmc/integer.pmc"

    (_self)->vtable->set_integer_native(interp, _self, (value)->vtable->get_integer(interp, value));
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1107 "./src/pmc/integer.c"
}
static void
Parrot_Integer_set_string_native(Parrot_Interp interp, PMC *_self, STRING *value)
{
# 319 "./src/pmc/integer.pmc"

    Parrot_pmc_reuse(interp, _self,
        Parrot_hll_get_ctx_HLL_type(interp, enum_class_String), 0);
    (_self)->vtable->set_string_native(interp, _self, value);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1118 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_subtract(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
    INTVAL type = (value)->vtable->type(interp, value);

    if ((type >= enum_class_core_max) || ((_self)->vtable->type(interp, _self) >= enum_class_core_max))
        type = enum_class_core_max;
    switch(type) {
        case enum_class_Integer:
            return Parrot_Integer_multi_subtract_Integer_PMC(interp, _self, value, dest);
            break;
        case enum_class_Complex:
            return Parrot_Integer_multi_subtract_Complex_PMC(interp, _self, value, dest);
            break;
        case enum_class_BigInt:
            return Parrot_Integer_multi_subtract_BigInt_PMC(interp, _self, value, dest);
            break;
        case enum_class_core_max:
            {
                PMC *retval = PMCNULL;
                Parrot_mmd_multi_dispatch_from_c_args(interp, "subtract", "PPP->P", _self, value, dest, &retval);
                return retval;
            }
            break;
        default:
            return Parrot_Integer_multi_subtract_DEFAULT_PMC(interp, _self, value, dest);
            break;

    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
}
static PMC *
Parrot_Integer_subtract_int(Parrot_Interp interp, PMC *_self, INTVAL b, PMC *dest)
{
# 526 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL c = a - b;

    if ((c^a) >= 0 || (c^~b) >= 0)
        return Parrot_pmc_new_init_int(interp,
                (_self)->vtable->type(interp, _self), c);
    else {
        PMC *temp;
        maybe_throw_overflow_error(interp);
        temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (temp)->vtable->subtract_int(interp, temp, b, dest);
    }
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1169 "./src/pmc/integer.c"
}
static void
Parrot_Integer_thaw(Parrot_Interp interp, PMC *_self, PMC *info)
{
# 1305 "./src/pmc/integer.pmc"

    interp->vtables[enum_class_default]->thaw(interp, _self, info);
    (_self)->vtable->set_integer_native(interp, _self, (info)->vtable->shift_integer(interp, info));
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
# 1179 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_add_Integer_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 337 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);
    const INTVAL b = (value)->vtable->get_integer(interp, value);
    const INTVAL c = a + b;

    if ((c^a) >= 0 || (c^b) >= 0)
        return Parrot_pmc_new_init_int(interp,
                (_self)->vtable->type(interp, _self), c);
    else {
        PMC *temp;
        maybe_throw_overflow_error(interp);
        temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (temp)->vtable->add(interp, temp, value, dest);
    }
# 1199 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_add_Complex_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 354 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);
    dest = Parrot_pmc_new_init_int(interp,
                        (value)->vtable->type(interp, value),
                        a + (value)->vtable->get_number_keyed_int(interp, value, 0));
    (dest)->vtable->set_number_keyed_int(interp, dest, 1, (value)->vtable->get_number_keyed_int(interp, value, 1))
                                                          ;

    return dest;
# 1214 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_add_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 366 "./src/pmc/integer.pmc"

    PMC *temp;
    maybe_throw_overflow_error(interp);
    temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt,
            _self->vtable->get_integer(interp, _self));
    return (temp)->vtable->add(interp, temp, value, dest);
# 1226 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_add_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 375 "./src/pmc/integer.pmc"

    dest = Parrot_pmc_new(interp, (value)->vtable->type(interp, value));
    (dest)->vtable->set_number_native(interp, dest, _self->vtable->get_integer(interp, _self) + (value)->vtable->get_number(interp, value))
                                                                                     ;
    return dest;
# 1237 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_add_Integer(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 413 "./src/pmc/integer.pmc"

    Parrot_Integer_i_add_int(interp, _self, (value)->vtable->get_integer(interp, value));
# 1245 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_add_Complex(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 418 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);
        if (0) (void)(a) ;

    Parrot_pmc_reuse(interp, _self, enum_class_Complex, 0);
    (_self)->vtable->set_number_native(interp, _self, _self->vtable->get_integer(interp, _self) + (value)->vtable->get_number(interp, value))
                                                                                         ;
# 1258 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_add_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 428 "./src/pmc/integer.pmc"

    (_self)->vtable->set_number_native(interp, _self, _self->vtable->get_integer(interp, _self) + (value)->vtable->get_number(interp, value))
                                                                                         ;
# 1267 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_subtract_Integer_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 468 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);
    const INTVAL b = (value)->vtable->get_integer(interp, value);
    const INTVAL c = a - b;

    if ((c^a) >= 0 || (c^~b) >= 0)
        return Parrot_pmc_new_init_int(interp,
                (_self)->vtable->type(interp, _self), c);
    else {
        PMC *temp;
        maybe_throw_overflow_error(interp);
        temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (temp)->vtable->subtract(interp, temp, value, dest);
    }
# 1287 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_subtract_Complex_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 485 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);
    dest = Parrot_pmc_new(interp, (value)->vtable->type(interp, value));

    (dest)->vtable->set_number_native(interp, dest, a - (value)->vtable->get_number_keyed_int(interp, value, 0))
                                                              ;
    (dest)->vtable->set_number_keyed_int(interp, dest, 1, -(value)->vtable->get_number_keyed_int(interp, value, 1))
                                                           ;

    return dest;
# 1303 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_subtract_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 498 "./src/pmc/integer.pmc"

    PMC *temp;
    maybe_throw_overflow_error(interp);
    temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt,
             _self->vtable->get_integer(interp, _self));
    return (temp)->vtable->subtract(interp, temp, value, dest);
# 1315 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_subtract_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 507 "./src/pmc/integer.pmc"

    dest = Parrot_pmc_new(interp, (value)->vtable->type(interp, value));

    (dest)->vtable->set_number_native(interp, dest, _self->vtable->get_integer(interp, _self) - (value)->vtable->get_number(interp, value))
                                                                                         ;
    return dest;
# 1327 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_subtract_Integer(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 556 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);
    const INTVAL b = (value)->vtable->get_integer(interp, value);
    const INTVAL c = a - b;

    if ((c^a) >= 0 || (c^~b) >= 0)
        (_self)->vtable->set_integer_native(interp, _self, c);
    else {
        maybe_throw_overflow_error(interp);
        _self = upgrade_self_to_bignum(interp, _self);
        (_self)->vtable->i_subtract(interp, _self, value);
    }
# 1345 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_subtract_Complex(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 571 "./src/pmc/integer.pmc"

    const INTVAL a = _self->vtable->get_integer(interp, _self);

    Parrot_pmc_reuse(interp, _self, enum_class_Complex, 0);
    (_self)->vtable->set_number_native(interp, _self, (FLOATVAL)a - (value)->vtable->get_number_keyed_int(interp, value, 0))
                                                                        ;
    (_self)->vtable->set_number_keyed_int(interp, _self, 1, -(value)->vtable->get_number_keyed_int(interp, value, 1))
                                                           ;
# 1359 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_subtract_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 582 "./src/pmc/integer.pmc"

    (_self)->vtable->set_number_native(interp, _self, _self->vtable->get_integer(interp, _self) - (value)->vtable->get_number(interp, value))
                                                                                         ;
# 1368 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_multiply_Integer_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 620 "./src/pmc/integer.pmc"

    const INTVAL a = (_self)->vtable->get_integer(interp, _self);
    const INTVAL b = (value)->vtable->get_integer(interp, value);
    const INTVAL c = a * b;
    const double cf = (double)a * (double)b;

    if ((double) c == cf)
        return Parrot_pmc_new_init_int(interp,
                (_self)->vtable->type(interp, _self), c);
    else {
        PMC *temp;
        maybe_throw_overflow_error(interp);
        temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt, a);
        return (temp)->vtable->multiply(interp, temp, value, dest);
    }
# 1389 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_multiply_Complex_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 638 "./src/pmc/integer.pmc"

    return (value)->vtable->multiply(interp, value, _self, dest);
# 1397 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_multiply_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 643 "./src/pmc/integer.pmc"

    return (value)->vtable->multiply_int(interp, value, _self->vtable->get_integer(interp, _self), dest);
# 1405 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_multiply_String_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 648 "./src/pmc/integer.pmc"

    return Parrot_Integer_multi_multiply_Integer_PMC(interp, _self, value, dest);
# 1413 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_multiply_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)))
{
# 653 "./src/pmc/integer.pmc"
    const FLOATVAL valf = (value)->vtable->get_number(interp, value);
    return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
        _self->vtable->get_number(interp, _self) * valf);
# 1422 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_divide_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 744 "./src/pmc/integer.pmc"

    PMC *temp;
    maybe_throw_overflow_error(interp);
    temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt,
        _self->vtable->get_integer(interp, _self));
    return (temp)->vtable->divide(interp, temp, value, dest);
# 1434 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_divide_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)))
{
# 752 "./src/pmc/integer.pmc"
    const FLOATVAL d = (value)->vtable->get_number(interp, value);

    if (((d) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
                _self->vtable->get_number(interp, _self) / d);
# 1448 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_divide_BigInt(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 765 "./src/pmc/integer.pmc"

    maybe_throw_overflow_error(interp);
    _self = upgrade_self_to_bignum(interp, _self);
    (_self)->vtable->i_divide(interp, _self, value);
# 1458 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_divide_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 772 "./src/pmc/integer.pmc"

    const FLOATVAL d = (value)->vtable->get_number(interp, value);

    if (((d) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    (_self)->vtable->set_number_native(interp, _self, _self->vtable->get_number(interp, _self) / d);
# 1472 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_floor_divide_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 805 "./src/pmc/integer.pmc"

    PMC *temp;
    maybe_throw_overflow_error(interp);
    temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt,
            _self->vtable->get_integer(interp, _self));
    return (temp)->vtable->floor_divide(interp, temp, value, dest);
# 1484 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_floor_divide_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)))
{
# 814 "./src/pmc/integer.pmc"
    const FLOATVAL d = (value)->vtable->get_number(interp, value);
    FLOATVAL f;

    if (((d) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    f = floor(_self->vtable->get_number(interp, _self) / d);
    return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
        (INTVAL)f);
# 1500 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_floor_divide_BigInt(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 855 "./src/pmc/integer.pmc"

    maybe_throw_overflow_error(interp);
    _self = upgrade_self_to_bignum(interp, _self);
    (_self)->vtable->i_floor_divide(interp, _self, value);
# 1510 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_floor_divide_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 861 "./src/pmc/integer.pmc"

    const FLOATVAL d = (value)->vtable->get_number(interp, value);
    FLOATVAL f;

    if (((d) == 0.0))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "float division by zero");

    f = floor(_self->vtable->get_number(interp, _self) / d);
    (_self)->vtable->set_integer_native(interp, _self, (INTVAL)f);
# 1526 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_modulus_BigInt_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest)
{
# 922 "./src/pmc/integer.pmc"

    PMC *temp;
    maybe_throw_overflow_error(interp);
    temp = Parrot_pmc_new_init_int(interp, enum_class_BigInt,
         _self->vtable->get_integer(interp, _self));
    return (temp)->vtable->modulus(interp, temp, value, dest);
# 1538 "./src/pmc/integer.c"
}
static PMC *
Parrot_Integer_multi_modulus_DEFAULT_PMC(Parrot_Interp interp, PMC *_self, PMC *value, PMC *dest_unused __attribute__((__unused__)))
{
# 931 "./src/pmc/integer.pmc"
    const INTVAL d = (value)->vtable->get_integer(interp, value);

    if (d == 0)
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "int modulus by zero");

    return Parrot_pmc_new_init_int(interp, (_self)->vtable->type(interp, _self),
            Parrot_util_intval_mod(_self->vtable->get_integer(interp, _self), d));
# 1552 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_modulus_BigInt(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 966 "./src/pmc/integer.pmc"

    maybe_throw_overflow_error(interp);
    _self = upgrade_self_to_bignum(interp, _self);
    (_self)->vtable->i_modulus(interp, _self, value);
# 1562 "./src/pmc/integer.c"
}
static void
Parrot_Integer_multi_i_modulus_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 973 "./src/pmc/integer.pmc"

    const INTVAL d = (value)->vtable->get_integer(interp, value);

    if (d == 0)
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_DIV_BY_ZERO,
                "int modulus by zero");

    (_self)->vtable->set_integer_native(interp, _self, Parrot_util_intval_mod(_self->vtable->get_integer(interp, _self), d))
                                                                                 ;
# 1577 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_multi_cmp_String(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1086 "./src/pmc/integer.pmc"

    INTVAL iv;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (iv) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (iv) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);
    {
        const FLOATVAL fdiff =
            (FLOATVAL)iv - (value)->vtable->get_number(interp, value);

        if (((fdiff) == 0.0)) {
            const INTVAL idiff =
                _self->vtable->get_integer(interp, _self) - (value)->vtable->get_integer(interp, value);
            return idiff > 0 ? 1 : idiff < 0 ? -1 : 0;
        }

        return fdiff > 0 ? 1 : -1;
    }
# 1598 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_multi_cmp_Float(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1104 "./src/pmc/integer.pmc"

    INTVAL iv;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (iv) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (iv) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);

    {
        const FLOATVAL diff = (FLOATVAL)iv - (value)->vtable->get_number(interp, value);
        return diff > 0 ? 1 : diff < 0 ? -1 : 0;
    }
# 1612 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_multi_cmp_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1115 "./src/pmc/integer.pmc"


    INTVAL selfint;
    do { if (!(((_self)->flags) & PObj_is_object_FLAG)) { (selfint) = ((Parrot_Integer_attributes *)(_self)->data)->iv; } else { PMC * const attr_value = (_self)->vtable->get_attr_str(interp, _self, Parrot_str_new_constant(interp, "iv")); (selfint) = (((attr_value) == PMCNULL || (attr_value) == ((void *)0)) ? (INTVAL) 0: (attr_value)->vtable->get_integer(interp, attr_value)); } } while (0);
    {
        const INTVAL valueint = (value)->vtable->get_integer(interp, value);
        return selfint > valueint ? 1 : selfint < valueint ? -1 : 0;
    }
# 1626 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_multi_cmp_num_String(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1136 "./src/pmc/integer.pmc"

    const FLOATVAL fdiff = _self->vtable->get_number(interp, _self) - (value)->vtable->get_number(interp, value);

    if (((fdiff) == 0.0)) {
        const INTVAL idiff =
            _self->vtable->get_integer(interp, _self) - (value)->vtable->get_integer(interp, value);
        return idiff > 0 ? 1 : idiff < 0 ? -1 : 0;
    }

    return fdiff > 0 ? 1 : -1;
# 1642 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_multi_cmp_num_Float(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1149 "./src/pmc/integer.pmc"

    const FLOATVAL diff = _self->vtable->get_number(interp, _self) - (value)->vtable->get_number(interp, value);
    return diff > 0 ? 1 : diff < 0 ? -1 : 0;
# 1651 "./src/pmc/integer.c"
}
static INTVAL
Parrot_Integer_multi_cmp_num_DEFAULT(Parrot_Interp interp, PMC *_self, PMC *value)
{
# 1155 "./src/pmc/integer.pmc"


    const INTVAL diff = _self->vtable->get_integer(interp, _self) - (value)->vtable->get_integer(interp, value);
    return diff > 0 ? 1 : diff < 0 ? -1 : 0;
# 1661 "./src/pmc/integer.c"
}
static void
Parrot_Integer_nci_get_as_base(Parrot_Interp interp, PMC *_self)
{
    PMC * const _ctx = ((interp)->ctx);
    PMC * const _call_object = (((Parrot_Context *)((_ctx))->data)->current_sig);

    {
INTVAL base;

        Parrot_pcc_fill_params_from_c_args(interp, _call_object, "PiI",
            &_self, &base);
    {
# 1265 "./src/pmc/integer.pmc"

    char buf[128];
    STRING *result;

    if ((base < 2) || (base > 36))
        Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_OUT_OF_BOUNDS,
            "get_as_base: base out of bounds");

    result = Parrot_str_from_int_base(interp, buf,
            (HUGEINTVAL)(_self)->vtable->get_integer(interp, _self),
            (unsigned int)base);
# 1688 "./src/pmc/integer.c"
    {

    Parrot_pcc_set_call_from_c_args(interp, _call_object,
        "S", (STRING*)result);
    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);
    return;

    }
# 1277 "./src/pmc/integer.pmc"
# 1699 "./src/pmc/integer.c"

    }

    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);

    }
    return;
}
static void
Parrot_Integer_nci_set_random(Parrot_Interp interp, PMC *_self)
{
    PMC * const _ctx = ((interp)->ctx);
    PMC * const _call_object = (((Parrot_Context *)((_ctx))->data)->current_sig);

    {
INTVAL a;
INTVAL has_a;
INTVAL b;
INTVAL has_b;

        Parrot_pcc_fill_params_from_c_args(interp, _call_object, "PiIoIpIoIp",
            &_self, &a, &has_a, &b, &has_b);
    {
# 1327 "./src/pmc/integer.pmc"

    INTVAL r;
    if (has_a && a != 0) {
        if (!has_b) {
            if (a < 0)
                b = 0;
            if (a > 0) {
                b = a;
                a = 0;
            }
        }
        if (a == b || a > b) {
            Parrot_ex_throw_from_c_args(interp, ((void *)0), EXCEPTION_OUT_OF_BOUNDS,
                "set_random: range start must be less than range end (%d, %d)", a, b);
        }
        {
            const double spread = (double)(b - a + 1);
            const double randpart = Parrot_util_float_rand(0);
            r = a + (INTVAL)(spread * randpart);
        }
    }
    else
        r = Parrot_util_int_rand(0);
    _self->vtable->set_integer_native(interp, _self, r);
# 1748 "./src/pmc/integer.c"

    }

    do { if (((((_self))->flags) & PObj_GC_need_write_barrier_FLAG)) Parrot_gc_write_barrier((interp), (_self)); } while (0);

    }
    return;
}
static void
Parrot_Integer_multi_add_Integer_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_add_Integer_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_add_Complex_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_add_Complex_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_add_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_add_BigInt_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_add_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_add_DEFAULT_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_i_add_Integer_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_add_Integer(interp, _self, value);
}
static void
Parrot_Integer_multi_i_add_Complex_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_add_Complex(interp, _self, value);
}
static void
Parrot_Integer_multi_i_add_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_add_DEFAULT(interp, _self, value);
}
static void
Parrot_Integer_multi_subtract_Integer_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_subtract_Integer_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_subtract_Complex_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_subtract_Complex_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_subtract_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_subtract_BigInt_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_subtract_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_subtract_DEFAULT_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_i_subtract_Integer_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_subtract_Integer(interp, _self, value);
}
static void
Parrot_Integer_multi_i_subtract_Complex_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_subtract_Complex(interp, _self, value);
}
static void
Parrot_Integer_multi_i_subtract_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_subtract_DEFAULT(interp, _self, value);
}
static void
Parrot_Integer_multi_multiply_Integer_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_multiply_Integer_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_multiply_Complex_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_multiply_Complex_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_multiply_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_multiply_BigInt_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_multiply_String_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_multiply_String_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_multiply_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_multiply_DEFAULT_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_divide_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_divide_BigInt_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_divide_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_divide_DEFAULT_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_i_divide_BigInt_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_divide_BigInt(interp, _self, value);
}
static void
Parrot_Integer_multi_i_divide_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_divide_DEFAULT(interp, _self, value);
}
static void
Parrot_Integer_multi_floor_divide_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_floor_divide_BigInt_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_floor_divide_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_floor_divide_DEFAULT_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_i_floor_divide_BigInt_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_floor_divide_BigInt(interp, _self, value);
}
static void
Parrot_Integer_multi_i_floor_divide_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_floor_divide_DEFAULT(interp, _self, value);
}
static void
Parrot_Integer_multi_modulus_BigInt_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_modulus_BigInt_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_modulus_DEFAULT_PMC_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value; PMC *dest;
PMC * _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiPP", &_self, &value, &dest);
_result = Parrot_Integer_multi_modulus_DEFAULT_PMC(interp, _self, value, dest);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "P", _result);
}
static void
Parrot_Integer_multi_i_modulus_BigInt_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_modulus_BigInt(interp, _self, value);
}
static void
Parrot_Integer_multi_i_modulus_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
Parrot_Integer_multi_i_modulus_DEFAULT(interp, _self, value);
}
static void
Parrot_Integer_multi_cmp_String_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
INTVAL _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
_result = Parrot_Integer_multi_cmp_String(interp, _self, value);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "I", _result);
}
static void
Parrot_Integer_multi_cmp_Float_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
INTVAL _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
_result = Parrot_Integer_multi_cmp_Float(interp, _self, value);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "I", _result);
}
static void
Parrot_Integer_multi_cmp_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
INTVAL _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
_result = Parrot_Integer_multi_cmp_DEFAULT(interp, _self, value);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "I", _result);
}
static void
Parrot_Integer_multi_cmp_num_String_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
INTVAL _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
_result = Parrot_Integer_multi_cmp_num_String(interp, _self, value);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "I", _result);
}
static void
Parrot_Integer_multi_cmp_num_Float_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
INTVAL _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
_result = Parrot_Integer_multi_cmp_num_Float(interp, _self, value);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "I", _result);
}
static void
Parrot_Integer_multi_cmp_num_DEFAULT_pcc(Parrot_Interp interp, PMC *_self)
{
PMC *value;
INTVAL _result;
PMC *_call_obj = (((Parrot_Context *)((((interp)->ctx)))->data)->current_sig);
Parrot_pcc_fill_params_from_c_args(interp, _call_obj, "PiP", &_self, &value);
_result = Parrot_Integer_multi_cmp_num_DEFAULT(interp, _self, value);
    Parrot_pcc_set_call_from_c_args(interp, _call_obj, "I", _result);
}


__attribute__ ((visibility("default")))
VTABLE *Parrot_Integer_update_vtable(VTABLE *vt) {
    vt->absolute = Parrot_Integer_absolute;
    vt->add = Parrot_Integer_add;
    vt->add_int = Parrot_Integer_add_int;
    vt->clone = Parrot_Integer_clone;
    vt->cmp = Parrot_Integer_cmp;
    vt->cmp_num = Parrot_Integer_cmp_num;
    vt->decrement = Parrot_Integer_decrement;
    vt->divide = Parrot_Integer_divide;
    vt->floor_divide = Parrot_Integer_floor_divide;
    vt->floor_divide_float = Parrot_Integer_floor_divide_float;
    vt->floor_divide_int = Parrot_Integer_floor_divide_int;
    vt->freeze = Parrot_Integer_freeze;
    vt->get_bool = Parrot_Integer_get_bool;
    vt->get_integer = Parrot_Integer_get_integer;
    vt->get_number = Parrot_Integer_get_number;
    vt->get_pointer = Parrot_Integer_get_pointer;
    vt->get_repr = Parrot_Integer_get_repr;
    vt->get_string = Parrot_Integer_get_string;
    vt->i_absolute = Parrot_Integer_i_absolute;
    vt->i_add = Parrot_Integer_i_add;
    vt->i_add_float = Parrot_Integer_i_add_float;
    vt->i_add_int = Parrot_Integer_i_add_int;
    vt->i_divide = Parrot_Integer_i_divide;
    vt->i_floor_divide = Parrot_Integer_i_floor_divide;
    vt->i_floor_divide_float = Parrot_Integer_i_floor_divide_float;
    vt->i_floor_divide_int = Parrot_Integer_i_floor_divide_int;
    vt->i_modulus = Parrot_Integer_i_modulus;
    vt->i_modulus_float = Parrot_Integer_i_modulus_float;
    vt->i_modulus_int = Parrot_Integer_i_modulus_int;
    vt->i_multiply = Parrot_Integer_i_multiply;
    vt->i_multiply_float = Parrot_Integer_i_multiply_float;
    vt->i_multiply_int = Parrot_Integer_i_multiply_int;
    vt->i_neg = Parrot_Integer_i_neg;
    vt->i_subtract = Parrot_Integer_i_subtract;
    vt->i_subtract_float = Parrot_Integer_i_subtract_float;
    vt->i_subtract_int = Parrot_Integer_i_subtract_int;
    vt->increment = Parrot_Integer_increment;
    vt->init = Parrot_Integer_init;
    vt->init_int = Parrot_Integer_init_int;
    vt->init_pmc = Parrot_Integer_init_pmc;
    vt->is_equal = Parrot_Integer_is_equal;
    vt->modulus = Parrot_Integer_modulus;
    vt->modulus_float = Parrot_Integer_modulus_float;
    vt->modulus_int = Parrot_Integer_modulus_int;
    vt->multiply = Parrot_Integer_multiply;
    vt->multiply_int = Parrot_Integer_multiply_int;
    vt->neg = Parrot_Integer_neg;
    vt->set_bool = Parrot_Integer_set_bool;
    vt->set_integer_native = Parrot_Integer_set_integer_native;
    vt->set_number_native = Parrot_Integer_set_number_native;
    vt->set_pmc = Parrot_Integer_set_pmc;
    vt->set_string_native = Parrot_Integer_set_string_native;
    vt->subtract = Parrot_Integer_subtract;
    vt->subtract_int = Parrot_Integer_subtract_int;
    vt->thaw = Parrot_Integer_thaw;
    vt->attr_size = sizeof(Parrot_Integer_attributes);

    return vt;
}


__attribute__ ((visibility("default")))
VTABLE *Parrot_Integer_ro_update_vtable(VTABLE *vt) {
    vt->absolute = Parrot_Integer_absolute;
    vt->add = Parrot_Integer_add;
    vt->add_int = Parrot_Integer_add_int;
    vt->clone = Parrot_Integer_clone;
    vt->cmp = Parrot_Integer_cmp;
    vt->cmp_num = Parrot_Integer_cmp_num;
    vt->divide = Parrot_Integer_divide;
    vt->floor_divide = Parrot_Integer_floor_divide;
    vt->floor_divide_float = Parrot_Integer_floor_divide_float;
    vt->floor_divide_int = Parrot_Integer_floor_divide_int;
    vt->freeze = Parrot_Integer_freeze;
    vt->get_bool = Parrot_Integer_get_bool;
    vt->get_integer = Parrot_Integer_get_integer;
    vt->get_number = Parrot_Integer_get_number;
    vt->get_pointer = Parrot_Integer_get_pointer;
    vt->get_repr = Parrot_Integer_get_repr;
    vt->get_string = Parrot_Integer_get_string;
    vt->is_equal = Parrot_Integer_is_equal;
    vt->modulus = Parrot_Integer_modulus;
    vt->modulus_float = Parrot_Integer_modulus_float;
    vt->modulus_int = Parrot_Integer_modulus_int;
    vt->multiply = Parrot_Integer_multiply;
    vt->multiply_int = Parrot_Integer_multiply_int;
    vt->neg = Parrot_Integer_neg;
    vt->subtract = Parrot_Integer_subtract;
    vt->subtract_int = Parrot_Integer_subtract_int;
    vt->attr_size = sizeof(Parrot_Integer_attributes);

    return vt;
}

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
VTABLE* Parrot_Integer_get_vtable(Parrot_Interp interp) {
    VTABLE *vt;
    vt = Parrot_scalar_get_vtable(interp);
    Parrot_Integer_update_vtable(vt);

    return vt;
}

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
VTABLE* Parrot_Integer_ro_get_vtable(Parrot_Interp interp) {
    VTABLE *vt;
    vt = Parrot_scalar_ro_get_vtable(interp);
    Parrot_Integer_ro_update_vtable(vt);

    return vt;
}

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
PMC* Parrot_Integer_get_mro(Parrot_Interp interp, PMC* mro) {
    if (((mro) == PMCNULL || (mro) == ((void *)0))) {
        mro = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    }
    mro = Parrot_scalar_get_mro(interp, mro);

    (mro)->vtable->unshift_string(interp, mro, (interp)->const_cstring_table[276]);
    return mro;
}

__attribute__ ((visibility("default")))

__attribute__((__warn_unused_result__))
Hash* Parrot_Integer_get_isa(Parrot_Interp interp, Hash* isa) {
    isa = Parrot_scalar_get_isa(interp, isa);
    Parrot_hash_put(interp, isa, (void *)((interp)->const_cstring_table[276]), PMCNULL);
    return isa;
}

void
Parrot_Integer_class_init(Parrot_Interp interp, int entry, int pass)
{
    static const char attr_defs [] =
        "Iiv ";
    if (pass == 0) {
        VTABLE * const vt = Parrot_Integer_get_vtable(interp);
        vt->base_type = enum_class_Integer;
        vt->flags = 0|VTABLE_HAS_READONLY_FLAG;
        vt->attribute_defs = attr_defs;
        interp->vtables[entry] = vt;

        vt->whoami = (interp)->const_cstring_table[276];
        vt->provides_str = (interp)->const_cstring_table[277];
        vt->isa_hash = Parrot_Integer_get_isa(interp, ((void *)0));
        {
            VTABLE * const vt_ro = Parrot_Integer_ro_get_vtable(interp);
            vt_ro->base_type = enum_class_Integer;
            vt_ro->flags = 0|VTABLE_IS_READONLY_FLAG;

            vt_ro->attribute_defs = attr_defs;

            vt_ro->base_type = entry;
            vt_ro->whoami = vt->whoami;
            vt_ro->provides_str = vt->provides_str;
            vt->ro_variant_vtable = vt_ro;
            vt_ro->ro_variant_vtable = vt;
            vt_ro->isa_hash = vt->isa_hash;
        }

    }
    else {
        {
            VTABLE * const vt = interp->vtables[entry];

            vt->mro = Parrot_Integer_get_mro(interp, PMCNULL);

            if (vt->ro_variant_vtable)
                vt->ro_variant_vtable->mro = vt->mro;
        }


        Parrot_pmc_create_mro(interp, entry);
        {
            STRING * const method_name = (interp)->const_cstring_table[278];
            STRING * const signature = (interp)->const_cstring_table[157];
            Parrot_interp_register_native_pcc_method_in_ns(interp, entry,
                ((void *)(((UINTVAL)(((funcptr_t) (Parrot_Integer_nci_get_as_base)))))),
                method_name, signature);
        }
        {
            STRING * const method_name = (interp)->const_cstring_table[279];
            STRING * const signature = (interp)->const_cstring_table[157];
            Parrot_interp_register_native_pcc_method_in_ns(interp, entry,
                ((void *)(((UINTVAL)(((funcptr_t) (Parrot_Integer_nci_set_random)))))),
                method_name, signature);
        }
        {
            STRING * const mfl_0 = (interp)->const_cstring_table[280];
            STRING * const mfl_1 = (interp)->const_cstring_table[281];
            STRING * const mfl_2 = (interp)->const_cstring_table[276];
            STRING * const mfl_3 = (interp)->const_cstring_table[282];
            STRING * const mfl_4 = (interp)->const_cstring_table[283];
            STRING * const mfl_5 = (interp)->const_cstring_table[284];
            STRING * const mfl_6 = (interp)->const_cstring_table[285];
            STRING * const mfl_7 = (interp)->const_cstring_table[286];
            STRING * const mfl_8 = (interp)->const_cstring_table[287];
            STRING * const mfl_9 = (interp)->const_cstring_table[288];
            STRING * const mfl_10 = (interp)->const_cstring_table[289];
            STRING * const mfl_11 = (interp)->const_cstring_table[290];
            STRING * const mfl_12 = (interp)->const_cstring_table[291];
            STRING * const mfl_13 = (interp)->const_cstring_table[292];
            STRING * const mfl_14 = (interp)->const_cstring_table[293];
            STRING * const mfl_15 = (interp)->const_cstring_table[294];
            STRING * const mfl_16 = (interp)->const_cstring_table[295];
            STRING * const mfl_17 = (interp)->const_cstring_table[296];
            STRING * const mfl_18 = (interp)->const_cstring_table[297];
            STRING * const mfl_19 = (interp)->const_cstring_table[298];
            STRING * const mfl_20 = (interp)->const_cstring_table[299];
            STRING * const mfl_21 = (interp)->const_cstring_table[274];
            STRING * const mfl_22 = (interp)->const_cstring_table[300];
            STRING * const mfl_23 = (interp)->const_cstring_table[301];
            STRING * const mfl_24 = (interp)->const_cstring_table[275];
        PMC *_temp_func;
_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_add_Integer_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_0, mfl_1, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_add_Complex_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_0, mfl_3, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_add_BigInt_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_0, mfl_4, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_add_DEFAULT_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_0, mfl_5, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_add_Integer_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_6, mfl_7, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_add_Complex_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_6, mfl_8, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_add_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_6, mfl_9, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_subtract_Integer_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_10, mfl_1, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_subtract_Complex_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_10, mfl_3, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_subtract_BigInt_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_10, mfl_4, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_subtract_DEFAULT_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_10, mfl_5, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_subtract_Integer_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_11, mfl_7, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_subtract_Complex_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_11, mfl_8, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_subtract_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_11, mfl_9, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_multiply_Integer_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_12, mfl_1, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_multiply_Complex_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_12, mfl_3, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_multiply_BigInt_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_12, mfl_4, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_multiply_String_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_12, mfl_13, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_multiply_DEFAULT_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_12, mfl_5, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_divide_BigInt_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_14, mfl_4, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_divide_DEFAULT_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_14, mfl_5, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_divide_BigInt_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_15, mfl_16, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_divide_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_15, mfl_9, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_floor_divide_BigInt_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_17, mfl_4, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_floor_divide_DEFAULT_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_17, mfl_5, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_floor_divide_BigInt_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_18, mfl_16, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_floor_divide_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_18, mfl_9, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_modulus_BigInt_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_19, mfl_4, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_modulus_DEFAULT_PMC_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_19, mfl_5, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_modulus_BigInt_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_20, mfl_16, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_i_modulus_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_20, mfl_9, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_cmp_String_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_21, mfl_22, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_cmp_Float_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_21, mfl_23, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_cmp_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_21, mfl_9, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_cmp_num_String_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_24, mfl_22, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_cmp_num_Float_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_24, mfl_23, _temp_func);

_temp_func = Parrot_pmc_new(interp, enum_class_NativePCCMethod);
(_temp_func)->vtable->set_pointer_keyed_str(interp, _temp_func, (interp)->const_cstring_table[157], (void *)Parrot_Integer_multi_cmp_num_DEFAULT_pcc);
Parrot_mmd_add_multi_from_long_sig(interp, mfl_24, mfl_9, _temp_func);

        }
    }
}
# 1351 "./src/pmc/integer.pmc"
