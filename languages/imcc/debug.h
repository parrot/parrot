#ifndef __DEBUG_H
#define __DEBUG_H
void fatal(int code, const char *func, const char *fmt, ...);
void fataly(int code, const char *func, int line, const char *fmt, ...);
void warning(const char *func, const char *fmt, ...);
void debug(int level, const char *fmt, ...);
void info(int level, const char *fmt, ...);

void dump_instructions(void);
void dump_cfg(void);
void dump_loops(void);
void dump_symreg(void);
void dump_interference_graph(void);
void dump_dominators(void);
void dump_liveness_status(void);
void dump_liveness_status_var(SymReg*);

#endif
