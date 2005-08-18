.include "runtime/parrot/library/dumper.imc"

.namespace [ "_Tcl" ]

=head1 _Tcl::__expression_parse

Given a string (or String), return a single stack that contains the work to be
done. This stack can then be passed to C<__expression_interpret> to actually
invoke the items on the stack.

Uses the standard two arg return - if C<TCL_ERROR> is returned, then 
we return our error information back up the chain. If we return C<TCL_OK>,
however, then we're returning the invokable PMC.

=cut

.const int MAX_PRECEDENCE =  9

.sub __expression_parse
  .param string expr
  
  .local pmc retval
  .local int return_type
  return_type = TCL_OK
  
  .local pmc chunk        # the current chunk we're working on
  .local pmc ops          # Global list of available ops.
  ops = find_global "_Tcl", "operators"
  .local pmc precedences  # Global list of operator precedence
  precedences = find_global "_Tcl", "precedence"

  .local pmc undef
  undef = new Undef

  .local pmc chunks
  chunks = new TclList
  .local pmc program_stack
  program_stack = new TclList

  .local int chunk_start
  chunk_start = -1 # we inc before we use it

  .local int char
  .local int expr_length
  expr_length = length expr
  .local int op_length

chunk_loop:
  inc chunk_start
  if chunk_start >= expr_length goto chunks_done
  
  $I0 = is_whitespace expr, chunk_start
  if $I0 == 1 goto chunk_loop
  
  $I0 = is_digit expr, chunk_start
  if $I0 == 1 goto get_number
  
  $I0 = ord expr, chunk_start
  if $I0 == 91 goto subcommand        # [
  if $I0 == 40 goto get_parenthetical # (
  if $I0 == 36 goto get_variable      # $
  if $I0 == 46 goto get_number        # .
  
  $I0 = is_wordchar expr, chunk_start
  if $I0 == 1 goto get_function
  
  goto get_operator

get_parenthetical:
  .local int depth
  depth = 1
  $I1   = chunk_start
get_paren_loop:
  inc $I1
  if $I1 >= expr_length goto premature_end
  $I0 = ord expr, $I1
  if $I0 == 41 goto get_paren_loop_right
  if $I0 == 40 goto get_paren_loop_left
  if $I0 == 92 goto get_paren_loop_backslash
  goto get_paren_loop
get_paren_loop_right:
  dec depth
  if depth == 0 goto get_paren_done
  goto get_paren_loop
get_paren_loop_left:
  inc depth
  goto get_paren_loop
get_paren_loop_backslash:
  inc $I1
  goto get_paren_loop

get_paren_done:
  $I0 = $I1 - chunk_start
  dec $I0
  inc chunk_start
  $S1 = substr expr, chunk_start, $I0
  
  # XXX this is now officially braindead. Fissit.
  (return_type,retval) = __expression_parse($S1)
  if return_type == TCL_ERROR goto die_horribly
  (return_type,retval) = __expression_interpret(retval)
  if return_type == TCL_ERROR goto die_horribly

  chunk = new TclList
  chunk[0] = OPERAND
  chunk[1] = retval

  push chunks, chunk
  chunk_start += $I0
  goto chunk_loop
 
get_variable:
  (retval, chunk_start) = parse_variable(expr, chunk_start)
  
  chunk = new TclList
  chunk[0] = OPERAND
  chunk[1] = retval
  push chunks, chunk
  dec chunk_start
  goto chunk_loop

subcommand:
  (retval, chunk_start) = get_subcommand(expr, chunk_start)

  chunk = new TclList
  chunk[0] = OPERAND
  chunk[1] = retval
  push chunks, chunk
  dec chunk_start
  goto chunk_loop

get_function:
  # Does the string of characters here match one of our pre-defined
  # functions? If so, put that function on the stack.
  .local pmc func
  .local pmc result

  (op_length,func,result) = __expr_get_function(expr,chunk_start)
  if op_length == 0 goto get_operator
  chunk = new TclList
  chunk[0] = FUNC
  chunk[1] = func
  chunk[2] = -1 # functions trump operands, for now.
  push chunks, chunk
  push chunks, result
  chunk_start += op_length
  dec chunk_start
  goto chunk_loop

