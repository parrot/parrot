#
# z3 opcode functions
# a lot are valid for other version too
#
# Most functions here implement a particular opcode function.
#
# On the first pass translation pass (just finding labels), they
# usually just make sure they read all the args (labels & return values
# aren't included in the opcode counts stored in the first byte of an opcode)
# and then return the new pc, plus any label found in the opcode, and
# a boolean saying whether it's a return-like opcode.
#
# On the second pass, each sub creates the PIR code translation of an opcode
# The translation routines then compile that code to run it.
#

# Numbers are stored as unsigned ints
# Change them to signed ints when doing addition, comparisons, etc.

#
# return the packed address of a subroutine
# z3 specific
#
.sub packed_addr method
  .param int adr
  # V3 - real adr * 2
  adr *= 2
  .return(adr)
.end

##########
# ARITHMETIC
##########

# 2OP:20 14 add a b -> (result)
.sub zop_add method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    self."emit_binary_op"(args, "+", 1)
done:
  .return (args, pc, 0, 0)
.end

# 2OP:21 15 sub a b -> (result)
.sub zop_sub method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    self."emit_binary_op"(args, "-", 1)
done:
  .return (args, pc, 0, 0)
.end

# 2OP:22 16 mul a b -> (result)
.sub zop_mul method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    self."emit_binary_op"(args, "*", 1)
done:
  .return (args, pc, 0, 0)
.end

# 2OP:23 17 div a b -> (result)
.sub zop_div method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    self."emit_binary_op"(args, "/", 1)
done:
  .return (args, pc, 0, 0)
.end

# 2OP:24 18 mod a b -> (result)
# Can't use emit_binary_mod because % does mod and we need cmod
.sub zop_mod method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    .local string left, l, right, r, var, val
    left = args[0]
    right = args[1]
    var = args[2]
    l = self."emit_get"(left, 1)
    r  = self."emit_get"(right, 1)
    val = self."temp"()
    $S0 = "\t"
    $S0 .= val
    $S0 .= " = cmod "
    $S0 .= l
    $S0 .= ", "
    $S0 .= r
    $S0 .= "\n"
    self."code"($S0)
    self."emit_store"(var, val)
done:
  .return (args, pc, 0, 0)
.end

.sub emit_binary_op method
  .param pmc args
  .param string operator
  .param string is_signed
    .local string left, l, right, r, var, val
    left = args[0]
    right = args[1]
    var = args[2]
    l = self."emit_get"(left, is_signed)
    r  = self."emit_get"(right, is_signed)
    val = self."temp"()
    $S0 = "\t"
    $S0 .= val
    $S0 .= " = "
    $S0 .= l
    $S0 .= " "
    $S0 .= operator
    $S0 .= " "
    $S0 .= r
    $S0 .= "\n"
    self."code"($S0)
    self."emit_store"(var, val)
    .return (1)
.end

##########
# LOGICAL
##########

# and
# 2OP:9 9 and a b -> (result)
.sub zop_and method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    self."emit_binary_op"(args, "&", 0)
done:
  .return (args, pc, 0, 0)
.end

# or
# 2OP:8 8 or a b -> (result)
.sub zop_or method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    self."emit_binary_op"(args, "|", 0)
done:
  .return (args, pc, 0, 0)
.end

# not
# 1OP:143 F 1/4 not value -> (result)
# VAR:248 18 5/6 not value -> (result)
.sub zop_not method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
  .local string operand, notted, store_var, val
  operand = args[0]
  store_var = args[1]
  notted = self."emit_get"(operand, 0)
    val = self."temp"()
    $S0 = "\t"
    $S0 .= val
    $S0 .= " = ~ "
    $S0 .= notted
    $S0 .= "\n"
    self."code"($S0)
    self."emit_store"(store_var, val)
done:
  .return (args, pc, 0, 0)
.end


##########
# JUMP
##########
.sub zop_jump method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local int label
  label = args[0]
  label += pc
  if label < 65536 goto ok
    label -= 65536
ok:
  label -= 2
  self."remember_label"(label)
  args[0] = label
  if pass goto emit
    goto done
emit:
    $S0 = "\tgoto L"
    $S1 = to_hex(label)
    $S0 .= $S1
    $S0 .= "\n"
    self."code"($S0)
