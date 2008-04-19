/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/nci_test.c - shared library used for testing the Native Call Interface

=head1 DESCRIPTION

From this code a shared library can be compiled and linked with a command like:

   cc -shared -fpic nci_test.c -o libnci_test.so -g

For non-Unix platforms the above command has to be modified appropriately.

The resulting shared library should be copied to a location like:

   parrot/runtime/parrot/dynext/libnci_test.so

At that location the shared library is loadable with the opcode 'loadlib'.
The functions in the library are available with the opcode 'dlfunc'.
The variables in the library are available with the opcode 'dlvar'.

=head2 Functions

The name of a test function is usually 'nci_<signature>'. E.g. the function
'nci_ip' takes a 'pointer' and returns a 'int'.

=over 4

=cut

*/

#include <stdio.h>
#include <stdlib.h>
#include <parrot/config.h>

#ifdef __cplusplus
extern "C" {
#endif


/* Declarations of structs */

typedef struct Nested {
    int y;
} Nested;

typedef struct Outer {
    int x;
    Nested *nested;
} Outer;

typedef struct Rect_Like {
    int x, y;
    int w, h;
} Rect_Like;

/* Function declarations.

*** If you add a new test function here,
*** please update src/libnci_test.def and src/call_list.txt too. ***

*/

PARROT_API int    call_back(const char *str);
PARROT_API char   nci_c(void);
PARROT_API char   nci_csc(short, char);
PARROT_API double nci_d(void);
PARROT_API double nci_dd(double);
PARROT_API float  nci_f(void);
PARROT_API float  nci_fff(float, float);
PARROT_API int    nci_i(void);
PARROT_API int    nci_ib(int *);
PARROT_API int    nci_iiii(int, int, int);
PARROT_API int    nci_ii3(int, int *);
PARROT_API int    nci_ip(void *);
PARROT_API int    nci_isc(short, char);
PARROT_API int    nci_it(void *);
PARROT_API int    nci_i33(int *, int *);
PARROT_API int    nci_i4i(long *, int);
PARROT_API long   nci_l(void);
PARROT_API int *  nci_p(void);
PARROT_API void * nci_pi(int);
PARROT_API void * nci_pii(int, int);
PARROT_API void * nci_piiii(int, int, int, int);
PARROT_API void   nci_pip(int, Rect_Like *);
PARROT_API void * nci_pp(void *);
PARROT_API short  nci_s(void);
PARROT_API short  nci_ssc(short, char);
PARROT_API char * nci_t(void);
PARROT_API char * nci_tb(void *);
PARROT_API char * nci_tB(void **);
PARROT_API char * nci_tt(void *);
PARROT_API void   nci_v(void);
PARROT_API void   nci_vP(void *);
PARROT_API void   nci_vpii(Outer *, int, int);
PARROT_API void   nci_vv(void);


/* Declarations for callback tests */

typedef void (*cb_C1_func)(const char*, void*);
PARROT_API void nci_cb_C1(cb_C1_func, void*);

typedef void (*cb_C2_func)(int, void*);
PARROT_API void nci_cb_C2(cb_C2_func, void*);

typedef void (*cb_C3_func)(void*, void*);
PARROT_API void nci_cb_C3(cb_C3_func, void*);

typedef void (*cb_D1_func)(void*, const char*);
PARROT_API void nci_cb_D1(cb_D1_func, void*);

typedef void (*cb_D2_func)(void*, int);
PARROT_API void nci_cb_D2(cb_D2_func, void*);

typedef void (*cb_D3_func)(void*, void*);
PARROT_API void nci_cb_D3(cb_D3_func, void*);

typedef void (*cb_D4_func)(void*, void*);
PARROT_API void nci_cb_D4(cb_D4_func, void*);

/* Variable definitions */

PARROT_API int    int_cb_D4           = -55555;
PARROT_API int    nci_dlvar_char      = 22;
PARROT_API int    nci_dlvar_short     = 333;
PARROT_API int    nci_dlvar_int       = -4444;
PARROT_API long   nci_dlvar_long      = -7777777;
PARROT_API float  nci_dlvar_float     = -333.0;
PARROT_API double nci_dlvar_double    = -55555.55555;
PARROT_API char   nci_dlvar_cstring[] = "This is a C-string.\n";


/* Function definitions */

/*

=item C<PARROT_API char
nci_c(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API char
nci_c(void) {
    return nci_dlvar_char;
}

/*

=item C<PARROT_API char
nci_csc(short l1, char l2)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API char
nci_csc(short l1, char l2)
{
    return l1 * l2;
}

/*

=item C<PARROT_API double
nci_d(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API double
nci_d(void)
{
    nci_dlvar_double *= 10.0;

    return nci_dlvar_double;
}

/*

=item C<PARROT_API double
nci_dd(double d)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API double
nci_dd(double d)
{
    return d * 2.0;
}

/*

=item C<PARROT_API float
nci_f(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API float
nci_f(void)
{
    nci_dlvar_float *= 10.0;

    return nci_dlvar_float;
}

/*

=item C<PARROT_API float
nci_fff(float l1, float l2)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API float
nci_fff(float l1, float l2)
{
    return l1 / l2;
}

/*

=item C<PARROT_API int
nci_i(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_i(void)
{
   return nci_dlvar_int;
}

/*

=item C<PARROT_API int
nci_isc(short l1, char l2)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_isc(short l1, char l2)
{
    return l1 * l2;
}

/*

=item C<PARROT_API int
nci_ip(void *p)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_ip(void *p)
{
    typedef struct _dfi {
        double d;
        float f;
        int i;
        char *s;
    } dfi;
    dfi *sp = (dfi*) p;
    puts(sp->s);
    fflush(stdout);

    return (int) (sp->d + sp->f + sp->i);
}

/*

=item C<PARROT_API int
nci_it(void *p)>

test calls this with a string

=cut

*/

PARROT_API int
nci_it(void *p)
{
    fprintf(stderr, "%c%c\n", ((char*) p)[1], ((char *) p)[0]);
    fflush(stderr);

    return 2;
}

/*

=item C<PARROT_API long
nci_l(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API long
nci_l(void)
{
    return nci_dlvar_long;
}

/*

=item C<PARROT_API int *
nci_p(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int *
nci_p(void)
{
    return &nci_dlvar_int;
}

/*

=item C<PARROT_API char *
nci_t(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API char *
nci_t(void)
{
    return nci_dlvar_cstring;
}

/*

=item C<PARROT_API char *
nci_tb(void *p)>

RT#48260: Not yet documented!!!

=cut

*/

static char b[] = "xx worked\n";

PARROT_API char *
nci_tb(void *p)
{
    b[0] = ((char*) p)[1];
    b[1] = ((char*) p)[0];

    return b;
}

/*

=item C<PARROT_API char *
nci_tt(void *p)>

RT#48260: Not yet documented!!!

=cut

*/

static char s[] = "xx worked\n";

PARROT_API char *
nci_tt(void *p)
{
    s[0] = ((char*) p)[1];
    s[1] = ((char*) p)[0];

    return s;
}

/*

=item C<PARROT_API char *
nci_tB(void **p)>

RT#48260: Not yet documented!!!

=cut

*/

static char B[] = "xx done\n";

PARROT_API char *
nci_tB(void **p)
{
    B[0] = (*(char**) p)[1];
    B[1] = (*(char**) p)[0];

    return B;
}

/*

=item C<PARROT_API void *
nci_pp(void *p)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void *
nci_pp(void *p)
{
    return p;
}

/*

=item C<PARROT_API int
nci_iiii(int i1, int i2, int i3)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_iiii(int i1, int i2, int i3)
{
    fprintf(stderr, "%d %d %d\n", i1, i2, i3);
    fflush(stderr);

    return 2;
}

/*

=item C<PARROT_API int
nci_i4i(long * l, int i)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_i4i(long * l, int i)
{

    return (int) (*l * i);
}

/*

=item C<PARROT_API int
nci_ii3(int a, int *bp)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_ii3(int a, int *bp)
{
    int r = a * *bp;
    *bp = 4711;

    return r;
}

/*

=item C<PARROT_API int
call_back(const char *str)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
call_back(const char *str)
{
    puts(str);
    fflush(stdout);

    return 4711;
}

/*

=item C<PARROT_API void *
nci_pi(int test)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void *
nci_pi(int test)
{
    switch (test) {
        case 0:
            {
                static struct {
                    int i[2];
                    char c;
                } t = {
                    {42, 100},
                    'B'
                };
                return &t;
            }
        case 1:
            {
                static struct {
                    float f[2];
                    double d;
                } t = {
                    {42.0, 100.0},
                    47.11
                };
                return &t;
            }
        case 2:
            {
                static struct {
                    char c;
                    int i;
                } t = {
                     10,
                     20
                };
                return &t;
            }
        case 3:
            {
                static struct {
                    const char *c;
                    int i;
                } t = {
                     "hello",
                     20
                };
                return &t;
            }
        case 4:
            {
                static struct _x {
                    int i;
                    int j;
                    double d;
                } xx = { 100, 77, 200.0 };
                static struct {
                    char c;
                    struct _x *x;
                } t = {
                     10,
                     &xx
                };
                return &t;
            }
        case 5:
            {
                static struct {
                    int (*f)(const char *);
                } t = {
                     call_back
                };
                return &t;
            }
        case 6:
            {
                static struct xt {
                    int x;
                    struct yt {
                        int i;
                        int  j;
                    } _y;
                    int z;
                } _x = {
                    32,
                    { 127, 12345 },
                    33
                };
                return &_x;
            }
        case 7:
            {
                static struct xt {
                    char x;
                    struct yt {
                        char i;
                        int  j;
                    } _y;
                    char z;
                } _x = {
                    32,
                    { 127, 12345 },
                    33
                };
                return &_x;
            }
        case 8:
            {
                static struct _z {
                    int i;
                    int j;
                } zz = { 100, 77 };
                static struct xt {
                    int x;
                    struct yt {
                        int i;
                        int j;
                        struct _z *z;
                    } _y;
                } _x = {
                    32,
                    { 127, 12345, &zz },
                };
                return &_x;
            }
        case 9:
            {
                static int i = 55555;
                return &i;
            }
        default:
            fprintf(stderr, "unknown test number\n");
    }

    return NULL;
}

/*

=item C<PARROT_API short
nci_s(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API short
nci_s(void)
{
    return nci_dlvar_short;
}

/*

=item C<PARROT_API short
nci_ssc(short l1, char l2)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API short
nci_ssc(short l1, char l2)
{
    return l1 * l2;
}

/*

=item C<PARROT_API void
nci_vP(void *pmc)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_vP(void *pmc)
{
    if (pmc)
        puts("ok");
    else
        puts("got null");
}


/*

=back

=head2 Functions used for pdd16 tests

=over 4

=cut

*/

/*

=item C<PARROT_API void
nci_cb_C1(cb_C1_func cb, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_cb_C1(cb_C1_func cb, void* user_data)
{
    const char *result = "succeeded";
    /* call the cb synchronously */
    (cb)(result, user_data);

    return;
}