get_number:
  # If we got here, then char and chunk_start are already set properly
  .local pmc value
  (op_length,value) = __expr_get_number(expr,chunk_start)
  if op_length == 0 goto get_operator
  # XXX otherwise, pull that number off
  # stuff the chunk onto the chunk_list
  chunk = new TclList
  chunk[0] = OPERAND
  chunk[1] = value
  push chunks, chunk
  chunk_start += op_length
  dec chunk_start
  goto chunk_loop
 
get_operator:
  # If we got here, then char and chunk_start are already set properly
  .local int op_len
  .local int expr_len
  .local string test_op

  expr_len = length expr 

  # cheat - right now there are only 2 and 1 character ops
  # 2 char trump one char.

  $I0 = chunk_start + 1
  if $I0 == expr_len goto one_char

two_char:
  op_len = 2
  test_op = substr expr, chunk_start, op_len
  $P11 = ops[test_op]
  if_null $P11, one_char
  $I1 = typeof $P11
  if $I1 == .Undef goto one_char
  goto op_done
  # Does this op exist?

one_char:
  op_len = 1
  test_op = substr expr, chunk_start, op_len
  $P11 = ops[test_op]
  if_null $P11, op_fail
  $I1 = typeof $P11
  if $I1 == .Undef goto op_fail
  goto op_done

op_fail:
  op_len = 0

op_done:
  $I5 = precedences[test_op]
  # If we didn't find an operator here, then... die. we
  # can handle this more gracefully later, I suppose. 
  if op_len == 0 goto die_horribly

  $I6 = ops[test_op]

  chunk = new TclList
  chunk[0] = OP
  chunk[1] = $I6 # op lookup
  chunk[2] = $I5 # precedence

  push chunks, chunk

  chunk_start += op_len
  dec chunk_start
  goto chunk_loop

  # if we don't match any of the possible cases so far, then we must
  # be a string operand, but for now, die. #XXX

chunks_done:
# convert the chunks into a stack.
 
  # to do this, we scan for our Operators in precedence order.
  # as we find each one, put it on the program_stack with the appropriate
  # args. Leave a "NOOP" placeholder when pulling things. If our target
  # arg is a noop, we can either put it on the stack and ignore it when
  # popping the stack, or not put it on the stack.

  # XXX cheat for now , assume no precedence. means we can just
  # walk through, grabbing ops. (hope nothing is orphaned?)
 
  .local int stack_index 
  .local int input_len

  stack_index = 0

 # we're looping over this once - to handle precedence, I suggest
 # looping multiple times, leaving the NOOPS when we remove something
 # to faciliate processing on further runs. If we try to pull a 
 # left or right arg and see a NO-OP, we know it's safe to skip because
 # walking the stack will convert it to a number by the time we get to it.

  .local pmc our_op 
  input_len  = chunks
  if input_len == 0 goto die_horribly

  # a single value, return now.
  if input_len != 1 goto pre_converter_loop
  # XXX (That's value, not an operator)
  .return(TCL_OK,chunks)

pre_converter_loop:
  .local int precedence_level
  precedence_level = -1 # start with functions
converter_loop:
  if precedence_level > MAX_PRECEDENCE goto converter_done
  if stack_index >= input_len goto precedence_done
  our_op = chunks[stack_index]
  if_null our_op, converter_next
  $I0 = typeof our_op
  if $I0 == .Undef goto converter_next
  $I2 = our_op[0]
  if $I2 == OPERAND goto converter_next
  if $I2 == CHUNK   goto converter_next
  if $I2 == OP   goto is_opfunc
  if $I2 == FUNC goto is_opfunc # XXX should eventually go away as we make functions part of "CHUNK", above.

  # Should never be reached (XXX then shouldn't we die horribly?)
  goto converter_next 

is_opfunc:
  #print "is_opfunc\n"
  $I3 = our_op[2] 
  if $I3 != precedence_level goto converter_next

right_arg:
  $I2 = stack_index + 1
  if $I2 >= input_len goto left_arg
  retval = chunks[$I2]
  if_null retval, left_arg
  chunks[$I2] = undef
  inc $I4
  program_stack = unshift retval
  
  # If we're a function, (XXX) assume a single arg (which
  # we've now pulled - so, go to the, skip the left arg.
  if precedence_level == -1 goto shift_op

  # XXX we just deal with binary args at the moment.
left_arg:
  $I2 = stack_index - 1
  if $I2 < 0 goto shift_op
  retval = chunks[$I2]
  if_null retval, shift_op
  chunks[$I2] = undef
  inc $I4
  program_stack = unshift retval

