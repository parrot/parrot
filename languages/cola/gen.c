/*
 * gen.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * This file is really kludgy. What started as a simple
 * expression generator for Parrot is now trying to do way more
 * than it should. I've started a rewrite with the lessons learned.
 */


/******************************************************************************
 * Intermediate code generation routines.
 ******************************************************************************/

#include <malloc.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"


#undef DEBUG
int rval, lval;

void gen_ast(AST * ast) {
    AST * p;
    for(p = ast; p; p = p->next) {
        if(p->kind == KIND_DECL)
        switch(p->asttype) {
            case ASTT_NAMESPACE_DECL:
                    gen_namespace_decl(p);
                    printf(".namespace\n#End of namespace %s\n", p->sym->name);
                    break;
            case ASTT_CLASS_DECL:
                    gen_class_decl(p);
                    printf(".class\n#End of class %s\n", p->sym->name);
                    break;
            default:
                    printf("Unknown AST statement type [%d].\n", p->asttype);
                    exit(0);
        }
        else {
            printf("Unknown AST class or type for start node.\n");
            exit(0);
        }
    }
}

void gen_bootstrap() {
    /*
     *    Kludge, generate a limited support library until
     *    I can import modules
     */
    const char * saveregs        = "\tpushi\n\tpushn\n\tpushs\n";
    const char * restoreregs    = "\tpops\n\tpopn\n\tpopi\n";
    printf("\nemit<<EOF\n");
    printf("\n__puts:\n%s\trestore S31\n\tprint S31\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__puti:\n%s\trestore I31\n\tprint I31\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__putf:\n%s\trestore N31\n\tprint N31\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__substr:\n%s\trestore I31\n\trestore I30\n\trestore S31\n\tsubstr S30, S31, I30, I31\n\tsave S30\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__strlen:\n%s\trestore S0\n\tlength I0, S0\n\tsave I0\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__strchop:\n%s\trestore S0\n\tchopn S0, 1\n\tsave S0\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__strrep:\n%s\trestore S30\n\trestore I31\n\trestore I30\n\trestore S31\n\tsubstr S31, I30, I31, S30\n\tsave S31\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__ord:\n%s\trestore S0\n\tord I0, S0\n\tsave I0\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__gets:\n%s\treadline S0, 0\n\tsave S0\n%s\tret\n",
                saveregs, restoreregs);
    printf("\n__sleep:\n%s\trestore I0\n\tsleep I0\n%s\tret\n",
                saveregs, restoreregs);
    printf("EOF\n");
}

void gen_namespace_decl(AST * p) {
    printf(".namespace %s\n", p->sym->name);
    if(p->arg1)
        gen_ast(p->arg1);
}

void gen_class_decl(AST * p) {
    printf(".class %s\n", p->sym->name);
    if(p->arg1) {
        gen_class_body(p->arg1);
    }
}

void gen_class_body(AST * p) {
    while(p) {
        switch(p->asttype) {
            /* No class member fields yet, only constants and methods. */
            case ASTT_CONSTANT_DECL:
                gen_constant_decl(p);
                break;
            case ASTT_METHOD_DECL:
                gen_method_decl(p);
                break;
            default:
                printf("#Invalid AST(%d) in class_body\n", p->kind);
                abort();
        }
        p = p->next;
    }
}


void gen_constant_decl(AST * p) {
    /* Just to generate the comment */
    printf("\t\t\t# constant %s = %s\n", p->sym->name, p->sym->literal->name);
}

void gen_block(AST * p) {
    /* First declare locals. */
    if(p->locals) {
        Symbol * s = p->locals;
        while(s) {
            printf("\t.local %s\t%s\n", type_name(s), s->name);
            s = s->next;
        }
    }
    gen_statement(p);    
}

