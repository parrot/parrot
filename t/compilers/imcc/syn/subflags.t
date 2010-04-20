#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/imcc/syn/subflags.t

=head1 SYNOPSIS

    % prove t/compilers/imcc/syn/subflags.t

=head1 DESCRIPTION

test flags on PIR subs

=cut

.namespace ['FlagTest']

.sub 'main' :main
    load_bytecode 'Test/More.pbc'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_hll_namespace ['Test';'More']
    exports        = split ' ', 'plan diag ok nok is todo isa_ok'
    test_namespace.'export_to'(curr_namespace, exports)

    ##  set our plan
    plan(27)

    .local pmc pmcnull
    null pmcnull

    ## normal (unflagged) subs
    .const 'Sub' $P0 = 'normal1'
    isa_ok($P0, 'Sub', "sub found w/.const")
    $P1 = get_global 'normal1'
    is_same($P0, $P1, "namespace entry same as const")
    $S0 = $P1()
    is($S0, 'normal1', "sub executable from namespace entry")
    $S0 = 'normal1'()
    is($S0, 'normal1', "sub executable from name")

    ## :anon subs
    .const 'Sub' $P10 = 'anon1'
    isa_ok($P10, 'Sub', ":anon sub found w/.const")
    $P11 = get_global 'anon1'
    is_same($P11, pmcnull, ":anon sub not found in namespace")
    $S0 = $P10()
    is($S0, 'anon1', ':anon sub executable from .const')
    $S0 = 'anon1'()
    is($S0, 'anon1', ':anon sub executable by name')

    ## :nsentry subs
    .const 'Sub' $P20 = 'nsentry1'
    isa_ok($P20, 'Sub', ":nsentry found w/.const")
    $P21 = get_global 'nsentry1'
    isa_ok($P21, 'Sub', ":nsentry found in namespace")
    is_same($P20, $P21, ":nsentry in namespace same as const")
    $S0 = $P21()
    is($S0, 'nsentry1', "sub executable from nsentry")
    $S1 = 'nsentry1'()
    is($S1, 'nsentry1', "sub executable by name")

    ## :method subs
    .const 'Sub' $P30 = 'method1'
    isa_ok($P30, 'Sub', ":method sub found w/.const")
    $P0 = get_global 'method1'
    $I0 = isnull $P0
    ok($I0, ":method sub not found in namespace")

    ## :subid subs
    .const 'Sub' $P40 = 'subid1'
    isa_ok($P40, 'Sub', ':subid found w/.const')
    $P0 = get_global 'subid1'
    $I0 = isnull $P0
    ok($I0, ":subid not found in namespace")
    $P0 = get_global '_subid1_'
    $I0 = issame $P40, $P0
    ok($I0, ":subid found under sub's name in namespace")

    ## test all flags
    .const 'Sub' $P50 = 'subid2'
    isa_ok($P50, 'Sub', 'subid2 found w/.const')
    $P0 = get_global 'subid2'
    $I0 = isnull $P0
    ok($I0, "subid2 not found in namespace")
    $P0 = get_global 'nsentry2'
    $I0 = issame $P50, $P0
    ok($I0, "nsentry2 found in namespace")
    $P0 = get_global 'method2'
    $I0 = isnull $P0
    ok($I0, "method2 not found in namespace")

    ## unicode nsentry
    .const 'Sub' $P60 = 'subid3'
    isa_ok($P60, 'Sub', 'subid3 found w/.const')
    $P0 = get_global unicode:"nsentry\u2462"
    $I0 = issame $P60, $P0
    ok($I0, "nsentry3 found in namespace")

    ## subid from a different namespace
    push_eh subid4_err
    .const 'Sub' $P70 = 'subid4'
    goto subid4_done
  subid4_err:
    $P70 = new 'Undef'
  subid4_done:
    pop_eh
    $I0 = isa $P70, 'Sub'
    ok($I0, 'subid4 in another ns found w/.const')

    ## find multis via subid
    .const 'Sub' $P0 = 'above'
    $P0(3)
    ok(1, "multi found via subid 'above'")
    .const 'Sub' $P1 = 'below'
    $P1('3')
    ok(1, "multi found via subid 'below'")
.end

.sub 'xyz' :multi(Integer) :subid('above')
    .return('xyz above')
.end

.sub 'xyz' :multi(String) :subid('below')
    .return('xyz below')
.end

.sub 'is_same'
    .param pmc x
    .param pmc y
    .param string msg
    $I0 = issame x, y
    'ok'($I0, msg)
.end

.sub 'isnt_same'
    .param pmc x
    .param pmc y
    .param string msg
    $I0 = issame x, y
    'nok'($I0, msg)
.end


.sub 'normal1'
    .return ('normal1')
.end


.sub 'anon1' :anon
    .return ('anon1')
.end


.sub 'nsentry1' :nsentry
    .return ('nsentry1')
.end


.sub 'method1' :method
    .return ('method1')
.end


.sub '_subid1_' :subid('subid1')
    .return ('subid1')
.end


.sub 'anon2' :nsentry('nsentry2') :method('method2') :subid('subid2')
    .return ('anon2')
.end


.sub 'anon3' :nsentry(unicode:"nsentry\u2462") :subid('subid3')
    .return ('anon3')
.end

.namespace ['OtherNameSpace']

.sub 'anon4' :subid('subid4')
    .return ('anon4')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
