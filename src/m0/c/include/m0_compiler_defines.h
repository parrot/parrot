#ifdef __clang__
#  define UNUSED(a) (void)(a);
#else
#  define UNUSED(a) /*@-noeffect*/if (0) (void)(a)/*@=noeffect*/;
#endif