void gen_statement(AST * p) {
    AST * t;
#ifdef DEBUG
    printf("#gen_statement\n");
#endif
    if(p->kind == KIND_EXPRESSION) {
        gen_expr(p, NULL);
        goto END;
    }
    
    switch(p->asttype) {
        case ASTT_CONSTANT_DECL:
            gen_constant_decl(p);
            break;
        case ASTT_IF:
            gen_if(p);
            break;
        case ASTT_WHILE:
            gen_while(p);
            break;
        case ASTT_FOR:
            gen_for(p);
            break;
        case ASTT_BREAK:
            if(get_cur_primary_block() == NULL) {
                printf("break statement not within loop or switch\n");
                exit(0);
            }
            printf("\tgoto %s\n", get_cur_primary_block()->end_label);
            break;
        case ASTT_CONTINUE:
            if((t = get_cur_primary_block()) == NULL
                || (t->asttype != ASTT_FOR && t->asttype != ASTT_WHILE)) {
                printf("continue statement not within a loop\n");
                exit(0);
            }
            if(t->asttype == ASTT_WHILE)
                printf("\tgoto %s\n", t->start_label);
            else {
                if(t->Attr.Loop.iteration)
                    printf("\tgoto %s\n", t->Attr.Loop.iteration->start_label);
                else
                    printf("\tgoto %s\n", t->start_label);
            }
            break;
        case ASTT_RETURN:
            if(cur_method == NULL) {
                printf("return statement not within a method\n");
                exit(0);
            }
            if(cur_method->sym->type != t_void) {
                if(p->arg1 == NULL) {
                    printf("ERROR: Method '%s' must return a value.\n",
                            cur_method->sym->name);
                    exit(0);
                }
                gen_expr(p->arg1, NULL);
                printf("\t# Push return val and jump\n\tpush %s %s\n",
                        type_name(p->arg1->targ), EVAL_SYM(p->arg1->targ) ); 
            }
            printf("\tgoto %s\n", cur_method->end_label);
            break;
        default:
            printf( "UNKNOWN AST node : %d/%d\n", p->kind, p->asttype);
    }

END:
    if(p->next) {
        gen_statement(p->next);
    }
}

void gen_param_list(Symbol * paramlist) {
    if(paramlist->tnext)
        gen_param_list(paramlist->tnext);
    printf("\t.param %s\t%s\n", type_name(paramlist), paramlist->name);
}

void gen_method_decl(AST * p) {
    Symbol * s;
    reset_temps();
    cur_method = p;
    p->end_label = make_label();
    printf(".sub __%s\n", p->sym->name);
#if 0
    check_id_redecl(global_symbol_table, p->sym->name);
#endif
    if((s = p->Attr.Method.params) != NULL)
        gen_param_list(s);
    
    if(p->Attr.Method.body)
        gen_block(p->Attr.Method.body);

    printf("%s:\tret\n", p->end_label);
    cur_method = NULL;
}

void gen_assign(AST * ast) {
    AST * p = ast;
#ifdef DEBUG
    printf("#gen_assign\n");
#endif
    if(p->arg1->asttype == ASTT_IDENTIFIER ||
        p->arg1->asttype == ASTT_LITERAL) {
        p->arg1->targ = p->arg1->sym;
    }

    /*
     *    gen_expr() generates the assignment if
     *    a target lval is passed to it. This gets rid of some
     *    temporaries of type (temp1 = source; target = temp1),
     */
    if(p->arg1->targ) {
        /* target is an identifier or address, pass the
         * symbol to gen_expr() which will emit the expression
         * and assignment.
         */
        gen_expr(p->arg2, p->arg1->targ);
    }
    else {
        /* target is an expression that may or may not
         * have parsed to a assignable lvalue
         */

        /* Now assign the temporary to the lvalue expression */
        if(p->arg1->asttype == ASTT_INDEX) {
            char buf[4096];
            AST * deref = p->arg1;
               /* Assign to an array */
            gen_expr(deref->arg1, NULL);
            gen_expr(deref->arg2, NULL);
            if(deref->arg1 == NULL || deref->arg2 == NULL) {
                printf("Internal error: invalid array expression or indirection as lvalue\n");
                abort();
            }

            /* If destination indirection uses a variable, copy it to a temporary
             * in case it is modified by source expression code ( d[i] = s[++i] )
             */
            if(deref->arg2->asttype == ASTT_IDENTIFIER) {
                deref->arg2->targ = make_rval(deref->arg2->sym->type);
                printf("\t(%s)%s = %s\n", type_name(deref->arg2->targ),
                    deref->arg2->targ->name, deref->arg2->sym->name);
            }
            /* emit source expression with a temporary */
            gen_expr(p->arg2, NULL);

            sprintf(buf, "%s%s%s", deref->arg1->targ->name, op_name(INDEX), deref->arg2->targ->name);
            p->targ = new_symbol(IDENTIFIER, buf);
            p->targ->is_lval = 1;
            p->targ->type = deref->arg1->targ->type;
            
            // Generate assignment
            printf("\t(%s)%s = %s\n", type_name(p->targ), p->targ->name, p->arg2->targ->name);
            return;
        }

        printf("#gen_assign: Internal error, unsupported assignment.\n");
        exit(0);
    }
}


