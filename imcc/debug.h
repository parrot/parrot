#ifndef __DEBUG_H
#define __DEBUG_H
void fatal(int code, char *func, char *fmt, ...);
void fataly(int code, char *func, int line, char *fmt, ...);
void warning(char *func, char *fmt, ...);
void debug(int level, char *fmt, ...);
void info(int level, char *fmt, ...);

void dump_instructions();
void dump_cfg();
void dump_loops();
void dump_symreg();
void dump_interference_graph();
void dump_dominators();
void dump_liveness_status();
void dump_liveness_status_var();

#endif
