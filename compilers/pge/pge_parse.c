/*

=head1 NAME

pge/pge_parse.c - Parse a P6 rule into an expression tree

=head1 DESCRIPTION

This file contains the functions for parsing perl 6 regular expressions
into a tree representation that can then be used to generate regular
expression code.

=head2 Functions

=over 4

=cut

*/

#include "pge.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int pge_ctype[256];
int pge_cmeta[256];

static PGE_Exp* pge_parse_expr(PGE_Text* t);

void
pge_init()
{
    unsigned int c;
    for(c=0; c<256; c++) {
        pge_ctype[c] = (isspace(c)) ? (ctmeta | ctspace) : 0;
        pge_cmeta[c] = (!isalnum(c)) ? (int)c : -1;
    }
    pge_ctype[0] |= ctmeta | ctket;
    pge_ctype['['] |= ctmeta;
    pge_ctype['('] |= ctmeta;
    pge_ctype['<'] |= ctmeta;
    pge_ctype['{'] |= ctmeta;
    pge_ctype[']'] |= ctmeta | ctket;
    pge_ctype[')'] |= ctmeta | ctket;
    pge_ctype['>'] |= ctmeta | ctket;
    pge_ctype['}'] |= ctmeta | ctket;
    pge_ctype['|'] |= ctmeta | ctket;
    pge_ctype['+'] |= ctmeta | ctquant;
    pge_ctype['*'] |= ctmeta | ctquant;
    pge_ctype['?'] |= ctmeta | ctquant;
    pge_ctype[':'] |= ctmeta | ctquant;
    pge_ctype['.'] |= ctmeta;
    pge_ctype['^'] |= ctmeta;
    pge_ctype['$'] |= ctmeta;
    pge_ctype['\\'] |= ctmeta;
    pge_cmeta['n'] = '\n';
    pge_cmeta['0'] = '\0';
}


static void 
pge_parse_error(PGE_Text* t, const char* msg)
{
   printf("%s at offset %d (found '%c')\n", msg, t->pos - t->text, *(t->pos));
   t->pos = "";
}


static void 
pge_skip(PGE_Text* t,int skip) 
{
    const unsigned char* s = t->pos + skip;
    while (pge_ctype[*s] & ctspace) s++;
    while (*s=='#') {
        s++;
        while (*s && *s!='\n') s++;
        while (pge_ctype[*s] & ctspace) s++;
    }
    t->pos = s;
}

/*

=item C<PGE_Exp* pge_parse_new(pge_exp_t type,PGE_Exp* exp1, PGE_Exp* exp2)>

Creates and initializes a new node for an expression tree, setting the 
type and using exp1 and exp2 as the "left" and "right" subtrees of this node.

=cut

*/

PGE_Exp*
pge_parse_new(pge_exp_t type,PGE_Exp* exp1, PGE_Exp* exp2)
{
    static int id = 0;
    PGE_Exp* e = 0;
    e = malloc(sizeof(*e));
    e->id = id++;
    e->type = type;
    e->nlen = 0;
    e->min = 1;
    e->max = 1;
    e->isgreedy = 1;
    e->iscut = 0;
    e->group = 0;
    e->name = 0;
    e->exp1 = exp1;
    e->exp2 = exp2;
    return e;
}

/*

=item C<void pge_parse_free(PGE_Exp* e)>

Frees up the resources associated with the expression tree given by e.

=cut

*/

