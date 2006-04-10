=head1 NAME

PGE::CodeString - object to build (PIR) code segments

=head1 DESCRIPTION

=cut

.namespace [ "PGE::CodeString" ]

.sub "__onload" :load
    $P0 = getclass "String"
    $P1 = subclass $P0, "PGE::CodeString"
    .return ()
.end


.sub "emit" :method
    .param string fmt
    .param pmc args            :slurpy
    .local int argc, pos

    fmt = clone fmt
    argc = elements args
  emit_1:
    dec argc
    if argc < 0 goto end
    $S0 = argc
    $S0 = concat '%', $S0
    $I0 = length $S0
    pos = 0
  emit_2:
    pos = index fmt, $S0, pos
    if pos < 0 goto emit_1
    $S1 = args[argc]
    substr fmt, pos, $I0, $S1
    $I1 = length $S1
    pos += $I1
    goto emit_2
  end:
    self .= fmt
    self .= "\n"
    .return ()
.end


