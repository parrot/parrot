/* $Id$ */

/* GNU m4 -- A simple macro processor
   Copyright (C) 1989, 90, 91, 92, 93, 94 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

typedef int boolean;
typedef int eval_t;

/* Error handling.  */
#define CODE_SIZE 128

/* This file contains the functions to evaluate integer expressions for
   the "eval" macro.  It is a little, fairly self-contained module, with
   its own scanner, and a recursive descent parser.  The only entry point
   is evaluate().  
*/


/* Evaluates token types.  */
typedef enum eval_token
  {
    ERROR,
    PLUS, MINUS,
    EXPONENT,
    TIMES, DIVIDE, MODULO,
    EQ, NOTEQ, GT, GTEQ, LS, LSEQ,
    LSHIFT, RSHIFT,
    LNOT, LAND, LOR,
    NOT, AND, OR, XOR,
    LEFTP, RIGHTP,
    NUMBER, EOTEXT
  }
eval_token;

/* Error types.  */

typedef enum eval_error
  {
    NO_ERROR,
    MISSING_RIGHT,
    SYNTAX_ERROR,
    UNKNOWN_INPUT,
    EXCESS_INPUT,
    DIVIDE_ZERO,
    MODULO_ZERO
  }
eval_error;


/* declarations */
static eval_error          logical_or_term( eval_token, eval_t * );
static eval_error          logical_and_term( eval_token, eval_t * );
static eval_error          or_term( eval_token, eval_t * );
static eval_error          xor_term( eval_token, eval_t * );
static eval_error          and_term( eval_token, eval_t * );
static eval_error          not_term( eval_token, eval_t * );
static eval_error          logical_not_term( eval_token, eval_t * );
static eval_error          cmp_term( eval_token, eval_t * );
static eval_error          shift_term( eval_token, eval_t * );
static eval_error          add_term( eval_token, eval_t * );
static eval_error          mult_term( eval_token, eval_t * );
static eval_error          exp_term( eval_token, eval_t * );
static eval_error          unary_term( eval_token, eval_t * );
static eval_error          simple_term( eval_token, eval_t * );
boolean                    evaluate (const char *, eval_t *);
PMC *                      m4_eval_compiler(Parrot_Interp, const char *);
void                       Parrot_lib_m4_eval_compiler_init(Parrot_Interp , PMC* );

/*--------------------.
| Lexical functions.  |
`--------------------*/

/* Pointer to next character of input text.  */
static const char *eval_text;

/* Value of eval_text, from before last call of eval_lex ().  This is so we
   can back up, if we have read too much.  */
static const char *last_text;

static void eval_init_lex( const char *text )
{
  eval_text = text;
  last_text = NULL;
}

static void
eval_undo (void)
{
  eval_text = last_text;
}

/* VAL is numerical value, if any.  */

