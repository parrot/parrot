#ifndef PGE_H_GUARD
#define PGE_H_GUARD

#include "parrot/parrot.h"
#include <limits.h>
#include <stdio.h>

#define PGE_INF INT_MAX
#define PGE_MAX_LITERAL_LEN 128

typedef enum {
    PGE_NULL_PATTERN,
    PGE_PATTERN_END, PGE_DOT, PGE_LITERAL, 
    PGE_CONCAT, PGE_GROUP, PGE_ALT,
    PGE_ANCHOR_BOS, PGE_ANCHOR_EOS,
    PGE_ANCHOR_BOL, PGE_ANCHOR_EOL,
    PGE_CUT_ALT, PGE_CUT_RULE,
    PGE_BACKREFERENCE
} pge_exp_t;

enum { ctliteral=0x00, ctmeta=0x01, ctspace=0x02, ctket=0x04, ctquant=0x08 };

/* internal character type and meta character information in pge_parse.c */
extern int pge_ctype[256];
extern int pge_cmeta[256];

typedef struct _PGE_Text {
  const unsigned char* text;
  const unsigned char* pos;
  int capture;
  int ncapture;
} PGE_Text;

typedef struct _PGE_Exp {
    int id;
    pge_exp_t type;
    int nlen;
    int min;
    int max;
    int isgreedy;
    int iscut;
    int group;
    unsigned char* name;
    struct _PGE_Exp* exp1;
    struct _PGE_Exp* exp2;
} PGE_Exp;


/* external functions defined in pge_parse.c */
void pge_init(void);
PGE_Exp* pge_parse_new(pge_exp_t type, PGE_Exp* exp1, PGE_Exp* exp2);
void pge_parse_free(PGE_Exp* e);

char* pge_p6rule_pir(const unsigned char* s);

/* generator functions */
char* pge_gen(PGE_Exp* e);
void pge_set_trace(int istraced);
void Parrot_lib_pge_init(Parrot_Interp interpreter, PMC* lib);

/* optimizing functions in pge_opt.c */
int pge_is_bos_anchored(PGE_Exp* e);

/* other parsers */
char* pge_p5re_pir(const unsigned char* s);
char* pge_glob_pir(const unsigned char* s);

#endif /* PGE_H_GUARD */ 

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