/*
 * $0 = '-' expr 
 *
 * $0.type = expr.type
 */

#if 0
void gen_unary_expr(AST * p) {
#ifdef DEBUG
    printf("#gen_unary_expr\n");
#endif
    if(p->asttype == ASTT_INDEX) {
        /* Element access of an array */
        /* Ugly ugly kludgy klunky. I wrote the generator wrong to begin
         * with, so now I'm patching in lvalue generation for things
         * like arrays. Time for a rewrite.
         */
        gen_expr(p->arg1, NULL);
        gen_expr(p->arg2, NULL);
        return;
    }
    else if(p->kind == KIND_EXPRESSION)
        gen_expr(p, p->targ);    

    if(p->targ == NULL) {
        printf("Internal error: expression didn't generate an rval or lval\n");
#if 1
        abort();
#endif
        exit(0);    
    }
    emit_unary_expr(p->targ, p->arg1->targ, op_name(p->op));
}
#endif

void gen_add_expr(AST * ast) {
    AST * p = ast;
#ifdef DEBUG
    printf("#gen_add_expr\n");
#endif
    if(!p->arg1->targ)
        gen_expr(p->arg1, NULL);
    if(!p->arg2->targ)
        gen_expr(p->arg2, NULL);
    if(p->arg1->targ && p->arg2->targ) {
        p->targ = make_rval(p->arg1->targ->type);
        emit_op_expr(p->targ, p->arg1->targ, "+", p->arg2->targ);
    } else {
        printf("Generate add expression failed.\n");
        exit(0);
    }
}

/* If lval is passed, expressions use that as the target,
 * otherwise they create a temporary.
 */
void gen_expr(AST * p, Symbol * lval) {
#ifdef DEBUG
    printf("#gen_expr\n");
#endif

    if(p->asttype == ASTT_IDENTIFIER ||
        p->asttype == ASTT_LITERAL) {
        p->targ = p->sym;
        if(lval)
            emit_unary_expr(lval, p->targ, NULL);
        return;
    }
    
    if(p->asttype == ASTT_NEW_OBJECT) {
        printf("\t# new()\n");
        /*p->targ = make_rval(REFERENCE);*/
        if(lval != NULL)
            p->targ = lval;
        else 
            p->targ = make_rval(p->sym);
        printf("\t(%s)%s = new %s\n", type_name(p->sym), p->targ->name,
                type_name(p->sym));
        return;        
    }

    if(p->arg1 == NULL) {
        printf("#gen_expr: arg1 null\n");
        exit(0);
    }

    if(p->asttype == ASTT_CALL) {
        if(lval)
            p->targ = lval;
        gen_call(p);
        return;
    }
    else if(p->asttype == ASTT_ASSIGN) {
        gen_assign(p);
        return;
    }

    if(p->arg1->asttype == ASTT_IDENTIFIER ||
        p->arg1->asttype == ASTT_LITERAL) {
        p->arg1->targ = p->arg1->sym;
    }
    else
        gen_expr(p->arg1, NULL);

    if(p->arg2) {
        if(p->arg2->asttype == ASTT_IDENTIFIER ||
            p->arg2->asttype == ASTT_LITERAL) {
            p->arg2->targ = p->arg2->sym;
        }
        else
            gen_expr(p->arg2, NULL);
    }

    /* Very limited type coercion here */
    if(p->arg1 && p->arg2) {
        Symbol * type1 = p->arg1->targ->type,
             * type2 = p->arg2->targ->type;

        if(lval)
            p->targ = lval;

        if(p->op == INDEX) {
            if(type2 != t_int) {
                printf("Array subscript expression must be type integer.\n");    
                exit(0);
            }
            if(type1 != t_string) {
                printf("Index operators not yet implemented for non-string types.\n");
                exit(0);    
            }
            if(p->targ == NULL)
                p->targ = make_rval(type1);
            printf("\t(%s)%s = %s%s%s\n", type_name(p->targ), p->targ->name,
                        p->arg1->targ->name, op_name(INDEX), p->arg2->targ->name);
            return;
        }
        
        if(type1 != type2) {
            /* Generate required casting assignments to temporaries */
            coerce_operands(&type1, &type2);
            if(type1 != p->arg1->targ->type) {
                Symbol * cast = make_rval(type1);
                printf("\t(%s)%s = %s\n", type_name(cast),
                        cast->name, p->arg1->targ->name);
                p->arg1->targ = cast;    
            }
            if(type2 != p->arg2->targ->type) {
                Symbol * cast = make_rval(type2);
                printf("\t(%s)%s = %s\n", type_name(cast),
                        cast->name, p->arg2->targ->name);
                p->arg2->targ = cast;    
            }
            printf("#Info types not equivalent in expression\n");
        }
        
        /* If type cast generated a temporary, we still need to
         * assign to the passed in lvalue. Passed in lvalue
         * might also need a coercion. Generator really should not
         * pass in an lvalue that isn't compatible.
         */
        if(p->targ == NULL)
            p->targ = make_rval(type1);
        if(p->targ->type != type1) {        
            Symbol * temp = make_rval(type1);
            emit_op_expr(temp, p->arg1->targ, op_name(p->op), p->arg2->targ);
            printf("\t(%s)%s = %s\n", type_name(p->targ), p->targ->name, temp->name);
            return;
        }
        else
            emit_op_expr(p->targ, p->arg1->targ, op_name(p->op), p->arg2->targ);
    }
    else {
        /* Unary */
        if(p->asttype == ASTT_PREINC) {
            /* j = ++i ->
             *      inc $0
             *      $1 = $0
             */
            p->targ = p->arg1->targ;
            printf("\t%s %s\n", op_name(p->op), p->targ->name);
        }        
        else if(p->asttype == ASTT_POSTINC) {
             /* 
              * j = i++ ->
              *      $1 = $0
             *      inc $0
             *      $2 = $1
             */
            p->targ = make_rval(p->arg1->targ->type);
            printf("\t(%s)%s = %s\n", type_name(p->targ), p->targ->name, p->arg1->targ->name);
            printf("\t%s %s\n", op_name(p->op), p->arg1->targ->name);
        }
        else {
            if(lval)
                p->targ = lval;
            else
                p->targ = make_rval(p->arg1->targ->type);
            emit_unary_expr(p->targ, p->arg1->targ, op_name(p->op));
        }
    }
}

