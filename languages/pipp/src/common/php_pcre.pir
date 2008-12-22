# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pcre.pir - PHP pcre  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.HLL 'Pipp'

.include 'languages/pipp/src/common/php_MACRO.pir'
.include 'cclass.pasm'

.sub '__onload' :anon :load :init
    push_eh _handler
    load_bytecode "library/pcre.pir"
    $P0 = get_global ['PCRE'], 'init'
    $P1 = $P0()
    new $P0, 'PhpInteger'
    set $P0, 0
    set_hll_global 'pcre_error_code', $P0
    new $P0, 'Hash'
    set_hll_global 'pcre_cache', $P0
    __init()
  _handler:
.end

# options PCRE
.const int PCRE_CASELESS           = 0x00000001
.const int PCRE_MULTILINE          = 0x00000002
.const int PCRE_DOTALL             = 0x00000004
.const int PCRE_EXTENDED           = 0x00000008
.const int PCRE_ANCHORED           = 0x00000010
.const int PCRE_DOLLAR_ENDONLY     = 0x00000020
.const int PCRE_EXTRA              = 0x00000040
.const int PCRE_NOTBOL             = 0x00000080
.const int PCRE_NOTEOL             = 0x00000100
.const int PCRE_UNGREEDY           = 0x00000200
.const int PCRE_NOTEMPTY           = 0x00000400
.const int PCRE_UTF8               = 0x00000800
.const int PCRE_NO_AUTO_CAPTURE    = 0x00001000
.const int PCRE_NO_UTF8_CHECK      = 0x00002000
.const int PCRE_AUTO_CALLOUT       = 0x00004000
.const int PCRE_PARTIAL            = 0x00008000
.const int PCRE_DFA_SHORTEST       = 0x00010000
.const int PCRE_DFA_RESTART        = 0x00020000
.const int PCRE_FIRSTLINE          = 0x00040000
.const int PCRE_DUPNAMES           = 0x00080000
.const int PCRE_NEWLINE_CR         = 0x00100000
.const int PCRE_NEWLINE_LF         = 0x00200000
.const int PCRE_NEWLINE_CRLF       = 0x00300000
.const int PCRE_NEWLINE_ANY        = 0x00400000
.const int PCRE_NEWLINE_ANYCRLF    = 0x00500000
.const int PCRE_BSR_ANYCRLF        = 0x00800000
.const int PCRE_BSR_UNICODE        = 0x01000000


.const int PREG_PATTERN_ORDER              = 1
.const int PREG_SET_ORDER                  = 2
.const int PREG_OFFSET_CAPTURE             = 0x100

.const int PREG_SPLIT_NO_EMPTY             = 1
.const int PREG_SPLIT_DELIM_CAPTURE        = 2
.const int PREG_SPLIT_OFFSET_CAPTURE       = 4

.const int PREG_REPLACE_EVAL               = 1

.const int PREG_GREP_INVERT                = 1

.const int PHP_PCRE_NO_ERROR               = 0
.const int PHP_PCRE_INTERNAL_ERROR         = 1
.const int PHP_PCRE_BACKTRACK_LIMIT_ERROR  = 2
.const int PHP_PCRE_RECURSION_LIMIT_ERROR  = 3
.const int PHP_PCRE_BAD_UTF8_ERROR         = 4


.sub '__init' :anon
    .local pmc cst
    .GET_CONSTANTS(cst)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_PATTERN_ORDER', PREG_PATTERN_ORDER)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_SET_ORDER', PREG_SET_ORDER)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_OFFSET_CAPTURE', PREG_OFFSET_CAPTURE)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_SPLIT_NO_EMPTY', PREG_SPLIT_NO_EMPTY)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_SPLIT_DELIM_CAPTURE', PREG_SPLIT_DELIM_CAPTURE)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_SPLIT_OFFSET_CAPTURE', PREG_SPLIT_OFFSET_CAPTURE)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_GREP_INVERT', PREG_GREP_INVERT)

    .REGISTER_LONG_CONSTANT(cst, 'PREG_NO_ERROR', PHP_PCRE_NO_ERROR)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_INTERNAL_ERROR', PHP_PCRE_INTERNAL_ERROR)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_BACKTRACK_LIMIT_ERROR', PHP_PCRE_BACKTRACK_LIMIT_ERROR)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_RECURSION_LIMIT_ERROR', PHP_PCRE_RECURSION_LIMIT_ERROR)
    .REGISTER_LONG_CONSTANT(cst, 'PREG_BAD_UTF8_ERROR', PHP_PCRE_BAD_UTF8_ERROR)
    $P0 = get_global ['PCRE'], 'version'
    $S0= $P0()
    .REGISTER_STRING_CONSTANT(cst, 'PCRE_VERSION', $S0)
.end


