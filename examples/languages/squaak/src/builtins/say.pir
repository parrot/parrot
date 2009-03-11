# Copyright (C) 2008, Parrot Foundation.
# $Id$


=head1

Squaak built-in routines

=cut

.namespace []

.sub 'print'
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    print "\n"
    .return ()
.end

.sub 'read'
    $P0 = getstdin
    $S0 = readline $P0
    .return ($S0)
.end


## this doesn't work for me :-(
## once this works, Game of Life runs much nicer.
## --kjs
##
.sub 'clearscreen'
    print binary:"\027[2J"
    print binary:"\027[H"
    #print binary:"\e[2J"
    #print binary:"\e[H"
.end


.sub 'infix:<'
    .param pmc a
    .param pmc b
    islt $I0, a, b
    .return ($I0)
.end


.sub 'infix:<='
    .param pmc a
    .param pmc b
    isle $I0, a, b
    .return ($I0)
.end

.sub 'infix:>'
    .param pmc a
    .param pmc b
    isgt $I0, a, b
    .return ($I0)
.end

.sub 'infix:>='
    .param pmc a
    .param pmc b
    isge $I0, a, b
    .return ($I0)
.end

.sub 'infix:=='
    .param pmc a
    .param pmc b
    iseq $I0, a, b
    .return ($I0)
.end

.sub 'infix:!='
    .param pmc a
    .param pmc b
    isne $I0, a, b
    .return ($I0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

