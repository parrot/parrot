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

/* boolean might be defined in other header files */
typedef int boolean_for_m4;
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
    M4_ERROR,
    M4_PLUS, M4_MINUS,
    M4_EXPONENT,
    M4_TIMES, M4_DIVIDE, M4_MODULO,
    M4_EQ, M4_NOTEQ, M4_GT, M4_GTEQ, M4_LS, M4_LSEQ,
    M4_LSHIFT, M4_RSHIFT,
    M4_LNOT, M4_LAND, M4_LOR,
    M4_NOT, M4_AND, M4_OR, M4_XOR,
    M4_LEFTP, M4_RIGHTP,
    M4_NUMBER, M4_EOTEXT
  }
eval_token;

/* Error types.  */

typedef enum eval_error
  {
    M4_NO_ERROR,
    M4_MISSING_RIGHT,
    M4_SYNTAX_ERROR,
    M4_UNKNOWN_INPUT,
    M4_EXCESS_INPUT,
    M4_DIVIDE_ZERO,
    M4_MODULO_ZERO
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
boolean_for_m4             evaluate (const char *, eval_t *);
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

  if (*eval_text == '\0') return M4_EOTEXT;

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
		return M4_ERROR;
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
      return M4_NUMBER;
    }

  switch (*eval_text++)
    {
    case '+':
      return M4_PLUS;
    case '-':
      return M4_MINUS;
    case '*':
      if (*eval_text == '*')
	{
	  eval_text++;
	  return M4_EXPONENT;
	}
      else
	return M4_TIMES;
    case '/':
      return M4_DIVIDE;
    case '%':
      return M4_MODULO;
    case '=':
      if (*eval_text == '=')
	eval_text++;
      return M4_EQ;
    case '!':
      if (*eval_text == '=')
	{
	  eval_text++;
	  return M4_NOTEQ;
	}
      else
	return M4_LNOT;
    case '>':
      if (*eval_text == '=')
	{
	  eval_text++;
	  return M4_GTEQ;
	}
      else if (*eval_text == '>')
	{
	  eval_text++;
	  return M4_RSHIFT;
	}
      else
	return M4_GT;
    case '<':
      if (*eval_text == '=')
	{
	  eval_text++;
	  return M4_LSEQ;
	}
      else if (*eval_text == '<')
	{
	  eval_text++;
	  return M4_LSHIFT;
	}
      else
	return M4_LS;
    case '^':
      return M4_XOR;
    case '~':
      return M4_NOT;
    case '&':
      if (*eval_text == '&')
	{
	  eval_text++;
	  return M4_LAND;
	}
      else
	return M4_AND;
    case '|':
      if (*eval_text == '|')
	{
	  eval_text++;
	  return M4_LOR;
	}
      else
	return M4_OR;
    case '(':
      return M4_LEFTP;
    case ')':
      return M4_RIGHTP;
    default:
      return M4_ERROR;
    }
}

/*---------------------------------------.
| Main entry point, called from "eval".	 |
`---------------------------------------*/

boolean_for_m4
evaluate (const char *expr, eval_t *val)
{
    eval_token et;
    eval_error err;

    eval_init_lex (expr);
    et = eval_lex (val);
    err = logical_or_term( et, val );

  if (err == M4_NO_ERROR && *eval_text != '\0')
    err = M4_EXCESS_INPUT;

  switch (err)
    {
    case M4_NO_ERROR:
      break;

    case M4_MISSING_RIGHT:
      fprintf( stderr, "Bad expression in eval (missing right parenthesis): %s",
		expr);
      break;

    case M4_SYNTAX_ERROR:
      fprintf( stderr, "Bad expression in eval: %s", expr);
      break;

    case M4_UNKNOWN_INPUT:
      fprintf( stderr, "Bad expression in eval (bad input): %s", expr);
      break;

    case M4_EXCESS_INPUT:
      fprintf( stderr, "Bad expression in eval (excess input): %s", expr);
      break;

    case M4_DIVIDE_ZERO:
      fprintf( stderr, "Divide by zero in eval: %s", expr);
      break;

    case M4_MODULO_ZERO:
      fprintf( stderr, "Modulo by zero in eval: %s", expr);
      break;

    default:
      fprintf( stderr, "INTERNAL ERROR: Bad error code in evaluate ()");
      abort ();
    }

  return (boolean_for_m4) (err != M4_NO_ERROR);
}

/*---------------------------.
| Recursive descent parser.  |
`---------------------------*/

static eval_error
logical_or_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = logical_and_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == M4_LOR)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = logical_and_term (et, &v2)) != M4_NO_ERROR)
	return er;

      *v1 = *v1 || v2;
    }
  if (et == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
logical_and_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = or_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == M4_LAND)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = or_term (et, &v2)) != M4_NO_ERROR)
	return er;

      *v1 = *v1 && v2;
    }
  if (et == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
or_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = xor_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == M4_OR)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = xor_term (et, &v2)) != M4_NO_ERROR)
	return er;

      *v1 = *v1 | v2;
    }
  if (et == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
xor_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = and_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == M4_XOR)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = and_term (et, &v2)) != M4_NO_ERROR)
	return er;

      *v1 = *v1 ^ v2;
    }
  if (et == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
and_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  if ((er = not_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((et = eval_lex (&v2)) == M4_AND)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = not_term (et, &v2)) != M4_NO_ERROR)
	return er;

      *v1 = *v1 & v2;
    }
  if (et == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
not_term (eval_token et, eval_t *v1)
{
  eval_error er;

  if (et == M4_NOT)
    {
      et = eval_lex (v1);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = not_term (et, v1)) != M4_NO_ERROR)
	return er;
      *v1 = ~*v1;
    }
  else
    if ((er = logical_not_term (et, v1)) != M4_NO_ERROR)
      return er;

  return M4_NO_ERROR;
}

