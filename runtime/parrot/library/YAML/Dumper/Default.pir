
=head1 TITLE

YAML::Dumper::Default - The default output module of YAML::Dumper.

=head1 VERSION

version 0.20

=head1 SYNOPSIS

TDB

=head1 DESCRIPTION

This module provides the default output style of C<YAML::Dumper>.

=cut

.sub __library_data_dumper_default_onload :load
    .local pmc ydb_class
    ydb_class = get_class ['YAML'; 'Dumper'; 'Default']
    if null ydb_class goto create_ydb
    goto END

  create_ydb:
    load_bytecode 'YAML/Dumper/Base.pbc'
    get_class $P0, ['YAML'; 'Dumper'; 'Base']
    subclass $P0, $P0, ['YAML'; 'Dumper'; 'Default']
END:
    .return ()
.end

.namespace ['YAML'; 'Dumper'; 'Default']

=head1 METHODS

A YAML::Dumper::Default object has the following methods:

=over 4


=item style."dumpWithName"( shortname, name, dump )

=cut

.sub dumpWithName :method
    .param string shortname
    .param string name
    .param pmc dump
    .local int ret
    .local string indent
    .local string subindent

    (subindent, indent) = self."newIndent"()

    print subindent

    print "\""
    print shortname
    print "\" : "

    ret = self."yaml"( name, dump )

    self."deleteIndent"()

    .return ( ret )
.end


=item style."dumpCached"( name, dump )

=cut

.sub dumpCached :method
    .param string name
    .param pmc dump

    print "\\"
    print name

    .return ( 1 )
.end



=item style."dumpProperties"( name, dump )

=cut

.sub dumpProperties :method
    .param string paramName
    .param pmc dump
    .local string name
    .local pmc prop
    .local int ret

    ret = 1
    if_null dump, END
    prophash prop, dump
    if_null prop, END

    print " with-properties: "
    clone name, paramName
    name = concat name, ".properties()"
    ret = self."yaml"( name, prop )

END:
    .return ( ret )
.end


=item style.genericHash( name, hash )

Dumps a 'generic' Hash.

=cut

.sub genericHash :method
    .param string name
    .param pmc hash
    .local pmc it
    .local string key
    .local pmc val
    .local pmc keys
    .local string name2

    $S0 = typeof hash
    print "!"
    print $S0

    print " {"

    new keys, "ResizablePMCArray"
    it = iter hash

  iter_loop:
    unless it, iter_end

    shift key, it
    push keys, key
    branch iter_loop

  iter_end:
    keys."sort"()

  dump_loop:
    unless keys, dump_end

    print "\n"

    shift key, keys

    new val, "ResizablePMCArray"
    push val, name
    push val, key
    sprintf name2, "%s[\"%s\"]", val

    set val, hash[key]

    self."dumpWithName"( key, name2, val )

    print ","
    unless keys, dump_end

    branch dump_loop

  dump_end:
    .local string indent
    .local string subindent

    (subindent, indent) = self."newIndent"()

    print "\n"
    print indent
    print "}"

    self."deleteIndent"()

    .return ( 1 )
.end


=item style."dumpStringEscaped"( string, escapeChar )

Escape any characters in a string so we can re-use it as a literal.

=cut

.sub dumpStringEscaped :method
    .param pmc var
    .param string char
    .local string str

    str = var
    str = escape  str
    print str

    .return ( 1 )
.end


=item style."pmcDefault"( name, dump )

=cut

.sub pmcDefault :method
    .param string name
    .param pmc    dump
    .local pmc    class
    .local string type

    type  = typeof dump

    print "!"
    print type
    print " "

    $I0 = can dump, "__yaml"
    if $I0 goto CAN_DUMP
    print "{ ... }"
    branch END
CAN_DUMP:
    dump."__yaml"( self, name )
END:
    .return ( 1 )
.end


=item style."pmcIntList"( name, array )

Dumps an IntList PMC.

=cut

.sub pmcIntList :method
    .param string name
    .param pmc array
    .local string indent
    .local string subindent
    .local int size
    .local int pos
    .local pmc val
    .local string name2
    .local int tmp

    (subindent, indent) = self."newIndent"()

    typeof name2, array
    print name2
    print "["

    set size, array
    set pos, 0

    unless size, iter_end

iter_loop:
    print "\n"

    print subindent

    new val, "ResizablePMCArray"
    push val, name
    push val, pos
    sprintf name2, "%s[%d]", val

    $I0 = array[pos]
    print $I0

    # next array member
    inc pos

    print ","

    if pos >= size goto iter_end

    # elements left?
    branch iter_loop

iter_end:
    print "\n"
    print indent
    print "]"

    self."deleteIndent"()

    .return ( 1 )
.end


=item style."genericArray"( name, array )

Dumps any pmc that implements an Array interface.

=cut

.sub genericArray :method
    .param string name
    .param pmc array

    .local string indent
    .local string subindent
    .local int size
    .local int pos
    .local pmc val
    .local string name2
    .local int tmp

    (subindent, indent) = self."newIndent"()

    typeof name2, array
    print '!'
    print name2
    print " ["

    size = array
    pos = 0

    unless size, iter_end

iter_loop:
    print "\n"

    print subindent

    val = new 'ResizablePMCArray'
    push val, name
    push val, pos
    sprintf name2, "%s[%d]", val

    set val, array[pos]

    self."yaml"( name2, val )

    # next array member
    inc pos

    print ","

    if pos >= size goto iter_end

    # elements left?
    branch iter_loop

iter_end:
    print "\n"
    print indent
    print "]"

    self."deleteIndent"()

    .return ( 1 )
.end


=item style."genericString"( name, str )

Dumps any string-like PMC.

=cut

.sub genericString :method
    .param string name
    .param pmc str
    .local string name2

    typeof name2, str
    print '!'
    print name2
    print ' [ "'
    self."dumpStringEscaped"( str, "\"" )
    print '" ]'

    .return ( 1 )
.end


=item style."genericNumber"

Dumps a generic numeric PMC.

=cut

.sub genericNumber :method
    .param string name
    .param pmc val
    .local string name2

    typeof name2, val
    print '!'
    print name2
    print ' [ '
    print val
    print ' ]'

    .return ( 1 )
.end


=item style."genericUndef"( name, val )

Dumps any undef PMC.

=cut

.sub genericUndef :method
    .param string name
    .param pmc val
    .local string name2

    typeof name2, val
    print '!'
    print name2
    print ' [ '
    print ""
    print ' ]'

    .return ( 1 )
.end


=item style."pmcNull"( name, val )

Dumps a Null PMC.

=cut

.sub pmcNull :method
    .param string name
    .param pmc val

    print "null"

    .return ( 1 )
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
