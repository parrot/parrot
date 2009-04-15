# $Id$

=head1 TITLE

nqp.pir - A nqp compiler.

=head2 Description

This is the base file for the nqp compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'nqp'.

=head2 Functions

=over 4

=item onload()

Creates the nqp compiler using a C<PCT::HLLCompiler>
object.

=cut

.namespace [ 'NQP';'Compiler' ]

.loadlib 'nqp_group'

.sub 'onload' :anon :load :init
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('NQP')
    $P1.'parsegrammar'('NQP::Grammar')
    $P1.'parseactions'('NQP::Grammar::Actions')
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the nqp compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'NQP'
    $P1 = $P0.'command_line'(args)
.end

.include 'src/builtins.pir'
.include 'src/Grammar_gen.pir'
.include 'bootstrap/gen_actions.pir'


.namespace []

.sub 'initlist' :anon :load :init
    subclass $P0, 'ResizablePMCArray', 'List'
    $P0 = new 'List'
    set_hll_global ['NQP';'Grammar';'Actions'], '@?BLOCK', $P0
.end


.namespace [ 'List' ]

.sub 'unshift' :method
    .param pmc obj
    unshift self, obj
.end

.sub 'shift' :method
    shift $P0, self
    .return ($P0)
.end

.sub 'push' :method
    .param pmc obj
    push self, obj
.end


#.namespace [ 'NQP';'Grammar';'Actions' ]
#
#.sub 'package_declarator_helper'
#    .param pmc match
#    .param pmc key
#    .local pmc past
#    $P0 = match[key]
#    past = $P0.'get_scalar'()
#    $P1 = match['name']
#    $P1 = $P1['ident']
#    past.'namespace'($P1)
#    past.'blocktype'('declaration')
#    past.'pirflags'(':init :load')
#    past.'lexical'(0)
#    $S0 = match['sym']
#    if $S0 != 'class' goto class_done
#    .local string inline
#    inline = <<'        INLINE'
#        $P0 = get_hll_global 'Protomaker'
#        $P1 = split '::', '%s'
#        push_eh subclass_done
#        $P2 = $P0.'new_subclass'('Protoobject', $P1)
#        pop_eh
#      subclass_done:
#        INLINE
#    $S0 = match['name']
#    $I0 = index inline, '%s'
#    substr inline, $I0, 2, $S0
#    $P0 = get_hll_global ['PAST'], 'Op'
#    $P1 = $P0.'new'('inline'=>inline, 'pasttype'=>'inline')
#    $P2 = past[0]
#    $P2.'push'($P1)
#  class_done:
#    match.'result_object'(past)
#.end



.sub '__onload' :init :load

    ##  initialize optable with inline PIR
    .local pmc optable
    optable = get_hll_global [ 'NQP';'Grammar' ], '$optable'
    optable['prefix:~'; 'inline'] = <<"        END"
        ##  inline prefix:~
        $S0 = %0
        %r = new 'String'
        %r = $S0
        END

    optable['prefix:+'; 'inline'] = <<"        END"
        ##  inline prefix:+
        $N0 = %0
        %r = new 'Float'
        %r = $N0
        END

    optable['infix:=='; 'inline'] = <<"        END"
        ##  inline infix:==
        $I0 = cmp_num %0, %1
        $I0 = iseq $I0, 0
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:!='; 'inline'] = <<"        END"
        ##  inline infix:!=
        $I0 = cmp_num %0, %1
        $I0 = isne $I0, 0
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:eq'; 'inline'] = <<"        END"
        ##  inline infix:eq
        $S0 = %0
        $S1 = %1
        $I0 = iseq $S0, $S1
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:ne'; 'inline'] = <<"        END"
        ##  inline infix:ne
        $S0 = %0
        $S1 = %1
        $I0 = isne $S0, $S1
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:=:='; 'inline'] = <<"        END"
        ##  inline infix:=:=
        $I0 = issame %0, %1
        %r = new 'Integer'
        %r = $I0
        END

    optable['prefix:!'; 'inline'] = <<"        END"
        ##  inline prefix:!
        $I0 = isfalse %0
        %r = new 'Integer'
        %r = $I0
        END

    optable['prefix:?'; 'inline'] = <<"        END"
        ##  inline prefix:?
        $I0 = istrue %0
        %r = new 'Integer'
        %r = $I0
        END

    .return ()
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