shift_op:
  program_stack = unshift our_op
  chunks[stack_index] = undef

converter_next:
  inc stack_index
  goto converter_loop

precedence_done:
  inc precedence_level
  stack_index = 0
  goto converter_loop

die_horribly:
  return_type = TCL_ERROR 
  program_stack = new String
  program_stack = "An error occurred in EXPR"
  goto converter_done

premature_end:
  return_type = TCL_ERROR
  program_stack = new String
  program_stack = "syntax error in expression \""
  program_stack .= expr
  program_stack .= "\": premature end of expression"

converter_done:
  .return(return_type,program_stack)

.end

.sub __expression_interpret
  .param pmc args
  
   # is this dup neeeded?
  .local pmc program_stack
   program_stack = args
  .local pmc result_stack
  result_stack = new TclList
  .local pmc retval
  .local int return_type
  
stack_evaluator:
 # while the prog stack exists:
 .local int size
 size = program_stack
 if size == 0 goto stack_done
 
 .local int type
 .local pmc chunk
 chunk = pop program_stack
 $I10 = typeof chunk
 if $I10 == .Undef goto stack_evaluator
 type = chunk[0]

 # move all non op non funcs to the value stack
 if type == OP goto do_op
 if type == FUNC goto do_op
 $P0 = chunk[1]
 $P0 = $P0."interpret"()
 chunk[1] = $P0
 push result_stack, chunk
 goto stack_evaluator

do_op:
  # right now, we assume binary ops. Later, each op will define the
  # number of and type of ops it takes, and we will respect it.

  .local int func
  func = chunk[1]

  # XXX assume all operands take two args.
  .local pmc r_arg
  .local pmc l_arg
  .local pmc op_result
  op_result = new TclInt
  l_arg = pop result_stack
  l_arg = l_arg[1]

  if func >= FUNCTION_ABS goto func_list
  r_arg = pop result_stack
  r_arg = r_arg[1]

  # Is there a more efficient way to do this dispatch?
  if func == OPERATOR_MUL goto op_mul
  if func == OPERATOR_DIV goto op_div
  if func == OPERATOR_MOD goto op_mod
  if func == OPERATOR_PLUS goto op_plus
  if func == OPERATOR_MINUS goto op_minus
  if func == OPERATOR_SHL goto op_shl
  if func == OPERATOR_SHR goto op_shr
  if func == OPERATOR_LT goto op_lt
  if func == OPERATOR_GT goto op_gt
  if func == OPERATOR_LTE goto op_lte
  if func == OPERATOR_GTE goto op_gte
  if func == OPERATOR_EQUAL goto op_equal
  if func == OPERATOR_UNEQUAL goto op_unequal
  if func == OPERATOR_BITAND goto op_bitand
  if func == OPERATOR_BITXOR goto op_bitxor
  if func == OPERATOR_BITOR goto op_bitor
  if func == OPERATOR_NE goto op_ne
  if func == OPERATOR_EQ goto op_eq
func_list: 
  if func == FUNCTION_ABS goto func_abs
  if func == FUNCTION_ACOS goto func_acos
  if func == FUNCTION_ASIN goto func_asin
  if func == FUNCTION_ATAN goto func_atan
  if func == FUNCTION_COS goto func_cos
  if func == FUNCTION_COSH goto func_cosh
  if func == FUNCTION_EXP goto func_exp
  if func == FUNCTION_LOG goto func_log
  if func == FUNCTION_LOG10 goto func_log10
  if func == FUNCTION_SIN goto func_sin
  if func == FUNCTION_SINH goto func_sinh
  if func == FUNCTION_SQRT goto func_sqrt
  if func == FUNCTION_TAN goto func_tan
  if func == FUNCTION_TANH goto func_tanh

  #error_S = "invalid function lookup returned"
  goto die_horribly

op_mul:
  op_result = mul l_arg, r_arg
  goto done_op 
op_div:
  op_result = div l_arg, r_arg
  goto done_op 
op_mod:
  op_result = mod l_arg, r_arg
  goto done_op 
op_plus:
  op_result = l_arg + r_arg
  goto done_op 
op_minus:
  op_result = l_arg - r_arg
  goto done_op 
op_shl:
  op_result = shl l_arg, r_arg
  goto done_op 
op_shr:
  op_result = shr l_arg, r_arg
  goto done_op 