/*

=item C<PARROT_API void
nci_cb_C2(cb_C2_func cb, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_cb_C2(cb_C2_func cb, void* user_data)
{
    /* call the cb synchronously */
    (cb)(77, user_data);

    return;
}

/*

=item C<PARROT_API void
nci_cb_C3(cb_C3_func cb, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

static int int_cb_C3 = 99;

PARROT_API void
nci_cb_C3(cb_C3_func cb, void* user_data)
{
    /* call the cb synchronously */
    (cb)(&int_cb_C3, user_data);

    return;
}

/*

=item C<PARROT_API void
nci_cb_D1(cb_D1_func cb, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_cb_D1(cb_D1_func cb, void* user_data)
{
    const char *result = "succeeded";
    /* call the cb synchronously */
    (cb)(user_data, result);

    return;
}

/*

=item C<PARROT_API void
nci_cb_D2(cb_D2_func cb, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_cb_D2(cb_D2_func cb, void* user_data)
{
    /* call the cb synchronously */
    (cb)(user_data, 88);

    return;
}

/*

=item C<PARROT_API void
nci_cb_D3(cb_D3_func cb, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

static int int_cb_D3 = 111;

PARROT_API void
nci_cb_D3(cb_D3_func cb, void* user_data)
{
    /* call the cb synchronously */
    (cb)(user_data, &int_cb_D3);

    return;
}

