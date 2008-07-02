# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_com_dotnet.pir - PHP com_dotnet  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string COMPersistHelper::GetCurFile()>

Determines the filename into which an object will be saved, or false if none is set, via IPersistFile::GetCurFile

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::GetCurFile'
    not_implemented()
.end

=item C<int COMPersistHelper::GetMaxStreamSize()>

Gets maximum stream size required to store the object data, via IPersistStream::GetSizeMax (or IPersistStreamInit::GetSizeMax)

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::GetMaxStreamSize'
    not_implemented()
.end

=item C<int COMPersistHelper::InitNew()>

Initializes the object to a default state, via IPersistStreamInit::InitNew

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::InitNew'
    not_implemented()
.end

=item C<bool COMPersistHelper::LoadFromFile(string filename [, int flags])>

Load object data from file, via IPersistFile::Load

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::LoadFromFile'
    not_implemented()
.end

=item C<mixed COMPersistHelper::LoadFromStream(resource stream)>

Initializes an object from the stream where it was previously saved, via IPersistStream::Load or OleLoadFromStream

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::LoadFromStream'
    not_implemented()
.end

=item C<bool COMPersistHelper::SaveToFile(string filename [, bool remember])>

Persist object data to file, via IPersistFile::Save

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::SaveToFile'
    not_implemented()
.end

=item C<int COMPersistHelper::SaveToStream(resource stream)>

Saves the object to a stream, via IPersistStream::Save

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::SaveToStream'
    not_implemented()
.end

=item C<int COMPersistHelper::__construct([object com_object])>

Creates a persistence helper object, usually associated with a com_object

NOT IMPLEMENTED.

=cut

.sub 'COMPersistHelper::__construct'
    not_implemented()
.end

=item C<string com_create_guid()>

Generate a globally unique identifier (GUID)

NOT IMPLEMENTED.

=cut

.sub 'com_create_guid'
    not_implemented()
.end

=item C<bool com_event_sink(object comobject, object sinkobject [, mixed sinkinterface])>

Connect events from a COM object to a PHP object

NOT IMPLEMENTED.

=cut

.sub 'com_event_sink'
    not_implemented()
.end

=item C<object com_get_active_object(string progid [, int code_page ])>

Returns a handle to an already running instance of a COM object

NOT IMPLEMENTED.

=cut

.sub 'com_get_active_object'
    not_implemented()
.end

=item C<bool com_load_typelib(string typelib_name [, int case_insensitive])>

Loads a Typelibrary and registers its constants

NOT IMPLEMENTED.

=cut

.sub 'com_load_typelib'
    not_implemented()
.end

=item C<bool com_message_pump([int timeoutms])>

Process COM messages, sleeping for up to timeoutms milliseconds

NOT IMPLEMENTED.

=cut

.sub 'com_message_pump'
    not_implemented()
.end

=item C<bool com_print_typeinfo(object comobject | string typelib, string dispinterface, bool wantsink)>

Print out a PHP class definition for a dispatchable interface

NOT IMPLEMENTED.

=cut

.sub 'com_print_typeinfo'
    not_implemented()
.end

=item C<mixed variant_abs(mixed left)>

Returns the absolute value of a variant

NOT IMPLEMENTED.

=cut

.sub 'variant_abs'
    not_implemented()
.end

=item C<mixed variant_add(mixed left, mixed right)>

"Adds" two variant values together and returns the result

NOT IMPLEMENTED.

=cut

.sub 'variant_add'
    not_implemented()
.end

=item C<mixed variant_and(mixed left, mixed right)>

performs a bitwise AND operation between two variants and returns the result

NOT IMPLEMENTED.

=cut

.sub 'variant_and'
    not_implemented()
.end

=item C<object variant_cast(object variant, int type)>

Convert a variant into a new variant object of another type

NOT IMPLEMENTED.

=cut

.sub 'variant_cast'
    not_implemented()
.end

=item C<mixed variant_cat(mixed left, mixed right)>