static eval_token eval_lex( eval_t *val )
{
  while ( isspace(*eval_text) ) eval_text++;

  last_text = eval_text;

  if (*eval_text == '\0') return EOTEXT;

  if (isdigit (*eval_text))
  {
      int base, digit;

      if (*eval_text == '0')
	{
	  eval_text++;
	  switch (*eval_text)
	    {
	    case 'x':
	    case 'X':
	      base = 16;
	      eval_text++;
	      break;

	    case 'b':
	    case 'B':
	      base = 2;
	      eval_text++;
	      break;

	    case 'r':
	    case 'R':
	      base = 0;
	      eval_text++;
	      while (isdigit (*eval_text) && base <= 36)
		base = 10 * base + *eval_text++ - '0';
	      if (base == 0 || base > 36 || *eval_text != ':')
		return ERROR;
	      eval_text++;
	      break;

	    default:
	      base = 8;
	    }
	}
      else
	base = 10;

      (*val) = 0;
      for (; *eval_text; eval_text++)
	{
	  if (isdigit (*eval_text))
	    digit = *eval_text - '0';
	  else if (islower (*eval_text))
	    digit = *eval_text - 'a' + 10;
	  else if (isupper (*eval_text))
	    digit = *eval_text - 'A' + 10;
	  else
	    break;

	  if (digit >= base)
	    break;

	  (*val) = (*val) * base + digit;
	}
      return NUMBER;
    }

  switch (*eval_text++)
    {
    case '+':
      return PLUS;
    case '-':
      return MINUS;
    case '*':
      if (*eval_text == '*')
	{
	  eval_text++;
	  return EXPONENT;
	}
      else
	return TIMES;
    case '/':
      return DIVIDE;
    case '%':
      return MODULO;
    case '=':
      if (*eval_text == '=')
	eval_text++;
      return EQ;
    case '!':
      if (*eval_text == '=')
	{
	  eval_text++;
	  return NOTEQ;
	}
      else
	return LNOT;
    case '>':
      if (*eval_text == '=')
	{
	  eval_text++;
	  return GTEQ;
	}
      else if (*eval_text == '>')
	{
	  eval_text++;
	  return RSHIFT;
	}
      else
	return GT;
    case '<':
      if (*eval_text == '=')
	{
	  eval_text++;
	  return LSEQ;
	}
      else if (*eval_text == '<')
	{
	  eval_text++;
	  return LSHIFT;
	}
      else
	return LS;
    case '^':
      return XOR;
    case '~':
      return NOT;
    case '&':
      if (*eval_text == '&')
	{
	  eval_text++;
	  return LAND;
	}
      else
	return AND;
    case '|':
      if (*eval_text == '|')
	{
	  eval_text++;
	  return LOR;
	}
      else
	return OR;
    case '(':
      return LEFTP;
    case ')':
      return RIGHTP;
    default:
      return ERROR;
    }
}

/*---------------------------------------.
| Main entry point, called from "eval".	 |
`---------------------------------------*/

boolean
evaluate (const char *expr, eval_t *val)
{
    eval_token et;
    eval_error err;

    eval_init_lex (expr);
    et = eval_lex (val);
    err = logical_or_term( et, val );

  if (err == NO_ERROR && *eval_text != '\0')
    err = EXCESS_INPUT;

  switch (err)
    {
    case NO_ERROR:
      break;

    case MISSING_RIGHT:
      fprintf( stderr, "Bad expression in eval (missing right parenthesis): %s",
		expr);
      break;

    case SYNTAX_ERROR:
      fprintf( stderr, "Bad expression in eval: %s", expr);
      break;

    case UNKNOWN_INPUT:
      fprintf( stderr, "Bad expression in eval (bad input): %s", expr);
      break;

    case EXCESS_INPUT:
      fprintf( stderr, "Bad expression in eval (excess input): %s", expr);
      break;

    case DIVIDE_ZERO:
      fprintf( stderr, "Divide by zero in eval: %s", expr);
      break;

    case MODULO_ZERO:
      fprintf( stderr, "Modulo by zero in eval: %s", expr);
      break;

    default:
      fprintf( stderr, "INTERNAL ERROR: Bad error code in evaluate ()");
      abort ();
    }

  return (boolean) (err != NO_ERROR);
}

/*---------------------------.
| Recursive descent parser.  |
`---------------------------*/

static eval_error
logical_or_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = logical_and_term (et, v1)) != NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == LOR)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = logical_and_term (et, &v2)) != NO_ERROR)
	return er;

      *v1 = *v1 || v2;
    }
  if (et == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
logical_and_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = or_term (et, v1)) != NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == LAND)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = or_term (et, &v2)) != NO_ERROR)
	return er;

      *v1 = *v1 && v2;
    }
  if (et == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
or_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = xor_term (et, v1)) != NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == OR)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = xor_term (et, &v2)) != NO_ERROR)
	return er;

      *v1 = *v1 | v2;
    }
  if (et == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
xor_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = and_term (et, v1)) != NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == XOR)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = and_term (et, &v2)) != NO_ERROR)
	return er;

      *v1 = *v1 ^ v2;
    }
  if (et == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
and_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = not_term (et, v1)) != NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == AND)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = not_term (et, &v2)) != NO_ERROR)
	return er;

      *v1 = *v1 & v2;
    }
  if (et == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
not_term (eval_token et, eval_t *v1)
{
  eval_error er;

  if (et == NOT)
    {
      et = eval_lex (v1);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = not_term (et, v1)) != NO_ERROR)
	return er;
      *v1 = ~*v1;
    }
  else
    if ((er = logical_not_term (et, v1)) != NO_ERROR)
      return er;

  return NO_ERROR;
}

