/*

=head1 NAME

p6ge/p6ge_parse.c - Parse a P6 rule into an expression tree

=head1 DESCRIPTION

This file contains the functions for parsing perl 6 regular expressions
into a tree representation that can then be used to generate regular
expression code.

=head2 Functions

=over 4

=cut

*/

#include "p6ge.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int p6ge_ctype[256];
int p6ge_cmeta[256];

static P6GE_Exp* p6ge_parse_expr(P6GE_Text* t);

void
p6ge_init()
{
    unsigned int c;
    for(c=0; c<256; c++) {
        p6ge_ctype[c] = (isspace(c)) ? (ctmeta | ctspace) : 0;
        p6ge_cmeta[c] = (!isalnum(c)) ? (int)c : -1;
    }
    p6ge_ctype[0] |= ctmeta | ctket;
    p6ge_ctype['['] |= ctmeta;
    p6ge_ctype['('] |= ctmeta;
    p6ge_ctype['<'] |= ctmeta;
    p6ge_ctype['{'] |= ctmeta;
    p6ge_ctype[']'] |= ctmeta | ctket;
    p6ge_ctype[')'] |= ctmeta | ctket;
    p6ge_ctype['>'] |= ctmeta | ctket;
    p6ge_ctype['}'] |= ctmeta | ctket;
    p6ge_ctype['|'] |= ctmeta | ctket;
    p6ge_ctype['+'] |= ctmeta | ctquant;
    p6ge_ctype['*'] |= ctmeta | ctquant;
    p6ge_ctype['?'] |= ctmeta | ctquant;
    p6ge_ctype['.'] |= ctmeta;
    p6ge_ctype['^'] |= ctmeta;
    p6ge_ctype['$'] |= ctmeta;
    p6ge_ctype['\\'] |= ctmeta;
    p6ge_cmeta['n'] = '\n';
    p6ge_cmeta['0'] = '\0';
}


static void 
p6ge_parse_error(P6GE_Text* t, const char* msg)
{
   printf("%s at offset %d (found '%c')\n", msg, t->pos - t->text, *(t->pos));
   t->pos = NULL;
}


static void 
p6ge_skip(P6GE_Text* t,int skip) 
{
    const unsigned char* s = t->pos + skip;
    while (p6ge_ctype[*s] & ctspace) s++;
    while (*s=='#') {
        s++;
        while (*s && *s!='\n') s++;
        while (p6ge_ctype[*s] & ctspace) s++;
    }
    t->pos = s;
}

/*

=item C<P6GE_Exp* p6ge_parse_new(p6ge_exp_t type,P6GE_Exp* exp1, P6GE_Exp* exp2)>

Creates and initializes a new node for an expression tree, setting the 
type and using exp1 and exp2 as the "left" and "right" subtrees of this node.

=cut

*/

P6GE_Exp*
p6ge_parse_new(p6ge_exp_t type,P6GE_Exp* exp1, P6GE_Exp* exp2)
{
    static int id = 0;
    P6GE_Exp* e = 0;
    e = malloc(sizeof(*e));
    e->id = id++;
    e->type = type;
    e->nlen = 0;
    e->min = 1;
    e->max = 1;
    e->isgreedy = 1;
    e->group = 0;
    e->name = 0;
    e->exp1 = exp1;
    e->exp2 = exp2;
    return e;
}

/*

=item C<void p6ge_parse_free(P6GE_Exp* e)>

Frees up the resources associated with the expression tree given by e.

=cut

*/

