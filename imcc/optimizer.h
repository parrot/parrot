#ifndef __OPTIMIZER_H
#define __OPTIMIZER_H
void pre_optimize(struct Parrot_Interp *);
int optimize(struct Parrot_Interp *);
void post_optimize(struct Parrot_Interp *);

#endif