static eval_error
logical_not_term (eval_token et, eval_t *v1)
{
  eval_error er;

  if (et == M4_LNOT)
    {
      et = eval_lex (v1);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = logical_not_term (et, v1)) != M4_NO_ERROR)
	return er;
      *v1 = !*v1;
    }
  else
    if ((er = cmp_term (et, v1)) != M4_NO_ERROR)
      return er;

  return M4_NO_ERROR;
}

static eval_error
cmp_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = shift_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == M4_EQ || op == M4_NOTEQ
	 || op == M4_GT || op == M4_GTEQ
	 || op == M4_LS || op == M4_LSEQ)
    {

      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = shift_term (et, &v2)) != M4_NO_ERROR)
	return er;

      switch (op)
	{
	case M4_EQ:
	  *v1 = *v1 == v2;
	  break;

	case M4_NOTEQ:
	  *v1 = *v1 != v2;
	  break;

	case M4_GT:
	  *v1 = *v1 > v2;
	  break;

	case M4_GTEQ:
	  *v1 = *v1 >= v2;
	  break;

	case M4_LS:
	  *v1 = *v1 < v2;
	  break;

	case M4_LSEQ:
	  *v1 = *v1 <= v2;
	  break;

	default:
	  fprintf( stderr, "INTERNAL ERROR: Bad comparison operator in cmp_term ()");
	  abort ();
	}
    }
  if (op == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
shift_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = add_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == M4_LSHIFT || op == M4_RSHIFT)
    {

      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = add_term (et, &v2)) != M4_NO_ERROR)
	return er;

      switch (op)
	{
	case M4_LSHIFT:
	  *v1 = *v1 << v2;
	  break;

	case M4_RSHIFT:
	  *v1 = *v1 >> v2;
	  break;

	default:
	  fprintf( stderr, "INTERNAL ERROR: Bad shift operator in shift_term ()");
	  abort ();
	}
    }
  if (op == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
add_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = mult_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == M4_PLUS || op == M4_MINUS)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = mult_term (et, &v2)) != M4_NO_ERROR)
	return er;

      if (op == M4_PLUS)
	*v1 = *v1 + v2;
      else
	*v1 = *v1 - v2;
    }
  if (op == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
mult_term (eval_token et, eval_t *v1)
{
  eval_token op;
  eval_t v2;
  eval_error er;

  if ((er = exp_term (et, v1)) != M4_NO_ERROR)
    return er;

  while ((op = eval_lex (&v2)) == M4_TIMES || op == M4_DIVIDE || op == M4_MODULO)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = exp_term (et, &v2)) != M4_NO_ERROR)
	return er;

      switch (op)
	{
	case M4_TIMES:
	  *v1 = *v1 * v2;
	  break;

	case M4_DIVIDE:
	  if (v2 == 0)
	    return M4_DIVIDE_ZERO;
	  else
	    *v1 = *v1 / v2;
	  break;

	case M4_MODULO:
	  if (v2 == 0)
	    return M4_MODULO_ZERO;
	  else
	    *v1 = *v1 % v2;
	  break;

	default:
	  fprintf( stderr, "INTERNAL ERROR: Bad operator in mult_term ()");
	  abort ();
	}
    }
  if (op == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
exp_term (eval_token et, eval_t *v1)
{
  register eval_t result;
  eval_t v2;
  eval_error er;

  if ((er = unary_term (et, v1)) != M4_NO_ERROR)
    return er;
  result = *v1;

  while ((et = eval_lex (&v2)) == M4_EXPONENT)
    {
      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = exp_term (et, &v2)) != M4_NO_ERROR)
	return er;

      result = 1;
      while (v2-- > 0)
	result *= *v1;
      *v1 = result;
    }
  if (et == M4_ERROR)
    return M4_UNKNOWN_INPUT;

  eval_undo ();
  return M4_NO_ERROR;
}

static eval_error
unary_term (eval_token et, eval_t *v1)
{
  eval_token et2 = et;
  eval_error er;

  if (et == M4_PLUS || et == M4_MINUS)
    {
      et2 = eval_lex (v1);
      if (et2 == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = simple_term (et2, v1)) != M4_NO_ERROR)
	return er;

      if (et == M4_MINUS)
	*v1 = -*v1;
    }
  else
    if ((er = simple_term (et, v1)) != M4_NO_ERROR)
      return er;

  return M4_NO_ERROR;
}

static eval_error
simple_term (eval_token et, eval_t *v1)
{
  eval_t v2;
  eval_error er;

  switch (et)
    {
    case M4_LEFTP:
      et = eval_lex (v1);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if ((er = logical_or_term (et, v1)) != M4_NO_ERROR)
	return er;

      et = eval_lex (&v2);
      if (et == M4_ERROR)
	return M4_UNKNOWN_INPUT;

      if (et != M4_RIGHTP)
	return M4_MISSING_RIGHT;

      break;

    case M4_NUMBER:
      break;

    default:
      return M4_SYNTAX_ERROR;
    }

  return M4_NO_ERROR;
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
    cur_cs = (struct PackFile_ByteCode*)PackFile_Segment_new_seg(interp, interp->code->base.dir, PF_BYTEC_SEG, "m4_eval_bc", 1);
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
