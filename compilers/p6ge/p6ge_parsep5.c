/*

=head1 NAME

p6ge/p6ge_parsep5.c - Parse a P5 regex into an expression tree

=head1 DESCRIPTION

This file contains the functions for parsing perl 5 regular expressions
into a tree representation that can then be used to generate regular
expression code.

=head2 Functions

=over 4

=cut

*/

#include "p6ge.h"
#include <ctype.h>
#include <malloc.h>
#include <stdio.h>

static P6GE_Exp* p5re_parse_expr(P6GE_Text* t);

static void 
p5re_parse_error(P6GE_Text* t, const char* msg)
{
   printf("%s at offset %d (found '%c')\n", msg, t->pos - t->text, *(t->pos));
   t->pos = "";
}


static void 
p5re_skip(P6GE_Text* t,int skip) 
{
    const unsigned char* s = t->pos + skip;
    /* while (p5re_ctype[*s] & ctspace) s++;
    while (*s=='#') {
        s++;
        while (*s && *s!='\n') s++;
        while (p5re_ctype[*s] & ctspace) s++;
    } */
    t->pos = s;
}

#define p5re_parse_new  p6ge_parse_new
#define p5re_parse_free p6ge_parse_free
#define p5re_ctype      p6ge_ctype
#define p5re_cmeta      p6ge_cmeta

static P6GE_Exp*
p5re_parse_literal(P6GE_Text* t)
{
    static unsigned char lit[P6GE_MAX_LITERAL_LEN];
    P6GE_Exp* e = 0;
    int len = 0;
    int c;

    while (len<sizeof(lit) && (c = *(t->pos))) {
        if ((p5re_ctype[c] & ctmeta) == 0)
            { lit[len++] = c; p5re_skip(t, 1); }
        else if (p5re_ctype[c] & ctspace) 
            { lit[len++] = c; p5re_skip(t, 1); }
        else if (c == '\\' && p5re_cmeta[t->pos[1]] >= 0)
            { lit[len++] = p5re_cmeta[t->pos[1]]; p5re_skip(t, 2); }
        else break;
    }
    if (len>0) {
        e = p5re_parse_new(P6GE_LITERAL, 0, 0);
        e->name = malloc(len); e->nlen = len;
        memcpy(e->name, lit, len);
    }
    return e;
}


static P6GE_Exp*
p5re_parse_term(P6GE_Text* t)
{
    P6GE_Exp* e = 0;
    int c;
    int ctype;
    int tt;

    p5re_skip(t, 0);
    c = *(t->pos);
    ctype = p5re_ctype[c];
    if ((ctype & ctmeta) == 0 || (ctype & ctspace) != 0 
           || (c == '\\' && p5re_cmeta[t->pos[1]] >= 0))
       return p5re_parse_literal(t);
    if (c == '(') {
       p5re_skip(t,1);
       if (t->pos[0] == '?') { tt = --(t->ncapture);  p5re_skip(t,2); }
       else tt = ++(t->capture);
       e = p5re_parse_new(P6GE_GROUP, p5re_parse_expr(t), 0);
       e->group = tt;
       if (*(t->pos) != ')') p5re_parse_error(t, "Missing ')'");
       else p5re_skip(t, 1);
       return e;
    }
    if (c == '.') {
       p5re_skip(t, 1);
       return p5re_parse_new(P6GE_DOT, 0, 0);
    }
    if (c == '^') {
       p5re_skip(t, 1);
       return p5re_parse_new(P6GE_ANCHOR_BOS, 0, 0);
    }
    if (c == '$') {
       p5re_skip(t, 1);
       return p5re_parse_new(P6GE_ANCHOR_EOS, 0, 0);
    }
    p5re_parse_error(t, "Unrecognized character");
    return 0;
}


static P6GE_Exp* 
p5re_parse_quant(P6GE_Text* t)
{
    P6GE_Exp* e = p5re_parse_term(t);
    P6GE_Exp* q = e;

    int c = *(t->pos);
    if (c != '{' && (p5re_ctype[c] & ctquant) == 0) return e;
    p5re_skip(t, 1);

    /* if quantifying a literal string, the quantifier only applies
       to the last char */
    if (e->type == P6GE_LITERAL && e->nlen > 1) {
       q = p5re_parse_new(P6GE_LITERAL, 0, 0);
       e->nlen--;
       q->name = malloc(1); q->nlen = 1;
       q->name[0] = e->name[e->nlen];
       e = p5re_parse_new(P6GE_CONCAT, e, q);
    }

    if (c == '+') q->max = P6GE_INF;
    else if (c == '?') { q->min = 0; }
    else if (c == '*') { q->min = 0; q->max = P6GE_INF; }
    else if (c == '{') {
        if (isdigit(*(t->pos))) {
            q->min = q->max = atoi(t->pos);
            while (isdigit(*(t->pos))) t->pos++;
            p5re_skip(t, 0);
        } else p5re_parse_error(t, "Missing min value in {} quantifier");
        if (t->pos[0] == ',') {
            p5re_skip(t, 1);
            if (isdigit(*(t->pos))) {
                q->max = atoi(t->pos);
                while (isdigit(*(t->pos))) t->pos++;
                p5re_skip(t, 0);
            }
            else q->max = P6GE_INF;
        }
        if (*(t->pos) != '}') 
            p5re_parse_error(t, "Missing closing '}'");
        else p5re_skip(t, 1);
    }
    if (*(t->pos) == '?') { q->isgreedy = 0; p5re_skip(t,1); }
    return e;
}


static P6GE_Exp*
p5re_parse_concat(P6GE_Text* t)
{
    P6GE_Exp* e = p5re_parse_quant(t);
    if ((p5re_ctype[*(t->pos)] & ctket) == 0) 
        e = p5re_parse_new(P6GE_CONCAT, e, p5re_parse_concat(t));
    return e;
}


static P6GE_Exp*
p5re_parse_alt(P6GE_Text* t)
{
    P6GE_Exp* e = p5re_parse_concat(t);
    if (*(t->pos) == '|') {
        p5re_skip(t, 1);
        e = p5re_parse_new(P6GE_ALT, e, p5re_parse_alt(t));
    }
    return e;
}
      
static P6GE_Exp*
p5re_parse_expr(P6GE_Text* t)
{
    return p5re_parse_alt(t);
}

/*

=item C<P6GE_Exp* p5re_parse(const char* s)>

Builds a regular expression tree from the string specified in s.

=cut

*/

P6GE_Exp*
p6ge_parsep5(const char* s)
{
    P6GE_Text t;
    P6GE_Exp* e = 0;
    t.text = s;
    t.pos = s;
    t.capture = 0;
    t.ncapture = 0;
    return p5re_parse_expr(&t);
}


/*

=back

=head1 SEE ALSO

=head1 HISTORY

Initial version by Patrick R. Michaud, 2004.11.16

=cut

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

