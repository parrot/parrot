#
# initialize - create Zmachine object
#
.sub zm_init
  newclass $P0, "Zmachine"
  addattribute $P0, "file"
  addattribute $P0, "image"
  addattribute $P0, "opts"
  load_bytecode "library/Data/Escape.imc"
  .return($P0)
.end

#
# utilities
#

# S0 = to_hex(I0)

.sub to_hex
  .param int c
  .local pmc ar, val
  ar = new FixedPMCArray
  ar = 1
  ar[0] = c
  $S0 = sprintf "%x", ar
  .return($S0)
.end

# convert val 0..255 to var
# 0 = sp => "sp"
# 1..15  => "I16" ...
# 16 ... => "G0" ...

.sub to_var
  .param int val
  .local pmc ar
  if val < 16 goto no_global
    ar = new FixedPMCArray
    ar = 1
    val -= 16
    ar[0] = val
    $S0 = sprintf "G%d", ar
    goto done
  no_global:
  if val goto is_local
    $S0 = "sp"
    goto done
is_local:
  ar = new FixedPMCArray
  ar = 1
  val += 15		# L1 => I16
  ar[0] = val
  $S0 = sprintf "I%d", ar
done:
  .return ($S0)
.end

#####################################################
#
# Zmachine methods
#

.namespace ["Zmachine"]
.sub __instantiate method
  .param string file
  .param pmc opts
  .local pmc instance
  $I0 = typeof self
  instance = new $I0
  instance."load"(file)
  instance."set_opts"(opts)
  .return (instance)
.end

# load bytecode file

.sub load method
  .param string file
  .local pmc pfile, im, io
  pfile = new String
  pfile = file
  setattribute self, "Zmachine\0file", pfile
  .include "stat.pasm"
  $I0 = stat file, .STAT_FILESIZE
  io = open file, "<"
  $S0 = read io, $I0
  close io
  im = new String
  assign im, $S0
  setattribute self, "Zmachine\0image", im
.end

# set command line options

.sub set_opts method
  .param pmc opts
  setattribute self, "Zmachine\0opts", opts
.end

# TODO print some stats if --stats
# also check z version

.sub stats method
  .local pmc im
  im = getattribute self, "Zmachine\0image"
  $I0 = im[0]
  ## print "Z-code version "
  ## print $I0
  ## print "\n"
  if $I0 == 3 goto vers_ok
    printerr "only version 3 supported\n"
    exit 1
vers_ok:
  .local int pc
  # 5.5
  pc = self."get_word"(6)
  ## print "Start PC       0x"
  ## $S0 = to_hex(pc)
  ## print $S0
  ## print "\n"
.end

## return word, new offset
# 4.2.1 msb first

.sub get_word method
  .param int ofs
  .local int lo, hi
  .local pmc im
  im = getattribute self, "Zmachine\0image"
  hi = im[ofs]
  inc ofs
  lo = im[ofs]
  inc ofs
  hi <<= 8
  lo += hi
  .return(lo, ofs)
.end

#
# main translation driver
# create a z3 compiler
#    TODO depending on zcode version a ZxComp
# copy shared attributes
# call 2 passes of translation
# compile PIR and run it
#

.sub translate method
  .local pmc comp, im, f, o, t
  subclass $P0, "Zmachine", "ZComp"
  addattribute $P0, "labels"
  addattribute $P0, "subs"
  addattribute $P0, "todo_subs"
  addattribute $P0, "ops"
  addattribute $P0, "code"
  addattribute $P0, "temp"
  $I0 = typeof $P0
  comp = new $I0
  # ref instance vars
  im = getattribute self, "Zmachine\0image"
  setattribute comp, "Zmachine\0image", im
  f = getattribute self, "Zmachine\0file"
  setattribute comp, "Zmachine\0file", f
  o = getattribute self, "Zmachine\0opts"
  setattribute comp, "Zmachine\0opts", o
  # set temp counter
  comp."translate"(0)
  .local pmc code
  code = comp."translate"(1)
  .local int deb
  deb = self."debug"()
  unless deb goto no_deb
    print code
  no_deb:
  .local pmc compi, code_sub
  # get PIR compiler
  compi = compreg "PIR"
  $S0 = code
  # compile the code
  code_sub = compile compi, $S0
  # and run it
  code_sub(im)
.end

#
# accessor methods
#

.sub "debug" method
  .param pmc opts
  opts = getattribute self, "Zmachine\0opts"
  $I0 = defined opts["debug"]
  .return ($I0)
