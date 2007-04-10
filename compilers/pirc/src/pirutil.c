/*

=head1 NAME

pirutil.c - various utility functions

=cut

*/
#include "pirutil.h"
#include <assert.h>
#include <string.h>
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

/*

=head1 FUNCTIONS

=over 4

=item clone_string()

clone a string. Copy the characters of src into dest
and return dest. Memory allocation is done by this function, keeping
this function's client code simple. Please free() the memory after usage!

=cut

*/
char *
clone_string(char const * src) {
    int srclen;
    char * dest, *ptr;

    assert(src != NULL);
    srclen = strlen(src);
    /* dest is used as an iterator, ptr - still pointing to the beginning
     * of the string - is returned
     */
    dest = ptr = (char *)calloc(srclen + 1, sizeof(char));
    while (*src) {
        *dest++ = *src++;
    }
    return ptr;
}


/*

=item verbose()

Prints the specified message if the verbose flag was set

=cut

*/
void
printverbose(char *message) {
    fprintf(stdout, message);
}

/*

=item debug()

Prints the specified message if the debug flag was set.

=cut

*/
void
printdebug(char *message) {
    fprintf(stdout, message);
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