done:
  .return (args, pc, 0, label)
.end

##########
.sub zop_jz method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local int label, on_true
  (label, on_true, pc) = self."decode_label"(im, pc)
  push args, label
  unless pass goto done
    .local string left, l
    left = args[0]
    l = self."emit_get"(left, 1)
    $S0 = l
    $S0 .= " == 0"
    self."emit_branch"(on_true, $S0, label)
done:
  .return (args, pc, 0, label)
.end

##########
# Jump on equals
# TODO if equal to ANY of its args!!!
.sub zop_je method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local int label, on_true
  (label, on_true, pc) = self."decode_label"(im, pc)
  push args, label
  unless pass goto done
    .local string left, l, right, r
    left = args[0]
    right = args[1]
    l = self."emit_get"(left, 1)
    r  = self."emit_get"(right, 1)
    $S0 = l
    $S0 .= " == "
    $S0 .= r
    self."emit_branch"(on_true, $S0, label)
done:
  .return (args, pc, 0, label)
.end

##########
# Jump if a > b (using a signed 16-bit comparison). 
.sub zop_jg method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local int label, on_true
  (label, on_true, pc) = self."decode_label"(im, pc)
  push args, label
  unless pass goto done
    .local string left, l, right, r
    left = args[0]
    right = args[1]
    l = self."emit_get"(left, 1)
    r  = self."emit_get"(right, 1)
    $S0 = l
    $S0 .= " > "
    $S0 .= r
    $S0 = self."emit_branch"(on_true, $S0, label)
done:
  .return (args, pc, 0, label)
.end


##########
# Jump if a < b (using a signed 16-bit comparison). 
.sub zop_jl method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local int label, on_true
  (label, on_true, pc) = self."decode_label"(im, pc)
  push args, label
  unless pass goto done
    .local string left, l, right, r
    left = args[0]
    right = args[1]
    l = self."emit_get"(left, 1)
    r  = self."emit_get"(right, 1)
    $S0 = l
    $S0 .= " < "
    $S0 .= r
    $S0 = self."emit_branch"(on_true, $S0, label)
done:
  .return (args, pc, 0, label)
.end

# Given a condition, output an if/unless statement
.sub emit_branch method
  .param int on_true
  .param string condition
  .param int label
  .local string label_name

  unless label < 2 goto no_return
    on_true = ! on_true
  no_return:
  unless on_true goto emit_unless
    $S0 = "\tif "
    goto emit_cond
  emit_unless:
    $S0 = "\tunless "
  emit_cond:
  $S0 .= condition
  $S0 .= " goto L"
  if label < 2 goto if_return
    $S1 = to_hex(label)
    goto no_if_return
  if_return:
    $S1 = "_if_return"
    label_name = self."temp"() # get a non-repeatable number
    label_name = substr label_name, 2
    $S1 .= label_name
    $S1 .= "\n\t.return("
    $S2 = label
    $S1 .= $S2
    $S1 .= ")\n"
    $S1 .= "L_if_return"
    $S1 .= label_name
    $S1 .= ":\n"
  no_if_return:
  $S0 .= $S1
  $S0 .= "\n"
  self."code"($S0)
  .return (1)
.end

##########
# PRINT
##########
# 3.2
.sub decode_text method
  .param pmc im
  .param int pc

  .local int word, cur_a, next_a, i, z, sh, fin, double_count, double_sum
  .local string s, A0, A1, A2, c, a
  .local pmc alphabets
  alphabets = new FixedStringArray
  alphabets = 3
  A0 = "abcdefghijklmnopqrstuvwxyz"
  A1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  A2 = " \n0123456789.,!?_#'\"/\\-:()"	#"
  alphabets[0] = A0
  alphabets[1] = A1
  alphabets[2] = A2
  next_a = 0
  s = "\""
  fin = 0
  double_count = 0
  # trace 1