void
pge_parse_free(PGE_Exp* e)
{
    if (e->exp1) { pge_parse_free(e->exp1); e->exp1 = 0; }
    if (e->exp2) { pge_parse_free(e->exp2); e->exp2 = 0; }
    if (e->name) { free(e->name); e->name = 0; }
    free(e);
}

  
static PGE_Exp*
pge_parse_literal(PGE_Text* t)
{
    static unsigned char lit[PGE_MAX_LITERAL_LEN];
    PGE_Exp* e = 0;
    unsigned int len = 0;
    unsigned char c;

    while (len < sizeof(lit) && (c = *(t->pos))) {
        if ((pge_ctype[c] & ctmeta) == 0)
            { lit[len++] = c; pge_skip(t, 1); }
        else if (c == '\\' && pge_cmeta[t->pos[1]] >= 0)
            { lit[len++] = pge_cmeta[t->pos[1]]; pge_skip(t, 2); }
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
pge_parse_term(PGE_Text* t)
{
    PGE_Exp* e = 0;
    int c;
    int ctype;
    int type;
    int group;

    pge_skip(t, 0);
    c = *(t->pos);
    ctype = pge_ctype[c];
    if ((ctype & ctmeta) == 0
           || (c == '\\' && pge_cmeta[t->pos[1]] >= 0))
        return pge_parse_literal(t);
    if (c == '[') {
        pge_skip(t,1);
        group = --t->ncapture;
        e = pge_parse_new(PGE_GROUP, pge_parse_expr(t), 0);
        e->group = group;
        if (*(t->pos) != ']') pge_parse_error(t, "Missing ']'");
        else pge_skip(t, 1);
        return e;
    }
    if (c == '(') {
        pge_skip(t,1);
        group = ++t->capture;
        e = pge_parse_new(PGE_GROUP, pge_parse_expr(t), 0);
        e->group = group;
        if (*(t->pos) != ')') pge_parse_error(t, "Missing ')'");
        else pge_skip(t, 1);
        return e;
    }
    if (c == '.') {
        pge_skip(t, 1);
        return pge_parse_new(PGE_DOT, 0, 0);
    }
    if (c == '^') {
        type = PGE_ANCHOR_BOS; pge_skip(t, 1);
        if (*(t->pos) == '^') { type = PGE_ANCHOR_BOL; pge_skip(t, 1); }
        return pge_parse_new(type, 0, 0);
    }
    if (c == '$') {
        type = PGE_ANCHOR_EOS; pge_skip(t, 1);
        if (*(t->pos) == '$') { type = PGE_ANCHOR_EOL; pge_skip(t, 1); }
        else if (isdigit(*(t->pos))) { 
           e = pge_parse_new(PGE_BACKREFERENCE, 0, 0);
           e->group = atoi(t->pos);
           while (isdigit(*(t->pos))) t->pos++;
           pge_skip(t,0);
           return e;
        }
        return pge_parse_new(type, 0, 0);
    }
    if (c == ':' && t->pos[1] == ':') {
        type = PGE_CUT_ALT; pge_skip(t, 2);
        if (*(t->pos) == ':') { type = PGE_CUT_RULE; pge_skip(t,1); }
        return pge_parse_new(type, 0, 0);
    }
    if (c==0) return pge_parse_new(PGE_NULL_PATTERN, 0, 0);
    pge_parse_error(t, "Unrecognized character");
    return 0;
}


static PGE_Exp* 
pge_parse_quant(PGE_Text* t)
{
    PGE_Exp* e = pge_parse_term(t);
    PGE_Exp* q = e;

    int c = *(t->pos);
    if ((pge_ctype[c] & ctquant) == 0) return e;

    /* if quantifying a literal string, the quantifier only applies
       to the last char */
    if (e->type == PGE_LITERAL && e->nlen > 1) {
       q = pge_parse_new(PGE_LITERAL, 0, 0);
       e->nlen--;
       q->name = malloc(1); q->nlen = 1;
       q->name[0] = e->name[e->nlen];
       e = pge_parse_new(PGE_CONCAT, e, q);
    }

    if (c == '+') { pge_skip(t, 1); q->max = PGE_INF; }
    else if (c == '?') { pge_skip(t, 1); q->min = 0; }
    else if (c == '*' && t->pos[1] != '*') 
        { pge_skip(t, 1); q->min = 0; q->max = PGE_INF; }
    else if (c == '*') {
        pge_skip(t, 2);
        if (*(t->pos) != '{') 
            pge_parse_error(t, "Missing { after ** quantifier");
        pge_skip(t, 1);
        if (isdigit(*(t->pos))) {
            q->min = q->max = atoi((const char*)t->pos);
            while (isdigit(*(t->pos))) t->pos++;
            pge_skip(t, 0);
        } else pge_parse_error(t, "Missing min value in **{} quantifier");
        if (t->pos[0] == '.' && t->pos[1] == '.') {
            pge_skip(t, 2);
            if (t->pos[0] == '.') { q->max = PGE_INF; pge_skip(t, 1); }
            else if (isdigit(*(t->pos))) {
                q->max = atoi((const char*)t->pos);
                while (isdigit(*(t->pos))) t->pos++;
                pge_skip(t, 0);
            }
            else pge_parse_error(t, "Missing max value after '..'");
        }
        if (*(t->pos) != '}') 
            pge_parse_error(t, "Missing closing '}'");
        else pge_skip(t, 1);
    }
    if (*(t->pos) == '?') { q->isgreedy = 0; pge_skip(t,1); }
    if (t->pos[0] == ':' && t->pos[1] != ':') { q->iscut = 1; pge_skip(t,1); }
    return e;
}


static PGE_Exp*
pge_parse_concat(PGE_Text* t)
{
    PGE_Exp* e = pge_parse_quant(t);
    if ((pge_ctype[*(t->pos)] & ctket) == 0) 
        e = pge_parse_new(PGE_CONCAT, e, pge_parse_concat(t));
    return e;
}


static PGE_Exp*
pge_parse_alt(PGE_Text* t)
{
    PGE_Exp* e = pge_parse_concat(t);
    if (*(t->pos) == '|') {
        pge_skip(t, 1);
        e = pge_parse_new(PGE_ALT, e, pge_parse_alt(t));
    }
    return e;
}
      
static PGE_Exp*
pge_parse_expr(PGE_Text* t)
{
    return pge_parse_alt(t);
}


/* pge_parse() builds a regular expression tree from the perl 6 
   rule string specified in s. */
static PGE_Exp*
pge_parse(const unsigned char* s)
{
    PGE_Text t;
    PGE_Exp* e = 0;
    t.text = s;
    t.pos = s;
    t.capture = 0;
    t.ncapture = 0;
    return pge_parse_expr(&t);
}


/*

=item C<char* pge_p6rule_pir(const unsigned char* s)>

Converts the rule expression in s to its equivalent PIR code.
This function calls pge_parse() to build an expression tree from
the string in s, then calls pge_gen() to generate a PIR subroutine
from the expression tree.

=cut

*/

char*
pge_p6rule_pir(const unsigned char* s)
{
    PGE_Exp* e = 0;
    PGE_Exp* dot0 = 0;
    char* pir = 0;

    e = pge_parse_new(PGE_CONCAT,
                           pge_parse_new(PGE_GROUP, pge_parse(s), 0),
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

