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
 *
 * Type checking and semantics moved to semant.c; by the time
 * this runs we should assume everything is valid.
 */


/******************************************************************************
 * Intermediate code generation routines.
 ******************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"


int ival, nval, sval, pval;

void gen_ast(AST * ast) {
    AST * p;
    for(p = ast; p; p = p->next) {
        if(p->kind == KIND_DECL)
        switch(p->asttype) {
            case ASTT_NAMESPACE_DECL:
                gen_namespace_decl(p);
                printf("#.namespace\n#End of namespace %s\n", p->sym->name);
                break;
            case ASTT_CLASS_DECL:
                gen_class_decl(p);
                printf("#.endclass\n#End of class %s\n", p->sym->name);
                break;
            default:
                printf("Unknown AST statement type [%d].\n", p->asttype);
                exit(0);
        }
        else {
            printf("Unknown AST kind or type at top level.\n");
            exit(0);
        }
    }
}

void gen_namespace_decl(AST * p) {
    printf("#.namespace %s\n", p->sym->name);
    if(p->arg1)
        gen_ast(p->arg1);
}

void gen_class_decl(AST * p) {
    printf("#.class %s\n", p->sym->name);
    if(p->Attr.Class.body) {
        gen_class_body(p->Attr.Class.body);
    }
}

void gen_class_body(AST * p) {
    while(p) {
        switch(p->asttype) {
            case ASTT_CONSTANT_DECL:
                gen_constant_decl(p);
                break;
            case ASTT_FIELD_DECL:
                gen_field_decl(p);
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
    printf("#.constant %s = %s\n", p->arg1->sym->name, p->arg1->sym->literal->name);
}

void gen_field_decl(AST * p) {
    /* Just to generate the comment */
    printf("#.field %s %s\n", p->arg1->sym->typename->name, p->arg1->sym->name);
}

void gen_block(AST * p) {
    /* First declare locals. */
    if(!p) {
        fprintf(stderr, "WARNING: Null block in AST tree.\n");
        return;
    }
    if(p->vars) {
        Symbol * s = p->vars;
        while(s) {
            /* Don't emit local types that are in symbol table */
            if(s->kind != TYPE)
                printf("\t.local %s\t%s\n", s->typename->name, s->name);
            s = s->tnext;
        }
    }
    gen_statement(p);
}

void gen_statement(AST * p) {
    AST * b;
#if DEBUG
    printf("#gen_statement\n");
#endif
    if(p->kind == KIND_EXPR) {
        if(!eval_expr(p))
            gen_expr(p, NULL, NULL);
        goto END;
    }

    switch(p->asttype) {
        case ASTT_CONSTANT_DECL:
            gen_constant_decl(p);
            break;
        case ASTT_FIELD_DECL:
            /* Locals are collected during the first
             * pass so they can be ordered at the top of each block.
             * During code generation we skip them, only generating
             * the initializer expressions for each, if they exist.
             */
	        gen_var_decl(p);
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
            if((b = get_cur_primary_block()) == NULL
                || (b->asttype != ASTT_FOR && b->asttype != ASTT_WHILE)) {
                printf("continue statement not within a loop\n");
                exit(0);
            }
            if(b->asttype == ASTT_WHILE)
                printf("\tgoto %s\n", b->start_label);
            else {
                if(b->Attr.Loop.iteration)
                    printf("\tgoto %s\n", b->Attr.Loop.iteration->start_label);
                else
                    printf("\tgoto %s\n", b->start_label);
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
                if(!eval_expr(p->arg1))
                    gen_expr(p->arg1, NULL, cur_method->sym->type);

	       	printf("\t# Push return val and jump\n\tsave %s\n",
                        NAME(p->arg1->targ) );
            }
            /* Simple optimization that works most of the time.
             * If this statement is the last statement in the method
             * and its not part of a sub block we don't generate
             * the jump to end for the return. The optimizer should
             * really be used to pick up all instances of this.
             */
            if(get_cur_primary_block() != NULL || p->next != NULL)
                printf("\tgoto %s\n", cur_method->end_label);
            break;
        default:
            printf( "UNKNOWN AST node : %d/%d\n", p->kind, p->asttype);
    }

END:
    if(p->next)
        gen_statement(p->next);
}