/*
 * Generate arguments in reverse order on stack.
 */
void gen_arg_list(AST * p) {
    if(p == NULL)
        return;
    gen_expr(p, NULL);
    if(p->targ)
        printf("\tpusharg %s\n", EVAL_SYM(p->targ));
    if(p->next)
        gen_arg_list(p->next);
}

void gen_call(AST * p) {
    if(p->arg1->targ == NULL)
        gen_expr(p->arg1, NULL);

    /* Argument list */
    if(p->arg2)
        gen_arg_list(p->arg2);
    
    printf("\tcall __%s\n", p->arg1->targ->name);
    if(p->arg1->targ->type == t_void) {
        if(p->targ != NULL) {
            printf("ERROR: void function [%s] does not return a value.\n",
                        p->arg1->targ->name );
            exit(0);
        }
    }
    else {
        if(p->targ == NULL)
            p->targ = make_rval(p->arg1->targ->type);
        printf("\t#Get return val in %s\n", p->targ->name);
        printf("\tpop %s %s\n", type_name(p->targ), p->targ->name);
    }
}

void gen_if(AST * p) {
    AST * t;
    char * if_label, * else_label, *end_label;
    int op_inv;
    if_label = make_label();
    else_label = make_label();
    end_label = make_label();
    if(!p->Attr.Conditional.condition
        || p->Attr.Conditional.condition->kind != KIND_EXPRESSION) {
        printf("gen_if: Null or invalid CONDITION node\n");
        exit(0);
    }
    gen_boolean(p->Attr.Conditional.condition);
    if(!p->arg1) {
        printf("gen_if: Null THEN node\n");
        exit(0);
    }
    t = p->Attr.Conditional.condition->arg1;
    if(t->asttype == ASTT_IDENTIFIER || t->asttype == ASTT_LITERAL)
        t = p->Attr.Conditional.condition;
    op_inv = op_inverse(t->op);
    /* Else */
    if(p->arg2) {
        printf("\tif %s %s %s goto %s\n", EVAL_SYM(t->arg1->targ), op_name(op_inv),
                        EVAL_SYM(t->arg2->targ), else_label);
        gen_block(p->arg1);
        printf("\tgoto %s\n", end_label);
        printf("%s:\n", else_label);
        gen_block(p->arg2);
    } else {
        printf("\tif %s %s %s goto %s\n", EVAL_SYM(t->arg1->targ),
                        op_name(op_inv), EVAL_SYM(t->arg2->targ), end_label);
        gen_block(p->arg1);
    }
    printf("%s:\n", end_label);
}

