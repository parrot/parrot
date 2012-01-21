#ifndef M0_COMPILER_DEFINES_H

#   ifdef __clang__
#       define UNUSED(a) (void)(a);
#   else
#       define UNUSED(a) /*@-noeffect*/if (0) (void)(a)/*@=noeffect*/;
#   endif

#   define M0_COMPILER_DEFINES_H 1
#endif
