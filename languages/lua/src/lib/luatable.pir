# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luatable.pir - Lua Table Library

=head1 DESCRIPTION

This library provides generic functions for table manipulation. It provides
all its functions inside the table C<table>.

Most functions in the table library assume that the table represents an
array or a list. For these functions, when we talk about the "length" of a
table we mean the result of the length operator.

See "Lua 5.1 Reference Manual", section 5.5 "Table Manipulation",
L<http://www.lua.org/manual/5.1/manual.html#5.5>.

=head2 Functions

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'table' ]

.sub 'luaopen_table'
#    print "init Lua Table\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _table
    new _table, 'LuaTable'
    set $P1, 'table'
    _lua__GLOBAL[$P1] = _table

    # LUA_COMPAT_GETN
    $P2 = split "\n", <<'LIST'
concat
foreach
foreachi
getn
insert
maxn
remove
setn
sort
LIST
    lua_register($P1, _table, $P2)

.end

=item C<table.concat (table [, sep [, i [, j]]])>

Returns C<table[i]..sep..table[i+1] ... sep..table[j]>. The default value for
C<sep> is the empty string, the default for C<i> is 1, and the default for
C<j> is the length of the table. If C<i> is greater than C<j>, returns the
empty string.

=cut

.sub 'concat'
    .param pmc table :optional
    .param pmc sep :optional
    .param pmc i :optional
    .param pmc j :optional
    .param pmc extra :slurpy
    .local string res
    .local int last
    $S2 = lua_optstring(2, sep, '')
    lua_checktype(1, table, 'table')
    $I3 = lua_optint(3, i, 1)
    $I0 = table.'len'()
    last = lua_optint(4, j, $I0)
    res = ''
  L1:
    unless $I3 < last goto L2
    res = addfield(res, table, $I3)
    concat res, $S2
    inc $I3
    goto L1
  L2:
    unless $I3 == last goto L3
    res = addfield(res, table, $I3)
  L3:
    new $P0, 'LuaString'
    set $P0, res
    .return ($P0)
.end

.sub 'addfield' :anon
    .param string b
    .param pmc table
    .param int i
    .local pmc idx
    new idx, 'LuaNumber'
    set idx, i
    .local pmc value
    value = table.'rawget'(idx)
    $I0 = isa value, 'LuaString'
    if $I0 goto L1
    $I0 = isa value, 'LuaNumber'
    if $I0 goto L1
    $S0 = typeof value
    lua_error("invalid value (", $S0, ") at index ",i," in table for 'concat'")
  L1:
    $S0 = value
    concat b, $S0
    .return (b)
.end

=item C<table.foreach (table, f)>

Executes the given C<f> over all elements of C<table>. For each element, C<f>
is called with the index and respective value as arguments. If C<f> returns
a non-B<nil> value, then the loop is broken, and this value is returned as
the final value of C<foreach>.

See the C<next> function for extra information about table traversals.

B<DEPRECATED>

=cut

.sub 'foreach'
    .param pmc table :optional
    .param pmc f :optional
    .param pmc extra :slurpy
    .local pmc idx
    .local pmc value
    .local pmc res
    lua_checktype(1, table, 'table')
    lua_checktype(2, f, 'function')
    new idx, 'LuaNil'
  L1:
    $P0 = table.'next'(idx)
    unless $P0 goto L2
    idx = $P0[0]
    value = $P0[1]
    (res) = f(idx, value)
    $I0 = defined res
    unless $I0 goto L1
    .return (res)
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

.sub 'foreachi'
    .param pmc table :optional
    .param pmc f :optional
    .param pmc extra :slurpy
    .local pmc idx
    .local pmc value
    .local pmc res
    .local int i
    .local int n
    lua_checktype(1, table, 'table')
    lua_checktype(2, f, 'function')
    n = table.'len'()
    i = 0
    new idx, 'LuaNumber'
  L1:
    inc i
    unless i <= n goto L2
    set idx, i
    value = table.'rawget'(idx)
    (res) = f(idx, value)
    $I0 = defined res
    unless $I0 goto L1
    .return (res)
  L2:
    .return ()
