#!../../parrot
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id: /parrot/offline/t/compilers/pge/p6regex/01-regex.t 1716 2006-11-02T13:46:07.645128Z coke  $

=head1 NAME

languages/tcl/t/internal/select_switches.t

=head1 DESCRIPTION

Excercise select_switches() - this sub handles switch parsing for various
builtins.

=head1 SYNOPSIS

 % prove t/internal/select_switches.t

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub main :main
    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc plan, ok, is

    plan      = find_global 'Test::More', 'plan'
    ok        = find_global 'Test::More', 'ok'
    is        = find_global 'Test::More', 'is'

    load_bytecode 'languages/tcl/runtime/tcllib.pir'

    plan(27)
    .local string message

    # 1
    message = 'does select_switches() exist in _tcl'
    .local pmc select_switches
    select_switches  = get_root_global ['_tcl'], 'select_switches'
    if select_switches goto ok_1
nok_1:
    ok(0,message)
    end # not much point in doing anything else...
ok_1:
    ok(1,message)
done_1:

    # Setup options
    .local pmc options, argv
    options = new .ResizablePMCArray
    options[0] = 'baz'
    options[1] = 'bob'
    options[2] = 'joe'

    # 2-5
    argv = new .ResizablePMCArray
    argv[0] = '-joe'
    argv[1] = 'what'
    message='exact match, single, leftover args' 
    $P1 = select_switches(options, argv)

    $I1 = $P1['joe']
    $S1 = message . ' (value of switch key)'
    is ($I1, 1, $S1)

    $I1 = elements $P1
    $S1 = message . ' (no other options set)'
    is ($I1, 1, $S1)

    $I1 = elements argv
    $S1 = message . ' (only one argv left)'
    is ($I1, 1, $S1)

    $S0 = argv[0]
    $S1 = message . ' (value of remaining argv)'
    is ($S0, 'what', $S1)

    # 6-8
    argv = new .ResizablePMCArray
    argv[0] = '-joe'
    message='exact match, single, no leftover args'
    $P1 = select_switches(options, argv)

    $I1 = $P1['joe']
    $S1 = message . ' (value of switch key)'
    is ($I1, 1, $S1)

    $I1 = elements $P1
    $S1 = message . ' (no other options set)'
    is ($I1, 1, $S1)

    $I1 = elements argv
    $S1 = message . ' (no args left)'
    is ($I1, 0, $S1)

    # 9-13
    argv = new .ResizablePMCArray
    argv[0] = '-joe'
    argv[1] = '-baz'
    argv[2] = 'what'
    message='mutliple options, leftover args'
    $P1 = select_switches(options, argv)

    $I1 = $P1['joe']
    $S1 = message . ' (value of -joe key)'
    is ($I1, 1, $S1)

    $I1 = $P1['baz']
    $S1 = message . ' (value of -bar key)'
    is ($I1, 1, $S1)

    $I1 = elements $P1
    $S1 = message . ' (no other options set)'
    is ($I1, 2, $S1)

    $I1 = elements argv
    $S1 = message . ' (only one argv left)'
    is ($I1, 1, $S1)

    $S0 = argv[0]
    $S1 = message . ' (value of remaining argv)'
    is ($S0, 'what', $S1)

    # 14-17
    argv = new .ResizablePMCArray
    argv[0] = '-joe'
    argv[1] = '--'
    argv[2] = '-bob'
    message='end switch'
    $P1 = select_switches(options, argv, 1)

    $I1 = $P1['joe']
    $S1 = message . ' (value of -joe key)'
    is ($I1, 1, $S1)

    $I1 = elements $P1
    $S1 = message . ' (no other options set)'
    is ($I1, 1, $S1)

    $I1 = elements argv
    $S1 = message . ' (only one argv left)'
    is ($I1, 1, $S1)

    $S0 = argv[0]
    $S1 = message . ' (value of remaining argv)'
    is ($S0, '-bob', $S1)

    # 18-22
    argv = new .ResizablePMCArray
    argv[0] = '-joke'
    argv[1] = 'bag_o_donuts'
    message='invalid option specified, no exception'
    $P1 = select_switches(options, argv)

    $S2 = $P1['joke']
    $S1 = message . ' (value of -joke key)'
    is ($S2, '', $S1)

    $I1 = elements $P1
    $S1 = message . ' (no other options set)'
    is ($I1, 0, $S1)

    $I1 = elements argv
    $S1 = message . ' (two args left)'
    is ($I1, 2, $S1)

    $S0 = argv[0]
    $S1 = message . ' (argv[0])'
    is ($S0, '-joke', $S1)

    $S0 = argv[1]
    $S1 = message . ' (argv[1])'
    is ($S0, 'bag_o_donuts', $S1)

    # 23
    argv = new .ResizablePMCArray
    argv[0] = '-joke'
    argv[1] = 'bag_o_donuts'
    message='invalid option specified, w/ exception'

    push_eh eh_23
      $P1 = select_switches(options, argv, 0, 1)
    clear_eh
   
    $S2= ''   
    goto check_23 

eh_23: 
    get_results '(0,0)', $P2, $S2
check_23:
    is($S2, 'bad switch "-joke": must be -baz, -bob, or -joe', message)

    # 24-27
    options[2] = 'joe:s' # change this to take a value..

    argv = new .ResizablePMCArray
    argv[0] = '-joe'
    argv[1] = 'bag_o_donuts'
    argv[2] = 'what'
    message='switch with a value specified'
    $P1 = select_switches(options, argv)

    $S2 = $P1['joe']
    $S1 = message . ' (value of -joe key)'
    is ($S2, 'bag_o_donuts', $S1)

    $I1 = elements $P1
    $S1 = message . ' (no other options set)'
    is ($I1, 1, $S1)

    $I1 = elements argv
    $S1 = message . ' (only one argv left)'
    is ($I1, 1, $S1)

    $S0 = argv[0]
    $S1 = message . ' (value of remaining argv)'
    is ($S0, 'what', $S1)

.end
