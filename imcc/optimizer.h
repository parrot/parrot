#if !defined(PARROT_IMCC_OPTIMIZER_H_GUARD)
#define PARROT_IMCC_OPTIMIZER_H_GUARD
void pre_optimize(Interp *, IMC_Unit *);
int cfg_optimize(Interp *, IMC_Unit *);
int optimize(Interp *, IMC_Unit *);
void post_optimize(Interp *, IMC_Unit *);

#endif /* PARROT_IMCC_OPTIMIZER_H_GUARD */

