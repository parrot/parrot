#ifndef S_IFMT
#  ifdef _S_IFMT
#    define S_IFMT _S_IFMT
#  else
#    define S_IFMT 0170000
#  endif
#endif

#ifndef S_IFBLK
# define S_IFBLK 0060000
#endif

#ifndef S_ISBLK
#  define S_ISBLK(m) ((m & S_IFMT) == S_IFBLK)
#endif

#ifndef S_ISCHR
#  define S_ISCHR(m) ((m & S_IFMT) == S_IFCHR)
#endif

#ifndef S_ISDIR
#  define S_ISDIR(m) ((m & S_IFMT) == S_IFDIR)
#endif