.end

.sub image method
  .local pmc im
  im = getattribute self, "Zmachine\0image"
  .return(im)
.end

.sub file method
  .local pmc f
  f = getattribute self, "Zmachine\0file"
  .return(f)
.end

#####################################################
# actually z3 compiler only
# different methods should be overridden for z4, 5...

.namespace ["ZComp"]

.sub __init method
  $P0 = new Hash
  setattribute self, "ZComp\0labels", $P0
  $P0 = new Hash
  setattribute self, "ZComp\0subs", $P0
  $P0 = new PerlArray
  setattribute self, "ZComp\0todo_subs", $P0
  .local pmc ops
  ops = self."set_oplist"()
  setattribute self, "ZComp\0ops", ops
  $P0 = new String
  setattribute self, "ZComp\0code", $P0
  $P0 = new Integer
  setattribute self, "ZComp\0temp", $P0
.end

#
# some accessor methods
#

.sub ops method
  .local pmc o
  o = getattribute self, "ZComp\0ops"
  .return(o)
.end

# return or add code

.sub code method
  .param string s
  .local pmc c
  c = getattribute self, "ZComp\0code"
  unless argcS goto no_add
    c = c . s
no_add:
  .return(c)
.end

#
# main translation method
# the first sub (entrypoint, main) is obtained from the header
#    and put onto the todo list
# if a call is parsed, the sub is pushed onto
#    the todo list
# labels are set in a label hash
#
.sub translate method
  .param int pass
  .local int pc, deb, first
  .local pmc file
  first = 1
  # Very first time through, reset seen hash, print code header
  unless pass goto no_emit0
    $P0 = new Hash
    setattribute self, "ZComp\0subs", $P0
    # Output macros at the very beginning of the translated code
    self."emit_macros"()
no_emit0:

  deb = self."debug"()
  unless deb goto no_deb_1
    file = self."file"()
    print "translate '"
    print file
    print  "' pass "
    print pass
    print "\n"
no_deb_1:

  .local pmc the_sub, todo
  # we stop at quit and ret statements
  # if a label points beyond last, remember it
  pc = self."get_word"(6)
  $I0 = pc - 1
  # main has no locals
  self."remember_sub"(pc, $I0)
  todo = getattribute self, "ZComp\0todo_subs"

  # main loop over subs in todo list
  # (Todo list changes when we read a call zop for a so-far unseen sub)
loop:
  $I0 = elements todo
  unless $I0 goto fin
  the_sub = shift todo
  pc = the_sub

  pc = self."decode_one_sub"(pc, first, pass)
  first = 0 # not first time any more
  goto loop
fin:
  .local pmc code
  code = self."code"()
  .return (code)
.end

#
# Read/decode one sub
# Return pc after reading the sub
#
.sub decode_one_sub method
  .param int pc
  .param int first
  .param int pass
  .local int last, is_ret, label, deb
  .local string ops, type
  .local pmc args, im

  im = self."image"()
  last = pc
  $S0 = to_hex(pc)

  deb = self."debug"()
  unless deb goto no_deb_2
    print "sub "
    print $S0
    print "\n"
no_deb_2:
  unless pass goto no_emit
    # TODO read in nlocals here (I think I need to change subs
    # to be R + position of nlocals - change seen/todo) and pass it to 
    # emit_sub_header (OR have emit_sub_header read it).
    # Print out the sub header, params, variable declarations/assignments
    self."emit_sub_header"($S0, first)

  no_emit:
  #
  # loop until the last ret or quit is found in
  # one subroutine
  #