concatenates two variant values together and returns the result

NOT IMPLEMENTED.

=cut

.sub 'variant_cat'
    not_implemented()
.end

=item C<int variant_cmp(mixed left, mixed right [, int lcid [, int flags]])>

Compares two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_cmp'
    not_implemented()
.end

=item C<object variant_date_from_timestamp(int timestamp)>

Returns a variant date representation of a unix timestamp

NOT IMPLEMENTED.

=cut

.sub 'variant_date_from_timestamp'
    not_implemented()
.end

=item C<int variant_date_to_timestamp(object variant)>

Converts a variant date/time value to unix timestamp

NOT IMPLEMENTED.

=cut

.sub 'variant_date_to_timestamp'
    not_implemented()
.end

=item C<mixed variant_div(mixed left, mixed right)>

Returns the result from dividing two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_div'
    not_implemented()
.end

=item C<mixed variant_eqv(mixed left, mixed right)>

Performs a bitwise equivalence on two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_eqv'
    not_implemented()
.end

=item C<mixed variant_fix(mixed left)>

Returns the integer part ? of a variant

NOT IMPLEMENTED.

=cut

.sub 'variant_fix'
    not_implemented()
.end

=item C<int variant_get_type(object variant)>

Returns the VT_XXX type code for a variant

NOT IMPLEMENTED.

=cut

.sub 'variant_get_type'
    not_implemented()
.end

=item C<mixed variant_idiv(mixed left, mixed right)>

Converts variants to integers and then returns the result from dividing them

NOT IMPLEMENTED.

=cut

.sub 'variant_idiv'
    not_implemented()
.end

=item C<mixed variant_imp(mixed left, mixed right)>

Performs a bitwise implication on two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_imp'
    not_implemented()
.end

=item C<mixed variant_int(mixed left)>

Returns the integer portion of a variant

NOT IMPLEMENTED.

=cut

.sub 'variant_int'
    not_implemented()
.end

=item C<mixed variant_mod(mixed left, mixed right)>

Divides two variants and returns only the remainder

NOT IMPLEMENTED.

=cut

.sub 'variant_mod'
    not_implemented()
.end

=item C<mixed variant_mul(mixed left, mixed right)>

multiplies the values of the two variants and returns the result

NOT IMPLEMENTED.

=cut

.sub 'variant_mul'
    not_implemented()
.end

=item C<mixed variant_neg(mixed left)>

Performs logical negation on a variant

NOT IMPLEMENTED.

=cut

.sub 'variant_neg'
    not_implemented()
.end

=item C<mixed variant_not(mixed left)>

Performs bitwise not negation on a variant

NOT IMPLEMENTED.

=cut

.sub 'variant_not'
    not_implemented()
.end

=item C<mixed variant_or(mixed left, mixed right)>

Performs a logical disjunction on two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_or'
    not_implemented()
.end

=item C<mixed variant_pow(mixed left, mixed right)>

Returns the result of performing the power function with two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_pow'
    not_implemented()
.end

=item C<mixed variant_round(mixed left, int decimals)>

Rounds a variant to the specified number of decimal places

NOT IMPLEMENTED.

=cut

.sub 'variant_round'
    not_implemented()
.end

=item C<void variant_set(object variant, mixed value)>

Assigns a new value for a variant object

NOT IMPLEMENTED.

=cut

.sub 'variant_set'
    not_implemented()
.end

=item C<void variant_set_type(object variant, int type)>

Convert a variant into another type.  Variant is modified "in-place"

NOT IMPLEMENTED.

=cut

.sub 'variant_set_type'
    not_implemented()
.end

=item C<mixed variant_sub(mixed left, mixed right)>

subtracts the value of the right variant from the left variant value and returns the result

NOT IMPLEMENTED.

=cut

.sub 'variant_sub'
    not_implemented()
.end

=item C<mixed variant_xor(mixed left, mixed right)>

Performs a logical exclusion on two variants

NOT IMPLEMENTED.

=cut

.sub 'variant_xor'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
