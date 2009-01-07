# $Id$

#
# playfield = load( file )
#
# Load a file given as parameter
# The return value is a perlarray of perlarrays filled with the
# ordinal values of the content of the file, 80x25.
#
.sub "load"
    .param string file

    .local int    len, missing, noline
    .local string line
    .local pmc    fh, playline, playfield

    playfield = new 'ResizablePMCArray'


    # read the befunge program
    fh        = open file, 'r'
    noline    = 0
  LOAD__READ_NEXT_LINE:
    inc noline
    if noline > 25 goto LOAD__COMPLETE

    line = readline fh
    len  = length line
    if len <= 0 goto LOAD__EOF

    line     = _load__fit_str_to_80(line)
    playline = _load__str_to_array(line)
    push playfield, playline
    goto LOAD__READ_NEXT_LINE

    # end of file, but not enough lines
  LOAD__EOF:
    missing = 24 - noline

  LOAD__FILL_EMPTY_LINE:
    line     = _load__fit_str_to_80('')
    playline = _load__str_to_array(line)
    push playfield, playline
    dec missing
    if missing > 0 goto LOAD__FILL_EMPTY_LINE

    # file loaded, return the playfield
  LOAD__COMPLETE:
    close fh
    .return(playfield)

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
    .local int i, len
    len = length str
    i   = 80 - len
  _LOAD__FIT_STR_TO_80__PADDING:
    if i <= 0 goto _LOAD__FIT_STR_TO_80__PADDED
    dec i
    concat str, ' '
    goto _LOAD__FIT_STR_TO_80__PADDING
  _LOAD__FIT_STR_TO_80__PADDED:

    # truncate to 80 chars
    substr str, 80, -1, ''

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
    dec len
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
