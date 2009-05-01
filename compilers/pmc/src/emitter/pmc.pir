# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 Generic PMC emitter

=cut

.namespace ['PMC';'Emitter';'PMC']

.sub '' :load :init
    .local pmc p6meta

    p6meta = new 'P6metaclass'

    p6meta.'new_class'('PMC::Emitter::PMC')

.end

=item C<generate_h_file>

Generate part of header file.

=cut

# "Template Method". Just override generate_h_file_functions in derived
# classes.

.sub 'generate_h_file' :method
    .param pmc past
    .local string res

    .local string guard
    .local string name

    name = past.'name'()
    $S0 = 'uc'(name)

    guard = 'PARROT_PMC_'
    concat guard, $S0
    concat guard, '_H_GUARD'

    res = '#ifndef '
    concat res, guard
    concat res, "\n"
    concat res, '#define '
    concat res, guard
    concat res, "\n"

    $S0 = self.'generate_h_file_functions'(past)
    concat res, $S0
    
    concat res, '#endif /* '
    concat res, guard
    concat res, " */ \n"

    .return (res)
.end

=item C<generate_h_file_functions>

Generate C declarations for vtable functions

=cut

.sub 'generate_h_file_functions' :method
    .param pmc past
    .local string res
    .local pmc vtable_info, vtable_hash
    .local pmc vtables, it, entry, class_init
    .local string pmc_name, vtable_name

    pmc_name = past.'name'()

    $P0 = get_hll_global ['PMC'; 'VTableInfo'], 'vtable_hash'
    vtable_hash = $P0()
    
    concat res, "void Parrot_"
    concat res, pmc_name
    concat res, "_class_init(PARROT_INTERP, int, int);\n" 

    vtables = self.'!vtables'(past)

    it = iter vtables
  loop:
    unless it goto done
    vtable_name = shift it
    entry = vtables[vtable_name]
    vtable_info = vtable_hash[vtable_name]

    # Generate 2 methods. One for read, one for write.
    $P1 = new 'ResizableStringArray'
    push $P1, 'PARROT_EXPORT '
    $S0 = vtable_info.'ret_type'()
    push $P1, $S0
    push $P1, ' Parrot_'
    push $P1, pmc_name
    push $P1, '_'
    push $P1, vtable_name
    push $P1, '(PARROT_INTERP, '
    $S0 = entry['parameters']
    push $P1, $S0
    push $P1, ");\n"

    $S0 = join '', $P1
    concat res, $S0

    goto loop

  done:
    .return (res)
.end

.sub '!class_init' :method
    .param pmc past
    .tailcall past.'class_init'()
.end

.sub '!vtables' :method
    .param pmc past
    .tailcall past.'vtables'()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
