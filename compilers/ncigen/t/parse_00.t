#!perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use lib ('./lib', '../../lib');
use Parrot::Test::NCIGENAST;

plan tests => 20;

parse_success(<<'CODE', '__extension__00.c');
extern double strtod (__const char *__restrict __nptr, char **__restrict __endptr) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

enum { MSG_OOB = 0x01 };
__extension__ typedef signed long long int __int64_t;

__extension__ typedef struct { int __val[2]; } __fsid_t;
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict, __gnuc_va_list, int *__restrict);

struct random_data
{
  int32_t rand_type;
};

struct _IO_FILE {
char _unused2[15 * 6];
char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};

struct random_data
{
  int32_t rand_type;
};

int a = 8 - sizeof(int);
char _unused2 = 15 + 6;
int b = 12;
int a = 10 * sizeof(int) * 13;
int a = 8 * 3;
typedef int Oid;
int32_t Oid;
int Oid;
typedef unsigned int Oid;
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;

typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      int __spins;
      __pthread_slist_t __list;
    };

  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;
__extension__ typedef void * __timer_t;
CODE

parse_success(<<'CODE', '__attribute__.c');
extern double strtod (__const char *__restrict __nptr, char **__restrict __endptr) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
CODE

parse_success(<<'CODE', 'enums.c');
enum { MSG_OOB = 0x01 };
CODE

parse_success(<<'CODE', '__extension__01.c');
__extension__ typedef signed long long int __int64_t;
CODE

parse_success(<<'CODE', '__extension__02.c');
__extension__ typedef struct { int __val[2]; } __fsid_t;
CODE

parse_success(<<'CODE', 'gnu_va_arg.c');
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict, __gnuc_va_list, int *__restrict);
CODE

parse_success(<<'CODE', 'int_32_t_declaration.c');
struct random_data
{
  int32_t rand_type;
};
CODE

parse_success(<<'CODE', 'struct_declaration_00.c');
struct _IO_FILE {
char _unused2[15 * 6];
char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
CODE

parse_success(<<'CODE', 'struct_declaration_01.c' );
struct random_data
{
  int32_t rand_type;
};
CODE

parse_success(<<'CODE', 'times_01.c');
int a = 8 - sizeof(int);
CODE

parse_success(<<'CODE', 'times_02.c');
char _unused2 = 15 + 6;
CODE

parse_success(<<'CODE', 'times_03.c');
int b = 12;
int a = 10 * sizeof(int) * 13;
CODE

parse_success(<<'CODE', 'times_04.c').c;
int a = 8 * 3;
CODE

parse_success(<<'CODE', 'typedef_01.c');
typedef int Oid;
CODE

parse_success(<<'CODE', 'typedef_02.c');
int32_t Oid;
CODE

parse_success(<<'CODE', 'typedef_03.c');
int Oid;
CODE

parse_success(<<'CODE', 'typedef.c');
typedef unsigned int Oid;
CODE

parse_success(<<'CODE', 'typedef_union_00.c');
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
CODE

parse_success(<<'CODE', 'typedef_union_01.c');
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      int __spins;
      __pthread_slist_t __list;
    };

  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;
CODE

parse_success(<<'CODE', 'void_star.c');
__extension__ typedef void * __timer_t;
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
