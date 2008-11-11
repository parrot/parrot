## $Id$

=head1 NAME

src/builtins/eval.pir - Cardinal evaluators

=head1 DESCRIPTION

This file implements methods and functions that evaluate code,
such as C<eval>, C<require>, and C<use>.

=head1 Methods

=over 4

=cut

.namespace []
.sub 'onload' :anon :init :load
    $P0 = get_hll_namespace ['Any']
    '!EXPORT'('evalfile', 'from'=>$P0)
.end


.namespace ['Any']
.sub 'evalfile' :method :multi(_)
    .param pmc options         :slurpy :named

    .local string filename
    filename = self

    .local string lang
    lang = options['lang']
    if lang == 'Parrot' goto lang_parrot
    if lang goto lang_compile
    lang = 'cardinal'
  lang_compile:
    .local pmc compiler
    compiler = compreg lang
    .tailcall compiler.'evalfiles'(filename)

  lang_parrot:
    load_bytecode filename
    .return (1)
.end


.namespace []
.sub 'require' :multi(_)
    .param string name
    .param pmc options         :named :slurpy

    .local int isfile
    .local pmc file
    isfile = 0
    file = options['file']
    if null file goto have_name
    isfile = istrue file

  have_name:
    ##  see if we loaded this already
    .local pmc inc_hash
    inc_hash = get_hll_global '%INC'
    $I0 = exists inc_hash[name]
    unless $I0 goto require_name
    $I0 = defined inc_hash[name]
    .return ($I0)

  require_name:
    ##  loop through $:
    .local pmc inc_it
    $P0 = get_hll_global '$:'
    inc_it = iter $P0
  inc_loop:
    unless inc_it goto inc_end
    .local string basename, realfilename
    $S0 = shift inc_it
    basename = concat $S0, '/'
    basename .= name
    unless isfile goto try_module
    realfilename = basename
    $I0 = stat realfilename, 0
    if $I0 goto eval_ruby
    goto inc_loop
  try_module:
    realfilename = concat basename, '.pbc'
    $I0 = stat realfilename, 0
    if $I0 goto eval_parrot
    realfilename = concat basename, '.pir'
    $I0 = stat realfilename, 0
    if $I0 goto eval_parrot
    realfilename = concat basename, '.rb'
    $I0 = stat realfilename, 0
    if $I0 goto eval_ruby
    goto inc_loop
  inc_end:
    $S0 = concat "Can't find ", basename
    concat $S0, ' in $:'
    'die'($S0)
    .return (0)

  eval_parrot:
    .local pmc result
    result = 'evalfile'(realfilename, 'lang'=>'Parrot')
    goto done

  eval_ruby:
    result = 'evalfile'(realfilename, 'lang'=>'cardinal')

  done:
    inc_hash[name] = realfilename
    .return (result)
.end


.sub 'load'
    .param string file
    .param pmc args            :slurpy
    .param pmc options         :slurpy :named

    $P0 = 'require'(file, 'file'=>1)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