text_loop:
  (word, pc) = self."get_word"(pc)
  fin = word & 0x8000
  sh = 10
  word_loop:
    z = word >> sh
    z &= 0x1f
    cur_a = next_a
    next_a = 0 # by default. 3.2.3: "There are no shift lock characters" (v3+)

    # Handle ZSCII char
    unless double_count goto not_double
      unless double_count == 2 goto not_end_double
        double_sum = double_sum << 5
    not_end_double:
      double_sum += z
      unless double_count == 2 goto not_end_double2
        if double_sum < 128 goto valid_ascii
	  printerr "Don't support ZSCII >= 128: "
	  printerr double_sum
	  printerr "\n"
	  goto next_z
	valid_ascii:
        c = chr double_sum
	s .= c
	double_count = 0
	goto next_z
    not_end_double2:
	inc double_count
	goto next_z

    not_double:
      if z goto not_nul
	s .= " "
	goto next_z
    not_nul:
      if z < 6 goto special
      if z != 6 goto not_6 # 6 in A2 ONLY is specia
      if cur_a == 2 goto special
    not_6:
      z -= 6
      a = alphabets[cur_a]
      c = a[z]
      s .= c
      goto next_z
    special:
      if z != 4 goto not_4
	next_a = 1
	goto next_z
    not_4:
      if z != 5 goto not_5
	next_a = 2
	goto next_z
    not_5:
	if z != 6 goto not_6b
	double_count = 1 # Read a two-zchar ZSCII char
	double_sum = 0
	goto next_z
    not_6b:
	# 3.3 abbrev z (1,2,3) abbrev = 32(z-1) + x
	printerr "unimpl abbrev in text\n"
	#exit 1
	goto next_z

    next_z:
      sh -= 5
      if sh >= 0 goto word_loop

  unless fin goto text_loop
  .local pmc escape
  escape = find_global "Data::Escape", "String"
  s = escape(s)
  s .= "\""
  .return (s, pc)
.end

##########
.sub zop_print method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local string txt

  (txt, pc) = self."decode_text"(im, pc)
  push args, txt
  unless pass goto done
    $S0 = "\tprint "
    $S0 .= txt
    $S0 .= "\n"
    self."code"($S0)
done:
  .return (args, pc, 0, 0)
.end

##########
# TODO print a newline before return
.sub zop_print_ret method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  .local string txt

  (txt, pc) = self."decode_text"(im, pc)
  push args, txt
  unless pass goto done
    $S0 = "\tprint "
    $S0 .= txt
    $S0 .= "\n\t.return(1)\n"
    self."code"($S0)
done:

  .return (args, pc, 1, 0)
.end

##########
.sub zop_print_num method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  unless pass goto done
    .local string var
    $S0 = "\tprint "
    $S1 = args[0]
    var = self."emit_get"($S1, 1)
    $S0 .= var
    $S0 .= "\n"
    self."code"($S0)
done:
  .return (args, pc, 0, 0)
.end

##########
# TODO '@print_paddr I5' breaks. Need to call decode_text at runtime
.sub zop_print_paddr method
    #write_zchunk($ztext->decode_text($_[0]));
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # TODO if regular text, send text back for debug
  unless pass goto done
  .local string txt, var, tempi1, tempi2, temps1
  .local int adr, dumb
  txt = args[0]
  adr = txt # see whether it's a number or not
  unless adr goto non_constant_addr
    adr = self."packed_addr"(adr)
    (txt, dumb) = self."decode_text"(im, adr)
    push args, txt
    $S0 = "\tprint "
    $S0 .= txt
    $S0 .= "\n"
    goto encode
  non_constant_addr:
    printerr "Unimplemented print_paddr("
    printerr txt
    printerr ")\n"
# Below doesn't work: no access to Zmachine object or decode_text method
# I need to subclass ZMachine with ZRuntime and create a Z object
# so I can have access to packed_addr and decode_text on the image
# In fact, pass the ZRun object into @MAIN, then get its image
# object and make it global
#    var = self."emit_get"(txt, 0)
#    tempi1 = self."temp"()
#    tempi2 = self."temp"()
#    temps1 = tempi1
#    temps1[1] = "S" # string temp var instead of int
#    $S0 = "\t"
#    $S0 .= tempi1
#    $S0 .= " = "
#    $S0 .= var
#    $S0 .= "\n"
#    $S0 .= "\t"
#    $S0 .= tempi1
#    $S0 .= " = self.\"packed_addr\"("
#    $S0 .= tempi1
#    $S0 .= ")\n\t"
#    $S0 .= temps1
#    $S0 .= " = self.\"decode_text\"(image, "
#    $S0 .= tempi1
#    $S0 .= ")\n"
#    $S0 .= "\tprint "
#    $S0 .= temps1
#    $S0 .= "\n"