inner:
    $S0 = to_hex(pc)
    unless pass goto no_emit_l
      #
      # if at this pc is a label referenced
      # (collected from pass 0)
      # then emit a label in pass 1
      #
      .local pmc labs
      labs = getattribute self, "ZComp\0labels"
      $S1 = pc
      $I2 = exists labs[$S1]
      unless $I2 goto no_emit_l
      $S1 = "L" . $S0
      $S1 .= ":\n"
      self."code"($S1)
  no_emit_l:
    unless deb goto no_deb_3
      print_item $S0
  no_deb_3:
    # decode opcode at pc
    (ops, type, pc) = self."decode_op"(im, pc)
    unless deb goto no_deb_4
      print_item ops
      print_item type
  no_deb_4:
    # collect args encoded in opcode
    args = new ResizablePMCArray
    (args, pc) = self."decode_args"(im, pc, args, type)
    # call opcode function to parse more
    # and emit code in pass 1
    (args, pc, is_ret, label) = self.ops(im, pc, args, pass)
    # is label beyond last, remember it
    if label < last goto not_longer
      # probably not
      last = label
  not_longer:
    unless deb goto no_deb_5
      # debug arguments loop
      $I0 = elements args
      unless $I0 goto done_deb_args
      $I1 = 0
      print " "
    deb_arg_loop:
	$S0 = args[$I1]
	print $S0
	$I2 = ord $S0
	if $I2 <= 0x30 goto no_dig
	if $I2 >= 0x39 goto no_dig
	$I2 = $S0
	$S2 = to_hex($I2)
	print "="
	print $S2
      no_dig:
	print " "

	inc $I1
	if $I1 < $I0 goto deb_arg_loop
    done_deb_args:
      print_newline
  no_deb_5:
    # if the opcode did a return, is_ret is set
    if is_ret goto maybe_fin
    # if no label is beyond last, just advance
    # until a ret statement is found
    if last > pc goto maybe_fin
      last = pc
  maybe_fin:
    if pc <= last goto inner
  #
  # done with one sub
  # emit end
  unless pass goto no_emit2
    $S1 = ".end\n"
    self."code"($S1)
  no_emit2:
  .return(pc)
.end

#
# put sub into seen hash and onto todo list
# todo list gets position of first opcode (AFTER locals)
#
# the value in the seen hash is the
# position of the locals count in the image
#
.sub remember_sub method
  .param int adr
  .param int pc
  .local pmc todo, seen
  seen = getattribute self, "ZComp\0subs"

  $S0 = adr
  $I0 = exists seen[$S0]
  if $I0 goto done
    todo = getattribute self, "ZComp\0todo_subs"
    push todo, adr
    seen[$S0] = pc
done:
.end

# Print macros at beginning of translated Z-machine
.sub emit_macros method
      $S1 = ".macro GET_WORD(w, im, a)\n"
      $S1 .= "\t.w = .im[.a]\n"
      $S1 .= "\t$I0 = .a\n"
      $S1 .= "\tinc $I0\n"
      $S1 .= "\t$I1 = .im[$I0]\n"
      $S1 .= "\t.w <<= 8\n"
      $S1 .= "\t.w |= $I1\n"
      $S1 .= ".endm\n"
      $S1 .= ".macro STORE_WORD(im, a, w)\n"
      $S1 .= "\t$I0 = .w >> 8\n"
      $S1 .= "\t.im[.a] = $I0\n"
      $S1 .= "\t$I0 = .a\n"
      $S1 .= "\tinc $I0\n"
      $S1 .= "\t$I1 = .w & 0xff\n"
      $S1 .= "\t.im[$I0] = $I1\n"
      $S1 .= ".endm\n"
      self."code"($S1)
      .return(1)
.end

# Print out the sub header, params, variable declarations/assignments
# Treat MAIN slightly differently (It won't have locals, btw)
# a sub may be called with 0..3 (7) args
# TODO clear locals / set default values
.sub emit_sub_header method
    .param string address
    .param int first # first (main) sub?
    .local int i, j
    .local string assigns, declares
    .local int num_locals # will be a .param (or read it in this sub)
    num_locals = 3
    $S1 = ".sub R"
    $S1 .= address
    unless first goto not_first
      $S1 .= " @MAIN"
    not_first:
    $S1 .= "\n"
    assigns = ""
    declares = ""
    i = 0
    loop_start:
      if i >= num_locals goto loop_end
      # .param int a0
      declares .= "\t.param int a"
      $S0 = i
      declares .= $S0
      declares .= "\n"
      # I17 = a1 
      # uses of Z local var '1' will be translated to I17
      # But only assign as many args as we read in
      assigns .= "\tif argcI == "
      assigns .= $S0
      assigns .= " goto done_args\n"
      assigns .= "\tI"
      j = i + 16
      $S0 = j
      assigns .= $S0
      assigns .= " = a"
      $S0 = i
      assigns .= $S0
      assigns .= "\n"
      inc i
      goto loop_start
    loop_end:

    $S1 .= declares
    # MAIN creates the global image var; others load it in
    if first goto is_first2
      $S1 .= "\t.local pmc image\n"
      goto not_first2
    is_first2:
      $S1 .= "\t.param pmc image\n"
    not_first2:
    $S1 .= assigns
    unless num_locals goto no_done_args
      $S1 .= "\tdone_args:\n"
    no_done_args:

    # Create the global image var OR load it
    if first goto is_first3
      $S1 .= "\timage = global 'Image'\n"
      goto not_first3
    is_first3:
      $S1 .= "\tglobal 'Image' = image\n"
    not_first3:

    self."code"($S1)
    .return(1)
