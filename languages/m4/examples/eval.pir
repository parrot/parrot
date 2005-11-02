# $Id$

=head1 NAME

eval.imc - Integer arithmetic evaluation for Parrot m4

=head1 DESCRIPTION

Just a sample.
See languages/m4/Makefile on how to generate the needed shared lib.

=cut

.sub 'example' :main

    print "Trying to load shared library 'm4_evaluate'.\n"
    .local pmc m4_evaluate_lib
    m4_evaluate_lib = loadlib "m4_evaluate"
    if m4_evaluate_lib goto LOAD_FUNCTION
       printerr "Could not load 'm4_evaluate'.\n"     
       end

LOAD_FUNCTION:
    print "Trying to load function 'm4_evaluate'.\n"
    .local pmc m4_evaluate
    m4_evaluate = dlfunc m4_evaluate_lib, "m4_evaluate", "it"
    if m4_evaluate goto EVALUATE_CODE
       printerr "Could not load m4_evaluate.\n"     
       end

EVALUATE_CODE:
    .local string expression
    expression = '1 + 1 * 117'
    print "Evaluating expression: "
    print expression
    print "\n"
    .local int value 
    ( value ) = m4_evaluate( expression )

INVOKE_COMPILED_CODE:
    print "evaluated: "
    print value
    print "\n"

.end