encode:
    self."code"($S0)
done:
  .return (args, pc, 0, 0)
.end

##########
# VARIABLES
# Warning: indirect variables live here!
##########

# store (var) value
# var is indirect constant
.sub zop_store method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  .local string var, val, valget
  $I0 = args[0]
  var = to_var($I0)
  args[0] = var
  unless pass goto done
    var = args[0]
    val = args[1]
    valget  = self."emit_get"(val, 0)
    self."emit_store"(var, valget)
done:
  .return (args, pc, 0, 0)
.end

.sub zop_dec method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # args[0] is a small constant meaning var
  # parse again as variable, dec pc, clear args
  dec pc
  args = 0
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    .local string var
    $S1 = args[0]
    var = self."emit_get"($S1, 0)
    $S0 = "\tdec "
    $S0 .= var
    $S0 .= "\n"
    self."code"($S0)
    # 15."dec": "This is signed, so 0 decrements to -1"
    # Does that only matter for dec_chk? Stack & vars are unsigned?
    # emit_store will conv_u2
    self."emit_store"($S1, var)
done:
  .return (args, pc, 0, 0)
.end

.sub zop_inc method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  # args[0] is a small constant meaning var
  # parse again as variable, dec pc, clear args
  dec pc
  args = 0
  (args, pc) = self."decode_args"(im, pc, args, "v")
  unless pass goto done
    .local string var
    $S1 = args[0]
    var = self."emit_get"($S1, 0)
    $S0 = "\tinc "
    $S0 .= var
    $S0 .= "\n"
    self."code"($S0)
    self."emit_store"($S1, var)
done:
  .return (args, pc, 0, 0)
.end

##########
.sub zop_quit method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  unless pass goto done
    self."code"("\tend\n")
  done:
  .return (args, pc, 1, 0)
.end

##########
# CALL / RETURN
##########
# call addr [args..] store

.sub zop_call method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass
  .local int locals

  .local int var

  ##unless pass goto no1
  ##trace 1
  ##no1:
  # get variable for result storage
  (args, pc) = self."decode_args"(im, pc, args, "v")
  # remember sub at args[0] for decoding
  .local int adr, start, n, i
  adr = args[0]
  adr = self."packed_addr"(adr)
  start = adr
  args[0] = adr
  locals = im[adr]
  adr += 1
  locals *= 2	# 1 word per local
  adr += locals
  self."remember_sub"(adr, start)
  unless pass goto done
    $I0 = 0
    .local string result
    result = self."temp"()
    $S0 = "\t"
    $S0 .= result
    $S0 .= " = R"
    $S1 = to_hex(adr)
    $S0 .= $S1
    $S0 .= "("
    n = elements args
    dec n
    i = 1
arg_loop:
    if i >= n goto end_args
      $S1 = args[i]
      $S0 .= $S1
      $I1 = n - 1
      if i >= $I1 goto no_comm
      $S0 .= ", "
  no_comm:
      inc i
      goto arg_loop
end_args:
    $S0 .= ")\n"
    self."code"($S0)
    .local string var
    $I0 = n
    #dec $I0
    var = args[$I0]
    self."emit_store"(var, result)
done:
  .return (args, pc, 0, 0)
.end

##########
.sub zop_ret method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  unless pass goto done
    .local int val
    val = args[0]
    $S0 = "\t.return("
    $S1 = val
    $S0 .= $S1
    $S0 .= ")\n"
    self."code"($S0)
  done:
  .return (args, pc, 1, 0)
.end

##########
.sub zop_rtrue method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  unless pass goto done
    self."code"("\t.return(1)\n")
  done:
  .return (args, pc, 1, 0)
.end

##########
.sub zop_rfalse method
  .param pmc im
  .param int pc
  .param pmc args
  .param int pass

  unless pass goto done
    self."code"("\t.return(0)\n")
  done:
  .return (args, pc, 1, 0)
.end