.end

#
# decode one opcode byte
#

.sub decode_op method
  .param pmc im
  .param int pc

  .local int op, optype
  .local pmc op_names, op_ar
  .local string type, ops
  type = "??"
  optype = -1
  ops = "???"

  op = im[pc]
  inc pc
  $I0 = op & 0x80
  if $I0 goto not_long_form # no_2op
    # in long form, opcount is always 2op
    # 2op 0 tt ooooo
    #
    # 00 .. 1f  small const, small const
    # 20 .. 3f  small const, var
    # 40 .. 5f  var, small const
    # 60 ...7f  var, var
    optype = 0
    type = "vv"
    $I0 = op & 0x40
    if $I0 goto arg_1_is_var
      type[0] = "c"
arg_1_is_var:
    $I0 = op & 0x20
    if $I0 goto arg_2_is_var
      type[1] = "c"
arg_2_is_var:
      op &= 0x1f
      goto done

not_long_form: # no_2op:
  $I0 = op & 0xc0
  if $I0 == 0xc0 goto var_form # var_op
# else form is short: 10.. ....
    $I0 = op & 0xb0
    if $I0 != 0xb0 goto one_op
    # 0OP
    optype = 2
    op &= 0xf
    type = ""
    goto done
one_op:
    if $I0 != 0x80 goto one_op_c
    # 1OP long c
    optype = 1
    op &= 0xf
    type = "C"
    goto done
one_op_c:
    if $I0 != 0x90 goto one_op_v
    # 1OP small c
    optype = 1
    op &= 0xf
    type = "c"
    goto done
one_op_v:
    # 1OP var
    optype = 1
    op &= 0xf
    type = "v"
    goto done

var_form: # var_op:
# bit 5 is operand count: 0 = var, 1 = 2op
$I0 = op & 0x20
if $I0 == 0x20 goto var_var
# variable form, 2op
  optype = 0
  goto var_types
var_var: # variable form, variable opcount
    optype = 3
var_types:

    op &= 0x1f
    # next byte is operand types
    .local int types, i
    types = im[pc]
    inc pc
    type = ""
    i = 6
  type_loop:
      $I0 = types >> i
      $I0 &= 0x3
      if $I0 == 0x3 goto types_done
      $I1 = $I0 & 0x2
      unless $I1 goto type_no_var
	type .= "v"
	goto next_type
    type_no_var:
      $I1 = $I0 & 0x1
      unless $I1 goto type_no_c
	type .= "c"
	goto next_type
    type_no_c:
	type .= "C"
    next_type:
      i -= 2
# After 4th arg, i=-2
      if i >= 0 goto type_loop
  types_done:

done:
  # lookup the thing
  #printerr pc
  #printerr " "
  #printerr optype
  #printerr " "
  #printerr op
  #printerr "\n"
  op_ar = self."ops"()
  op_names = op_ar[optype]
  ops = op_names[op]
  .return (ops, type, pc)
.end

#
# decode arguments of the opcode
# if the opcode stores isn't known yet
#
# argument signatures are:
#
# c ... small constant
# C ... long constant
# v ... var
#

.sub decode_args method
  .param pmc im
  .param int pc
  .param pmc args
  .param string type
  .local pmc args, ar
  .local int len, i, val
  .local string t
  len = length type
  unless len goto done
  i = 0
arg_loop:
  t = type[i]
  if t != 'c' goto no_c
    # small constant
    val = im[pc]
    inc pc
    push args, val
    goto next_arg
no_c:
  if t != 'C' goto no_C
    # long constant
    (val, pc) = self."get_word"(pc)
    push args, val
    goto next_arg
no_C:
  if t != 'v' goto no_v
    # variable 0 = sp, 1..15 = local, 16..255 = global
    val = im[pc]
    inc pc
      $S0 = to_var(val)
      push args, $S0
      goto next_arg
no_v:
  printerr "unknown arg\n"
  exit 1
next_arg:
  inc i
  if i < len goto arg_loop
done:
  .return (args, pc)
.end

#
# initialize z3 opcode list
#