void gen_var_decl(AST * p) {
    /* Don't generate the identifier in arg1, it was collected for ordering
     * in phase 2 and declared at the top of the block.
     */
    if(p->arg2) {
        gen_expr(p->arg2, NULL, NULL);
    }
}

void gen_param_list(Symbol * paramlist) {
    if(paramlist->tnext)
        gen_param_list(paramlist->tnext);
    printf("\t.param %s\t%s\n", paramlist->typename->name, paramlist->name);
}

void gen_method_decl(AST * p) {
    Symbol * s;
    reset_temps();
    cur_method = p;
    p->end_label = make_label();
    if(p->sym->namespace && p->sym->namespace != global_namespace)
        printf(".sub _%s__%s\n", p->sym->namespace->name, p->sym->name);
    else
        printf(".sub __%s\n", p->sym->name);
#if 0
    check_id_redecl(global_symbol_table, p->sym->name);
#endif
    printf("\tsaveall\n");
    if((s = p->Attr.Method.params) != NULL)
        gen_param_list(s);

    if(p->Attr.Method.body) {
        gen_block(p->Attr.Method.body);
    }

    printf("%s:\trestoreall\n\tret\n.end\n", p->end_label);
    cur_method = NULL;
}

void gen_assign(AST * ast) {
    AST * p = ast;
#if DEBUG
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
        gen_expr(p->arg2, p->arg1->targ, p->arg1->targ->type);
#if DEBUG
        printf("#  return from gen_assign\n");
#endif

    }
    else {
        /* target is an expression that may or may not
         * have parsed to a assignable lvalue
         */
        /* Now assign the temporary to the lvalue expression */
        if(p->arg1->asttype == ASTT_INDEX) {
            char buf[4096];
            AST * deref = p->arg1;
#if DEBUG
        printf("# gen_assign: assign to index\n");
#endif
            if(deref->arg1 == NULL || deref->arg2 == NULL) {
                printf("Internal error: invalid array expression or indirection as lvalue\n");
                abort();
            }

            /* Assign to an array */
            if(!eval_expr(deref->arg1))
                gen_expr(deref->arg1, NULL, NULL);
            /* Require array subscript to be int */
            if(!eval_expr(deref->arg2))
                gen_expr(deref->arg2, NULL, t_int32);

#if 0
            /* If destination indirection uses a variable, copy it to a
             * temporary in case it is modified by source expression code
             * ( d[i] = s[++i] )
             * ANSI C says this is undefined, but not sure about C#/Java
             * so we try to do the right thing.
             */
            if(deref->arg2->asttype == ASTT_IDENTIFIER) {
                deref->arg2->targ = new_temp(deref->arg2->sym->type);
                printf("\t(%s)%s = %s\n", type_name(deref->arg2->targ->type),
                    deref->arg2->targ->name, deref->arg2->sym->name);
            }
#endif
            /* emit source expression with a temporary */
            gen_expr(p->arg2, NULL, NULL);

            sprintf(buf, "%s[%s]", deref->arg1->targ->name, deref->arg2->targ->name);
            p->targ = new_identifier_symbol(buf);
            p->targ->is_lval = 1;
            p->targ->type = deref->arg1->targ->type;
            p->targ->typename = deref->arg1->targ->typename;

            /* Generate assignment */
#if 0
            printf("\t(%s)%s = %s\n", p->targ->typename->name, p->targ->name,
                                    p->arg2->targ->name);
#endif
	    printf("\t%s = %s\n", p->targ->name, p->arg2->targ->name);
#if DEBUG
            printf("#  return from gen_assign\n");
#endif
            return;
        }

        printf("#gen_assign: Internal error, unsupported assignment.\n");
        exit(0);
    }

#if DEBUG
    printf("#  return from gen_assign\n");
#endif
}

/* If lval is passed, expressions use that as the target,
 * otherwise they create a temporary.
 */
