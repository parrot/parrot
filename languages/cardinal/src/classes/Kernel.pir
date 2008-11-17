## $Id$

=head1 TITLE

Kernel - Cardinal Kernel class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the kernel class

=cut

.namespace ['Kernel']

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta, kernelprototype
    load_bytecode 'P6object.pbc'
    $P0 = get_hll_global 'P6metaclass'
    kernelprototype = $P0.'new_class'('Kernel', 'attr'=>'%!properties')
    #cardinalmeta = $P0.'HOW'()
    cardinalmeta = kernelprototype.'new'()
    set_hll_global ['Kernel'], '!CARDINALMETA', cardinalmeta
    #.local pmc cardinalmeta
    #cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    #cardinalmeta.'new_class'('CardinalKernel')
    #$P0 = cardinalmeta.'HOW'()
    #set_hll_global ['CardinalKernel'], '!CARDINALMETA', $P0
.end


=item WHENCE()

Return the invocant's auto-vivification closure.

=cut

.sub 'WHENCE' :method
    $P0 = self.'WHAT'()
    $P1 = $P0.'WHENCE'()
    .return ($P1)
.end

=item get_bool(vtable)

Returns true if the object is defined, false otherwise

=cut

.sub '' :vtable('get_bool')
   $I0 = 'defined'(self)
   .return ($I0)
.end

=item print() prints to stdout

=item puts() print to stdout

=item readline() read from stdin

=cut

.sub 'print' :method
    .param pmc args     :slurpy
    $P0 = get_hll_global 'print'
    .tailcall $P0(self)
.end

.sub 'puts' :method
    .param pmc args     :slurpy
    $P0 = get_hll_global 'puts'
    .tailcall $P0(args :flat)
.end

.sub 'readline' :method
    .param pmc args     :slurpy
    $P0 = get_hll_global 'readline'
    .tailcall $P0(args)
.end

.sub 'printf' :method
    .param pmc fmt
    .param pmc args     :slurpy
    $P0 = get_hll_global 'print'
    $P99 = get_hll_global ['Kernel'], '!CARDINALMETA'
    $P1 = $P99.'sprintf'(fmt, args :flat)
    .tailcall $P0($P1)
.end

.sub 'sprintf' :method
    .param pmc fmt
    .param pmc args     :slurpy
    $P0 = new 'CardinalString'
    sprintf $P0, fmt, args
    .return ($P0)
.end

=item `(cmd)
Call the OS with C<cmd>, return the ouput.
=cut
.sub '`' :method
   .param string cmd
   .local pmc pipe
   pipe = open cmd, "-|"
   .local string buffer
   .local pmc output
   output = new 'CardinalString'
   $S0 = pop pipe      # pop buf layer
   goto lp
   lp:
       buffer = read pipe, 256
       output.'concat'(buffer)
       if pipe goto lp
       goto done
   done:
      .return(output)
.end

=item
Call the OS, return C<true> if successful, otherwise  C<false>
=cut
.sub 'system' :method
   .param string syscall
   spawnw $I0, syscall
   if $I0 == 0 goto done_t
   goto done_f
   done_t:
      $S0 = "true"
      goto ret
   done_f:
      $S0 = "false"
      goto ret
   ret:
       .return ($S0)
.end

.sub 'exit!' :method
    .param int return
    exit return
.end

.sub callcc :method
        .param pmc block :named('!BLOCK')
        .local pmc cont
        cont = new 'CardinalContinuation'
        set_addr cont, done
        block(cont)
        goto done

        done:
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
