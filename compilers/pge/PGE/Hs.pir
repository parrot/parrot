=head1 Title

PGE::Hs - Match and display PGE rules as Haskell expressions

=head1 SYNOPSIS

    .sub _main
        load_bytecode "PGE.pbc"
        $P0 = find_global "PGE::Hs", "match"
        $S0 = $P0("Hello\n", "H(.)llo(.)")
        print $S0   # Just (PGE_Match 0 6 [PGE_Match 1 2 []], PGE_Match 5 6 []]])
    .end

=head1 CAVEATS

This is an initial skecth.  The dump format may change, and the
whole thing may be taken out or refactored away at any moment.

=cut

.namespace [ "PGE::Hs" ]

.sub "__onload" 
.end

.sub "match" method
    .param string x
    .param string pattern
    .local pmc rulesub
    .local pmc match
    .local pmc p6rule_compile
    .local pmc capt
    .local string out

    find_global p6rule_compile, "PGE", "p6rule"
    null rulesub

    rulesub = p6rule_compile(pattern)
    match = rulesub(x)
  match_result:
    unless match goto match_fail
    out = "Just ("
    $S0 = match."dump_hs"()
    concat out, $S0
    concat out, ")\n"
    goto end_match
  match_fail:
    out = "Nothing\n"
    goto end_match
  end_match:
    .return (out)
.end

.namespace [ "PGE::Match" ]

.sub "dump_hs" method
    .local pmc capt, iter, elm
    .local int spi, spc
    .local int ari, arc
    .local string out

    out = ""

  start:
    concat out, "PGE_Match "
    $I0 = self."from"()
    $S0 = $I0
    concat out, $S0
    concat out, " "
    $I0 = self."to"()
    $S0 = $I0
    concat out, $S0
    concat out, " ["

  subpats:
    $I0 = self
    capt = getattribute self, "PGE::Match\x0@:capt"
    isnull capt, end
    spi = 0
    spc = elements capt
    goto subpats_body
  subpats_loop:
    unless spi < spc goto end
    concat out, ", "
  subpats_body:
    $S0 = spi
    $I0 = defined capt[spi]
    unless $I0 goto subpats_2
    elm = capt[spi]
    bsr dumper
    inc spi
    goto subpats_loop

# subrules:
#   capt = getattribute self, "PGE::Match\x0%:capt"
#   isnull capt, end
#   iter = new Iterator, capt
#   iter = 0
# subrules_1:
#   unless iter goto end
#   $S0 = shift iter
#   $I0 = defined capt[$S0]
#   unless $I0 goto subrules_1
#   $P0 = capt[$S0]
#   bsr dumper
#   goto subrules_1

  dumper:
    ari = 0
    arc = elements elm
    unless ari < arc goto dumper_null
    $P1 = getprop "isarray", elm
    if $P1 goto dumper_array
    $P1 = elm[-1]
    $S0 = $P1."dump_hs"()
    concat out, $S0
  dumper_end:
    concat out, "]"
    ret
  dumper_null:
    concat out, "Match 0 0 []"
    ret
  dumper_array:
    concat out, "PGE_Match "
    $P1 = elm[0]
    $I0 = $P1."from"()
    $S0 = $I0
    concat out, $S0
    concat out, " "
    $P1 = elm[-1]
    $I0 = $P1."to"()
    $S0 = $I0
    concat out, $S0
    concat out, " ["
    goto dumper_array_body
  dumper_array_loop:
    unless ari < arc goto dumper_end
    concat out, ", "
  dumper_array_body:
    $P1 = elm[ari]
    $S0 = $P1."dump_hs"()
    concat out, $S0
    inc ari
    goto dumper_array_loop

  end:
    concat out, "]"
    .return (out)
.end
