/*

=head1 NAME

pge/pge_parsep5.c - Generate PIR code for Perl 5 regular expressions

=head1 DESCRIPTION

This file contains the functions for parsing perl 5 regular expressions
into PIR code based on the Parrot Grammar Engine.

=head2 Functions

=over 4

=cut

*/

#include "pge.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static PGE_Exp* p5re_parse_expr(PGE_Text* t);

static void 
p5re_parse_error(PGE_Text* t, const char* msg)
{
   printf("%s at offset %d (found '%c')\n", msg, t->pos - t->text, *(t->pos));
   t->pos = NULL;
}


static void 
p5re_skip(PGE_Text* t,int skip) 
{
    const unsigned char* s = t->pos + skip;
    /* while (pge_ctype[*s] & ctspace) s++;
    while (*s=='#') {
        s++;
        while (*s && *s!='\n') s++;
        while (pge_ctype[*s] & ctspace) s++;
    } */
    t->pos = s;
}


static PGE_Exp*
p5re_parse_literal(PGE_Text* t)
{
    static unsigned char lit[PGE_MAX_LITERAL_LEN];
    PGE_Exp* e = 0;
    unsigned int len = 0;
    int c;

    while (len<sizeof(lit) && (c = *(t->pos))) {
        if ((pge_ctype[c] & ctmeta) == 0)
            { lit[len++] = c; p5re_skip(t, 1); }
        else if (pge_ctype[c] & ctspace) 
            { lit[len++] = c; p5re_skip(t, 1); }
        else if (c == '\\' && pge_cmeta[t->pos[1]] >= 0)
            { lit[len++] = pge_cmeta[t->pos[1]]; p5re_skip(t, 2); }
        else break;
    }
    if (len>0) {
        e = pge_parse_new(PGE_LITERAL, 0, 0);
        e->name = malloc(len); e->nlen = len;
        memcpy(e->name, lit, len);
    }
    return e;
}


static PGE_Exp*
p5re_parse_term(PGE_Text* t)
{
    PGE_Exp* e = 0;
    int c;
    int ctype;
    int tt;

    p5re_skip(t, 0);
    c = *(t->pos);
    ctype = pge_ctype[c];
    if ((ctype & ctmeta) == 0 || (ctype & ctspace) != 0 
           || (c == '\\' && pge_cmeta[t->pos[1]] >= 0))
       return p5re_parse_literal(t);
    if (c == '(') {
       p5re_skip(t,1);
       if (t->pos[0] == '?') { tt = --(t->ncapture);  p5re_skip(t,2); }
       else tt = ++(t->capture);
       e = pge_parse_new(PGE_GROUP, p5re_parse_expr(t), 0);
       e->group = tt;
       if (*(t->pos) != ')') p5re_parse_error(t, "Missing ')'");
       else p5re_skip(t, 1);
       return e;
    }
    if (c == '.') {
       p5re_skip(t, 1);
       return pge_parse_new(PGE_DOT, 0, 0);
    }
    if (c == '^') {
       p5re_skip(t, 1);
       return pge_parse_new(PGE_ANCHOR_BOS, 0, 0);
    }
    if (c == '$') {
       p5re_skip(t, 1);
       return pge_parse_new(PGE_ANCHOR_EOS, 0, 0);
    }
    p5re_parse_error(t, "Unrecognized character");
    return 0;
}


static PGE_Exp* 
p5re_parse_quant(PGE_Text* t)
{
    PGE_Exp* e = p5re_parse_term(t);
    PGE_Exp* q = e;

    int c = *(t->pos);
    if (c != '{' && (pge_ctype[c] & ctquant) == 0) return e;
    p5re_skip(t, 1);

    /* if quantifying a literal string, the quantifier only applies
       to the last char */
    if (e->type == PGE_LITERAL && e->nlen > 1) {
       q = pge_parse_new(PGE_LITERAL, 0, 0);
       e->nlen--;
       q->name = malloc(1); q->nlen = 1;
       q->name[0] = e->name[e->nlen];
       e = pge_parse_new(PGE_CONCAT, e, q);
    }

    if (c == '+') q->max = PGE_INF;
    else if (c == '?') { q->min = 0; }
    else if (c == '*') { q->min = 0; q->max = PGE_INF; }
    else if (c == '{') {
        if (isdigit(*(t->pos))) {
            q->min = q->max = atoi((const char *) t->pos);
            while (isdigit(*(t->pos))) t->pos++;
            p5re_skip(t, 0);
        } else p5re_parse_error(t, "Missing min value in {} quantifier");
        if (t->pos[0] == ',') {
            p5re_skip(t, 1);
            if (isdigit(*(t->pos))) {
                q->max = atoi((const char *) t->pos);
                while (isdigit(*(t->pos))) t->pos++;
                p5re_skip(t, 0);
            }
            else q->max = PGE_INF;
        }
        if (*(t->pos) != '}') 
            p5re_parse_error(t, "Missing closing '}'");
        else p5re_skip(t, 1);
    }
    if (*(t->pos) == '?') { q->isgreedy = 0; p5re_skip(t,1); }
    return e;
}


static PGE_Exp*
p5re_parse_concat(PGE_Text* t)
{
    PGE_Exp* e = p5re_parse_quant(t);
    if ((pge_ctype[*(t->pos)] & ctket) == 0) 
        e = pge_parse_new(PGE_CONCAT, e, p5re_parse_concat(t));
    return e;
}


static PGE_Exp*
p5re_parse_alt(PGE_Text* t)
{
    PGE_Exp* e = p5re_parse_concat(t);
    if (*(t->pos) == '|') {
        p5re_skip(t, 1);
        e = pge_parse_new(PGE_ALT, e, p5re_parse_alt(t));
    }
    return e;
}
      
static PGE_Exp*
p5re_parse_expr(PGE_Text* t)
{
    return p5re_parse_alt(t);
}

/*

=item C<PGE_Exp* p5re_parse(const char* s)>

Builds a regular expression tree from the string specified in s.

=cut

*/

static PGE_Exp*
p5re_parse(const unsigned char* s)
{
    PGE_Text t;
    PGE_Exp* e = 0;
    t.text = s;
    t.pos = s;
    t.capture = 0;
    t.ncapture = 0;
    return p5re_parse_expr(&t);
}

/*

=item C<char* pge_p5regex_pir(const char* s)>

Converts the P5 regular expression in s to its equivalent PIR code.
This function calls p5re_parse() to build an expression tree from
the string in s, then calls pge_gen() to generate a PIR subroutine
from the expression tree.

=cut

*/

char*
pge_p5re_pir(const unsigned char* s)
{
    PGE_Exp* e = 0;
    PGE_Exp* dot0 = 0;
    char* pir = 0;

    e = pge_parse_new(PGE_CONCAT,
                           pge_parse_new(PGE_GROUP, p5re_parse(s), 0),
                           pge_parse_new(PGE_PATTERN_END, 0, 0));

    if (!pge_is_bos_anchored(e)) {
        dot0 = pge_parse_new(PGE_DOT, 0, 0);
        dot0->min = 0; dot0->max = PGE_INF; dot0->isgreedy = 0;
        e = pge_parse_new(PGE_CONCAT, dot0, e);
    }

    pir = pge_gen(e);
    pge_parse_free(e);
    return pir;
}

/*

=back

=head1 SEE ALSO

=head1 HISTORY

Initial version by Patrick R. Michaud, 2004.11.16

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