.end


=item C<table.getn (table)>

Returns the size of a table.

B<DEPRECATED>

=cut

.sub 'getn'
    .param pmc table :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checktype(1, table, 'table')
    res = table.'len'()
    .return (res)
.end


=item C<table.insert (table, [pos,] value)>

Inserts element C<value> at position C<pos> in C<table>, shifting up other
elements to open space, if necessary. The default value for C<pos> is C<n+1>,
where C<n> is the length of the table, so that a call C<table.insert(t,x)>
inserts C<x> at the end of table C<t>.

=cut

.sub 'insert'
    .param pmc table :optional
    .param pmc arg2 :optional
    .param pmc arg3 :optional
    .param pmc extra :slurpy
    .local pmc value
    .local pmc idx
    .local int e
    .local int pos
    new idx, 'LuaNumber'
    lua_checktype(1, table, 'table')
    e = table.'len'()
    inc e
    unless null arg3 goto L1
    pos = e
    value = arg2
    goto L2
  L1:
    pos = lua_checknumber(2, arg2)
    unless pos > e goto L3
    e = pos
  L3:
    value = arg3
  L4:
    dec e
    unless e >= pos goto L2
    set idx, e
    $P0 = table.'rawget'(idx)
    inc idx
    table.'rawset'(idx, $P0)
    goto L4
  L2:
    set idx, pos
    table.'rawset'(idx, value)
.end


=item C<table.maxn (table)>

Returns the largest positive numerical index of the given table, or zero if
the table has no positive numerical indices. (To do its job this function
does a linear traversal of the whole table.)

=cut

.sub 'maxn'
    .param pmc table :optional
    .param pmc extra :slurpy
    .local pmc idx
    .local pmc max
    lua_checktype(1, table, 'table')
    new max, 'LuaNumber'
    set max, 0
    new idx, 'LuaNil'
  L1:
    $P0 = table.'next'(idx)
    unless $P0 goto L2
    idx = $P0[0]
    $I0 = isa idx, 'LuaNumber'
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

.sub 'remove'
    .param pmc table :optional
    .param pmc pos :optional
    .param pmc extra :slurpy
    .local pmc idx
    .local pmc res
    .local int e
    .local int ipos
    lua_checktype(1, table, 'table')
    e = table.'len'()
    ipos = lua_optint(2, pos, e)
    # position is outside bounds?
    unless 1 <= ipos goto L1
    if ipos <= e goto L2
  L1:
    # nothing to remove
    new res, 'LuaNil'
    .return (res)
  L2:
    new idx, 'LuaNumber'
    set idx, ipos
    res = table.'rawget'(idx)
  L3:
    unless ipos < e goto L4
    $I2 = ipos + 1
    set idx, $I2
    $P0 = table.'rawget'(idx)
    set idx, ipos
    table.'rawset'(idx, $P0)
    ipos = $I2
    goto L3
  L4:
    new $P0, 'LuaNil'
    set idx, e
    table.'rawset'(idx, $P0)
    .return (res)
.end

=item C<table.setn (table, n)>

B<OBSOLETE>

=cut

.sub 'setn'
    .param pmc table :optional
    .param pmc n :optional
    .param pmc extra :slurpy
    lua_checktype(1, table, 'table')
    lua_error("'setn' is obsolete")
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

=cut

.sub 'sort'
    .param pmc table :optional
    .param pmc comp :optional
    .param pmc extra :slurpy
    .local int n
    lua_checktype(1, table, 'table')
    n = table.'len'()
    if null comp goto L1
    $I0 = isa comp, 'LuaNil'
    if $I0 goto L1
    lua_checktype(2, comp, 'function')
  L1:
    auxsort(table, comp, 1, n)
.end

