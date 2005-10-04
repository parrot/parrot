.namespace [ "_Tcl" ]

.const int MAX_PRECEDENCE =  11

=head1 _Tcl::__expression_parse

Given a string, return an invokable PMC that will generate the appropriate
value described by this Tcl expression. An intermediate AST is generated,
and the functions ends with a tailcall to the compiler.

=cut

.sub __expression_parse
  .param string expr
  $P1 = __expression_ast(expr) 
  .return __expression_compile($P1)
.end

.sub __expression_ast
  .param string expr
  .local pmc retval

  .local pmc undef
  undef = new Undef

  .local pmc chunk, chunks, program_stack
  chunks = new TclList
  program_stack = new TclList

  .local int pos
  pos = 0

operand:
  (retval, pos) = get_operand(expr, pos)
  if_null retval, no_operand

  chunk = new TclList
  chunk[0] = OPERAND
  chunk[1] = retval
  push chunks, chunk
  goto operator

no_operand:
  $S0 = "syntax error in expression \""
  $S0 .= expr
  $S0 .= "\": premature end of expression"
  .throw ($S0)

operator:
  (chunk, pos) = get_operator(expr, pos)
  if_null chunk, chunks_done
  push chunks, chunk
  goto operand

chunks_done:

=for comment

Convert the chunks into a stack. For each level of precendence, 
scan the chunk list for operators that match our level. As we find one, 
grab the left and right operands. If the operand is null, instead use
the value from the same location in the program stack as the operand (as it
is the result of a previous operator.). If a value is pulled from the
program_stack, then null it there.

Now that we have an operand and two operators (unary ops are treated like
operands during the parse phase. Ternary op is currently ignored, but we'd
special case it here.), create a TclBinaryOp, and put it in the same
index in the program stack as the left op here. Replace all three entries
in the chunk list with a single NULL entry.

When our list of chunks to process is a single NULL entry, we're done,
and now have a program list containing a single element, which is something
which supports C<compile>. (In most cases, a TclBinaryOp)

=cut

  .local int stack_index
  stack_index = 0

  .local int input_len
  input_len = chunks
  if input_len == 1 goto singleton_chunk

  .local int precedence_level
  precedence_level = 1
  .local pmc operand1, operand2, our_op

converter_loop:
  input_len = chunks

  if precedence_level > MAX_PRECEDENCE goto converter_done
  if input_len == 1 goto converter_done # only one item left. should be null
  if stack_index >= input_len goto precedence_done 

  our_op = chunks[stack_index]
  unless our_op, converter_next  # skip placeholders
  $I0 = defined our_op
  unless $I0, converter_next      # skip placeholders (redundant?)
  $I2 = our_op[0]
  if $I2 == OPERAND goto converter_next

# an_operator
  $I3 = our_op[2]
  if $I3 != precedence_level goto converter_next 

# right precedence level.

right_arg:
  $I2 = stack_index + 1
  ### XXX Should never occur? if $I2 >= input_len goto left_arg  
  $P1 = chunks[$I2]
  unless $P1, right_arg_precalc
  operand2 = $P1[1]
  goto left_arg

right_arg_precalc:
  operand2 = program_stack[$I2]
  program_stack[$I2] = $P1 

left_arg:
  $I2 = stack_index - 1
  ### XXX Should never occur? if $I2 < 0 goto shift_op
  $P1 = chunks[$I2]
  unless $P1, left_arg_precalc
  operand1 = $P1[1]
  goto shift_op

left_arg_precalc:
  operand1 = program_stack[$I2]
  program_stack[$I2] = $P1 

shift_op:
  .local pmc type
  type = our_op[1]
  $I0 = find_type "TclBinaryOp" # XXX should cache this?
  .local pmc binary_op
  binary_op = new $I0

 
  setattribute binary_op, "TclBinaryOp\x00type", type
  setattribute binary_op, "TclBinaryOp\x00l_operand", operand1
  setattribute binary_op, "TclBinaryOp\x00r_operand", operand2

  program_stack[$I2] = binary_op

  delete chunks[$I2] # delete the left arg.
  chunks[$I2] = 0    # zero the operator
  inc $I2            # skip the operator position 
  delete chunks[$I2] # delete the right arg.
  dec stack_index    

