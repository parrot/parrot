/*
Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
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

=head1 Functions

The name of a test function is usually 'nci_<signature>'. E.g. the function
'nci_ip' takes a 'pointer' and returns a 'int'.

=cut

*/

#include <stdio.h>
#include <stdlib.h>

/* Declarations of structs */

typedef struct {
    int y;
} Nested;

typedef struct {
    int x;
    Nested *nested;
} Outer;

typedef struct {
    int x, y;
    int w, h;
} Rect_Like;

/* Function declarations.

*** If you add a new test function here,
*** please update src/libnci_test.def and src/call_list.txt too. ***

*/

char   nci_c(void);
char   nci_csc(short, char);
double nci_d(void);
double nci_dd(double);
float  nci_f(void);
float  nci_fff(float, float);
int    nci_i(void);
int    nci_ib(int *);
int    nci_iiii(int, int, int);
int    nci_ii3(int, int *);
int    nci_ip(void *);
int    nci_isc(short, char);
int    nci_it(void *);
int    nci_i33(int *, int *);
int    nci_i4i(long *, int);
long   nci_l(void);
int *  nci_p(void);
void * nci_pi(int);
void * nci_pii(int, int);
void * nci_piiii(int, int, int, int);
void   nci_pip(int, Rect_Like *);
void * nci_pp(void *);
short  nci_s(void);
short  nci_ssc(short, char);
char * nci_t(void);
char * nci_tb(void *);
char * nci_tB(void **);
char * nci_tt(void *);
void   nci_v(void);
void   nci_vP(void *);
void   nci_vpii(Outer *, int, int);
void   nci_vv(void);


/* Declarations for callback tests */

typedef void (*cb_C1_func)(const char*, void*);
void nci_cb_C1(cb_C1_func, void*);

typedef void (*cb_C2_func)(int, void*);
void nci_cb_C2(cb_C2_func, void*);

typedef void (*cb_C3_func)(void*, void*);
void nci_cb_C3(cb_C3_func, void*);

typedef void (*cb_D1_func)(void*, const char*);
void nci_cb_D1(cb_D1_func, void*);

typedef void (*cb_D2_func)(void*, int);
void nci_cb_D2(cb_D2_func, void*);

typedef void (*cb_D3_func)(void*, void*);
void nci_cb_D3(cb_D3_func, void*);

typedef void (*cb_D4_func)(void*, void*);
void nci_cb_D4(cb_D4_func, void*);

/* Variable definitions */

int    nci_dlvar_char      = 22;
int    nci_dlvar_short     = 333;
int    nci_dlvar_int       = -4444;
long   nci_dlvar_long      = -7777777;
float  nci_dlvar_float     = -333.0;
double nci_dlvar_double    = -55555.55555;
char   nci_dlvar_cstring[] = "This is a C-string.\n";


/* Function definitions */

char
nci_c() {
    return nci_dlvar_char;
}

char
nci_csc(short l1, char l2) {
    return l1 * l2;
}

double
nci_d() {
    nci_dlvar_double *= 10.0;

    return nci_dlvar_double;
}

double
nci_dd(double d) {
    return d * 2.0;
}

float
nci_f() {
    nci_dlvar_float *= 10.0;

    return nci_dlvar_float;
}

float
nci_fff(float l1, float l2) {
    return l1 / l2;
}

int
nci_i( void ) {
   return nci_dlvar_int;
}

int
nci_isc(short l1, char l2) {
    return l1 * l2;
}

