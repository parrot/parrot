
=head1 TITLE

Data::Dumper::Default - The default output module of Data::Dumper.

=head1 VERSION

version 0.20

=head1 SYNOPSIS

TDB

=head1 DESCRIPTION

This module provides the default output style of C<Data::Dumper>.

=cut

.sub __library_data_dumper_default_onload :tag('load')
    .local pmc ddb_class
    ddb_class = get_class ['Data'; 'Dumper'; 'Default']
    if null ddb_class goto create_ddb
    goto END

  create_ddb:
    load_bytecode 'Data/Dumper/Base.pbc'
    get_class $P0, ['Data'; 'Dumper'; 'Base']
    subclass $P0, $P0, ['Data'; 'Dumper'; 'Default']
END:
    .return ()
.end

.namespace ['Data'; 'Dumper'; 'Default']

=head1 METHODS

A Data::Dumper::Default object has the following methods:

=over 4

=item style."dumpWithName"( shortname, name, dump )

=cut

.sub dumpWithName :method
    .param string shortname
    .param string name
    .param pmc dump
    .local int ret

    print "\""
    print shortname
    print "\" => "

    ret = self."dump"( name, dump )

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
    ret = self."dump"( name, prop )

END:
    .return ( ret )
.end

=item style.genericHash( name, hash )

Dumps a 'generic' Hash.

=cut

.sub genericHash :method
    .param string name
    .param pmc hash
    .local string indent
    .local string subindent
    .local pmc it
    .local string key
    .local pmc val
    .local pmc keys
    .local string name2

    (subindent, indent) = self."newIndent"()

    $S0 = typeof hash
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
    print subindent

    shift key, keys

    new val, "ResizablePMCArray"
    push val, name
    push val, key
    sprintf name2, "%s[\"%s\"]", val

    set val, hash[key]

    self."dumpWithName"( key, name2, val )

    unless keys, dump_end
    print ","

    branch dump_loop

dump_end:
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

    print "PMC '"
    print type
    print "' "

    $I0 = can dump, "__dump"
    if $I0 goto CAN_DUMP
    print "{ ... }"
    branch END
CAN_DUMP:
    dump."__dump"( self, name )
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
    print " (size:"
    $I0 = array
    print $I0
    print ") ["

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

    # skip the ',' after the last element
    if pos >= size goto iter_end

    print ","

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
    print name2
    print " (size:"
    $I0 = array
    print $I0
    print ") ["

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

    self."dump"( name2, val )

    # next array member
    inc pos

    # skip the ',' after the last element
    if pos >= size goto iter_end

    print ","

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

    print "\""
    self."dumpStringEscaped"( str, "\"" )
    print "\""

    .return ( 1 )
.end

=item style."genericNumber"

Dumps a generic numeric PMC.

=cut

.sub genericNumber :method
    .param string name
    .param pmc val

    print val

    .return ( 1 )
.end

=item style."genericUndef"( name, val )

Dumps any undef PMC.

=cut

.sub genericUndef :method
    .param string name
    .param pmc val

    print "undef"

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

=item Capture dumpe

Dump a capture object.

=cut

.namespace ['Capture']
.sub '__dump' :method
    .param pmc dumper
    .param string label
    .local int hasstuff
    hasstuff = 0

    .local string subindent, indent
    (subindent, indent) = dumper.'newIndent'()

    # Sort hash keys before dump to preseve order
    # Use RPA instead of RSA because RSA doesn't have 'sort' method
    .local pmc hash, it, keys
    hash = self.'hash'()
    keys = new ['ResizablePMCArray']
    it = iter hash
  dump_hash_keys_loop:
    unless it goto dump_hash_keys_end
    .local string key
    key = shift it
    push keys, key
    goto dump_hash_keys_loop
  dump_hash_keys_end:
    keys.'sort'()

    it = iter keys
  dump_hash_loop:
    unless it goto dump_hash_end
    if hasstuff goto dump_hash_1
    print " {"
    hasstuff = 1
  dump_hash_1:
    print "\n"
    print subindent
    .local string key
    .local pmc val
    key = shift it
    val = hash[key]
    print "<"
    print key
    print "> => "
    dumper.'dump'(label, val)
    goto dump_hash_loop
  dump_hash_end:

    .local pmc array
    array = self.'list'()
    if null array goto dump_array_end
    $I1 = elements array
    $I0 = 0
  dump_array_loop:
    if $I0 >= $I1 goto dump_array_end
    if hasstuff goto dump_array_1
    print " {"
    hasstuff = 1
  dump_array_1:
    print "\n"
    print subindent
    val = array[$I0]
    print "["
    print $I0
    print "] => "
    dumper.'dump'(label, val)
    inc $I0
    goto dump_array_loop
  dump_array_end:
    unless hasstuff goto end
    print "\n"
    print indent
    print '}'
  end:
    dumper.'deleteIndent'()
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