/*

=item C<PARROT_API void
nci_cb_D4(cb_D4_func times_ten, void* user_data)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_cb_D4(cb_D4_func times_ten, void* user_data)
{
    int cnt;
    for (cnt = 0; cnt < 9; cnt++)
    {
        (times_ten)(user_data, &int_cb_D4);
        int_cb_D4++;
    }

    return;
}

/*

=item C<PARROT_API void
nci_pip(int count, Rect_Like *rects)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_pip(int count, Rect_Like *rects)
{
    int i;
    printf("Count: %d\n", count);
    for (i = 0; i < 4; ++i)
        printf("X: %d\nY: %d\nW: %d\nH: %d\n",
        rects[i].x, rects[i].y, rects[i].w, rects[i].h);
}

/*

=item C<PARROT_API int
nci_i33(int *double_me, int *triple_me)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API int
nci_i33(int *double_me, int *triple_me)
{
    *double_me *= 2;
    *triple_me *= 3;

    return (*double_me + *triple_me);
}

/*

=item C<PARROT_API void
nci_vpii(Outer *my_data, int my_x, int my_y)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_vpii(Outer *my_data, int my_x, int my_y)
{
    my_data->x            = my_x;
    my_data->nested->y    = my_y;
}

/*

=item C<PARROT_API void *
nci_piiii(int alpha, int beta, int gamma, int delta)>

RT#48260: Not yet documented!!!

=cut

*/

static int my_array[4];

PARROT_API void *
nci_piiii(int alpha, int beta, int gamma, int delta)
{
    static struct array_container
    {
        int   x;
        int *array;
    } container;

    my_array[0] = alpha;
    my_array[1] = beta;
    my_array[2] = gamma;
    my_array[3] = delta;

    container.x = 4;
    container.array = my_array;

    return &container;
}

/*

=item C<PARROT_API void *
nci_pii(int fac1, int fac2)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void *
nci_pii(int fac1, int fac2)
{
   nci_dlvar_int = fac1 * fac2;

   return &nci_dlvar_int;
}

/*

=item C<PARROT_API void
nci_v(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_v(void)
{
    nci_dlvar_int *= 10;
}

/*

=item C<PARROT_API void
nci_vv(void)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API void
nci_vv(void)
{
    nci_dlvar_int *= 3;
}

#ifdef TEST

char l2 = 4;
float f2 = 4.0;

/*

=item C<int
main(void)>

RT#48260: Not yet documented!!!

=cut

*/

int
main(void)
{
    short l1 = 3;
    float f, f1 = 3.0;
    int l = nci_ssc(l1, l2);
    printf("%d\n", l);
    f = nci_fff(f1, f2);
    printf("%f\n", f);

    return 0;
}

#endif

#ifdef __cplusplus
}
#endif

/*

=back

=head1 SEE ALSO:

  F<docs/pdds/pdd16_native_call.pod>
  F<config/gen/makefiles/root.in>
  F<t/pmc/nci.t>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