void gen_while(AST * p) {
    AST * t;
    int op_inv;
    p->start_label = make_label();
    p->end_label = make_label();
    push_primary_block(p);
    printf("%s:\n", p->start_label);
    gen_boolean(p->Attr.Loop.condition);
    t = p->Attr.Loop.condition->arg1;
    if(t->asttype == ASTT_IDENTIFIER || t->asttype == ASTT_LITERAL)
        t = p->Attr.Loop.condition;
    
    op_inv = op_inverse(t->op);
    printf("\tif %s %s %s goto %s\n", EVAL_SYM(t->arg1->targ), op_name(op_inv),
                EVAL_SYM(t->arg2->targ), p->end_label);
    gen_block(p->arg1);
    printf("\tgoto %s\n", p->start_label);    
    printf("%s:\n", p->end_label);
    pop_primary_block();
}

void gen_for(AST * p) {
    AST * t;
    int op_inv;
#ifdef DEBUG
    printf("#gen_for\n");
#endif
    p->start_label = make_label();
    p->end_label = make_label();
    if(p->Attr.Loop.iteration)
        p->Attr.Loop.iteration->start_label = make_label();
        
    push_primary_block(p);
    if(p->Attr.Loop.init != NULL) {
#ifdef DEBUG
        printf("#gen_for: generate init statement\n");
#endif
        gen_statement(p->Attr.Loop.init);
    }
    printf("%s:\n", p->start_label);
    gen_boolean(p->Attr.Loop.condition);
    t = p->Attr.Loop.condition->arg1;
    if(t->asttype == ASTT_IDENTIFIER || t->asttype == ASTT_LITERAL)
        t = p->Attr.Loop.condition;
    op_inv = op_inverse(t->op);
    printf("\tif %s %s %s goto %s\n", EVAL_SYM(t->arg1->targ), op_name(op_inv),
                    EVAL_SYM(t->arg2->targ), p->end_label);
    gen_block(p->arg1);
    if(p->Attr.Loop.iteration) {
        printf("%s:\n", p->Attr.Loop.iteration->start_label);
        gen_statement(p->Attr.Loop.iteration);
    }
    printf("\tgoto %s\n", p->start_label);    
    printf("%s:\n", p->end_label);
    pop_primary_block();
}

void gen_boolean(AST * p) {
#ifdef DEBUG
    printf("#gen_boolean\n");
#endif

    if(!p->arg1) {
        printf("gen_boolean: NULL expression\n");
        exit(0);
    }

    /* Assume arg1->kind is an KIND_EXPRESSION for now */
    switch(p->arg1->asttype) {
        /* If literal or identifier generate a comparison to 0
         * Fix this to skip the conditional for constant expressions.
         */
        case ASTT_IDENTIFIER:
        case ASTT_LITERAL:
            if(p->arg1->sym == NULL) {
                printf("Internal error: gen_bool(): NULL symbol for condition\n");
                abort();
            }
            p->arg1->targ = p->arg1->sym;
            p->arg2 = new_expression(ASTT_LITERAL, NULL, NULL);
            if(p->arg1->targ->type == t_string) {
                p->arg2->sym = p->arg2->targ = new_symbol(LITERAL, "\"\"");
            } else {
                p->arg2->sym = p->arg2->targ = new_symbol(LITERAL, "0");
                p->arg2->sym->name = str_dup("0");
            }
            p->op = LOGICAL_NE;
            return;
        case ASTT_COMPARISON:
            gen_comparison(p->arg1);
            return;
        default:
            printf("#gen_boolean: Unknown boolean AST type(%d).\n", p->arg1->asttype);
            exit(0);
    }
}

void gen_comparison(AST * p) {
#ifdef DEBUG
    printf("#gen_comparison\n");
#endif

    if(!p->arg1 || !p->arg2) {
        printf("#gen_comparison: Null arguments\n");
        exit(0);
    }
    gen_expr(p->arg1, NULL);
    gen_expr(p->arg2, NULL);

    /* Comparison doesn't generate a final statement because
     * the evaluation of the final comparison will be done as
     * a part of a higher level statement (assignment, if, while)
     */
    if(!p->arg1->targ || !p->arg2->targ) {
        printf("#gen_comparison: Comparison needs 2 rvalues\n");
        exit(0);
    }
}


