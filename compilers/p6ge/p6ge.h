#ifndef P6GE_H_GUARD
#define P6GE_H_GUARD

#include <limits.h>
#include <stdio.h>

#define P6GE_INF INT_MAX
#define P6GE_MAX_LITERAL_LEN 128

typedef enum {
    P6GE_PATTERN_END, P6GE_DOT, P6GE_LITERAL, 
    P6GE_CONCAT, P6GE_GROUP, P6GE_ALT,
    P6GE_ANCHOR_BOS, P6GE_ANCHOR_EOS,
    P6GE_ANCHOR_BOL, P6GE_ANCHOR_EOL
} p6ge_exp_t;

enum { ctliteral=0x00, ctmeta=0x01, ctspace=0x02, ctket=0x04, ctquant=0x08 };
extern int p6ge_ctype[256];
extern int p6ge_cmeta[256];
extern const char* p6ge_exp_s[];

typedef struct _P6GE_Text {
  const unsigned char* text;
  const unsigned char* pos;
  int capture;
  int ncapture;
} P6GE_Text;


typedef struct _P6GE_Exp {
    int id;
    p6ge_exp_t type;
    int nlen;
    int min;
    int max;
    int isgreedy;
    int group;
    unsigned char* name;
    struct _P6GE_Exp* exp1;
    struct _P6GE_Exp* exp2;
} P6GE_Exp;


P6GE_Exp* p6ge_parse(const char* s);
P6GE_Exp* p6ge_parsep5(const char* s);
P6GE_Exp* p6ge_parse_new(p6ge_exp_t type, P6GE_Exp* exp1, P6GE_Exp* exp2);
void p6ge_parse_free(P6GE_Exp* e);
void p6ge_init();
void p6ge_printexp(FILE* fp, P6GE_Exp* e, int depth);
char* p6ge_p6rule_pir(const char* s);
 
#endif /* P6GE_H_GUARD */ 

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