converter_next:
  inc stack_index
  goto converter_loop

precedence_done:
  inc precedence_level
  stack_index = 0
  goto converter_loop

singleton_chunk:
  # a single value, return now.
  $P1 = chunks[0] # first element..
  $P1 = $P1[1]    # value of first element.
  .return ($P1)

die_horribly:
  .throw ("XXX: An error occurred parsing [expr]")

converter_done:
  $P1 = program_stack[0]
  .return ($P1)

.end

.sub get_operand
  .param string expr
  .param int pos

  .local pmc retval

  .local int start, len
  start = pos
  len   = length expr

  dec pos
eat_space:
  inc pos
  if pos >= len goto fail

  $I0 = is_cclass .CCLASS_WHITESPACE, expr, pos
  if $I0 == 1 goto eat_space

  $I0 = is_cclass .CCLASS_NUMERIC, expr, pos
  if $I0 == 1 goto number

  $I0 = ord expr, pos
  if $I0 == 91 goto subcommand  # [
  if $I0 == 40 goto subexpr     # (
  if $I0 == 36 goto variable    # $
  if $I0 == 46 goto number      # .
  if $I0 == 34 goto quote       # "
  if $I0 == 45 goto unary       # -
  if $I0 == 43 goto unary       # +
  if $I0 == 47 goto unary       # ~
  if $I0 == 33 goto unary       # !

  $I0 = is_cclass .CCLASS_WORD, expr, pos
  if $I0 == 1 goto function

fail:
  null retval
  .return(retval, pos)

subexpr:
  .return get_subexpr(expr, pos)

variable:
  .return get_variable(expr, pos)

subcommand:
  .return get_subcommand(expr, pos)

function:
  .return get_function(expr, pos)

number:
  .return get_number(expr, pos)

quote:
  .return get_quote(expr, pos)

unary:
  .return get_unary(expr, pos)

.end

.sub get_operator
  .param string expr
  .param int pos

  .local pmc chunk
  null chunk

  .local pmc ops, precedences
  # Global list of available ops.
  ops = find_global "_Tcl", "operators"
  # Global list of operator precedence
  precedences = find_global "_Tcl", "precedence"

  .local int len
  len = length expr
  dec pos
eat_space:
  inc pos
  if pos >= len goto done
  $I0 = is_cclass .CCLASS_WHITESPACE, expr, pos
  if $I0 == 1 goto eat_space

  .local int op_len
  .local string test_op

  # XXX cheat - right now there are only 2 and 1 character ops
  # 2 char trump one char.

  $I0 = pos + 1
  if $I0 == len goto one_char

two_char:
  op_len = 2
  test_op = substr expr, pos, op_len
  $P11 = ops[test_op]
  if_null $P11, one_char
  $I1 = typeof $P11
  if $I1 == .Undef goto one_char
  goto op_done

one_char:
  op_len = 1
  test_op = substr expr, pos, op_len
  $P11 = ops[test_op]
  if_null $P11, done
  $I1 = typeof $P11
  if $I1 == .Undef goto done

op_done:
  $I5 = precedences[test_op]
  $I6 = ops[test_op]

  chunk = new TclList
  chunk[0] = OP
  chunk[1] = $I6 # op lookup
  chunk[2] = $I5 # precedence

  pos += op_len

done:
  .return(chunk, pos)
.end

.sub get_subexpr
  .param string expr
  .param int pos

  .local pmc chunk, retval

  .local int len, depth, start
  len   = length expr
  depth = 1
  start = pos + 1
paren_loop:
  inc pos
  if pos >= len goto premature_end
  $I0 = ord expr, pos
  if $I0 == 41 goto paren_right
  if $I0 == 40 goto paren_left
  if $I0 == 92 goto paren_backslash
  goto paren_loop
paren_right:
  dec depth
  if depth == 0 goto paren_done
  goto paren_loop
