# Plot
# Copyright YAS -- will have more detail later...

# Making ()/nil
    new P16, .PerlArray
    set P16[0], "*nil*"
    store_global "()", P16

.macro nilp ( T, L)
    

# Set up eval
    new_pad 0
    newsub P16, .Sub, eval
    store_lex 0, "eval", P16
    branch EVAL_END

eval:
    invoke P1

EVAL_END: