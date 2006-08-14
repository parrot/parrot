
=head1 TITLE

parse.pir - Parsing support subroutines for [expr] 

=cut

.sub 'quoted_literal'
    .param pmc mob
    .param pmc adverbs :named :slurpy

    .local string target
    .local pmc mfrom, mpos
    .local int pos
    (mob, pos, target, mfrom, mpos) = mob.'new'(mob)

    .local int capt, len, litfrom
    capt = 0
    len  = length target

    .local string char
outer_loop:
    if pos >= len goto fail
    char = substr target, pos, 1
    if char == '"' goto end
    if char == '[' goto command
    if char == '$' goto variable

literal:
    litfrom = pos
    inc pos
literal_loop:
    if pos >= len goto fail
    char = substr target, pos, 1
    if char == '"' goto literal_end
    if char == '[' goto literal_end
    if char == '\' goto backspace
    inc pos
    goto literal_loop

backspace:
    pos += 2
    goto literal_loop

literal_end:
    $I0 = pos - litfrom
    $S0 = substr target, litfrom, $I0
    ($P0, $P1, $P2, $P3, $P4) = mob.'new'(mob)
    $P3 = litfrom
    $P4 = pos
    $P0.'value'($S0)
    $P0['type'] = 'str'
    mob[capt] = $P0
    inc capt
    goto outer_loop

command:
    mpos = pos
    inc pos
    $P0 = 'subcommand'(mob)
    $P0['type'] = 'subcommand'
    mob[capt]   = $P0
    inc capt
    pos = $P0.to()
    goto outer_loop

variable:
    mpos = pos
    inc pos
    $P0 = 'variable'(mob)
    unless $P0 goto literal
    $P0['type'] = 'variable'
    mob[capt]   = $P0
    inc capt
    pos = $P0.to()
    goto outer_loop

end:
    mpos = pos
    .return(mob)

fail:
    mpos = -1
    .return(mob)
.end

.sub 'invalid_octal'
    .param pmc mob
    .param pmc adverbs :named :slurpy

    $S0 = mob
    $S0 = 'expected integer but got "' . $S0
    $S0 = $S0 . '" (looks like invalid octal number)'
    
    .throw($S0)
.end

.sub 'unknown_math_function'
    .param pmc mob
    .param pmc adverbs :named :slurpy

    $S0 = mob[0]
    $S0 = 'unknown math function "' . $S0
    $S0 = $S0 . '"'

    .throw($S0)
.end

.sub 'syntax_error'
    .param pmc    mob
    .param string msg
    .param pmc    adverbs :named :slurpy
    
    .local pmc target
    target = getattribute mob, '$.target'
    
    $P0 = new 'TclString'
    $P0 = 'syntax error in expression "'
    $P0 .= target
    $P0 .= '": '
    $P0 .= msg

    .throw($P0)
.end

.sub 'syntax_error_variable_or_function'
    .param pmc    mob
    .param pmc    adverbs :named :slurpy
    
    .local string target
    $P0 = getattribute mob, '$.target'
    target = $P0
    
    .local string msg
    msg = 'the word "'
    msg .= target
    msg .= '" requires a preceding $ if '
    msg .= "it's a variable or function arguments if it's a function"

    .return syntax_error(mob, msg, adverbs)
.end
