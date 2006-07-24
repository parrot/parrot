
=head1 TITLE

parse.pir - Parsing support subroutines for [expr] 

=cut

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
