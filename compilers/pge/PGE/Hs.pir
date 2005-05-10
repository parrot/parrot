=head1 Title

PGE::Hs - Match and display PGE rules as Haskell expressions

=head1 SYNOPSIS

    .sub _main
        load_bytecode "PGE.pbc"
        $P0 = find_global "PGE::Hs", "match"
        $S0 = $P0("Hello", "(...)*$")
        print $S0   # PGE_Match 2 5 [PGE_Array [PGE_Match 2 5 [] []]] []
    .end

=head1 CAVEATS

This is an initial sketch.  The dump format may change, and the
whole thing may be taken out or refactored away at any moment.

The Haskell-side data structure is defined thus:

    data MatchPGE
        = PGE_Match !Int !Int ![MatchPGE] ![(String, MatchPGE)]
        | PGE_Array ![MatchPGE]
        | PGE_Fail
        deriving (Show, Eq, Ord, Read)

=cut

.namespace [ "PGE::Hs" ]

.const string PGE_FAIL = "PGE_Fail"

.sub "__onload" @LOAD
    .local pmc load
    load = find_global "PGE::TokenHash", "__onload"
    load()
    load = find_global "PGE::Exp", "__onload"
    load()
    load = find_global "PGE::Match", "__onload"
    load()
    load = find_global "PGE::P6Rule", "__onload"
    load()
    load_bytecode "library/Data/Escape.pbc"
.end

.sub "match" method
    .param string x
    .param string pattern
    .local string out
    .local pmc rulesub
    .local pmc match
    .local pmc p6rule_compile
    .local pmc capt

    find_global p6rule_compile, "PGE", "p6rule"
    null rulesub

    rulesub = p6rule_compile(pattern)
    match = rulesub(x)
  match_result:
    unless match goto match_fail
    $S0 = match."dump_hs"()
    concat out, $S0
    goto end_match
  match_fail:
    out = PGE_FAIL
    goto end_match
  end_match:
    concat out, "\n"
    .return (out)
.end

.namespace [ "PGE::Match" ]

.sub "dump_hs" method
    .local string out
    .local int spi, spc
    .local int ari, arc
    .local pmc capt, iter, elm, escape

    out = ""
    escape = find_global "Data::Escape", "String"

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
    isnull capt, subrules
    spi = 0
    spc = elements capt
    goto subpats_body
  subpats_loop:
    unless spi < spc goto subrules
    concat out, ", "
  subpats_body:
    $S0 = spi
    $I0 = defined capt[spi]
    unless $I0 goto subpats_fail
    elm = capt[spi]
    bsr dumper
    inc spi
    goto subpats_loop
  subpats_fail:
    concat out, PGE_FAIL
    inc spi
    goto subpats_loop

  subrules:
    concat out, "] ["
    capt = getattribute self, "PGE::Match\x0%:capt"
    isnull capt, end
    iter = new Iterator, capt
    iter = 0
    goto subrules_body
  subrules_loop:
    unless iter goto end
    concat out, ", "
  subrules_body:
    $S0 = shift iter
    $I0 = defined capt[$S0]
    unless $I0 goto subrules_fail
    elm = capt[$S0]
    concat out, "(\""
    $S0 = escape($S0)
    concat out, $S0
    concat out, "\", "
    bsr dumper
    concat out, ")"
    goto subrules_loop
  subrules_fail:
    concat out, PGE_FAIL
    $S0 = shift iter
    goto subrules_loop

  dumper:
    ari = 0
    arc = elements elm
    $P1 = getprop "isarray", elm
    if $P1 goto dumper_array
    unless ari < arc goto dumper_fail
    $P1 = elm[-1]
    $S0 = $P1."dump_hs"()
    concat out, $S0
  dumper_end:
    ret
  dumper_fail:
    concat out, PGE_FAIL
    ret
  dumper_done:
    concat out, "]"
    ret
  dumper_array:
    concat out, "PGE_Array ["
    unless ari < arc goto dumper_done
    goto dumper_array_body
  dumper_array_loop:
    unless ari < arc goto dumper_done
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

.include "PGE/TokenHash.pir"
.include "PGE/Exp.pir"
.include "PGE/Match.pir"
.include "PGE/P6Rule.pir"