.sub 'pcre_get_compiled_regex_cache' :anon
    .param string regex
    .local pmc cache
    .local pmc code
    cache = get_hll_global 'pcre_cache'
    $I0 = exists cache[regex]
    unless $I0 goto L0
    code = cache[regex]
    .return (code)
  L0:
    null code
    $I1 = length regex
    $I0 = find_not_cclass .CCLASS_WHITESPACE, regex, 0, $I1
    unless $I0 == $I1 goto L1
    error(E_WARNING, "Empty regular expression")
    .return (code)
  L1:
    .local string delimiter
    delimiter = substr regex, $I0, 1
    .local int start_pat
    start_pat = $I0 + 1
    $I0 = is_cclass .CCLASS_ALPHANUMERIC, delimiter, 0
    if $I0 goto L2
    if delimiter == "\\" goto L2
    goto L3
  L2:
    error(E_WARNING, "Delimiter must not be alphanumeric or backslash")
    .return (code)
  L3:
    .local string start_delimiter, end_delimiter
    start_delimiter = delimiter
    $I0 = index '([{<)]}>', delimiter
    if $I0 < 0 goto L4
    delimiter = substr ')]}>([{<', $I0, 1
  L4:
    end_delimiter = delimiter
    $I1 = length regex
    $I0 = start_pat
    unless start_delimiter == end_delimiter goto L5
  L6:
    unless $I0 < $I1 goto L7
    $S0 = substr regex, $I0, 1
    unless $S0 == "\\" goto L8
    inc $I0
    goto L9
  L8:
    if $S0 == delimiter goto L10
  L9:
    inc $I0
    goto L6
  L7:
    error(E_WARNING, "No ending delimiter '", delimiter, "' found")
    .return (code)
  L5:
    .local int brackets
    brackets = 1
  L11:
    unless $I0 < $I1 goto L7
    $S0 = substr regex, $I0, 1
    unless $S0 == "\\" goto L12
    inc $I0
    goto L13
  L12:
    unless $S0 == end_delimiter goto L14
    dec brackets
    if brackets <= 0 goto L10
    goto L13
  L14:
    unless $S0 == start_delimiter goto L13
    inc brackets
  L13:
    inc $I0
    goto L11
  L10:
    .local string pat
    $I1 = $I0 - start_pat
    pat = substr regex, start_pat, $I1
    .local string options
    inc $I0
    options = substr regex, $I0
    .local int coptions, poptions, do_study
    coptions = 0
    poptions = 0
    do_study = 0
    $I0 = 0
    $I1 = length options
  L20:
    unless $I0 < $I1 goto L21
    $S0 = substr options, $I0, 1
    unless $S0 == 'i' goto L23
    coptions |= PCRE_CASELESS
    goto L22
  L23:
    unless $S0 == 'm' goto L24
    coptions |= PCRE_MULTILINE
    goto L22
  L24:
    unless $S0 == 's' goto L25
    coptions |= PCRE_DOTALL
    goto L22
  L25:
    unless $S0 == 'x' goto L26
    coptions |= PCRE_EXTENDED
    goto L22
  L26:
    unless $S0 == 'A' goto L27
    coptions |= PCRE_ANCHORED
    goto L22
  L27:
    unless $S0 == 'D' goto L28
    coptions |= PCRE_DOLLAR_ENDONLY
    goto L22
  L28:
    unless $S0 == 'S' goto L29
    do_study = 1
    goto L22
  L29:
    unless $S0 == 'U' goto L30
    coptions |= PCRE_UNGREEDY
    goto L22
  L30:
    unless $S0 == 'X' goto L31
    coptions |= PCRE_EXTRA
    goto L22
  L31:
    unless $S0 == 'u' goto L32
    coptions |= PCRE_UTF8
    goto L22
  L32:
    unless $S0 == 'X' goto L33
    poptions |= PREG_REPLACE_EVAL
    goto L22
  L33:
    if $S0 == ' ' goto L22
    if $S0 == "\n" goto L22
    error(E_WARNING, "Unknown modifier '", $S0, "'")
    .return (code)
  L22:
    inc $I0
    goto L20
  L21:
    .local string error
    .local int errptr
    $P0 = get_global ['PCRE'], 'compile'
    (code, error, errptr)= $P0(pat, coptions)
    unless null code goto L34
#    error(E_WARNING, "Compilation failed: ", error, " at offset ", errptr)
    .return (code)
  L34:
    cache[regex] = code
    .return (code)
.end


=item C<array preg_grep(string regex, array input [, int flags])>

Searches array and returns entries which match regex

NOT IMPLEMENTED.

=cut

