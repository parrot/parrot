#!../../parrot
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

languages/tcl/t/internal/select_option.t

=head1 DESCRIPTION

Excercise select_options() - the feature that lets us specify, for example
[string triml] instead of [string trimleft].

=head1 SYNOPSIS

    % prove t/internal/select_option.t

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

    plan(6)
    .local string message

    # 1
    message = 'does select_option() exist in _tcl'
    .local pmc select_option
    select_option  = get_root_global ['_tcl'], 'select_option'
    if select_option goto ok_1
nok_1:
    ok(0,message)
    goto done_1
ok_1:
    ok(1,message)
done_1:

    # Setup options
    .local pmc options
    options = new .ResizablePMCArray
    options[0] = 'dank'
    options[1] = 'dark'
    options[2] = 'dunk'

    # 2
    message='exact match' 
    $S1 = select_option(options,'dark')
    is($S1,"dark",message)

    # 3
    message='no match' 
    push_eh eh_3
      $S1 = select_option(options,'punk')
    clear_eh
    $S2 = ''
    goto check_3
eh_3:
    get_results '(0,0)', $P2, $S2
check_3:
    $S3 = 'bad option "punk": must be dank, dark, or dunk'
    is($S2,$S3,message)

    # 4
    message='no match' 
    push_eh eh_4
      $S1 = select_option(options,'da')
    clear_eh
    $S2 = ''
    goto check_4
eh_4:
    get_results '(0,0)', $P2, $S2
check_4:
    $S3 = 'ambiguous option "da": must be dank, dark, or dunk'
    is($S2,$S3,message)

    # 5
    message='no match (alt name)'
    push_eh eh_5
      $S1 = select_option(options,'punk','coke')
    clear_eh
    $S2 = ''
    goto check_5
eh_5:
    get_results '(0,0)', $P2, $S2
check_5:
    $S3 = 'bad coke "punk": must be dank, dark, or dunk'
    is($S2,$S3,message)

    # 6
    message='no match' 
    push_eh eh_6
      $S1 = select_option(options,'da','particle')
    clear_eh
    $S2 = ''
    goto check_6
eh_6:
    get_results '(0,0)', $P2, $S2
check_6:
    $S3 = 'ambiguous particle "da": must be dank, dark, or dunk'
    is($S2,$S3,message)
    
.end
