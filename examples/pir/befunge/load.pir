# Copyright (C) 2002-2009, Parrot Foundation.

#
# playfield = load( file )
#
# Load a file given as parameter
# The return value is a perlarray of perlarrays filled with the
# ordinal values of the content of the file, 80x25.
#
.sub "load"
    .param string file

    .local int    len, missing, noline, newline
    .local string line
    .local pmc    fh, playline, playfield

    playfield = new 'ResizablePMCArray'


    # read the befunge program
    fh = new 'FileHandle'
    push_eh catch
    fh.'open'(file, 'r')
    pop_eh
    noline    = 0
  LOAD__READ_NEXT_LINE:
    inc noline
    if noline > 25 goto LOAD__COMPLETE

    line = fh.'readline'()
    len  = length line
    if len <= 0 goto LOAD__EOF

    newline = index line, "\n"
    if newline < 0 goto LOAD__SKIP_CHOP
    line = chopn line, 1
    LOAD__SKIP_CHOP:
    line     = _load__fit_str_to_80(line)
    playline = _load__str_to_array(line)
    push playfield, playline
    goto LOAD__READ_NEXT_LINE

    # end of file, but not enough lines
  LOAD__EOF:
    missing = 26 - noline

  LOAD__FILL_EMPTY_LINE:
    line     = _load__fit_str_to_80('')
    playline = _load__str_to_array(line)
    push playfield, playline
    dec missing
    if missing > 0 goto LOAD__FILL_EMPTY_LINE

    # file loaded, return the playfield
  LOAD__COMPLETE:
    fh.'close'()
    .return(playfield)

  catch:
    .local pmc ex
    .get_results (ex)
    $S0 = "Can't open '"
    $S0 .= file
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")"
    ex = $S0
    rethrow ex

.end


#
# str = _load__fit_str_to_80( str )
#
# return a string equal to str, but truncated at 80 chars, or filled up
# with spaces to have 80 chars.
#
.sub "_load__fit_str_to_80"
    .param string str

    # padding with spaces to 80 chars if needed
    $S0 = repeat ' ', 80
    str = concat str, $S0

    # truncate to 80 chars
    str = replace str, 80, -1, ''

    .return(str)
.end


#
# array = _load__str_to_array( str )
#
# return a pmc array whose values are ordinal values of each of the chars
# of str.
#
.sub "_load__str_to_array"
    .param string str

    .local int i, len, val
    .local string char
    .local pmc array

    i     = 0
    len   = length str
    array = new 'ResizablePMCArray'
  _LOAD__STR_TO_ARRAY__NEXT_CHAR:
    if i == len goto _LOAD__STR_TO_ARRAY__DONE
    char = substr str, i, 1
    val  = ord char
    push array, val
    inc i
    goto _LOAD__STR_TO_ARRAY__NEXT_CHAR

  _LOAD__STR_TO_ARRAY__DONE:
    .return(array)
.end


########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