.sub 'preg_grep'
    .param pmc args :slurpy
    .local string regex
    .local pmc input
    .local int flags
    flags = 0
    ($I0, regex, input, flags) = parse_parameters('sa|l', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc pce
    pce = pcre_get_compiled_regex_cache(regex)
    unless null pce goto L2
    .RETURN_FALSE()
  L2:
    .tailcall preg_grep_impl(pce, input, flags)
.end

.sub 'preg_grep_impl' :anon
    .param pmc pce
    .param pmc input
    .param int flags
    not_implemented()
.end

=item C<int preg_last_error()>

Returns the error code of the last regexp execution.

=cut

.sub 'preg_last_error'
    .param pmc args :slurpy
    ($I0) = parse_parameters('', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $P0 = get_hll_global 'pcre_error_code'
    .return ($P0)
.end

=item C<int preg_match(string pattern, string subject [, array subpatterns [, int flags [, int offset]]])>

Perform a Perl-style regular expression match

STILL INCOMPLETE (see pcre_match_impl).

=cut

.sub 'preg_match'
    .param pmc args :slurpy
    .local string regex
    .local string subject
    .local pmc subpats
    .local int flags
    .local int start_offset
    flags = 0
    start_offset = 0
    ($I0, regex, subject, subpats, flags, start_offset) = parse_parameters('ss|zll', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc pce
    pce = pcre_get_compiled_regex_cache(regex)
    unless null pce goto L2
    .RETURN_FALSE()
  L2:
    .local int use_flags
    use_flags = 0
    $I0 = args
    unless $I0 >= 4 goto L3
    use_flags = 1
  L3:
    .tailcall pcre_match_impl(pce, subject, subpats, 0, use_flags, flags, start_offset)
.end

.sub 'pcre_match_impl' :anon
    .param pmc pce
    .param string subject
    .param pmc subpats
    .param int _global
    .param int use_flags
    .param int flags
    .param int start_offset
    .local int ok
    .local pmc result
    $P0 = get_global ['PCRE'], 'match'
    (ok, result)= $P0(pce, subject, 0, 0)
    unless ok < 0 goto L1
    .RETURN_LONG(0)
  L1:
    .RETURN_LONG(1)
.end

=item C<int preg_match_all(string pattern, string subject, array subpatterns [, int flags [, int offset]])>

Perform a Perl-style global regular expression match

STILL INCOMPLETE (see pcre_match_impl).

=cut

.sub 'preg_match_all'
    .param pmc args :slurpy
    .local string regex
    .local string subject
    .local pmc subpats
    .local int flags
    .local int start_offset
    flags = 0
    start_offset = 0
    ($I0, regex, subject, subpats, flags, start_offset) = parse_parameters('ss|zll', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc pce
    pce = pcre_get_compiled_regex_cache(regex)
    unless null pce goto L2
    .RETURN_FALSE()
  L2:
    .local int use_flags
    use_flags = 0
    $I0 = args
    unless $I0 >= 4 goto L3
    use_flags = 1
  L3:
    .tailcall pcre_match_impl(pce, subject, subpats, 1, use_flags, flags, start_offset)
.end

=item C<string preg_quote(string str [, string delim_char])>

Quote regular expression characters plus an optional character

=cut

.sub 'preg_quote'
    .param pmc args :slurpy
    .local string in_str
    .local string delim
    delim = ''
    ($I0, in_str, delim) = parse_parameters('s|s', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    unless in_str == '' goto L2
    .RETURN_EMPTY_STRING()
  L2:
    if delim == '' goto L3
    delim = substr delim, 0, 1
  L3:
    $S0 = ''
    $P0 = split '', in_str
  L4:
    unless $P0 goto L5
    $S1 = shift $P0
    $I0 = index '.\+*?[^]$(){}=!<>|:', $S1
    if $I0 < 0 goto L6
    concat $S0, "\\"
    concat $S0, $S1
    goto L4
  L6:
    unless $S1 == "\0" goto L7
    concat $S0, "\\000"
    goto L4
  L7:
    unless $S1 == delim goto L8
    concat $S0, "\\"
  L8:
    concat $S0, $S1
    goto L4
  L5:
    .RETURN_STRING($S0)
.end

=item C<string preg_replace(mixed regex, mixed replace, mixed subject [, int limit [, count]])>

Perform Perl-style regular expression replacement.

NOT IMPLEMENTED.

=cut

.sub 'preg_replace'
    not_implemented()
.end

=item C<string preg_replace_callback(mixed regex, mixed callback, mixed subject [, int limit [, count]])>

Perform Perl-style regular expression replacement using replacement callback.

NOT IMPLEMENTED.

=cut

.sub 'preg_replace_callback'
    not_implemented()
.end

=item C<array preg_split(string pattern, string subject [, int limit [, int flags]])>

Split string into an array using a perl-style regular expression as a delimiter

NOT IMPLEMENTED.

=cut

.sub 'preg_split'
    .param pmc args :slurpy
    .local string regex
    .local string subject
    .local int limit
    .local int flags
    limit = -1
    flags = 0
    ($I0, regex, subject, limit, flags) = parse_parameters('ss|ll', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc pce
    pce = pcre_get_compiled_regex_cache(regex)
    unless null pce goto L2
    .RETURN_FALSE()
  L2:
    .tailcall pcre_split_impl(pce, subject, limit, flags)
.end

.sub 'pcre_split_impl' :anon
    .param pmc pce
    .param string subject
    .param int limit
    .param int flags
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
