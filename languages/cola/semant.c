/*
 * semant.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Semantic and type checking phase.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"

/*
 * Walk the AST tree and resolve symbol types.
 * 1) Resolve identifiers to symbol table references
 * 2) Resolve typenames to type references
 * 3) Check for invalid assignments and operations
 */
void build_ast(AST * tree) {
    if(!tree) return;
    switch(tree->asttype) {
    	case ASTT_CLASS_DECL:
    	    build_class_decl(tree);
            break;
        default:
            fprintf(stderr, "build_ast: Invalid asttype [%d]\n", tree->asttype);
            abort();
    }

    build_ast(tree->next);
}

void build_class_decl(AST * c) {
    if(!c) return;
#if DEBUG
    fprintf(stderr, "Pass 2: class [%s]\n", c->sym->name);
#endif
    push_namespace(c->sym);
    if(c->Attr.Class.body)
	    build_class_body(c->Attr.Class.body);
    pop_namespace();
}

void build_class_body(AST * b) {
    if(!b) return;
    fprintf(stderr, "Pass 2: class body\n");
    while(b) {
        switch(b->asttype) {
            case ASTT_CONSTANT_DECL:
                build_field_decl(b);
        	    break;
            case ASTT_FIELD_DECL:
                build_field_decl(b);
        	    break;
            case ASTT_METHOD_DECL:
#if DEBUG
                fprintf(stderr, "Pass 2: Method [%s]\n", b->sym->name);
#endif
                build_method_decl(b);
#if DEBUG
                fprintf(stderr, "Pass 2: End Method [%s]\n", b->sym->name);
#endif
                break;
            default:
                fprintf(stderr, "build_class_body: Invalid asttype [%d]\n", b->asttype);
                abort();
        }
	    b = b->next;
    }
}

/*
 * A class field declaration
 */
void build_field_decl(AST * d) {
#if DEBUG
    if(d->asttype == ASTT_CONSTANT_DECL)
        fprintf(stderr, "Pass 2: class const [%s]\n", d->arg1->sym->name);
    else
        fprintf(stderr, "Pass 2: class field [%s]\n", d->arg1->sym->name);
#endif
    declare_field(d->arg1->sym);
    d->arg1->type = d->arg1->sym->type;
    build_expr(d->arg2);
}

/*
 * A class method declaration
 */
void build_method_decl(AST * m) {
    /* Uses enclosing class's namespace, nested scope */
    /*push_namespace(m->sym);*/
#if DEBUG
    fprintf(stderr, "build_method_decl\n");
#endif
    push_scope();
    if(m->Attr.Method.params) {
        Symbol * s = m->Attr.Method.params;
        while(s) {
            declare_local(s);
            s = s->tnext;
        }
    }
    if(m->Attr.Method.body) {
        push_scope();
        build_statement_list(m->Attr.Method.body);
        m->Attr.Method.body->vars = pop_scope();
        {
            Symbol * s = m->vars;
            fprintf(stderr, "\tPopped locals:\n");
            while(s) {
                fprintf(stderr, "\t[%s]\n", s->name);
                s = s->tnext;          
            }
        }
    }
    /*
     * Don't use pop_scope here because this scope's symbols
     * are also referenced by the ordered list in Method.params
     * pop_scope would reorder the symbol list we already have.
     */
    discard_scope();
}

/*
 * A block or method local variable declaration
 */
void build_var_decl(AST * d) {
#if DEBUG
    if(d->asttype == ASTT_CONSTANT_DECL)
        fprintf(stderr, "Pass 2: Local const [%s]\n", d->arg1->sym->name);
    else
        fprintf(stderr, "Pass 2: Local var [%s]\n", d->arg1->sym->name);
#endif
    declare_local(d->arg1->sym);
    d->arg1->type = d->arg1->sym->type;
    build_expr(d->arg2);
}

void build_if(AST * i) {
    /* IF */
#if DEBUG
    fprintf(stderr, "build_if\n");
#endif
    build_expr(i->Attr.Conditional.condition);
    /* THEN */
    build_statement_list(i->arg1);
    /* ELSE */
    build_statement_list(i->arg2);
}