void
p6ge_parse_free(P6GE_Exp* e)
{
    if (e->exp1) { p6ge_parse_free(e->exp1); e->exp1 = 0; }
    if (e->exp2) { p6ge_parse_free(e->exp2); e->exp2 = 0; }
    if (e->name) { free(e->name); e->name = 0; }
    free(e);
}

  
static P6GE_Exp*
p6ge_parse_literal(P6GE_Text* t)
{
    static unsigned char lit[P6GE_MAX_LITERAL_LEN];
    P6GE_Exp* e = 0;
    unsigned int len = 0;
    unsigned char c;

    while (len < sizeof(lit) && (c = *(t->pos))) {
        if ((p6ge_ctype[c] & ctmeta) == 0)
            { lit[len++] = c; p6ge_skip(t, 1); }
        else if (c == '\\' && p6ge_cmeta[t->pos[1]] >= 0)
            { lit[len++] = p6ge_cmeta[t->pos[1]]; p6ge_skip(t, 2); }
        else break;
    }
    if (len>0) {
        e = p6ge_parse_new(P6GE_LITERAL, 0, 0);
        e->name = malloc(len); e->nlen = len;
        memcpy(e->name, lit, len);
    }
    return e;
}


static P6GE_Exp*
p6ge_parse_term(P6GE_Text* t)
{
    P6GE_Exp* e = 0;
    int c;
    int ctype;
    int type;
    int group;

    p6ge_skip(t, 0);
    c = *(t->pos);
    ctype = p6ge_ctype[c];
    if ((ctype & ctmeta) == 0
           || (c == '\\' && p6ge_cmeta[t->pos[1]] >= 0))
       return p6ge_parse_literal(t);
    if (c == '[') {
       p6ge_skip(t,1);
       group = --t->ncapture;
       e = p6ge_parse_new(P6GE_GROUP, p6ge_parse_expr(t), 0);
       e->group = group;
       if (*(t->pos) != ']') p6ge_parse_error(t, "Missing ']'");
       else p6ge_skip(t, 1);
       return e;
    }
    if (c == '(') {
       p6ge_skip(t,1);
       group = ++t->capture;
       e = p6ge_parse_new(P6GE_GROUP, p6ge_parse_expr(t), 0);
       e->group = group;
       if (*(t->pos) != ')') p6ge_parse_error(t, "Missing ')'");
       else p6ge_skip(t, 1);
       return e;
    }
    if (c == '.') {
       p6ge_skip(t, 1);
       return p6ge_parse_new(P6GE_DOT, 0, 0);
    }
    if (c == '^') {
       type = P6GE_ANCHOR_BOS; p6ge_skip(t, 1);
       if (*(t->pos) == '^') { type = P6GE_ANCHOR_BOL; p6ge_skip(t, 1); }
       return p6ge_parse_new(type, 0, 0);
    }
    if (c == '$') {
       type = P6GE_ANCHOR_EOS; p6ge_skip(t, 1);
       if (*(t->pos) == '$') { type = P6GE_ANCHOR_EOL; p6ge_skip(t, 1); }
       return p6ge_parse_new(type, 0, 0);
    }
    p6ge_parse_error(t, "Unrecognized character");
    return 0;
}


static P6GE_Exp* 
p6ge_parse_quant(P6GE_Text* t)
{
    P6GE_Exp* e = p6ge_parse_term(t);
    P6GE_Exp* q = e;

    int c = *(t->pos);
    if ((p6ge_ctype[c] & ctquant) == 0) return e;
    p6ge_skip(t, 1);

    /* if quantifying a literal string, the quantifier only applies
       to the last char */
    if (e->type == P6GE_LITERAL && e->nlen > 1) {
       q = p6ge_parse_new(P6GE_LITERAL, 0, 0);
       e->nlen--;
       q->name = malloc(1); q->nlen = 1;
       q->name[0] = e->name[e->nlen];
       e = p6ge_parse_new(P6GE_CONCAT, e, q);
    }

    if (c == '+') q->max = P6GE_INF;
    else if (c == '?') { q->min = 0; }
    else if (c == '*' && *(t->pos) != '*') { q->min = 0; q->max = P6GE_INF; }
    else if (c == '*') {
        p6ge_skip(t, 1);
        if (*(t->pos) != '{') 
            p6ge_parse_error(t, "Missing { after ** quantifier");
        p6ge_skip(t, 1);
        if (isdigit(*(t->pos))) {
            q->min = q->max = atoi((const char*)t->pos);
            while (isdigit(*(t->pos))) t->pos++;
            p6ge_skip(t, 0);
        } else p6ge_parse_error(t, "Missing min value in **{} quantifier");
        if (t->pos[0] == '.' && t->pos[1] == '.') {
            p6ge_skip(t, 2);
            if (t->pos[0] == '.') { q->max = P6GE_INF; p6ge_skip(t, 1); }
            else if (isdigit(*(t->pos))) {
                q->max = atoi((const char*)t->pos);
                while (isdigit(*(t->pos))) t->pos++;
                p6ge_skip(t, 0);
            }
            else p6ge_parse_error(t, "Missing max value after '..'");
        }
        if (*(t->pos) != '}') 
            p6ge_parse_error(t, "Missing closing '}'");
        else p6ge_skip(t, 1);
    }
    if (*(t->pos) == '?') { q->isgreedy = 0; p6ge_skip(t,1); }
    return e;
}


