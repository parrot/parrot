/*

=head1 NAME

pge/pge_parseglob.c - Parse a (wildcard) glob into an expression tree

=head1 DESCRIPTION

This file contains the functions for parsing glob expressions (commonly
used as "wildcards" in shell expansions) into a tree representation 
that can be converted to a subroutine by PGE's rule generator.

=head2 Functions

=over 4

=cut

*/

#include "pge.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/* Build a regular expression tree from the glob string given by s. */
static PGE_Exp*
pge_parseglob(const unsigned char* s)
{
    PGE_Exp* e = 0;
    static unsigned char lit[PGE_MAX_LITERAL_LEN];
    int len = 0;

    switch (*s) {
    case 0:
        e = pge_parse_new(PGE_NULL_PATTERN, 0, 0); break;
    case '?': 
        s++; e = pge_parse_new(PGE_DOT, 0, 0); break;
    case '*':
        s++; e = pge_parse_new(PGE_DOT, 0, 0);
        e->min = 0; e->max = PGE_INF;
        break;
    default:
        while (len < PGE_MAX_LITERAL_LEN && *s) {
            if (*s == '*' || *s == '?') break;
            if (*s == '\\') s++;
            lit[len++] = *(s++);
        }
        e = pge_parse_new(PGE_LITERAL, 0, 0);
        e->name = malloc(len);
        e->nlen = len;
        memcpy(e->name, lit, e->nlen);
        break;
    }
    if (*s) return pge_parse_new(PGE_CONCAT, e, pge_parseglob(s));
    return e;
}

/*

=item C<char* pge_glob_pir(const char* s)>

Converts the glob expression in s to its equivalent PIR code.
This function calls pge_parseglob() to build an expression tree from
the string in s, then calls pge_gen() to generate a PIR subroutine
from the expression tree.

=back

=cut

*/

char*
pge_glob_pir(const unsigned char* s)
{
    PGE_Exp* e = 0;
    char* pir = 0;

    e = pge_parse_new(PGE_PATTERN_END, 0, 0);
    e = pge_parse_new(PGE_CONCAT, pge_parse_new(PGE_ANCHOR_EOS, 0, 0), e);
    e = pge_parse_new(PGE_CONCAT, pge_parseglob(s), e);
    e = pge_parse_new(PGE_CONCAT, pge_parse_new(PGE_ANCHOR_BOS, 0, 0), e);

    pir = pge_gen(e);
    pge_parse_free(e);
    return pir;
}