static eval_error
logical_not_term (eval_token et, eval_t *v1)
{
  eval_error er;

  if (et == LNOT)
    {
      et = eval_lex (v1);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = logical_not_term (et, v1)) != NO_ERROR)
	return er;
      *v1 = !*v1;
    }
  else
    if ((er = cmp_term (et, v1)) != NO_ERROR)
      return er;

  return NO_ERROR;
}

static eval_error
cmp_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = shift_term (et, v1)) != NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == EQ || op == NOTEQ
	 || op == GT || op == GTEQ
	 || op == LS || op == LSEQ)
    {

      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = shift_term (et, &v2)) != NO_ERROR)
	return er;

      switch (op)
	{
	case EQ:
	  *v1 = *v1 == v2;
	  break;

	case NOTEQ:
	  *v1 = *v1 != v2;
	  break;

	case GT:
	  *v1 = *v1 > v2;
	  break;

	case GTEQ:
	  *v1 = *v1 >= v2;
	  break;

	case LS:
	  *v1 = *v1 < v2;
	  break;

	case LSEQ:
	  *v1 = *v1 <= v2;
	  break;

	default:
	  fprintf( stderr, "INTERNAL ERROR: Bad comparison operator in cmp_term ()");
	  abort ();
	}
    }
  if (op == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
shift_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = add_term (et, v1)) != NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == LSHIFT || op == RSHIFT)
    {

      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = add_term (et, &v2)) != NO_ERROR)
	return er;

      switch (op)
	{
	case LSHIFT:
	  *v1 = *v1 << v2;
	  break;

	case RSHIFT:
	  *v1 = *v1 >> v2;
	  break;

	default:
	  fprintf( stderr, "INTERNAL ERROR: Bad shift operator in shift_term ()");
	  abort ();
	}
    }
  if (op == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
add_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = mult_term (et, v1)) != NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == PLUS || op == MINUS)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = mult_term (et, &v2)) != NO_ERROR)
	return er;

      if (op == PLUS)
	*v1 = *v1 + v2;
      else
	*v1 = *v1 - v2;
    }
  if (op == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
mult_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = exp_term (et, v1)) != NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == TIMES || op == DIVIDE || op == MODULO)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = exp_term (et, &v2)) != NO_ERROR)
	return er;

      switch (op)
	{
	case TIMES:
	  *v1 = *v1 * v2;
	  break;

	case DIVIDE:
	  if (v2 == 0)
	    return DIVIDE_ZERO;
	  else
	    *v1 = *v1 / v2;
	  break;

	case MODULO:
	  if (v2 == 0)
	    return MODULO_ZERO;
	  else
	    *v1 = *v1 % v2;
	  break;

	default:
	  fprintf( stderr, "INTERNAL ERROR: Bad operator in mult_term ()");
	  abort ();
	}
    }
  if (op == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
exp_term (eval_token et, eval_t *v1)
{
  register eval_t result;
  eval_t v2;
  eval_error er;

  if ((er = unary_term (et, v1)) != NO_ERROR)
    return er;
  result = *v1;

  while ((et = eval_lex (&v2)) == EXPONENT)
    {
      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = exp_term (et, &v2)) != NO_ERROR)
	return er;

      result = 1;
      while (v2-- > 0)
	result *= *v1;
      *v1 = result;
    }
  if (et == ERROR)
    return UNKNOWN_INPUT;

  eval_undo ();
  return NO_ERROR;
}

static eval_error
unary_term (eval_token et, eval_t *v1)
{
  eval_token et2 = et;
  eval_error er;

  if (et == PLUS || et == MINUS)
    {
      et2 = eval_lex (v1);
      if (et2 == ERROR)
	return UNKNOWN_INPUT;

      if ((er = simple_term (et2, v1)) != NO_ERROR)
	return er;

      if (et == MINUS)
	*v1 = -*v1;
    }
  else
    if ((er = simple_term (et, v1)) != NO_ERROR)
      return er;

  return NO_ERROR;
}

