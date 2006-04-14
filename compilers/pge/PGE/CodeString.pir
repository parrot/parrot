=head1 NAME

PGE::CodeString - object to build (PIR) code segments

=head1 DESCRIPTION

=cut

.include 'cclass.pasm'

.namespace [ "PGE::CodeString" ]

.sub "__onload" :load
    $P0 = getclass "String"
    $P1 = subclass $P0, "PGE::CodeString"

    $P0 = new .Integer
    $P0 = 10
    store_global "PGE::CodeString", "$!serno", $P0
    .return ()
.end


.sub "emit" :method
    .param string fmt
    .param pmc args            :slurpy
    .param pmc hash            :slurpy :named
    .local int pos
    .local string key, repl

    fmt = clone fmt
    pos = 0
  emit_loop:
    pos = index fmt, '%', pos
    if pos < 0 goto end
    $I1 = pos + 1
    key = substr fmt, $I1, 1
    $I0 = exists hash[key]
    if $I0 goto hash_arg
    $I0 = is_cclass .CCLASS_NUMERIC, fmt, $I1
    if $I0 goto args_arg
    if key == ',' goto comma_arg
    if key == '%' goto percent
    goto emit_next
  comma_arg:
    repl = args[0]
    repl = clone repl
    $I1 = elements args
    $I0 = 1
  comma_arg_loop:
    if $I0 >= $I1 goto fmt_arg
    $S0 = args[$I0]
    concat repl, ', '
    concat repl, $S0
    inc $I0
    goto comma_arg_loop
  percent:
    repl = '%'
    goto fmt_arg
  hash_arg:
    repl = hash[key]
    goto fmt_arg
  args_arg:
    $I0 = key
    repl = args[$I0]
  fmt_arg:
    substr fmt, pos, 2, repl
  emit_next:
    pos += 2
    goto emit_loop
  end:
    self .= fmt
    self .= "\n"
    .return ()
.end


.sub 'unique' :method
    .param string fmt          :optional
    .param int has_fmt         :opt_flag

    if has_fmt goto unique_1
    fmt = ''
  unique_1:
    $P0 = find_global "PGE::CodeString", "$!serno"
    $S0 = $P0
    $S0 = concat fmt, $S0
    inc $P0
    .return ($S0)
.end


