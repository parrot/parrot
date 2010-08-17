#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/key.t - Keys

=head1 SYNOPSIS

    % prove t/pmc/key.t

=head1 DESCRIPTION

Tests the C<Key> PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(9)

    traverse_key_chain()
    extract_int_from_string_keys()
    extract_string_from_int_keys()
    use_number_keys()
    do_not_collect_string_keys_early_rt_60128()
.end

.sub traverse_key_chain
    .local string result
    result = ''

    new $P0, ['Key']
    set $P0, "1"
    new $P1, ['Key']
    set $P1, "2"
    push $P0, $P1
    new $P2, ['Key']
    set $P2, "3"
    push $P1, $P2

    set $P4, $P0
l1:
    defined $I0, $P0
    unless $I0, e1
    $S0 = $P0
    result .= $S0
    shift $P0, $P0
    branch l1
e1:
    is( result, '123', 'traverse key chain' )

    result = ''
    set $P0, $P4
l2:
    defined $I0, $P0
    unless $I0, e2
    $S0 = $P0
    result .= $S0
    shift $P0, $P0
    branch l2
e2:
    is( result, '123', 'traverse second key chain' )
.end

.sub extract_int_from_string_keys
    new $P0, ['ResizableStringArray']
    push $P0, 'ok1'
    push $P0, 'ok2'
    set $S0, 0
    set $P1, $P0[$S0]
    is( $P1, 'ok1', 'retrieve key is number as string' )
    set $P1, $P0["1"]
    is( $P1, 'ok2', 'retrieved key is number as str const' )
.end

.sub extract_string_from_int_keys
    new $P0, ['Hash']
    set $P0['1'], 'ok1'
    set $P0['2'], 'ok2'
    set $I0, 1
    set $P1, $P0[$I0]
    is( $P1, 'ok1', 'retrieve key is int, set key was str const' )
    set $P1, $P0[2]
    is( $P1, 'ok2', 'retrieve key is const int, set key was str const' )
.end

.sub use_number_keys
    .local pmc hash, key
    .local string foo

    hash = new ['Hash']
    key  = new ['Key']

    key = 1.234
    is(key, "1.234", "number-valued Key stringification works")

    hash[key] = "FOO"
    foo = hash[key]
    is(foo, "FOO", "set/get via number-valued Key works")
.end


.sub do_not_collect_string_keys_early_rt_60128
    .local pmc proc, a
    proc = get_root_global [ 'tcl' ], '&proc'
    proc()
    a = get_root_global [ 'tcl' ], '&a'
    a()
    collect
    a()
    ok(1, 'register and non-register string keys should be COW' )
.end

# support for do_not_collect_string_keys_early_rt_60128
.HLL 'tcl'
.namespace []

.sub '&info'
iterate:
  .local pmc call_chain, lexpad
  call_chain = get_root_global ['_tcl'], 'call_chain'
  lexpad     = call_chain[-1]
  .local pmc    iterator
  .local string elem
  iterator = iter lexpad
loop:
  unless iterator goto end
  elem = shift iterator
  $S0 = replace elem, 0, 1, ''
  goto loop
end:
  .return('')
.end

.sub '&proc'

 $S0 = <<'code'
.namespace []
.sub 'xxx' :anon
  .local pmc call_chain, lexpad
  call_chain = get_root_global ['_tcl'], 'call_chain'
  lexpad = new ['Hash']
  push call_chain, lexpad
  .local pmc arg_list
  arg_list = new ['ResizablePMCArray']
  lexpad['args'] = arg_list
    $P14 = find_name "&info"
    $P14()
  $P0 = pop call_chain
  .return('')
.end
code

  .local pmc pir_compiler
  pir_compiler = compreg 'PIR'
  $P0 = pir_compiler($S0)
  $P0 = $P0[0]
  $P1 = new ['TclProc']
  assign $P1, $P0
  .local pmc ns_target
  ns_target = get_hll_namespace
  ns_target['&a'] = $P1
.end

.HLL '_Tcl'
.namespace []

.sub prepare_lib :init
  $P0 = get_class 'Sub'
  $P1 = subclass $P0, 'TclProc'
  $P1 = new ['ResizablePMCArray']
  set_global 'call_chain', $P1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
