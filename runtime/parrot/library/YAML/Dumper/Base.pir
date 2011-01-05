
=head1 TITLE

YAML::Dumper::Base - style baseclass

=head1 VERSION

version 0.20

=head1 SYNOPSIS

TDB

=head1 DESCRIPTION

This is a baseclass that provides some essential functions necessary
for dumping data structures. It is subclassed by C<YAML::Dumper::Default>,
which implements the methods that are finally doing the output.

=head1 METHODS

A YAML::Dumper::Base object has the following methods:

=over 4

=cut

.sub __library_data_dumper_base_onload :load
    .local pmc ydb_class
    ydb_class = get_class ['YAML'; 'Dumper'; 'Base']
    if null ydb_class goto create_ydb
    goto END

  create_ydb:
    newclass $P0, ['YAML'; 'Dumper'; 'Base']
    addattribute $P0, "yaml"
    addattribute $P0, "level"
    addattribute $P0, "indention"
    addattribute $P0, "cache"
    addattribute $P0, "cachename"
END:
    .return ()
.end

.namespace ['YAML'; 'Dumper'; 'Base']

=item style."prepare"( yaml, indent )

=cut

.sub prepare :method
    .param pmc yaml
    .param string indent
    .local string stemp
    .local pmc temp

    setattribute self, "yaml", yaml

    new temp, "Integer"
    set temp, 0
    setattribute self, "level", temp

    new temp, "String"
    clone stemp, indent
    set temp, stemp
    setattribute self, "indention", temp

    new temp, "AddrRegistry"
    setattribute self, "cache", temp
    new temp, "ResizableStringArray"
    setattribute self, "cachename", temp

    .return ()
.end

=item (pos, name) = style."cache"( find, defname ) B<(internal)>

=cut

.sub cache :method
    .param string name
    .param pmc find
    .local pmc _cache
    .local int i
    .local pmc _names

    getattribute _cache, self, "cache"
    getattribute _names, self, "cachename"

    i = _cache[find]
    if i == 0 goto NOTFOUND
    # found entry => get its name
    name = _names[i]

    .return ( i, name )

NOTFOUND:
    i = elements _cache
    inc i
    _cache[find] = i
    _names[i] = name

    .return ( -1, name )
.end

=item indent = style."createIndent"() B<(internal)>

=cut

.sub createIndent :method
    .param int level
    .local pmc temp
    .local string indent

    getattribute temp, self, "indention"
    set indent, temp
    clone indent, indent
    repeat indent, indent, level

    .return ( indent )
.end

=item indent = style."indent"()

=cut

.sub indent :method
    .local pmc temp
    .local string _indent
    .local int level

    getattribute temp, self, "level"
    set level, temp

    _indent = self."createIndent"( level )

    .return ( _indent )
.end

=item (subindent,indent) = style."newIndent"()

=cut

.sub newIndent :method
    .local pmc temp
    .local string indent1
    .local string indent2
    .local int level

    getattribute temp, self, "level"
    set level, temp
    inc temp

    indent1 = self."createIndent"( level )
    inc level
    indent2 = self."createIndent"( level )

    .return ( indent2, indent1 )
.end

=item indent = style."deleteIndent"()

=cut

.sub deleteIndent :method
    .local pmc temp
    .local string indent
    .local int level

    getattribute temp, self, "level"
    dec temp
    set level, temp

    indent = self."createIndent"( level )

    .return ( indent )
.end

=item style."yaml"( name, dump )

=cut

.sub yaml :method
    .param string paramName
    .param pmc _dump
    .local int type
    .local int ret
    .local string temp
    .local string func
    .local string name

    # Don't cache undef...
    $I0 = defined _dump
    unless $I0 goto NOT_IN_CACHE

    (type, name) = self."cache"( paramName, _dump )

    if type == -1 goto NOT_IN_CACHE
    # name found in cache:
    self."dumpCached"( name, _dump )
    branch END

NOT_IN_CACHE:
    # is _dump null?
    # lookup the type id otherwise
    set func, "pmcNull"
    if_null _dump, DUMP

    # does a specific helper method exist?
    # (in general, it will not, let it override the general ones below)
    typeof temp, _dump
    set func, "pmc"
    func = concat func, temp
    can ret, self, func
    if ret goto DUMP

    #is _dump undef?
    func = "genericUndef"
    $I0  = defined _dump
    unless $I0 goto DUMP

    func = "pmcDefault"
    $I0  = isa _dump, "Object"
    if $I0 goto DUMP

  TEST_GENERIC:
    # does a generic helper method exist?
    func = "genericHash"
    $I0 = does _dump, "hash"
    if $I0 goto DUMP

    func = "genericArray"
    $I0 = does _dump, "array"
    if $I0 goto DUMP

    func = "genericString"
    $I0 = does _dump, "string"
    if $I0 goto DUMP

    func = "genericNumber"
    $I0 = does _dump, "boolean"
    if $I0 goto DUMP
    $I0 = does _dump, "integer"
    if $I0 goto DUMP
    $I0 = does _dump, "float"
    if $I0 goto DUMP

    # no, dump as a unknown PMC
    set func, "pmcDefault"
DUMP:
    ret = self.func( name, _dump )
    unless ret goto END

    self."dumpProperties"( name, _dump )

END:
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
