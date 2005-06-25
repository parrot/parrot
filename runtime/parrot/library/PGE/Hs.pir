=head1 Title

PGE::Hs - Match and display PGE rules as Haskell expressions

=head1 SYNOPSIS

(You need to run C<make PGE-Hs.pbc> in F<compilers/pge> first.)

    .sub _main
        load_bytecode "PGE-Hs.pbc"
        $P0 = find_global "PGE::Hs", "match"
        $S0 = $P0("Hello", "(...)*$")
        print $S0   # PGE_Match 2 5 [PGE_Array [PGE_Match 2 5 [] []]] []
    .end

=head1 DESCRIPTION

The Haskell-side data structure is defined thus:

    data MatchPGE
        = PGE_Match Int Int [MatchPGE] [(String, MatchPGE)]
        | PGE_Array [MatchPGE]
        | PGE_Fail
        deriving (Show, Eq, Ord, Read)

This F<PGE-Hs.pbc> is built separately (not by default).  The reason is
because it's intended to be bundled with Pugs, so as to make Pugs usable
with vanilla Parrot from 0.2.0 on, using either an external F<parrot>
executable, or a linked F<libparrot>.

In external F<parrot> mode, Parrot's include path looks into the
F<.pbc> files inside the library tree first, then look into the current
directory, F<.>.  Hence this file includes, rather than loads, the
F<PGE.pbc> library, because if Pugs is shipped with its own copy
of F<PGE.pbc>, Parrot would ignore that file and prefer to load
the one in the Parrot tree instead.

Granted, it is possible to pass in Pugs's own library path into an
environment variable (maybe C<PARROT_LIBS>?), but as this was not in
the 0.2.0 release, I (autrijus) decided to take the easy route. :-)

=head1 CAVEATS

This is an initial sketch.  The dump format may change, and the
whole thing may be taken out or refactored away at any moment.

=cut

.namespace [ "PGE::Hs" ]

.const string PGE_FAIL = "PGE_Fail"
.const string PGE_SUB_POS = "@:capt"
.const string PGE_SUB_NAMED = "%:capt"

.sub "__onload" @LOAD
    .local pmc load
    load_bytecode "library/Data/Escape.imc"
.end

.sub "add_rule" method
    .param string name
    .param string pattern
    .local pmc p6rule_compile, rulesub

    find_global p6rule_compile, "PGE", "p6rule"
    null rulesub
    rulesub = p6rule_compile(pattern)
    store_global name, rulesub

    .return (name)
.end

.sub "match" method
    .param string x
    .param string pattern
    .local string out, tmps
    .local pmc rulesub
    .local pmc match
    .local pmc p6rule_compile
    .local pmc capt

    find_global p6rule_compile, "PGE", "p6rule"
    null rulesub

    push_eh match_error
    rulesub = p6rule_compile(pattern)
    match = rulesub(x)

  match_result:
    unless match goto match_fail
    tmps = match."dump_hs"()
    out .= tmps
    goto end_match

  match_fail:
    out = PGE_FAIL
    goto end_match

  match_error:
    out = P5

  end_match:
    out .= "\n"

    .return (out)
.end

.namespace [ "PGE::Match" ]

.sub "dump_hs" method
    .local string out
    .local int spi, spc
    .local int ari, arc
    .local int tmpi, cond
    .local string tmps, key
    .local pmc capt, iter, subelm, elm, escape, is_array

    out = ""
    escape = find_global "Data::Escape", "String"

  start:
    out .= "PGE_Match "
    tmpi = self."from"()
    tmps = tmpi
    out .= tmps
    out .= " "
    tmpi = self."to"()
    tmps = tmpi
    out .= tmps
    out .= " ["

  subpats:
    capt = getattribute self, PGE_SUB_POS
    isnull capt, subrules
    spi = 0
    spc = elements capt
    goto subpats_body
  subpats_loop:
    unless spi < spc goto subrules
    out .= ", "
  subpats_body:
    cond = defined capt[spi]
    unless cond goto subpats_fail
    elm = capt[spi]
    bsr dumper
    inc spi
    goto subpats_loop
  subpats_fail:
    out .= PGE_FAIL
    inc spi
    goto subpats_loop

  subrules:
    out .= "] ["
    capt = getattribute self, PGE_SUB_NAMED
    isnull capt, end
    iter = new Iterator, capt
    iter = 0
    goto subrules_body
  subrules_loop:
    unless iter goto end
    out .= ", "
  subrules_body:
    key = shift iter
    cond = defined capt[key]
    unless cond goto subrules_fail
    elm = capt[key]
    out .= '("'
    tmps = escape(key)
    out .= tmps
    out .= '", '
    bsr dumper
    out .= ")"
    goto subrules_loop
  subrules_fail:
    out .= PGE_FAIL
    key = shift iter
    goto subrules_loop

  dumper:
    ari = 0
    arc = elements elm
    is_array = getprop "isarray", elm
    if is_array goto dumper_array
    unless ari < arc goto dumper_fail
    subelm = elm[-1]
    tmps = subelm."dump_hs"()
    out .= tmps
    ret
  dumper_fail:
    out .= PGE_FAIL
    ret
  dumper_done:
    out .= "]"
    ret
  dumper_array:
    out .= "PGE_Array ["
    unless ari < arc goto dumper_done
    goto dumper_array_body
  dumper_array_loop:
    unless ari < arc goto dumper_done
    out .= ", "
  dumper_array_body:
    subelm = elm[ari]
    tmps = subelm."dump_hs"()
    out .= tmps
    inc ari
    goto dumper_array_loop

  end:
    out .= "]"
    .return (out)
.end
