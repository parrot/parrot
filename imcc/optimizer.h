#ifndef __OPTIMIZER_H
#define __OPTIMIZER_H
void pre_optimize(struct Parrot_Interp *);
int dead_code_remove(void);
int optimize(struct Parrot_Interp *);
void post_optimize(struct Parrot_Interp *);

#endif