void build_conditional(AST * c) {
    /* IF */
#if DEBUG
    fprintf(stderr, "build_conditional\n");
#endif
    build_expr(c->Attr.Conditional.condition);
    /* THEN */
    build_expr(c->arg1);
    /* ELSE */
    build_expr(c->arg2);
    if(c->arg1->type != c->arg2->type) {
        fprintf(stderr, "Error: expression types not equivalent in ternary expression\n");
	exit(0);
    }
    c->typename = c->arg1->typename;
    c->type = c->arg1->type;
}

void build_method_call(AST * c) {
    fprintf(stderr, "build_method_call\n");
    build_expr(c->arg1);
    c->type = c->arg1->type;
    c->typename = c->arg1->typename;
    /* The argument list */
    build_expr_list(c->arg2);
}

void build_new_expr(AST * n) {
    n->type = lookup_type_symbol(n->typename);
    if(!n->type) {
        fprintf(stderr, "Internal error: new called for unknown type [%s]\n",
            n->typename->name);
        abort();
    }
}

void build_loop(AST * l) {
#if DEBUG
    fprintf(stderr, "build_loop\n");
#endif
    build_statement_list(l->Attr.Loop.init);
    build_statement_list(l->Attr.Loop.iteration);
    build_expr(l->Attr.Loop.condition);
    build_statement_list(l->Attr.Loop.body);
}

void build_return(AST * r) {
    if(r->arg1)
        build_expr(r->arg1);
}

void build_expr_list(AST * e) {
    AST * p = e;
    while(p) {
        build_expr(p);
        p = p->next;
    }
}

void build_expr(AST * e) {
#if DEBUG
    fprintf(stderr, "build_expr\n");
#endif
    if(!e) return;
    switch(e->asttype) {
        case ASTT_LITERAL:
            e->type = e->sym->type;
            e->typename = e->sym->typename;
            return;

    	case ASTT_IDENTIFIER:
            resolve_identifier(&e->sym);
            e->type = e->sym->type;
            e->typename = e->sym->typename;
            return;

    	case ASTT_METHOD_CALL:
            build_method_call(e);
            break;

    	case ASTT_NEW_OBJECT:
            build_new_expr(e);
            break;

    	case ASTT_ASSIGN:
            build_expr(e->arg1);
            build_expr(e->arg2);
            break;

        case ASTT_CONDITIONAL_EXPR:
            build_conditional(e);
            break;

        case ASTT_OP:
            build_expr(e->arg1);
            build_expr(e->arg2);
            if(e->arg1->type == t_string) {
                /* Implicitly convert + operator on string types to
                 * . concat operator until the compiler can handle class
                 * operators.
                 */
                e->op = '.';
            }
            break;
        case ASTT_LOGICAL:
        case ASTT_INDEX:
        case ASTT_COMPARISON:
        case ASTT_PREINC:
        case ASTT_POSTINC:
            build_expr(e->arg1);
            build_expr(e->arg2);
            break;

        case ASTT_BOOLEAN:
            build_expr(e->arg1);
            break;
        default:
            fprintf(stderr, "build_expr: Invalid expr asttype [%d]\n", e->asttype);
            abort();
    }
    
    if(e->arg1) {
        e->type = e->arg1->type;
        e->typename = e->arg1->typename;
    }
}

void build_statement_list(AST * s) {
    static int statements;
    if(!s) return;
#if DEBUG
    fprintf(stderr, "statements parsed [%d]\n", statements++);
#endif
    if(s->kind == KIND_EXPR) {
        build_expr(s);
        goto END;
    }

    switch(s->asttype) {
        case ASTT_IF:
            build_if(s);
            break;
        case ASTT_CONSTANT_DECL:
            build_var_decl(s);
    	    break;
        case ASTT_FIELD_DECL:
            build_var_decl(s);
    	    break;
        case ASTT_WHILE:
        case ASTT_FOR:
            build_loop(s);
            break;
        case ASTT_BREAK:
        case ASTT_CONTINUE:
	    break;
        case ASTT_RETURN:
            build_return(s);
            break;
        default:
            fprintf(stderr, "build_statement_list: Invalid asttype [%d]\n", s->asttype);
            abort();
    }

END:
    build_statement_list(s->next);
}


