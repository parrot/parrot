#if !defined(PARROT_IMCC_DEBUG_H_GUARD)
#define PARROT_IMCC_DEBUG_H_GUARD

#define DEBUG_PARROT 0x0001
#define DEBUG_LEXER  0x0002
#define DEBUG_PARSER 0x0004
#define DEBUG_IMC    0x0008
#define DEBUG_CFG    0x0010
#define DEBUG_OPT1   0x0020
#define DEBUG_OPT2   0x0040

#define DEBUG_AST    0x0100

#define DEBUG_PBC    0x1000
#define DEBUG_PBC_CONST    0x2000
#define DEBUG_PBC_FIXUP    0x4000

void fatal(int code, const char *func, const char *fmt, ...);
void fataly(int code, const char *func, int line, const char *fmt, ...);
void print_inc(const char *file, int lin);
void warning(Parrot_Interp interpreter, const char *func, const char *fmt, ...);
void debug(Parrot_Interp interpreter, int level, const char *fmt, ...);
void info(Parrot_Interp interpreter, int level, const char *fmt, ...);

void dump_instructions(IMC_Unit *);
void dump_cfg(IMC_Unit *);
void dump_loops(IMC_Unit *);
void dump_labels(IMC_Unit *);
void dump_symreg(IMC_Unit *);
void dump_interference_graph(IMC_Unit *);
void dump_dominators(IMC_Unit *);
void dump_liveness_status(IMC_Unit *);
void dump_liveness_status_var(IMC_Unit *, SymReg*);

#endif /* PARROT_IMCC_DEBUG_H_GUARD */
