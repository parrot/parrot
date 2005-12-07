#if !defined(PARROT_IMCC_DEBUG_H_GUARD)
#define PARROT_IMCC_DEBUG_H_GUARD

#define DEBUG_PARROT 0x0001
#define DEBUG_LEXER  0x0002
#define DEBUG_PARSER 0x0004
#define DEBUG_IMC    0x0008
#define DEBUG_CFG    0x0010
#define DEBUG_OPT1   0x0020
#define DEBUG_OPT2   0x0040
#define DEBUG_SPILL  0x0080

#define DEBUG_AST    0x0100
#define DEBUG_REG    0x0200
#define DEBUG_REG2   0x0400

#define DEBUG_PBC    0x1000
#define DEBUG_PBC_CONST    0x2000
#define DEBUG_PBC_FIXUP    0x4000

void IMCC_fatal(Interp *, int code,  const char *fmt, ...);
void IMCC_fataly(Interp *, int code, const char *fmt, ...);
void IMCC_print_inc(Interp *);
void IMCC_warning(Interp*, const char *fmt, ...);
void IMCC_debug(Interp*, int level, const char *fmt, ...);
void IMCC_info(Interp*, int level, const char *fmt, ...);

void dump_instructions(Interp *, IMC_Unit *);
void dump_cfg(IMC_Unit *);
void dump_loops(IMC_Unit *);
void dump_labels(IMC_Unit *);
void dump_symreg(IMC_Unit *);
void dump_interference_graph(IMC_Unit *);
void dump_dominators(IMC_Unit *);
void dump_dominance_frontiers(IMC_Unit *);
void dump_liveness_status(IMC_Unit *);
void dump_liveness_status_var(IMC_Unit *, SymReg*);

#endif /* PARROT_IMCC_DEBUG_H_GUARD */
