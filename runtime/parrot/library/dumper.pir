# Copyright (C) 2004-2009, Parrot Foundation.

=head1 TITLE

dumper.pir - PIR version of Perl 5's Data::Dumper module

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    load_bytecode "dumper.pbc"

    # dump the $P0 register
    _dumper( $P0 )

    # dump the $P0 register, with "name"
    _dumper( $P0, "name" )


=head1 DESCRIPTION

    PIR implementation of Perl 5's Data::Dumper module.

=cut

# first method prints usage information
.sub __library_dumper_print_usage
    say "# usage:"
    say ".sub main"
    say "    load_bytecode 'Data/Dumper.pbc'"
    say ''
    say "    .local pmc foo, dumper"
    say "    foo    = new 'ResizablePMCArray'"
    say "    dumper = new ['Data'; 'Dumper']"
    say ''
    say "    dumper.'dumper'( foo, 'foo' )"
    say ".end"
    say ''
.end

.include "errors.pasm"

=head1 FUNCTIONS

This library provides the following functions:

=over 4

=item _dumper( pmc, ?name, ?indent] )

This is the public (non object) interface to the dumper library.

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

.sub _dumper
    .param pmc p
    .param string name    :optional
    .param int has_name   :opt_flag
    .param string ident   :optional
    .param int has_ident  :opt_flag

    $P2 = _global_dumper()
    if has_ident goto w_ident
    unless has_name goto wo_name        # XXX argument order, opt 1st
    $P2."dumper"(p, name)
    goto ex
wo_name:
    $P2."dumper"(p)
    goto ex
w_ident:
    $P2."dumper"(p, name, ident)
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

=item __dump(pmc dumper, str label) method

If a method C<__dump> exists in the namespace of the class, it will be
called with the current dumper object and the label of the PMC.

=item dumper =_global_dumper() B<(internal)>

Internal helper function.

Returns the global dumper instance used by the non object interface.

=cut

.sub _global_dumper
    .local pmc self
    .local pmc dd_class
    .local int is_defined

    get_class dd_class, ['Data'; 'Dumper']
    if null dd_class goto load_dd_pir
    goto TYPE_OK

  load_dd_pir:
    '__load_bytecode'("Data/Dumper.pbc")
    get_class dd_class, ['Data'; 'Dumper']
    if null dd_class goto no_class
    goto TYPE_OK

  no_class:
    print "fatal error: failure while loading Data/Dumper.pbc\n"
    end
TYPE_OK:

    self = get_hll_global ['Data'; 'Dumper'], 'global'
    if null self goto create_type

create_type:
    new self, ['Data'; 'Dumper']
    set_hll_global ['Data'; 'Dumper'], 'global', self

END:
    .return( self )
.end

.include 'load_bytecode.pir'

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