op_lt:
  op_result = 1
  if l_arg < r_arg goto done_op
  op_result = 0
  goto done_op 
op_gt:
  op_result = 1
  if l_arg > r_arg goto done_op
  op_result = 0
  goto done_op 
op_lte:
  op_result = 1
  if l_arg <= r_arg goto done_op
  op_result = 0
  goto done_op 
op_gte:
  op_result = 1
  if l_arg >= r_arg goto done_op
  op_result = 0
  goto done_op 
op_equal:
  op_result = 1
  if l_arg == r_arg goto done_op
  op_result = 0
  goto done_op 
op_unequal:
  op_result = 1
  if l_arg != r_arg goto done_op
  op_result = 0
  goto done_op 
op_bitand:
  op_result = band l_arg, r_arg
  goto done_op 
op_bitxor:
  op_result = bxor l_arg, r_arg
  goto done_op 
op_bitor:
  op_result = bor l_arg, r_arg
  goto done_op
op_ne:
  op_result = 1
  $S0 = l_arg
  $S1 = r_arg
  if $S0 != $S1 goto done_op
  op_result = 0
  goto done_op
op_eq:
  op_result = 1
  $S0 = l_arg
  $S1 = r_arg
  if $S0 == $S1 goto done_op
  op_result = 0
  goto done_op
func_abs:
  # XXX This isn't int only, izzit?
  $I0 = l_arg
  $I1 = abs $I0
  op_result = $I1
  goto done_op
func_acos:
  $N0 = l_arg
  $N1 = acos $N0
  op_result = $N1
  goto done_op
func_asin:
  $N0 = l_arg
  $N1 = asin $N0
  op_result = $N1
  goto done_op
func_atan:
  $N0 = l_arg
  $N1 = atan $N0
  op_result = $N1
  goto done_op
func_cos:
  $N0 = l_arg
  $N1 = cos $N0
  op_result = $N1
  goto done_op
func_cosh:
  $N0 = l_arg
  $N1 = cosh $N0
  op_result = $N1
  goto done_op
func_exp:
  $N0 = l_arg
  $N1 = exp $N0
  op_result = $N1
  goto done_op
func_log:
  $N0 = l_arg
  $N1 = ln $N0
  op_result = $N1
  goto done_op
func_log10:
  $N0 = l_arg
  $N1 = log10 $N0
  op_result = $N1
  goto done_op
func_sin:
  $N0 = l_arg
  $N1 = sin $N0
  op_result = $N1
  goto done_op
func_sinh:
  $N0 = l_arg
  $N1 = sinh $N0
  op_result = $N1
  goto done_op
func_sqrt:
  $N0 = l_arg
  $N1 = sqrt $N0
  op_result = $N1
  goto done_op
func_tan:
  $N0 = l_arg
  $N1 = tan $N0
  op_result = $N1
  goto done_op
func_tanh:
  $N0 = l_arg
  $N1 = tanh $N0
  op_result = $N1
  # fallthrough to done_op

done_op:
  $P5 = new FixedPMCArray
  $P5 = 2
  $P5[0] = OPERAND
  $P5[1] = op_result
  push result_stack, $P5

  # Ignoring exceptions for now.
  goto stack_evaluator

stack_done:
  $I0 = result_stack
  if $I0 == 0 goto die_horribly
  retval = pop result_stack
  goto evaluation_done

die_horribly:
  return_type = TCL_ERROR 
  retval = new String
  retval = "An error occurred in EXPR"
  goto evaluation_return

evaluation_done:
  return_type = TCL_OK 
  retval = retval[1]

evaluation_return:
  .return(return_type,retval)
.end

# given a string, starting at position, return the length
# of the number starting at that position. return '0' if 
# no number was found.

.sub __expr_get_number
  .param string expr
  .param int pos

  .local int len
  len = length expr
  .local int char, start
  .local pmc value
  null value

  start = pos
  if pos >= len goto failure

integer:
  if pos >= len goto integer_done
  char = ord expr, pos
  if char > 57 goto integer_done # > "9"
  if char < 48 goto integer_done # < "0"
  inc pos
  goto integer 
integer_done:
  if char == 46 goto floating
  pos -= start
  if pos == 0 goto done # failure
  
  $S0 = substr expr, start, pos
  $I0 = $S0
  value = new TclInt
  value = $I0
  goto done

