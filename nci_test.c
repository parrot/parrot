#include <stdio.h>
/*
 * cc -shared -fpic nci_test.c -o libnci.so -g
 * export LD_LIBRARY_PATH=.
 */

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

/* test calls this with a string */
int nci_ip(void *p) {
    fprintf(stderr, "%c%c\n", (*(char**) p)[1], (*(char **) p)[0]);
    return 2;
}

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
