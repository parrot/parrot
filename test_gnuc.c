/*
 * test_gnuc.c - figure out if the compiler is gcc.
 */

#include <stdio.h>

int main(int argc, char **argv) {
    puts("(");
#ifdef __GNUC__
    printf ("__GNUC__ => %d,\n", __GNUC__);
#ifdef __GNUC_MINOR__
    printf ("__GNUC_MINOR__ =>%d,\n", __GNUC_MINOR__);
#endif
#else
    puts ("__GNUC__ => undef,");
#endif
    puts(");");
    return 0;
}
