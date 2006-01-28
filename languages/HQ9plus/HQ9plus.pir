# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

HQ9plus.pasm - Mmmm, beer good

=head1 SYNOPSIS

    % ../../parrot HQ9plus.pbc t/basic_1.HQ9plus

=head1 DESCRIPTION

A non turing complete languages for a change.

=head1 HISTORY

Derived from 99beer.pasm.

=head1 TODO

Use store_global and find_global for accessing the code and the accumulator.

=head1 AUTHOR

Bernhard Schmalhofer . L<Bernhard.Schmalhofer@gmx.de>

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/HQ9%2B>,
L<http://www.cliff.biffle.org/esoterica/hq9plus.html>

=cut

.sub main :main
    .param pmc argv

    # the program name is the first element in argv
    .local string program_fn
    program_fn = shift argv
    .local string code_fn
    code_fn = shift argv

    # Get the input as a string, don't care about buffer overflow yet
    .local pmc code_fh
    code_fh = open code_fn, '<'
    .local string code_string, code_string_orig
    code_string = read code_fh, 1000
    concat code_string_orig, code_string

    .local int accumulator

    # no exceeption when a sub is not found
    .include "errors.pasm"
    errorsoff .PARROT_ERRORS_GLOBALS_FLAG

    .local string op_char
    .local pmc    op_sub
    SHIFT_NEXT_OP:
    op_char = substr code_string, 0, 1, ''
    unless op_char goto FINISH_SHIFT_OPS
        op_sub = find_global "HQ9plus", op_char
        I0 = defined op_sub
        unless I0 goto OP_NOT_FOUND
            accumulator = op_sub( code_string_orig, accumulator )
            goto SHIFT_NEXT_OP 
        OP_NOT_FOUND:
            print op_char
            print " not found\n"
            goto SHIFT_NEXT_OP 
    FINISH_SHIFT_OPS:

.end

.namespace ["HQ9plus"]

.sub '9'
    .param string code_string
    .param int    accumulator

    set I1, 99 # bottles of beer
    set I2, 1  # single bottle
    
    set S1, " of beer on the wall,\n"
    set S2, " of beer,\n"
    set S3, "Take one down, pass it around,\n"
    set S4, " of beer on the wall.\n\n"
    
    set S5, " bottle"
    set S6, " bottles"
    
    set S7, "No more bottles of beer on the wall.\n\n"
    
    set S8, "*Buuurrp*\n"
    
    branch N_BOTTLES # start drinking
    
    N_BOTTLES:
            print I1
            print S6
            print S1
            print I1
            print S6
            print S2
            print S3
            dec I1
            eq I1, I2, BOTTLE_OF # Aww, we're getting low
            print I1
            print S6
            print S4
            ne I1, I2, N_BOTTLES # keep on drinking
    
    BOTTLE_OF:
            print I1
            print S5
            print S4
            branch ONE_BOTTLE # 'bout time for a liver transplant
    
    ONE_BOTTLE: # it's been fun
            print I1
            print S5
            print S1
            print I1
            print S5
            print S2
            print S3
            print S7
            print S8

    .return( accumulator )
.end

.sub 'H'
    .param string code_string
    .param int    accumulator

    print "Hello, world!\n"

    .return( accumulator )
.end


.sub 'Q'
    .param string code_string
    .param int    accumulator

    print code_string

    .return( accumulator )
.end

.sub '+'
    .param string code_string
    .param int    accumulator

    inc accumulator

    .return( accumulator )
.end
