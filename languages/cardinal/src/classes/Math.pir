## $Id$

=head1 TITLE

Math - Cardinal Math class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Math class

=cut

.namespace ['Math']


.const num PI = 3.14159265358979

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('Math', 'parent'=>'', 'attr'=>'')
    #cardinalmeta = $P0.'HOW'()
    #set_hll_global ['Math'], '!CARDINALMETA', cardinalmeta

    #.local pmc math_clazz, base_clazz
    #base_clazz = class $P0
    ###newclass math_clazz, 'Math'
    ###math_clazz.'add_parent'(base_clazz)
    #get_class $P0, "CardinalObject"
    #subclass math_clazz, $P0, "Math"
    #set_hll_global ['Math'], '!CARDINALMETA', math_clazz


.end

#=item WHENCE()
#
#Return the invocant's auto-vivification closure.
#
#=cut
#.sub 'WHENCE' :method
#    $P0 = self.'WHAT'()
#    $P1 = $P0.'WHENCE'()
#    .return ($P1)
#.end

.sub 'get_bool' :vtable
    .return (1)
.end

.sub 'initialize' :method
     noop
.end

.sub 'get_string' :vtable
   $S0 = 'Math'
   .return ($S0)
.end

.sub 'cos' :method
    .param num arg
    cos $N0, arg
    .return ($N0)
.end

.sub 'sin' :method
    .param num arg
    sin $N0, arg
    .return ($N0)
.end

.sub 'acos' :method
    .param num arg
    acos $N0, arg
    .return ($N0)
.end

.sub 'asin' :method
   .param num arg
   asin $N0, arg
   .return ($N0)
.end

.sub 'asec' :method
   .param num arg
   asec $N0, arg
   .return ($N0)
.end

.sub 'atan' :method
   .param num arg
   atan $N0, arg
   .return ($N0)
.end

.sub 'cosh' :method
    .param num arg
    cosh $N0, arg
    .return ($N0)
.end

.sub 'sinh' :method
    .param num arg
    sinh $N0, arg
    .return ($N0)
.end

.sub 'sech' :method
    .param num arg
    sech $N0, arg
    .return ($N0)
.end

.sub 'tanh' :method
    .param num arg
    tanh $N0, arg
    .return ($N0)
.end

.sub 'log' :method
    .param num arg
    log2 $N0, arg
    .return ($N0)
.end

.sub 'log10' :method
    .param num arg
    log10 $N0, arg
    .return ($N0)
.end

.sub 'sqrt' :method
    .param num arg
    sqrt $N0, arg
    .return ($N0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
