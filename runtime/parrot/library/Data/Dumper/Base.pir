=head1 TITLE

Data::Dumper::Base - style baseclass

=head1 VERSION

version 0.20

=head1 SYNOPSIS

TDB

=head1 DESCRIPTION

This is a baseclass that provides some essential functions necessary
for dumping data structures. It is subclassed by C<Data::Dumper::Default>,
which implements the methods that are finally doing the output.

=head1 METHODS

A Data::Dumper::Base object has the following methods:

=over 4

=cut

.const int attrDumper = 0
.const int attrLevel = 1
.const int attrIndention = 2
.const int attrCache = 3
.const int attrCacheNames = 4

.sub __library_data_dumper_base_onload :load
    find_type $I0, "Data::Dumper::Base"
    if $I0 > 1 goto END
    newclass $P0, "Data::Dumper::Base"
    addattribute $P0, "dumper"
    addattribute $P0, "level"
    addattribute $P0, "indention"
    addattribute $P0, "cache"
    addattribute $P0, "cachename"
END:
    .return ()
.end

.namespace ["Data::Dumper::Base"]

=item style."prepare"( dumper, indent )

=cut

.sub prepare :method
    .param pmc dumper
    .param string indent
    .local string stemp
    .local pmc temp

    setattribute self, "dumper", dumper

    new temp, .Integer
    set temp, 0
    setattribute self, "level", temp

    new temp, .String
    clone stemp, indent
    set temp, stemp
    setattribute self, "indention", temp

    new temp, .AddrRegistry 
    setattribute self, "cache", temp
    new temp, .ResizableStringArray 
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

    classoffset $I0, self, "Data::Dumper::Base"
    add $I0, attrIndention
    getattribute temp, self, $I0
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

    classoffset $I0, self, "Data::Dumper::Base"
    add $I0, attrLevel
    getattribute temp, self, $I0
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

    classoffset $I0, self, "Data::Dumper::Base"
    add $I0, attrLevel
    getattribute temp, self, $I0
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

    classoffset $I0, self, "Data::Dumper::Base"
    add $I0, attrLevel
    getattribute temp, self, $I0
    dec temp
    set level, temp

    indent = self."createIndent"( level )

    .return ( indent )
.end

=item style."dump"( name, dump )

=cut

.sub dump :method
    .param string paramName
    .param pmc _dump
    .local int type
    .local int ret
    .local string temp
    .local string func
    .local string name

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
    concat func, temp
    can ret, self, func
    if ret goto DUMP

    #is _dump undef?
    func = "genericUndef"
    $I0 = defined _dump
    unless $I0 goto DUMP

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

Copyright (c) 2004, the Perl Foundation.

=cut