.sub set_oplist method
  .local pmc ops, ops_2op, ops_1op, ops_0op, ops_var, ops_ext
  ops = new FixedPMCArray
  ops = 5
  ops_2op = new FixedPMCArray
  ops_2op = 32
  ops[0] = ops_2op
  ops_1op = new FixedPMCArray
  ops_1op = 16
  ops[1] = ops_1op
  ops_0op = new FixedPMCArray
  ops_0op = 16
  ops[2] = ops_0op
  ops_var = new FixedPMCArray
  ops_var = 32
  ops[3] = ops_var
  ops_ext = new FixedPMCArray
  ops_ext = 32
  ops[4] = ops_ext

  # ops_2op[0] = ""
  ops_2op[1] = "zop_je"
  ops_2op[2] = "zop_jl"
  ops_2op[3] = "zop_jg"
  ops_2op[4] = "zop_dec_chk"
  ops_2op[5] = "zop_inc_chk"
  ops_2op[6] = "zop_jin"
  ops_2op[7] = "zop_test"
  ops_2op[8] = "zop_or"
  ops_2op[9] = "zop_and"
  ops_2op[10] = "zop_test_attr"
  ops_2op[11] = "zop_set_attr"
  ops_2op[12] = "zop_clear_attr"
  ops_2op[13] = "zop_store"
  ops_2op[14] = "zop_insert_obj"
  ops_2op[15] = "zop_loadw"
  ops_2op[16] = "zop_loadb"
  ops_2op[17] = "zop_get_prop"
  ops_2op[18] = "zop_get_prop_addr"
  ops_2op[19] = "zop_get_next_prop"
  ops_2op[20] = "zop_add"
  ops_2op[21] = "zop_sub"
  ops_2op[22] = "zop_mul"
  ops_2op[23] = "zop_div"
  ops_2op[24] = "zop_mod"


  ops_1op[0] = "zop_jz"
  ops_1op[1] = "zop_get_sibling"
  ops_1op[2] = "zop_get_child"
  ops_1op[3] = "zop_get_parent"
  ops_1op[4] = "zop_get_prop_len"
  ops_1op[5] = "zop_inc"
  ops_1op[6] = "zop_dec"
  ops_1op[7] = "zop_print_addr"
  # ops_1op[8] = "zop_call_ls"	# V4
  ops_1op[9] = "zop_remove_obj"
  ops_1op[10] = "zop_print_obj"
  ops_1op[11] = "zop_ret"
  ops_1op[12] = "zop_jump"
  ops_1op[13] = "zop_print_paddr"
  ops_1op[14] = "zop_load"
  ops_1op[15] = "zop_not"

  ops_0op[0] = "zop_rtrue"
  ops_0op[1] = "zop_rfalse"
  ops_0op[2] = "zop_print"
  ops_0op[3] = "zop_print_ret"
  ops_0op[4] = "zop_nop"
  ops_0op[5] = "zop_save"
  ops_0op[6] = "zop_restore"
  ops_0op[7] = "zop_restart"
  ops_0op[8] = "zop_ret_popped"
  ops_0op[9] = "zop_pop"
  ops_0op[10] = "zop_quit"
  ops_0op[11] = "zop_new_line"
  ops_0op[12] = "zop_show_status"
  ops_0op[13] = "zop_verify"
  # ops_0op[14] = ""	# EXT
  # ops_0op[15] = ""

  ops_var[0] = "zop_call"	# V4: call_vs
  ops_var[1] = "zop_storew"
  ops_var[2] = "zop_storeb"
  ops_var[3] = "zop_put_prop"
  ops_var[4] = "zop_sread"
  ops_var[5] = "zop_print_char"
  ops_var[6] = "zop_print_num"
  ops_var[7] = "zop_random"
  ops_var[8] = "zop_push"
  ops_var[9] = "zop_pull"
  ops_var[10] = "zop_split_window"
  ops_var[11] = "zop_set_window"

  ops_var[19] = "zop_output_stream"
  .return(ops)
.end


.sub temp method
  .local pmc tc
  tc = getattribute self, "ZComp\0temp"
  inc tc
  $S0 = "$I"
  $S1 = tc
  $S0 .= $S1
  .return ($S0)
.end

