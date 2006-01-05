# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: luatable.pir $

=head1 NAME

lib/luatable.pir - Lua Table Library

=head1 DESCRIPTION

This library provides generic functions for table manipulation. It provides
all its functions inside the table C<table>.

Most functions in the table library assume that the table represents an array
or a list. For those functions, an important concept is the I<size> of the
array. There are three ways to specify that size:

=over 4

=item the field C<"n">

When the table has a field C<"n"> with a numerical value, that value is
assumed as its size.

=item C<setn>

You can call the C<table.setn> function to explicitly set the size of a table.

=item implicit size

Otherwise, the size of the object is one less the first integer index with a
B<nil> value.

=back

For more details, see the descriptions of the C<table.getn> and C<table.setn>
functions.

See "Lua 5.0 Reference Manual", section 5.4 "Table Manipulation".

=head2 Functions

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luapir.pbc"
    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua Table\n"

    .local pmc _lua__G
    _lua__G = global "_G"
    $P1 = new .LuaString

    .local pmc _table
    _table = new .LuaTable
    $P1 = "table"
    _lua__G[$P1] = _table

    .const .Sub _table_concat = "_table_concat"
    $P0 = _table_concat
    $P1 = "concat"
    _table[$P1] = $P0

    .const .Sub _table_foreach = "_table_foreach"
    $P0 = _table_foreach
    $P1 = "foreach"
    _table[$P1] = $P0

    .const .Sub _table_foreachi = "_table_foreachi"
    $P0 = _table_foreachi
    $P1 = "foreachi"
    _table[$P1] = $P0

    .const .Sub _table_getn = "_table_getn"
    $P0 = _table_getn
    $P1 = "getn"
    _table[$P1] = $P0

    .const .Sub _table_sort = "_table_sort"
    $P0 = _table_sort
    $P1 = "sort"
    _table[$P1] = $P0

    .const .Sub _table_insert = "_table_insert"
    $P0 = _table_insert
    $P1 = "insert"
    _table[$P1] = $P0

    .const .Sub _table_remove = "_table_remove"
    $P0 = _table_remove
    $P1 = "remove"
    _table[$P1] = $P0

    .const .Sub _table_setn = "_table_setn"
    $P0 = _table_setn
    $P1 = "setn"
    _table[$P1] = $P0

.end

=item C<table.concat (table [, sep [, i [, j]]])>

Returns C<table[i]..sep..table[i+1] ... sep..table[j]>. The default value for
C<sep> is the empty string, the default for C<i> is 1, and the default for
C<j> is the size of the table. If C<i> is greater than C<j>, returns the
empty string.

NOT YET IMPLEMENTED.

=cut

.sub _table_concat :anon
    not_implemented()
.end

=item C<table.foreach (table, f)>

Executes the given C<f> over all elements of C<table>. For each element, C<f>
is called with the index and respective value as arguments. If C<f> returns
a non-B<nil> value, then the loop is broken, and this value is returned as
the final value of C<foreach>.

See the C<next> function for extra information about table traversals.

NOT YET IMPLEMENTED.

=cut

.sub _table_foreach :anon
    not_implemented()
.end

=item C<table.foreachi (table, f)>

Executes the given C<f> over the numerical indices of C<table>. For each
index, C<f> is called with the index and respective value as arguments.
Indices are visited in sequential order, from 1 to C<n>, where C<n> is the
size of the table. If C<f> returns a non-B<nil> value, then the loop is
broken and this value is returned as the result of C<foreachi>.

NOT YET IMPLEMENTED.

=cut

.sub _table_foreachi :anon
    not_implemented()
.end

=item C<table.getn (table)>

Returns the size of a table, when seen as a list. If the table has an C<n>
field with a numeric value, this value is the size of the table. Otherwise,
if there was a previous call to C<table.setn> over this table, the respective
value is returned. Otherwise, the size is one less the first integer index
with a B<nil> value.

NOT YET IMPLEMENTED.

=cut

.sub _table_getn :anon
    not_implemented()
.end

=item C<table.sort (table [, comp])>

Sorts table elements in a given order, I<in-place>, from C<table[1]> to
C<table[n]>, where C<n> is the size of the table. If C<comp> is given, then
it must be a function that receives two table elements, and returns true
when the first is less than the second (so that C<not comp(a[i+1],a[i]>) will
be true after the sort). If C<comp> is not given, then the standard Lua
operator C<<> is used instead.

The sort algorithm is I<not> stable, that is, elements considered equal by
the given order may have their relative positions changed by the sort.

NOT YET IMPLEMENTED.

=cut

.sub _table_sort :anon
    not_implemented()
.end

=item C<table.insert (table, [pos,] value)>

Inserts element C<value> at position C<pos> in C<table>, shifting up other
elements to open space, if necessary. The default value for C<pos> is C<n+1>,
where C<n> is the size of the table, so that a call C<table.insert(t,x)>
inserts C<x> at the end of table C<t>. This function also updates the size
of the table by calling C<table.setn(table, n+1)>.

NOT YET IMPLEMENTED.

=cut

.sub _table_insert :anon
    not_implemented()
.end

=item C<table.remove (table [, pos])>

Removes from C<table> the element at position C<pos>, shifting down other
elements to close the space, if necessary. Returns the value of the removed
element. The default value for C<pos> is C<n>, where C<n> is the size of the
table, so that a call C<table.remove(t)> removes the last element of table
C<t>. This function also updates the size of the table by calling
C<table.setn(table, n-1)>.

NOT YET IMPLEMENTED.

=cut

.sub _table_remove :anon
    not_implemented()
.end

=item C<table.setn (table, n)>

Updates the size of a table. If the table has a field C<"n"> with a numerical
value, that value is changed to the given C<n>. Otherwise, it updates an
internal state so that subsequent calls to C<table.getn(table)> return C<n>.

NOT YET IMPLEMENTED.

=cut

.sub _table_setn :anon
    not_implemented()
.end

=back

=head1 AUTHORS


=cut