static eval_error
simple_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  switch (et)
    {
    case LEFTP:
      et = eval_lex (v1);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if ((er = logical_or_term (et, v1)) != NO_ERROR)
	return er;

      et = eval_lex (&v2);
      if (et == ERROR)
	return UNKNOWN_INPUT;

      if (et != RIGHTP)
	return MISSING_RIGHT;

      break;

    case NUMBER:
      break;

    default:
      return SYNTAX_ERROR;
    }

  return NO_ERROR;
}

/*
compiler used by builtin macro 'eval' of Parrot m4

$ make -C examples/compilers/

*/


/*
 * loadlib calls the load and init hooks
 * we use init to register the compiler
 */

void
Parrot_lib_m4_eval_compiler_init(Parrot_Interp interp, PMC* lib)
{
    Parrot_compreg(interp, const_string(interp, "m4_eval_compiler"), m4_eval_compiler);
}


static int
unescape(char *string)
{
    char *start, *p;

    for (start = p = string ; *string; string++) {
        if (*string == '\\' && string[1]) {
            switch (*++string) {
                case 'n':
                    *p++ = '\n';
                    break;
                default:
                    *p++ = *string;
                    break;
            }
        }
        else
            *p++ = *string;
    }
    *p = 0;
    return p - start;
}


/*
 * simple compiler - no error checking
 */
PMC *
m4_eval_compiler( Parrot_Interp interp, const char *program )
{
    eval_t value;  /* will be returned to caller */

    struct PackFile_ByteCode *cur_cs, *old_cs;
    opcode_t* pc;
    PMC *sub;
    parrot_sub_t sub_data;


    /*
     * The real work is done here
     */
    evaluate( program, &value );

    /*
     * need a packfile segment
     */
    cur_cs = (struct PackFile_ByteCode*)PackFile_Segment_new_seg(interp,&interp->code->base.dir, PF_BYTEC_SEG, "m4_eval_bc", 1);
    old_cs = Parrot_switch_to_cs(interp, cur_cs, 0);
    /*
     * alloc byte code mem
     */
    cur_cs->base.data = mem_sys_allocate(CODE_SIZE * sizeof(opcode_t));
    cur_cs->base.size = CODE_SIZE;

    /*
     * Generate some bytecode
     */
    pc = cur_cs->base.data;
    /* set the single integer return value */
    *pc++ = interp->op_lib->op_code("set_i_ic", 1);
    *pc++ = 5;
    *pc++ = value;
    /* promise to fill in the counters */
    *pc++ = interp->op_lib->op_code("set_i_ic", 1);
    *pc++ = 0;
    *pc++ = 1;
    /* one integer return value */
    *pc++ = interp->op_lib->op_code("set_i_ic", 1);
    *pc++ = 1;
    *pc++ = 1;
    /* no string return values */
    *pc++ = interp->op_lib->op_code("set_i_ic", 1);
    *pc++ = 2;
    *pc++ = 0;
    /* no PMC return values */
    *pc++ = interp->op_lib->op_code("set_i_ic", 1);
    *pc++ = 3;
    *pc++ = 0;
    /* no numeric return values */
    *pc++ = interp->op_lib->op_code("set_i_ic", 1);
    *pc++ = 4;
    *pc++ = 0;
    /* invoke the return continuation */
    *pc++ = interp->op_lib->op_code("returncc", 1);

    if (old_cs) {
        /* restore old byte_code, */
        (void)Parrot_switch_to_cs(interp, old_cs, 0);
    }
    /*
     * create sub PMC
     */
    sub = pmc_new(interp, enum_class_Eval);
    sub_data = PMC_sub(sub);
    sub_data->seg = cur_cs;
    sub_data->address = cur_cs->base.data;
    sub_data->end = cur_cs->base.data + cur_cs->base.size;
    sub_data->name = string_from_cstring(interp, "m4 eval", 0);

    return sub;
}
