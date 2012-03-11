# Copyright (C) 2008-2009, Parrot Foundation.

=head1 TITLE

yaml_dumper.pir - PIR version of a YAML dumper, ala Data::Dumper

=head1 VERSION

version 0.1

=head1 SYNOPSIS

    load_bytecode "dumper.pbc"

    # dump the P0 register
    yaml( $P0 )

    # dump the P0 register, with "name"
    yaml( $P0, "name" )


=head1 DESCRIPTION

PIR implementation of Perl 5's Data::Dumper module to dump YAML format.

=cut

# first method prints usage information
.sub __library_yaml_dumper_print_usage
    say "# usage:"
    say ".sub main"
    say "    load_bytecode 'YAML/Dumper.pbc'"
    say ''
    say "    .local pmc foo, yaml_dumper"
    say "    foo         = new 'ResizablePMCArray'"
    say "    yaml_dumper =  new ['YAML'; 'Dumper']"
    say ''
    say "    yaml_dumper.'yaml'( foo, 'foo' )"
    say ".end"
    say ''
.end

.include "errors.pasm"

=head1 FUNCTIONS

This library provides the following functions:

=over 4

=item yaml( pmc, ?name, ?indent] )

This is the public (non object) interface to the yaml dumper library.

=over 4

=item pmc

Required. The PMC to dump.

=item name

Optional. The name of the PMC.

=item indent

Optional. The indent used at the start of each line printed.

=back

B<Note:> This function currently returns nothing. It should return
the dumped data as a string, like Perl's Data::Dumper. Instead,
everything is printed out using C<print>.

B<Note: #2> Hash keys are now sorted using C<_sort()> (sort.pir)

=cut

.sub yaml
    .param pmc p
    .param string name    :optional
    .param int has_name   :opt_flag
    .param string ident   :optional
    .param int has_ident  :opt_flag

    $P2 = _global_dumper()
    if has_ident goto w_ident
    unless has_name goto wo_name        # XXX argument order, opt 1st
    $P2."yaml"(p, name)
    goto ex
wo_name:
    $P2."yaml"(p)
    goto ex
w_ident:
    $P2."yaml"(p, name, ident)
ex:
.end

=item _register_dumper( id, sub )

Registers a dumper for new PMC type. B<EXCEPTION_UNIMPLEMENTED>
But see B<method __dump> below.

=over 4

=item id

the PMC id, as returned by the C<typeof> op.

=item sub

a Sub pmc, that gets called in order to dump the content of the given PMC

=back

For example:

    sub = find_name "_dump_PerlArray"
    _register_dumper( .PerlArray, sub )

This function returns nothing.

=cut

.sub _register_dumper
    .param int id
    .param pmc s
    $P2 = _global_dumper()
    $P2."registerDumper"(id, s)
.end

=item __dump(pmc yaml, str label) method

If a method C<__dump> exists in the namespace of the class, it will be
called with the current dumper object and the label of the PMC.

=item yaml =_global_dumper() B<(internal)>

Internal helper function.

Returns the global dumper instance used by the non object interface.

=cut

.sub _global_dumper
    .local pmc self
    .local pmc yd_class
    .local int is_defined

    get_class yd_class, ['YAML'; 'Dumper']
    if null yd_class goto load_yd_pir
    goto TYPE_OK

  load_yd_pir:
    $P0 = load_bytecode 'YAML/Dumper.pbc'
    $I0 = $P0.'is_initialized'('load')
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:
    $P0.'mark_initialized'('load')
  done_initialization:
    get_class yd_class, ['YAML'; 'Dumper']
    if null yd_class goto no_class
    goto TYPE_OK

  no_class:
    print "fatal error: failure while loading YAML/Dumper.pbc\n"
    end
TYPE_OK:

    self = get_global ['YAML'; 'Dumper'], 'global'
    if null self goto create_type

create_type:
    new self, ['YAML'; 'Dumper']
    set_global ['YAML'; 'Dumper'], 'global', self

END:
    .return( self )
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
