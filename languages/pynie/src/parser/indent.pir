=head1 NAME

src/parser/indent.pir - Helper parsing function for Python indents

=head1 Functions

=over 4

=cut


.include 'cclass.pasm'

.namespace [ 'Pynie';'Grammar' ]

.sub 'onload' :load :init
    .local pmc optable, ws
    optable = get_global '$optable'
    ws = get_global 'ws'
    setattribute optable, "&!ws", ws
    .return ()
.end

.sub 'indent_zero'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local pmc indents
    indents = new 'ResizablePMCArray'
    push indents, 0
    set_global '@!indents', indents
    .local int pos
    (mob, pos) = mob.'new'(mob)
    mob.'to'(pos)
    .return ()
.end


.sub 'indent'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos, lastpos, spaces
    .local string target
    (mob, pos, target) = mob.'new'(mob)
    lastpos = length target
    ##  determine the number of spaces on the line
    $I0 = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $I0 -= pos
    ##  if larger than current indent level, succeed and create a new level
    .local pmc indents
    indents = get_global '@!indents'
    $I1 = indents[-1]
    unless $I0 > $I1 goto fail
  succeed:
    push indents, $I0
    .local int to
    to = pos + $I0
    mob.'to'(to)
  fail:
    .return (mob)
.end


.sub 'dedent'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos, lastpos, spaces
    .local string target
    (mob, pos, target) = mob.'new'(mob)
    lastpos = length target
    $I0 = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $I0 -= pos
    # $I1 = find_cclass .CCLASS_NEWLINE, target, pos, lastpos
    .local pmc indents
    indents = get_global '@!indents'
    $I2 = elements indents
  loop:
    dec $I2
    if $I2 < 0 goto fail
    $I1 = indents[$I2]
    if $I0 > $I1 goto fail
    if $I0 < $I1 goto loop
  succeed:
    $I1 = pop indents
    mob.'to'(pos)
  fail:
    .return (mob)
.end


.sub 'indent_same'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    .local int pos, lastpos, spaces
    .local string target
    (mob, pos, target) = mob.'new'(mob)
    lastpos = length target
    $I0 = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $I0 -= pos
    # $I1 = find_cclass .CCLASS_NEWLINE, target, pos, lastpos
    .local pmc indents
    indents = get_global '@!indents'
    $I1 = indents[-1]
    if $I0 != $I1 goto fail
  succeed:
    .local int to
    to = pos + $I0
    mob.'to'(to)
  fail:
    .return (mob)
.end


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the current author and
maintainer.  Patches and suggestions can be sent to
<parrot-dev@lists.parrot.org> or <perl-compiler@perl.org> .

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