.sub 'auxsort' :anon
    .param pmc table
    .param pmc comp
    .param int l
    .param int u
    .local pmc idx1
    .local pmc idx2
    .local int i
    .local int j
    .local int tmp
    new idx1, 'LuaNumber'
    new idx2, 'LuaNumber'
  L1:
    unless l < u goto L2
    # sort elements a[l], a[(l+u)/2] and a[u]
    set idx1, l
    set idx2, u
    $P1 = table.'rawget'(idx1)
    $P2 = table.'rawget'(idx2)
    $I0 = sort_comp(comp, $P2, $P1) # a[u] < a[l]?
    unless $I0 goto L3
    # swap a[l] - a[u]
    table.'rawset'(idx1, $P2)
    table.'rawset'(idx2, $P1)
  L3:
    tmp = u - l
    if tmp == 1 goto L2 # break: only 2 elements
    i = l + u
    i /= 2
    set idx1, i
    set idx2, l
    $P1 = table.'rawget'(idx1)
    $P2 = table.'rawget'(idx2)
    $I0 = sort_comp(comp, $P1, $P2) # a[i]<a[l]?
    unless $I0 goto L4
    table.'rawset'(idx1, $P2)
    table.'rawset'(idx2, $P1)
    goto L5
  L4:
    set idx2, u
    $P2 = table.'rawget'(idx2)
    $I0 = sort_comp(comp, $P2, $P1) # a[u]<a[i]?
    unless $I0 goto L5
    table.'rawset'(idx1, $P2)
    table.'rawset'(idx2, $P1)
  L5:
    tmp = u - l
    if tmp == 2 goto L2 # break: only 3 elements
    set idx1, i
    $P1 = table.'rawget'(idx1)    # Pivot
    tmp = u - 1
    set idx2, tmp
    $P2 = table.'rawget'(idx2)
    table.'rawset'(idx1, $P2)
    table.'rawset'(idx2, $P1)
    # a[l] <= P == a[u-1] <= a[u], only need to sort from l+1 to u-2 */
    i = l
    j = u - 1
  L6: # invariant: a[l..i] <= P <= a[j..u]
    # repeat ++i until a[i] >= P
    inc i
    set idx2, i
    $P2 = table.'rawget'(idx2)
    $I0 = sort_comp(comp, $P2, $P1)
    unless $I0 goto L7
    unless i >= u goto L6
    lua_error("invalid order function for sorting")
    goto L6
  L7:
    # repeat --j until a[j] <= P
    dec j
    set idx1, j
    $P3 = table.'rawget'(idx1)
    $I0 = sort_comp(comp, $P1, $P3)
    unless $I0 goto L8
    unless j <= l goto L7
    lua_error("invalid order function for sorting")
    goto L7
  L8:
    if j < i goto L9
    table.'rawset'(idx2, $P3)
    table.'rawset'(idx1, $P2)
    goto L6
  L9:
    tmp = u - 1
    set idx1, tmp
    set idx2, i
    $P1 = table.'rawget'(idx1)
    $P2 = table.'rawget'(idx2)
    # swap pivot (a[u-1]) with a[i]
    table.'rawset'(idx1, $P2)
    table.'rawset'(idx2, $P1)
    # a[l..i-1] <= a[i] == P <= a[i+1..u]
    # adjust so that smaller half is in [j..i] and larger one in [l..u]
    tmp += l
    unless i < tmp goto L10
    j = l
    i = i - 1
    l = i + 2
    goto L11
  L10:
    j = i + 1
    i = u
    u = j - 2
  L11:
    # call recursively the smaller one
    auxsort(table, comp, j, i)
    # repeat the routine for the larger one
    goto L1
  L2:
.end

.sub 'sort_comp' :anon
    .param pmc comp
    .param pmc a
    .param pmc b
    if null comp goto L1
    unless comp goto L1
    $P0 = comp(a, b)
    $I0 = istrue $P0
    .return ($I0)
  L1:
    $I0 = islt a, b
    .return ($I0)
.end

=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
