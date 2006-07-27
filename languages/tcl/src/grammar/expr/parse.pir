
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
    mob[capt] = $P0
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