floating:
  inc pos
float_loop:
  if pos >= len goto float_done
  char = ord expr, pos
  if char > 57 goto float_done # > "9"
  if char < 48 goto float_done # < "0"
  inc pos
  goto float_loop
float_done:
  pos -= start
  
  $S0 = substr expr, start, pos
  $N0 = $S0
  value = new TclFloat
  value = $N0
  # goto done

done:
  .return(pos,value)
.end

.sub __expr_get_function
  .param string expr
  .param int start

  .local int len 
  .local pmc func,operand

  .local int start_paren_pos
  .local int expr_length
  expr_length = length expr

  # if we are starting with the text of a defined function,
  # and it's followed by a (), 
 
  index start_paren_pos, expr, "(", start
  if start_paren_pos == -1 goto fail

  .local int depth
  depth = 1
  $I0 = start_paren_pos
loop:
  inc $I0
  if $I0 >= expr_length goto fail
  $I1 = ord expr, $I0
  if $I1 == 40 goto left
  if $I1 == 41 goto right
  if $I1 == 92 goto backslash
  goto loop
left:
  inc depth
  goto loop
right:
  dec depth
  if depth == 0 goto loop_done
  goto loop
backslash:
  inc $I0
  goto loop

loop_done:
  $I1 = $I0 - start_paren_pos
  dec $I1
 
  # so, we know that the function name must be before the first (
  .local int len
  len = start_paren_pos - start

  $S0 = substr expr, start, len
  $P1 = find_global "_Tcl", "functions"
  
  func = $P1[$S0]
  if_null func, fail 
  $I0 = typeof func
  if $I0 == .Undef goto fail

  # and the operand is what's between the ()'s - get the result
  # of /that/ expression and return it.
  # XXX - If there are commas in the op, then split the operand
  #   and parse each one as an operand. needed for:
  #   atan2,pow,fmod,hypot

  inc start_paren_pos
  .local int len_operand
  len_operand = $I1

  $S1 = substr expr, start_paren_pos, len_operand
  # XXX should be checking return value here.
  ($I9,operand) = __expression_parse($S1)  
  ($I9,operand) = __expression_interpret(operand)  
  $P10 = new FixedPMCArray
  $P10 = 2
  $P10[0] = OPERAND
  $P10[1] = operand
  operand = $P10
  if $I9 == TCL_ERROR goto fail

  len =  start_paren_pos + len_operand
  inc len
  len = len - start
  goto done

fail:
  len = 0

done:
  .return(len,func,operand)
.end

=head2 _Tcl::__get_call_level

Given a pmc containing the tcl-style call level, return an int-like pmc
indicating the parrot-style level, and an integer with a boolean 0/1 -
was this a valid tcl-style level, or did we get this value as a default?

=cut

.sub __get_call_level
  .param pmc tcl_level
  .local pmc parrot_level, defaulted, orig_level
  defaulted = new Integer
  defaulted = 0

  .local pmc current_call_level
  current_call_level = find_global "_Tcl", "call_level"
  orig_level = current_call_level
 
  .local int num_length

get_absolute:
  # Is this an absolute? 
  $S0 = tcl_level
  $S1 = substr $S0, 0, 1
  if $S1 != "#" goto get_integer
  $S0 = tcl_level
  (num_length,parrot_level) = __expr_get_number($S0,1)
  $I0 = isa parrot_level, "Integer"
  if $I0 == 0 goto default
  $S0 = tcl_level
  $I0 = length $S0

  dec $I0
  if $I0 != num_length goto default
  goto bounds_check
 
get_integer:
  # Is this an integer? 
  $S0 = tcl_level
  (num_length,parrot_level) = __expr_get_number($S0,0)
  $I0 = isa parrot_level, "Integer"
  if $I0 == 0 goto default
  $S0 = tcl_level
  $I0 = length $S0
  if $I0 != num_length goto default
  parrot_level = orig_level - parrot_level
  goto bounds_check
 
default:
  defaulted = 1
  parrot_level = orig_level - 1
  # fallthrough.

bounds_check:
  # Are we < 0 ? 
  if parrot_level >= 0 goto bounds_pos
  parrot_level = 0
  goto done

bounds_pos:
  # Are we > the current max level?
  if parrot_level <= orig_level goto done
  parrot_level = orig_level

done: 
  $I1 = defaulted 
  .return(parrot_level,$I1)
.end 