void gen_expr(AST * p, Symbol * lval, Type * type) {
    /* Temporaries we may have to use in expression generation */
    Symbol *tv1, *tv2;
    const char *tl1, *tl2, *tl3;
#if DEBUG
    printf("#gen_expr\n");
#endif

    /* Expression is a simple identifier or literal */
    if(p->asttype == ASTT_IDENTIFIER ||
        p->asttype == ASTT_LITERAL) {
        if(lval)
            p->targ = lval;
        else
            p->targ = new_temp(p->sym->type);
#if DEBUG
        printf("# literal or identifier\n");
#endif
        emit_unary_expr(p->targ, p->sym, NULL);

#if DEBUG
        goto LAST;
#endif
        return;
    }

    /* Expression is a new() expression */
    if(p->asttype == ASTT_NEW_OBJECT) {
        printf("\t# new()\n");
        if(lval != NULL)
            p->targ = lval;
        else
            p->targ = new_temp(p->type);
#if 0
        printf("\t(%s)%s = new %s\n", p->typename->name, p->targ->name,
                        p->typename->name);
#endif
     	printf("\t%s = new %s\n", p->targ->name, p->typename->name);
        return;
    }

    /* Expression has no operands */
    if(p->arg1 == NULL && p->arg2 == NULL) {
        printf("#gen_expr: no operands\n");
        exit(0);
    }

    /* Expression is a method call */
    if(p->asttype == ASTT_METHOD_CALL) {
        if(lval)
            p->targ = lval;
        gen_method_call(p);
#if DEBUG
        goto LAST;
#endif
        return;
    }
    /* Expression is an assignment */
    else if(p->asttype == ASTT_ASSIGN) {
        gen_assign(p);
#if DEBUG
        goto LAST;
#endif
        return;
    }
    else if(p->asttype == ASTT_CONDITIONAL_EXPR) {
        /* Ternary conditional:  i > j ? i : j */
        /* This needs work */
#if DEBUG
        printf("# gen_expr: conditional expression\n");
#endif
        tl1 = make_label();
        tl2 = make_label();
        tl3 = make_label();
        gen_boolean(p->Attr.Conditional.condition, tl1, tl2, 1);
        printf("%s:\n", tl1);
        p->targ = lval;
        if(p->targ == NULL) {
            gen_expr(p->arg1, NULL, type);
            p->targ = p->arg1->targ;
        }
        else {
            gen_expr(p->arg1, p->targ, p->targ->type);
        }

        printf("\tgoto %s\n%s:\n", tl3, tl2);
        /* Temporary was generated by first expression generation if it was null
         * so reuse it here.
         */
        gen_expr(p->arg2, p->targ, p->targ->type);
        printf("%s:\n", tl3);
        if(!p->arg1->targ || !p->arg2->targ) {
            fprintf(stderr, "Error: ternary conditionals must generate rvalues to be a statement.\n");
            exit(0);
        }
        return;
    }

    if(!eval_expr(p->arg1))
        gen_expr(p->arg1, NULL, NULL);

    if(p->arg2) {
        if(!eval_expr(p->arg2))
            gen_expr(p->arg2, NULL, NULL);
    }

    /* Very limited type coercion here */
    if(p->arg1 && p->arg2) {
        Type * type1 = p->arg1->targ->type,
             * type2 = p->arg2->targ->type;

        if(lval)
            p->targ = lval;

        if(p->op == INDEX) {
#if DEBUG
            printf("# gen_expr: index operator\n");
#endif
            if(type2 != t_int32) {
                fprintf(stderr, "Array subscript expression must be type integer.\n");
                exit(0);
            }
            if(type1 != t_string) {
                fprintf(stderr, "Index operators not yet implemented for non-string types.\n");
                exit(0);
            }
            if(p->targ == NULL)
                p->targ = new_temp(type1);
#if 0
            printf("\t(%s)%s = %s[%s]\n", p->targ->typename->name,
                                p->targ->name, p->arg1->targ->name,
                                p->arg2->targ->name);
#endif
            printf("\t%s = %s[%s]\n", p->targ->name, p->arg1->targ->name,
                                p->arg2->targ->name);
#if DEBUG
            printf("#  return from gen_expr\n");
#endif
            return;
        }

        if(type1 != type2) {
            /* Generate required casting assignments to temporaries */
#if DEBUG
            fprintf(stderr, "#typeof(%s) != typeof(%s)\n",
               p->arg1->targ->name, p->arg2->targ->name);
#endif
            coerce_operands(&type1, &type2);
            if(type1 != p->arg1->targ->type) {
                Symbol * cast = new_temp(type1);
#if 0
                printf("\t(%s)%s = %s\n", cast->typename->name,
                        cast->name, p->arg1->targ->name);
#endif
                printf("\t%s = %s\n", cast->name, p->arg1->targ->name);
                p->arg1->targ = cast;
            }
            if(type2 != p->arg2->targ->type) {
                Symbol * cast = new_temp(type2);
#if 0
                printf("\t(%s)%s = %s\n", cast->typename->name,
                        cast->name, p->arg2->targ->name);
#endif
                printf("\t%s = %s\n", cast->name, p->arg2->targ->name);
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
            p->targ = new_temp(type1);
        if(p->targ->type != type1) {
            Symbol * temp = new_temp(type1);
            emit_op_expr(temp, p->arg1->targ, op_name(p->op), p->arg2->targ);
#if 0
            printf("\t(%s)%s = %s\n", p->targ->typename->name, p->targ->name,
                                        temp->name);
#endif
            printf("\t%s = %s\n", p->targ->name, temp->name);
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
            p->targ = new_temp(p->arg1->targ->type);
#if 0
            printf("\t(%s)%s = %s\n", p->targ->typename->name, p->targ->name,
                                        p->arg1->targ->name);
#endif
            printf("\t%s = %s\n", p->targ->name, p->arg1->targ->name);
            printf("\t%s %s\n", op_name(p->op), p->arg1->targ->name);
        }
        else {
            if(lval)
                p->targ = lval;
            else
                p->targ = new_temp(p->arg1->targ->type);
            emit_unary_expr(p->targ, p->arg1->targ, op_name(p->op));
        }
    }

#if DEBUG
    LAST: printf("#  return from gen_expr\n");
#endif
}

/*
 * Generate arguments in reverse order on stack.
 */
void gen_arg_list(AST * p) {
    if(p == NULL)
        return;
    /* FIXME: Here we should check the method signature and find out
     * what type is expected.
     */
    if(!eval_expr(p))
        gen_expr(p, NULL, NULL);
    if(p->targ)
        printf("\t.arg %s\n", NAME(p->targ));
    else {
        fprintf(stderr, "Internal compiler error: argument expression didn't generate an rvalue\n");
        exit(0);
    }
    if(p->next)
        gen_arg_list(p->next);
}

void gen_method_call(AST * p) {
    /* FIXME: Should check that expression evaluates to a method */
    if(!eval_expr(p->arg1))
        gen_expr(p->arg1, NULL, NULL);

    /* Argument list */
    if(p->arg2)
        gen_arg_list(p->arg2);

    /*
     * if p is instance method, push implicit object reference onto
     * calling stack.
     */
    if(p->arg1->targ->namespace && p->arg1->targ->namespace != global_namespace) {
        printf("\tcall _%s__%s\n", p->arg1->targ->namespace->name,
                    p->arg1->targ->name);
    }
    else {
        printf("\tcall __%s\n", p->arg1->targ->name);
    }

    if(p->arg1->targ->type == t_void) {
        if(p->targ != NULL) {
            /* If caller wants a return value, method can't be void. */
            fprintf(stderr, "ERROR: void function [%s] does not return a value.\n",
                        p->arg1->targ->name );
            exit(0);
        }
    }
    else {
        if(p->targ == NULL)
            p->targ = new_temp(p->arg1->targ->type);
        printf("\t#Get return val in %s\n", p->targ->name);
        printf("\trestore %s\n", p->targ->name);
    }
}

void gen_if(AST * p) {
    char * if_label, * else_label, *end_label;
#if DEBUG
    printf("#gen_if\n");
#endif
    if_label = make_label();
    else_label = make_label();
    end_label = make_label();
    if(!p->Attr.Conditional.condition
        || p->Attr.Conditional.condition->kind != KIND_EXPR) {
        fprintf(stderr, "gen_if: Null or invalid CONDITION node\n");
        exit(0);
    }

    if(!p->arg1) {
        fprintf(stderr, "gen_if: Null THEN node\n");
        exit(0);
    }

    /* If Then Else */
    if(p->arg2) {
        gen_boolean(p->Attr.Conditional.condition, if_label, else_label, 1);
        printf("%s:\n", if_label);
        gen_block(p->arg1);
        printf("\tgoto %s\n", end_label);
        printf("%s:\n", else_label);
        gen_block(p->arg2);
    }
    /* If Then */
    else {
        gen_boolean(p->Attr.Conditional.condition, if_label, end_label, 1);
        printf("%s:\n", if_label);
        gen_block(p->arg1);
    }
    printf("%s:\n", end_label);
}

void gen_while(AST * p) {
    const char * redo_label = make_label();
    p->start_label = make_label();
    p->end_label = make_label();
    push_primary_block(p);
    printf("%s:\n", redo_label);
    gen_boolean(p->Attr.Loop.condition, p->start_label, p->end_label, 1);
    printf("%s:\n", p->start_label);
    gen_block(p->Attr.Loop.body);
    printf("\tgoto %s\n", redo_label);
    printf("%s:\n", p->end_label);
    pop_primary_block();
}

void gen_for(AST * p) {
    const char * redo_label = make_label();
#if DEBUG
    printf("#gen_for\n");
#endif
    p->start_label = make_label();
    p->end_label = make_label();
    if(p->Attr.Loop.iteration)
        p->Attr.Loop.iteration->start_label = make_label();

    push_primary_block(p);
    if(p->Attr.Loop.init != NULL) {
#if DEBUG
        printf("#gen_for: generate init statement\n");
#endif
        gen_statement(p->Attr.Loop.init);
    }
    printf("%s:\n", redo_label);
    gen_boolean(p->Attr.Loop.condition, p->start_label, p->end_label, 1);
    printf("%s:\n", p->start_label);
    gen_block(p->Attr.Loop.body);
    if(p->Attr.Loop.iteration) {
        printf("%s:\n", p->Attr.Loop.iteration->start_label);
        gen_statement(p->Attr.Loop.iteration);
    }
    printf("\tgoto %s\n", redo_label);
    printf("%s:\n", p->end_label);
    pop_primary_block();
}

/*
 * boolean->arg1 points to the actual expression, boolean just converts to true/false
 * The invert arg is for generating the branches depending on if we are generating
 * a simple logical or compound for lazy evaluation.
 */
void gen_boolean(AST * p, const char * true_label, const char * false_label, int invert) {
    int op_inv;
    const char * inverse_label;
#if DEBUG
    printf("#gen_boolean\n");
#endif

    switch(p->asttype) {
        /* If literal or identifier generate a comparison to 0
         * Fix this to skip the conditional for constant expressions.
         */
        case ASTT_IDENTIFIER:
        case ASTT_LITERAL:
            /* If boolean expression is a literal or variable we can
             * either optimize the compare away or generate a comparison
             * to the boolean false equivalent to the data type.
             */
            if(p->sym == NULL) {
                printf("Internal error: gen_bool(): NULL symbol for condition\n");
                abort();
            }
            p->targ = p->sym;
            if(invert) {
                inverse_label = false_label;
                op_inv = LOGICAL_EQ;
            }
            else {
                inverse_label = true_label;
                op_inv = LOGICAL_NE;
            }
            if(p->targ->type == t_string) {
                printf("\tif %s %s \"\" goto %s\n", NAME(p->targ),
                            op_name(op_inv), inverse_label);
            } else {
                printf("\tif %s %s 0 goto %s\n", NAME(p->targ),
                            op_name(op_inv), inverse_label);
            }
            return;
        case ASTT_LOGICAL:
            printf("#Logical expression\n");
            if(p->op == LOGICAL_AND) {
                /* AND */
                const char * next_logical = make_label();
                gen_boolean(p->arg1, next_logical, false_label, 1);
                printf("%s:\n", next_logical);
                gen_boolean(p->arg2, true_label, false_label, 1);
            }
            else {
                /* OR */
                const char * next_logical = make_label();
                gen_boolean(p->arg1, true_label, next_logical, 0);
                printf("%s:\n", next_logical);
                gen_boolean(p->arg2, true_label, false_label, invert);
            }
            return;
        case ASTT_COMPARISON:
            if(!p->arg1 || !p->arg2) {
                printf("#gen_boolean(comparison): Need 2 operands\n");
                exit(0);
            }
            if(!eval_expr(p->arg1))
                gen_expr(p->arg1, NULL, NULL);
            if(!eval_expr(p->arg2))
                gen_expr(p->arg2, NULL, NULL);
            if(invert) {
                op_inv = op_inverse(p->op);
                inverse_label = false_label;
            } else {
                op_inv = p->op;
                inverse_label = true_label;
            }
            printf("\tif %s %s %s goto %s\n", NAME(p->arg1->targ), op_name(op_inv),
                        NAME(p->arg2->targ), inverse_label);
            return;
        default:
            printf("#gen_boolean: Unknown boolean AST type(%d).\n", p->arg1->asttype);
            exit(0);
    }
}

void coerce_operands(Type ** t1, Type ** t2) {
    if(!*t1 || !*t2) {
        fprintf(stderr, "Internal error: coerce_operands: NULL type(s)\n");
        abort();
    }
    if(*t1 == *t2)
        return;
    if(*t1 == t_int32) {
        if(*t2 == t_float)
            *t1 = t_float;
        else {
            printf("Can't coerce types (int, %s)\n", type_name(*t2));
            exit(0);
        }
    }
    else if(*t1 == t_float) {
        if(*t2 == t_int32)
            *t2 = t_float;
        else {
            printf("Can't coerce types (float, %s)\n", type_name(*t2));
            exit(0);
        }
    }
    else {
        printf("Unsupported type coercion requested (%s, %s).\n",
                            (*t1)->sym->name, (*t2)->sym->name);
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
        case INC:           return "inc";
        case DEC:           return "dec";
        case LOGICAL_OR:    return "||";
        case LOGICAL_AND:   return "&&";
        case LOGICAL_EQ:    return "==";
        case LOGICAL_NE:    return "!=";
        case '<':           return "<";
        case '>':           return ">";
        case LOGICAL_LTE:   return "<=";
        case LOGICAL_GTE:   return ">=";
        case LEFT_SHIFT:    return "<<";
        case RIGHT_SHIFT:   return ">>";
        default:    printf("Invalid operator %d\n", operator);
                exit(0);
    }
}

int op_inverse(int operator) {
    switch(operator) {
        case LOGICAL_EQ:    return LOGICAL_NE;
        case LOGICAL_NE:    return LOGICAL_EQ;
        case '<':           return LOGICAL_GTE;
        case '>':           return LOGICAL_LTE;
        case LOGICAL_LTE:   return '>';
        case LOGICAL_GTE:   return '<';
    }
    printf("op_inverse: Invalid logical operator %d\n", operator);
    exit(0);
}

char * new_itemp() {
    static char name[256];
    sprintf(name, "$I%d", ival++);
    return &name[0];
}

char * new_ntemp() {
    static char name[256];
    sprintf(name, "$N%d", ival++);
    return &name[0];
}

char * new_stemp() {
    static char name[256];
    sprintf(name, "$S%d", ival++);
    return &name[0];
}

char * new_ptemp() {
    static char name[256];
    sprintf(name, "$P%d", ival++);
    return &name[0];
}


/* Create a temporary rval */
Symbol * new_temp(Type * type) {
    Symbol * s;
    if(!type) {
        abort();
    }

    /* Map a Cola type to a primitive type */
    if(type == t_int32 || type == t_uint32 || type == t_short
        || type == t_ushort || type == t_char || type == t_byte
        || type == t_sbyte || type == t_bool)
        s = new_identifier_symbol(new_itemp());
    else if(type == t_float || type == t_double || type == t_decimal)
        s = new_identifier_symbol(new_ntemp());
    else if(type == t_string)
        s = new_identifier_symbol(new_stemp());
    else if(type == t_object)
        s = new_identifier_symbol(new_ptemp());
    else {
        fprintf(stderr, "Internal error: Can't map type %s to a primitive type.\n", type->sym->name);
        abort();
    }

    s->type = type;
    s->typename = type->sym;
    s->is_lval = 0;
    return s;
}

void reset_temps() {
    ival = 0;
    nval = 0;
    sval = 0;
    pval = 0;
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
#if DEBUG
    printf("#emit_op_expr\n");
#endif

#if 0
    printf( "\t(%s)%s = %s %s %s\n", r->typename->name, r->name,
               NAME(a1), op, NAME(a2));
#endif
    printf( "\t%s = %s %s %s\n", r->name, NAME(a1), op, NAME(a2));
}

void emit_unary_expr(Symbol * res, Symbol * arg1, char * op) {
#if DEBUG
    printf("#emit_unary_expr\n");
#endif

    if(op)
#if 0
        printf( "\t(%s)%s = %s %s\n", res->typename->name, res->name,
                       op, NAME(arg1));
#endif
        printf( "\t%s = %s %s\n", res->name, op, NAME(arg1));
    else
#if 0
        printf( "\t(%s)%s = %s\n", res->typename->name, res->name,
                NAME(arg1));
#endif
        printf( "\t%s = %s\n", res->name,
                NAME(arg1));

#if DEBUG
    printf("#  return from emit_unary_expr\n");
#endif
}

