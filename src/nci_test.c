#include <stdio.h>
/*
 * cc -shared -fpic nci_test.c -o libnci.so -g
 * export LD_LIBRARY_PATH=.
 */
double nci_dd(double d);
short nci_ssc(short l1, char l2);
int nci_csc(short l1, char l2);
int nci_isc(short l1, char l2);
float nci_fff(float l1, float l2);
int nci_ip(void *p);
int nci_it(void *p);
char *nci_tt(void *p);
char *nci_tb(void *p);
char *nci_tB(void **p);
void * nci_pp(void *p);
int nci_iiii(int i1, int i2, int i3);
int nci_i4i(long * l, int i);
int nci_ii3(int a, int *b);
void * nci_pi(int test);
void  nci_vP(void *pmc);

typedef void (*cb_C1_func)(const char*, void*);
void nci_cb_C1(cb_C1_func, void*);
typedef void (*cb_C2_func)(int, void*);
void nci_cb_C2(cb_C2_func, void*);

typedef void (*cb_D1_func)(void*, const char*);
void nci_cb_D1(cb_D1_func, void*);

typedef struct
{
	int x, y;
	int w, h;
} Rect_Like;

void nci_pip (int count, Rect_Like *rects);
int nci_i_33 (int *double_me, int *triple_me);

double nci_dd(double d) {
    return d * 2.0;
}

short nci_ssc(short l1, char l2) {
    return l1 * l2;
}

int nci_csc(short l1, char l2) {
    return l1 * l2;
}

int nci_isc(short l1, char l2) {
    return l1 * l2;
}

float nci_fff(float l1, float l2) {
    return l1 / l2;
}

int nci_ip(void *p) {
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
int nci_it(void *p) {
    fprintf(stderr, "%c%c\n", ((char*) p)[1], ((char *) p)[0]);
    return 2;
}

static char s[] = "xx worked\n";
char *nci_tt(void *p) {
    s[0] = ((char*) p)[1];
    s[1] = ((char*) p)[0];
    return s;
}

static char b[] = "xx worked\n";
char *nci_tb(void *p) {
    b[0] = ((char*) p)[1];
    b[1] = ((char*) p)[0];
    return b;
}

static char B[] = "xx done\n";
char *nci_tB(void **p) {
    B[0] = (*(char**) p)[1];
    B[1] = (*(char**) p)[0];
    return B;
}

void * nci_pp(void *p) {
    return p;
}

int nci_iiii(int i1, int i2, int i3) {
    fprintf(stderr, "%d %d %d\n", i1, i2, i3);
    return 2;
}

int nci_i4i(long * l, int i) {
    return (int) (*l * i);
}

int nci_ii3(int a, int *bp) {
    int r = a * *bp;
    *bp = 4711;
    return r;
}

static int call_back(char *str) {
    puts(str);
    fflush(stdout);
    return 4711;
}

void * nci_pi(int test) {
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
        default:
            fprintf(stderr, "unknown test number\n");
    }
    return NULL;
}

void nci_vP(void *pmc)
{
    if (pmc)
        puts("ok");
    else
        puts("got null");
}

/*
 * pdd16 tests
 */
void
nci_cb_C1(cb_C1_func cb, void* user_data)
{
    const char *result = "succeeded";
    /* call the cb synchronously */
    (cb)(result, user_data);
}

void
nci_cb_C2(cb_C2_func cb, void* user_data)
{
    /* call the cb synchronously */
    (cb)(77, user_data);
}


void
nci_cb_D1(cb_D1_func cb, void* user_data)
{
    const char *result = "succeeded";
    /* call the cb synchronously */
    (cb)(user_data, result);
}

void nci_pip (int count, Rect_Like *rects)
{
    int i;
    printf( "Count: %d\n", count);
    for (i = 0; i < 4; ++i)
        printf("X: %d\nY: %d\nW: %d\nH: %d\n",
		rects[i].x, rects[i].y, rects[i].w, rects[i].h );
}

int nci_i_33 (int *double_me, int *triple_me)
{
	*double_me *= 2;
	*triple_me *= 3;

	return( *double_me + *triple_me );
}

#ifdef TEST
char l2 = 4;
float f2 = 4.0;
int main() {
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