paren_left:
  inc depth
  goto paren_loop
paren_backslash:
  inc $I1
  goto paren_loop

paren_done:
  $I0 = pos - start
  inc pos
  $S1 = substr expr, start, $I0

  retval = __expression_ast($S1)
  .return(retval, pos)

die_horribly:
  .throw("XXX: An error occurred processing a sub-expression")

premature_end:
  $S0 = "syntax error in expression \""
  $S0 .= expr
  $S0 .= "\": premature end of expression"
  .throw($S0)
.end

# given a string, starting at position, return a PMC
# for the number and the new position

.sub get_number
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
  if char == 46 goto floating    # "."
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

  $S0 = substr expr, start, pos
  # XXX Can't we just assign this string directly to the the TclFloat - WJC
  $N0 = $S0
  value = new TclFloat
  value = $N0
  # goto done

done:
  .return(value, pos)
.end

.sub get_function
  .param string expr
  .param int pos

  .local int len, start
  len   = length expr
  start = pos

  .local pmc func,operand

  # functions *must* have ()s
  pos = index expr, "(", start
  if pos == -1 goto fail

  .local int depth, paren_pos
  depth     = 1
  paren_pos = pos
loop:
  inc pos
  if pos >= len goto missing_paren
  $I1 = ord expr, pos
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
  inc pos
  goto loop

loop_done:
  # the function name must be before the first (
  $I0 = paren_pos - start
  $S0 = substr expr, start, $I0
  $P1 = find_global "_Tcl", "functions"

  func = $P1[$S0]
  if_null func, unknown_func

  $I0 = find_type "TclFunc"
  func = new $I0
  $P0 = new String
  $P0 = $S0
  setattribute func, "TclFunc\x00name", $P0

  # and the operand is what's between the ()'s - get the result
  # of /that/ expression and return it.
  # XXX - If there are commas in the op, then split the operand
  #   and parse each one as an operand. needed for:
  #   atan2,pow,fmod,hypot

  inc paren_pos
  $I0 = pos - paren_pos
  $S1 = substr expr, paren_pos, $I0

  operand = __expression_ast($S1)
  setattribute func, "TclFunc\x00argument", operand

done:
  inc pos
  .return(func, pos)

fail:
  .throw("error parsing function arguments!")

missing_paren:
  $S0 = "syntax error in expression \""
  $S0 .= expr
  $S0 .= "\": missing close parenthesis at end of function call"
  .throw($S0)

unknown_func:
  $S1 = "unknown math function \""
  $S1 .= $S0
  $S1 .= "\""
  .throw($S0)
.end

.sub get_unary
  .param string expr
  .param int pos

  .local pmc name, operand

  $S0 = substr expr, pos, 1
  name = new String
  name = $S0

  inc pos
  (operand, pos) = get_operand(expr, pos)

  .local pmc unary
  $I0   = find_type "TclUnaryOp"
  unary = new $I0
  setattribute unary, "TclUnaryOp\x00name", name
  setattribute unary, "TclUnaryOp\x00operand", operand

  .return(unary, pos)
.end

=head1 _Tcl::__expression_compile

Given the AST generated by the expression parser, render the various operands
as PIR. 

=cut

.sub __expression_compile
  .param pmc thing
 
   .local pmc compile
   compile = find_global "_Tcl", "compile"
   .local string pir_code

   ($I0,pir_code) = compile(thing,0)

  .local pmc pir_compiler
  pir_compiler = compreg "PIR"
  # XXX deal with re-using sub name?

  $P1 = new .Array
  $P1 = 2
  $P1[0] = pir_code
  $P1[1] = $I0

  # Use n_operators pragma to force generation of new pmcs 
  pir_code = sprintf ".pragma n_operators 1\n.sub blah @ANON\n%s.return ($P%s)\n.end\n", $P1

  #print pir_code # for debugging the compiler

  # XXX HACK: can't tailcall these.  
  $P1 = pir_compiler(pir_code)
  .return ($P1)

die_horribly:
  .throw ("XXX: an error occurred compiling [expr]")

.end