void gen_conditional_expr(AST * p) {
    switch(p->kind) {
        /* Not implemented */
        default:
    }

}

void coerce_operands(Symbol ** t1, Symbol ** t2) {
    if(*t1 == *t2)
        return;
    if(*t1 == t_int) {
        if(*t2 == t_float)
            *t1 = t_float;
        else {
            printf("Can't coerce types (int, %s)\n", type_name(*t2));
            exit(0);
        } 
    }
    else if(*t1 == t_float) {
        if(*t2 == t_int)
            *t2 = t_float;
        else {
            printf("Can't coerce types (float, %s)\n", type_name(*t2));
            exit(0);
        } 
    }
    else {
        printf("Unsupported type coercion requested (%s, %s).\n",
                            (*t1)->name, (*t2)->name);
        exit(0);
    }
}

char * op_name(int operator) {
    static char buf[512];
    static char * ptr = buf;

    if(operator == 0) {
        printf("op_name: non-existent operator (0)\n");
        return "noop";
    }
    /* isascii(operator) */
    if(((operator) & ~0x7f) == 0) {
        if(ptr-buf < 256) {
            ptr += 4;
        } else {
            ptr = buf;
        }
        *ptr = operator;
        *(ptr+1) = '\0';
        return ptr;
    }

    switch(operator) {
        case INC:        return "inc";
        case DEC:        return "dec";
        case LOGICAL_OR:    return "||";
        case LOGICAL_AND:    return "&&";
        case LOGICAL_EQ:    return "==";
        case LOGICAL_NE:    return "!=";
        case LOGICAL_LT:    return "<";
        case LOGICAL_GT:    return ">";
        case LOGICAL_LTE:    return "<=";
        case LOGICAL_GTE:    return ">=";
        case LEFT_SHIFT:    return "<<";
        case RIGHT_SHIFT:    return ">>";
        case INDEX:            return "[]";
        default:    printf("Invalid operator %d\n", operator);
                exit(0);
    }
}

int op_inverse(int operator) {
    switch(operator) {
        case LOGICAL_EQ:    return LOGICAL_NE;
        case LOGICAL_NE:    return LOGICAL_EQ;
        case LOGICAL_LT:    return LOGICAL_GTE;
        case LOGICAL_GT:    return LOGICAL_LTE;
        case LOGICAL_LTE:    return LOGICAL_GT;
        case LOGICAL_GTE:    return LOGICAL_LT;
    }
    printf("op_inverse: Invalid logical operator %d\n", operator);
    exit(0);
}

/* Rvalues are temporaries which hold values but cannot be assigned to. */
char * new_rval() {
    static char rv_name[256];
    sprintf(rv_name, "$R%d", rval++);
    return &rv_name[0];
}

/* Create a temporary rval */
Symbol * make_rval(Symbol * type) {
    Symbol * s = new_symbol(IDENTIFIER, new_rval());
    if(type->kind != TYPE) {
        printf("Internal error: make_rval(): Symbol [%s] is not a type\n", type->name);
        abort();
    }
    s->type = type;
    s->is_lval = 0;
    return s;    
}

void reset_temps() {
    lval = 0;
    rval = 0;
}

char * get_label() {
    static int l;
    static char name[256];
    sprintf(name, "LBL%d", l++);
    return &name[0];
}

char * make_label() {
    return str_dup(get_label());    
}

void emit_op_expr(Symbol * r, Symbol * a1, char * op, Symbol * a2) {
#ifdef DEBUG
    printf("#emit_op_expr\n");
#endif

    printf( "\t(%s)%s = %s %s %s\n", type_name(r), r->name,
               EVAL_SYM(a1), op, EVAL_SYM(a2));
}

void emit_unary_expr(Symbol * res, Symbol * arg1, char * op) {
#ifdef DEBUG
    printf("#emit_unary_expr\n");
#endif
    
    if( op )
        printf( "\t(%s)%s = %s %s\n", type_name(res), res->name,
                       op, EVAL_SYM(arg1));
    else
        printf( "\t(%s)%s = %s\n", type_name(res), res->name,
                EVAL_SYM(arg1));
}

