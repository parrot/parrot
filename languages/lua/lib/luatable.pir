# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

lib/luatable.pir - Lua Table Library

=head1 DESCRIPTION

This library provides generic functions for table manipulation. It provides
all its functions inside the table C<table>.

Most functions in the table library assume that the table represents an
array or a list. For these functions, when we talk about the "length" of a
table we mean the result of the length operator. 

See "Lua 5.1 Reference Manual", section 5.5 "Table Manipulation".

=head2 Functions

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luaaux.pbc"
    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua Table\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global "_G"
    $P1 = new .LuaString

    .local pmc _table
    _table = new .LuaTable
    $P1 = "table"
    _lua__GLOBAL[$P1] = _table

    .const .Sub _table_concat = "_table_concat"
    $P1 = "concat"
    _table[$P1] = _table_concat

    .const .Sub _table_foreach = "_table_foreach"
    $P1 = "foreach"
    _table[$P1] = _table_foreach

    .const .Sub _table_foreachi = "_table_foreachi"
    $P1 = "foreachi"
    _table[$P1] = _table_foreachi

    .const .Sub _table_getn = "_table_getn"
    $P1 = "getn"
    _table[$P1] = _table_getn

    .const .Sub _table_insert = "_table_insert"
    $P1 = "insert"
    _table[$P1] = _table_insert

    .const .Sub _table_maxn = "_table_maxn"
    $P1 = "maxn"
    _table[$P1] = _table_maxn

    .const .Sub _table_remove = "_table_remove"
    $P1 = "remove"
    _table[$P1] = _table_remove

    .const .Sub _table_setn = "_table_setn"
    $P1 = "setn"
    _table[$P1] = _table_setn

    .const .Sub _table_sort = "_table_sort"
    $P1 = "sort"
    _table[$P1] = _table_sort

.end

=item C<table.concat (table [, sep [, i [, j]]])>

Returns C<table[i]..sep..table[i+1] ... sep..table[j]>. The default value for
C<sep> is the empty string, the default for C<i> is 1, and the default for
C<j> is the length of the table. If C<i> is greater than C<j>, returns the
empty string.

Returns C<table[i]..sep..table[i+1] ... sep..table[j]>. The default value for

=cut

.sub _table_concat :anon
    .param pmc table :optional
    .param pmc sep :optional
    .param pmc i :optional
    .param pmc j :optional
    .local pmc idx
    .local pmc value
    .local pmc ret
    .local int last
    $S0 = optstring(sep, "")
    checktype(table, "table")
    $I0 = optint(i, 1)
    $I1 = getn(table)
    last = optint(j, $I1)
    $S1 = ""
    new idx, .LuaNumber 
L2:
    unless $I0 <= last goto L3
    idx = $I0
    value = table."rawget"(idx)
    $I2 = isa value, "LuaString"
    if $I2 goto L4
    $I2 = isa value, "LuaNumber"
    if $I2 goto L4
    argerror("table contains non-strings")
L4:
    $S2 = value
    concat $S1, $S2
    unless $I0 != last goto L5
    concat $S1, $S0
L5:    
    add $I0, 1
    goto L2
L3:
    new ret, .LuaString
    ret = $S1
    .return (ret)
.end


=item C<table.foreach (table, f)>

Executes the given C<f> over all elements of C<table>. For each element, C<f>
is called with the index and respective value as arguments. If C<f> returns
a non-B<nil> value, then the loop is broken, and this value is returned as
the final value of C<foreach>.

See the C<next> function for extra information about table traversals.

B<DEPRECATED>

=cut

.sub _table_foreach :anon
    .param pmc table :optional
    .param pmc f :optional
    .local pmc idx
    .local pmc value
    .local pmc ret
    checktype(table, "table")
    checktype(f, "function")
    new idx, .LuaNil
L1:
    (idx, value) = next(table, idx)
    unless idx goto L2
    (ret) = f(idx, value)
    $I0 = defined ret
    unless $I0 goto L1
    .return (ret)       
L2:
    .return ()
.end


=item C<table.foreachi (table, f)>

Executes the given C<f> over the numerical indices of C<table>. For each
index, C<f> is called with the index and respective value as arguments.
Indices are visited in sequential order, from 1 to C<n>, where C<n> is the
size of the table. If C<f> returns a non-B<nil> value, then the loop is
broken and this value is returned as the result of C<foreachi>.

B<DEPRECATED>

=cut

.sub _table_foreachi :anon
    .param pmc table :optional
    .param pmc f :optional
    .local pmc index
    .local pmc value
    .local pmc ret
    .local int i
    .local int n
    checktype(table, "table")
    checktype(f, "function")
    n = getn(table)
    i = 0
    new index, .LuaNumber
L1:
    add i, 1
    unless i <= n goto L2
    index = i
    value = table."rawget"(index)
    (ret) = f(index, value) 
    $I0 = defined ret
    unless $I0 goto L1
    .return (ret)       