# Creates code to get a number, local or global variable
#    and adds it to the Z object
# Converts value to signed integer if necessary.
# Returns the string (e.g. "$I18" or "35") with the new value
.sub emit_get method
  .param string var
  .param int is_signed # need to convert variable to signed int?
  .local string t, result, conv_temp
  .local int global_adr
  t = var[0]
  if t != 'G' goto no_global
    $S1 = substr var, 1
    result = self."temp"()
    $S0 = ""
    global_adr = self."get_word"(12)
    $I1 = $S1
    $I1 *= 2
    $I1 += global_adr
    $S1 = $I1
    $S0 .= "\t.GET_WORD("
    $S0 .= result
    $S0 .= " , image, "
    $S0 .= $S1
    $S0 .= ")\n"
    self."code"($S0)
    goto got_it
no_global:
  if t != 'I' goto no_local
    result = var
    goto got_it
no_local:
  if t != 's' goto no_stack
    result = self."temp"()
    $S0 .= "\trestore "
    $S0 .= result
    $S0 .= "\n"
    self."code"($S0)
    goto got_it
no_stack:
    result = var
# now convert to signed int if nec
got_it: 
    unless is_signed goto no_conv
    conv_temp = self."temp"()
    $S0 = "\t"
    $S0 .= conv_temp
    $S0 .= " = "
    $S0 .= result
    $S0 .= "\n"
    $S0 .= "\tconv_i2 "
    $S0 .= conv_temp
    $S0 .= "\n"
    self."code"($S0)
    result = conv_temp
no_conv:
    .return(result)
.end

# Emit code that will store a value in a variable (local, global, stack)
# IMO all variables in the Z-machine are supposed to be unsigned: the only
# time you do signed stuff is for ops like add, where you're supposed
# to signify the args before doing the op. But I think the result is
# still supposed to be unsigned.
# 15."dec": "This is signed, so 0 decrements to -1"
# I still think that that rule only matters for dec_chk
.sub emit_store method
  .param string var
  .param string value
  .local string t
  .local int global_adr
  .local string conv_temp
  # Change the value to a signed value: 
  # $I27=I46; conv_temp $I27; use $I27 instead of I46 for the rest of the sub
  conv_temp = self."temp"()
  $S0 = "\t"
  $S0 .= conv_temp
  $S0 .= " = "
  $S0 .= value
  $S0 .= "\n"
  $S0 .= "\tconv_u2 "
  $S0 .= conv_temp
  $S0 .= "\n"
  value = conv_temp

  t = var[0]
  if t != 'G' goto no_global
    $S1 = substr var, 1
    global_adr = self."get_word"(12)
    $I1 = $S1
    $I1 *= 2
    $I1 += global_adr
    $S1 = $I1
    $S0 .= "\t.STORE_WORD(image, "
    $S0 .= $S1
    $S0 .= ", "
    $S0 .= value
    $S0 .= ")\n"
    self."code"($S0)
    goto done
no_global:
  if t != 'I' goto no_local
    # Could happen for '@dec I18'. But can't happen now that we conv_u2
    # if var == value goto done
    $S0 .= "\t"
    $S0 .= var
    $S0 .= " = "
    $S0 .= value
    $S0 .= "\n"
    self."code"($S0)
    goto done
no_local:
  if t != 's' goto no_stack
    $S0 .= "\tsave "
    $S0 .= value
    $S0 .= "\n"
    self."code"($S0)
    goto done
no_stack:
    printerr "emit_store: unknown var: '"
    printerr var
    printerr "'\n"
    exit 1
done:
.end

.sub decode_label method
  .param pmc im
  .param int pc
  .local int label, on_true
  label = im[pc]
  inc pc
  # 4.7
  # bit 7
  on_true = 0
  $I0 = label & 0x80
  unless $I0 goto on_false
    on_true = 1
on_false:
  # bit 6 = 1 ... 6 bit branch
  $I0 = label & 0x40
  unless $I0 goto long_branch
    label &= 0x3f
    # Branch of 0/1 means rfalse/rtrue respectively
    unless label goto decode_done
    if label == 1 goto decode_done
    label += pc
    label -= 2
    goto decode_done
long_branch:
    .local int hi, lo
    lo = im[pc]
    inc pc
    hi = label & 0x3f
    hi <<= 8
    hi |= lo

    label = hi
    label += pc
    label -= 2
    # fix me
    goto decode_done

decode_done:
  if label < 2 goto no_remember # don't bother remembering labels 0 and 1
    self."remember_label"(label)
  no_remember:
  .return (label, on_true, pc)
.end

# store address of a label

.sub remember_label method
  .param int adr
  .local pmc lab
  lab = getattribute self, "ZComp\0labels"
  $S0 = adr
  lab[$S0] = 1
.end

.include "zops.pir"

