# Copyright (C) 2005-2012, Parrot Foundation.

=head1 DESCRIPTION

JSON.pir - PIR implementation of JSON data interchange format.

=head1 SYNOPSIS

Use the C<_json> method to generate a JSON representation of a PMC.

 load_bytecode 'JSON.pir'
 $S0 = _json( $P0 )

To generate a PMC from a JSON string, see L<compilers/data_json>.

=cut

=head1 FUNCTIONS

This library provides the following functions:

=over 4

=item (string) = _json(pmc, ?pretty )

Convert a PMC to a JSON-serialized string. Note: If you pass in a cyclic
structure, JSON will eventually throw a maximum recursion depth exception.

=over 4

=item pmc

Required. The PMC to dump.

=item pretty

Optional. Boolean: If true, then the generated string will be very
readable for humans. Defaults to false, which will generate the
most compact string possible.

=back

=cut

.const string _json_prefix = '  '

.sub _json
    .param pmc thing
    .param int pretty     :optional
    .param int has_pretty :opt_flag

    .local string result

    if has_pretty goto done_init
    pretty = 0

done_init:
    result = _json_any(thing,pretty,0)
    unless pretty goto plain
    result .= "\n"
plain:
    .return (result)
.end

.sub _json_any
    .param pmc thing
    .param int pretty
    .param int indent

done_init:
    if_null thing, json_null

    $I0 = does thing, "array"
    if $I0 goto json_array

    $I0 = does thing, "hash"
    if $I0 goto json_hash

    $I0 = does thing, "string"
    if $I0 goto json_string

    $I0 = does thing, "boolean"
    if $I0 goto json_boolean

    $I0 = does thing, "integer"
    if $I0 goto json_integer

    $I0 = does thing, "float"
    if $I0 goto json_float

    # Default to a null. We could in the future make this more
    # clever, or conditional.
json_null:
    .tailcall _json_null(thing,pretty,indent)
json_string:
    .tailcall _json_string(thing,pretty,indent)
json_array:
    .tailcall _json_array(thing,pretty,indent)
json_hash:
    .tailcall _json_hash(thing,pretty,indent)
json_boolean:
    .tailcall _json_boolean(thing,pretty,indent)
json_integer:
    .tailcall _json_number(thing,pretty,indent)
json_float:
    .tailcall _json_number(thing,pretty,indent)

.end

.sub '_json_null'
  .param pmc thing  # ignored, but needed for the ``API''
  .param int pretty
  .param int indent

  unless pretty goto plain
  unless indent goto plain

  .local string result
  result = repeat _json_prefix, indent
  result .= 'null'
  .return (result)

plain:
  .return ('null')
.end

.sub '_json_string'
  .param string thing
  .param int pretty
  .param int indent

  .local string result

  thing = escape thing

  result = '"' . thing
  result = result . '"'

  unless pretty goto plain
  unless indent goto plain

  $S0 = repeat _json_prefix, indent
  result = $S0 . result

plain:
  .return (result)
.end

.sub '_json_boolean'
  .param pmc thing
  .param int pretty
  .param int indent

  .local string result

  result = 'true'
  if thing goto got_value
  result = 'false'

got_value:

  unless pretty goto plain
  unless indent goto plain

  $S0 = repeat _json_prefix, indent
  result = $S0 . result

plain:
  .return (result)
.end

.sub '_json_number'
  .param pmc thing
  .param int pretty
  .param int indent

  .local string result

  result = thing

  unless pretty goto plain
  unless indent goto plain

  $S0 = repeat _json_prefix, indent
  result = $S0 . result

plain:
  .return (result)
.end

.sub '_json_array'
  .param pmc thing
  .param int pretty
  .param int indent

  .local string result

  result = '['
  .local int len
  len = thing

  unless pretty goto pre_loop
  unless indent goto pre_loop

  $S0 = repeat _json_prefix, indent
  result = $S0 . result
  if len goto pre_loop
  result .= "\n"

pre_loop:
  inc indent
  .local int pos
  pos = 0
  unless pretty goto loop
  if len == 0 goto done_loop
  result .= "\n"

loop:
  if pos >= len goto done_loop
  $P1 = thing[pos]
  $S0 = _json_any($P1,pretty,indent)
  result .= $S0
  inc pos
  if pos == len goto loop
  result .= ","
  unless pretty goto loop
  result .= "\n"
  goto loop

done_loop:
  dec indent

  .local string optional_newline,optional_indent
  optional_newline = ''
  optional_indent = ''

  unless pretty goto done
  if len == 0 goto indent1
  optional_newline = "\n"

indent1:
  unless indent goto done
  optional_indent = repeat _json_prefix, indent

done:
  result .= optional_newline
  result .= optional_indent
  result .= ']'

  .return (result)

.end

.sub '_json_hash'
  .param pmc thing
  .param int pretty
  .param int indent

  .local int not_empty
  not_empty = thing

  .local pmc keys
  keys = new 'ResizablePMCArray'
  .local pmc it
  it = iter thing
  .local string key

iter_loop:
  unless it, done_iter
  shift key, it
  push keys, key
  goto iter_loop

done_iter:
  keys.'sort'()

  .local string result,separator

  result = '{'
  separator = ':'

  unless pretty goto pre_loop
  separator = ' : '
  unless indent goto pre_loop

  $S0 = repeat _json_prefix, indent
  result = $S0 . result
  if not_empty goto pre_loop
  result .= "\n"

pre_loop:
  inc indent
  .local int pos
  pos = 0
  unless pretty goto loop
  unless not_empty goto done_loop
  result .= "\n"

loop:
  if pos >= not_empty goto done_loop
  key = keys[pos]
  $S0 = _json_string(key,pretty,indent)
  result .= $S0
  result .= separator
  $P1 = thing[key]
  $S0 = _json_any($P1,pretty,indent)

  # remove any leading whitespace on the value's string.
  unless pretty goto space_loop_skip

  .local int space_pos,space_len
  space_pos = 0
  space_len = length $S0

space_loop:
  if space_pos >= space_len goto space_loop_done
  $I0 = ord $S0, space_pos
  if $I0 != 32 goto space_loop_done

  inc space_pos
  goto space_loop

space_loop_done:
  $S0 = substr $S0, space_pos

space_loop_skip:

  result .= $S0
  inc pos
  if pos == not_empty goto loop
  result .= ","
  unless pretty goto loop
  result .= "\n"
  goto loop

done_loop:
  dec indent

  .local string optional_newline,optional_indent
  optional_newline = ''
  optional_indent = ''

  unless pretty goto done
  unless not_empty goto indent1
  optional_newline = "\n"

indent1:
  unless indent goto done
  optional_indent = repeat _json_prefix, indent

done:
  result .= optional_newline
  result .= optional_indent
  result .= '}'

  .return (result)
.end

=back

=head1 TODO

=over 4

=item 1

Thunk a better way to deal with the maximum recursion depth exception (Or make it official)

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