L2:
    .return ()
.end


=item C<table.getn (table)>       

Returns the size of a table.

B<DEPRECATED>

=cut

.sub _table_getn :anon
    .param pmc table :optional
    .local pmc ret
    checktype(table, "table")
    ret = table."len"()
    .return (ret)
.end


=item C<table.insert (table, [pos,] value)>

Inserts element C<value> at position C<pos> in C<table>, shifting up other
elements to open space, if necessary. The default value for C<pos> is C<n+1>,
where C<n> is the length of the table, so that a call C<table.insert(t,x)>
inserts C<x> at the end of table C<t>.

=cut

.sub _table_insert :anon
    .param pmc table :optional
    .param pmc arg2 :optional
    .param pmc arg3 :optional
    .local pmc value
    .local pmc index
    .local int e
    .local int pos
    new index, .LuaNumber
    checktype(table, "table")
    e = getn(table)
    inc e
    unless_null arg3, L1
    pos = e
    value = arg2
    goto L2
L1:
    pos = checknumber(arg2)    
    unless pos > e goto L3
    e = pos
L3:
    value = arg3
L4:
    dec e
    unless e >= pos goto L2
    index = e
    $P0 = table."rawget"(index)
    $I0 = e + 1
    index = $I0
    table."rawset"(index, $P0)
    goto L4
L2:
    index = pos
    table[index] = value
.end


=item C<table.maxn (table)>

Returns the largest positive numerical index of the given table, or zero if
the table has no positive numerical indices. (To do its job this function
does a linear traversal of the whole table.)

STILL INCOMPLETE (see next in luapir.pir).

=cut

.sub _table_maxn :anon
    .param pmc table :optional
    .local pmc idx
    .local pmc value
    .local pmc max
    checktype(table, "table")
    new max, .LuaNumber
    max = 0
    new idx, .LuaNil
L1:
    (idx, value) = next(table, idx)
    unless idx goto L2
    $I0 = isa idx, "LuaNumber"
    unless $I0 goto L1
    unless idx > max goto L1 
    max = clone idx
    goto L1
L2:
    .return (max)       
.end


=item C<table.remove (table [, pos])>

Removes from C<table> the element at position C<pos>, shifting down other
elements to close the space, if necessary. Returns the value of the removed
element. The default value for C<pos> is C<n>, where C<n> is the length of
the table, so that a call C<table.remove(t)> removes the last element of
table C<t>.

=cut

.sub _table_remove :anon
    .param pmc table :optional
    .param pmc pos :optional
    .local pmc index
    .local pmc ret
    .local int e
    .local int ipos
    checktype(table, "table")
    e = getn(table)
    ipos = optint(pos, e)
    unless e <= 0 goto L1
    new ret, .LuaNil
    .return (ret)
L1:      
    $I1 = e - 1
    new index, .LuaNumber
    index = ipos
    ret = table."rawget"(index)
L2:
    unless ipos < e goto L3
    $I2 = ipos + 1
    index = $I2
    $P0 = table."rawget"(index)
    index = ipos
    table."rawset"(index, $P0)
    ipos = $I2
    goto L2
L3:
    new $P0, .LuaNil
    index = e
    table."rawset"(index, $P0)        
    .return (ret)
.end


=item C<table.setn (table, n)>

B<OBSOLETE>

=cut

.sub _table_setn :anon
    .param pmc table :optional
    .param pmc n :optional
    checktype(table, "table")
    error("'setn' is obsolete")
.end


=item C<table.sort (table [, comp])>

Sorts table elements in a given order, I<in-place>, from C<table[1]> to
C<table[n]>, where C<n> is the length of the table. If C<comp> is given,
then it must be a function that receives two table elements, and returns
true when the first is less than the second (so that C<not comp(a[i+1],a[i]>)
will be true after the sort). If C<comp> is not given, then the standard Lua
operator C<<> is used instead.

The sort algorithm is I<not> stable; that is, elements considered equal by
the given order may have their relative positions changed by the sort. 

NOT YET IMPLEMENTED (see auxsort).

=cut

.sub _table_sort :anon
    .param pmc table :optional
    .param pmc comp :optional
    .local int n
    checktype(table, "table")
    n = getn(table)
    if_null comp, L1
    if comp goto L1
    checktype(comp, "function")
    goto L2
L1:    
    .const .Sub lessthan = "lessthan"
    comp = lessthan
L2:
    auxsort(table, comp, n)
.end

.sub auxsort :anon
    .param pmc table
    .param pmc comp
    .param int u
    not_implemented()
.end

.sub lessthan :anon
    .param pmc l
    .param pmc r
    .local int ret
    ret = cmp l, r
    .return (ret)
.end

=back

=head1 AUTHORS

Francois Perrad

=cut

