#ifndef __OPTIMIZER_H
#define __OPTIMIZER_H
void pre_optimize(struct Parrot_Interp *, IMC_Unit *);
int cfg_optimize(struct Parrot_Interp *, IMC_Unit *);
int optimize(struct Parrot_Interp *, IMC_Unit *);
void post_optimize(struct Parrot_Interp *, IMC_Unit *);

#endif