int
nci_ip(void *p) {
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

/* test calls this with a string */
int
nci_it(void *p) {
    fprintf(stderr, "%c%c\n", ((char*) p)[1], ((char *) p)[0]);
    fflush(stderr);

    return 2;
}

long
nci_l() {
    return nci_dlvar_long;
}

int *
nci_p() {
    return &nci_dlvar_int;
}

char *
nci_t() {
    return nci_dlvar_cstring;
}

static char b[] = "xx worked\n";
char *
nci_tb(void *p) {
    b[0] = ((char*) p)[1];
    b[1] = ((char*) p)[0];

    return b;
}

static char s[] = "xx worked\n";
char *
nci_tt(void *p) {
    s[0] = ((char*) p)[1];
    s[1] = ((char*) p)[0];

    return s;
}

static char B[] = "xx done\n";
char *
nci_tB(void **p) {
    B[0] = (*(char**) p)[1];
    B[1] = (*(char**) p)[0];

    return B;
}

void *
nci_pp(void *p) {
    return p;
}

int
nci_iiii(int i1, int i2, int i3) {
    fprintf(stderr, "%d %d %d\n", i1, i2, i3);
    fflush(stderr);

    return 2;
}

int
nci_i4i(long * l, int i) {

    return (int) (*l * i);
}

int
nci_ii3(int a, int *bp) {
    int r = a * *bp;
    *bp = 4711;

    return r;
}

static int
call_back(char *str) {
    puts(str);
    fflush(stdout);

    return 4711;
}

void *
nci_pi(int test) {
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
                    int (*f)(char *);
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

short
nci_s() {
    return nci_dlvar_short;
}

short
nci_ssc(short l1, char l2) {
    return l1 * l2;
}

void
nci_vP(void *pmc) {
    if (pmc)
        puts("ok");
    else
        puts("got null");
}


/*

=head1 Functions used for pdd16 tests

=cut

*/

void
nci_cb_C1(cb_C1_func cb, void* user_data) {
    const char *result = "succeeded";
    /* call the cb synchronously */
    (cb)(result, user_data);

    return;
}

void
nci_cb_C2(cb_C2_func cb, void* user_data) {
    /* call the cb synchronously */
    (cb)(77, user_data);

    return;
}

static int int_cb_C3 = 99;
void
nci_cb_C3(cb_C3_func cb, void* user_data) {
    /* call the cb synchronously */
    (cb)(&int_cb_C3, user_data);

    return;
}

void
nci_cb_D1(cb_D1_func cb, void* user_data) {
    const char *result = "succeeded";
    /* call the cb synchronously */
    (cb)(user_data, result);

    return;
}

void
nci_cb_D2(cb_D2_func cb, void* user_data) {
    /* call the cb synchronously */
    (cb)(user_data, 88);

    return;
}

static int int_cb_D3 = 111;
void
nci_cb_D3(cb_D3_func cb, void* user_data) {
    /* call the cb synchronously */
    (cb)(user_data, &int_cb_D3);

    return;
}

int int_cb_D4 = -55555;
void
nci_cb_D4(cb_D4_func times_ten, void* user_data) {
    int cnt;
    for ( cnt = 0; cnt < 9; cnt++ )
    {
        (times_ten)(user_data, &int_cb_D4);
        int_cb_D4++;
    }

    return;
}

void 
nci_pip(int count, Rect_Like *rects) {
    int i;
    printf( "Count: %d\n", count);
    for (i = 0; i < 4; ++i)
        printf("X: %d\nY: %d\nW: %d\nH: %d\n",
        rects[i].x, rects[i].y, rects[i].w, rects[i].h );
}

int
nci_i33(int *double_me, int *triple_me) {
    *double_me *= 2;
    *triple_me *= 3;

    return( *double_me + *triple_me );
}

void
nci_vpii(Outer *my_data, int my_x, int my_y) {
    my_data->x            = my_x;
    my_data->nested->y    = my_y;
}

static int my_array[4];
void *
nci_piiii(int alpha, int beta, int gamma, int delta) {
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

void *
nci_pii(int fac1, int fac2) {
   nci_dlvar_int = fac1 * fac2;

   return &nci_dlvar_int;
}


void
nci_v( ) {
    nci_dlvar_int *= 10;
}

void
nci_vv( void ) {
    nci_dlvar_int *= 3;
}

#ifdef TEST

char l2 = 4;
float f2 = 4.0;
int
main() {
    short l1 = 3;
    float f, f1 = 3.0;
    int l = nci_ssc(l1, l2);
    printf("%d\n", l);
    f = nci_fff(f1, f2);
    printf("%f\n", f);

    return 0;
}

#endif

/*

=head1 SEE ALSO:

  F<docs/pdds/pdd16_native_call.pod>
  F<config/gen/makefiles/root.in>
  F<t/pmc/nci.t>

=cut

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