static P6GE_Exp*
p6ge_parse_concat(P6GE_Text* t)
{
    P6GE_Exp* e = p6ge_parse_quant(t);
    if ((p6ge_ctype[*(t->pos)] & ctket) == 0) 
        e = p6ge_parse_new(P6GE_CONCAT, e, p6ge_parse_concat(t));
    return e;
}


static P6GE_Exp*
p6ge_parse_alt(P6GE_Text* t)
{
    P6GE_Exp* e = p6ge_parse_concat(t);
    if (*(t->pos) == '|') {
        p6ge_skip(t, 1);
        e = p6ge_parse_new(P6GE_ALT, e, p6ge_parse_alt(t));
    }
    return e;
}
      
static P6GE_Exp*
p6ge_parse_expr(P6GE_Text* t)
{
    return p6ge_parse_alt(t);
}

/*

=item C<P6GE_Exp* p6ge_parse(const char* s)>

Builds a regular expression tree from the string specified in s.

=cut

*/

P6GE_Exp*
p6ge_parse(const unsigned char* s)
{
    P6GE_Text t;
    P6GE_Exp* e = 0;
    t.text = s;
    t.pos = s;
    t.capture = 0;
    t.ncapture = 0;
    return p6ge_parse_expr(&t);
}

/*

=item C<void p6ge_printexp(FILE* fp, P6GE_Exp* e, int depth)>

Displays a regular expression tree.  This function is likely obsolete.

*/

void
p6ge_printexp(FILE* fp, P6GE_Exp* e, int depth)
{
    int indent = depth * 4;
    char quant[64];
        sprintf(quant,"{%d..%d}%c", e->min, e->max,
                (e->isgreedy) ? ' ' : '?');
        switch (e->type) {
        case P6GE_PATTERN_END:
            break;
        case P6GE_LITERAL:
            fprintf(fp, "%*sliteral \"%.*s\" %s\n", indent, "", e->nlen, 
                e->name, quant);
            break;
        case P6GE_DOT:
            fprintf(fp, "%*sdot %s\n", indent, "", quant);
            break;
        case P6GE_CONCAT:
            p6ge_printexp(fp, e->exp1, depth);
            p6ge_printexp(fp, e->exp2, depth);
            break;
        case P6GE_GROUP:
            fprintf(fp, "%*sGROUP #%d %s\n", indent, "", e->group, quant);
            p6ge_printexp(fp, e->exp1, depth+1);
            break;
        case P6GE_ALT:
            p6ge_printexp(fp, e->exp1, depth+1);
            fprintf(fp, "%*sOR \n", indent, "");
            p6ge_printexp(fp, e->exp2, depth+1);
            break;
        case P6GE_ANCHOR_BOS:
            fprintf(fp, "%*sanchor-bos\n", indent, "");
            break;
        default:
            fprintf(fp,"Unknown expression type: %d\n",e->type);
            break;
        }
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

