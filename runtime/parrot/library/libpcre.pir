# Copyright (C) 2004-2008, Parrot Foundation.

=head1 TITLE

libpcre.pir - NCI interface to Perl-Compatible Regular Expression library

=head1 DESCRIPTION

See 'library/pcre.pir' for details on the user interface.

=cut


.namespace ['PCRE'; 'NCI']


.sub compile
    .param string pat
    .param int options

    .local pmc NULL
    NULL = null

    .local pmc PCRE_NCI_compile
    PCRE_NCI_compile = get_hll_global ['PCRE'; 'NCI'], 'PCRE_compile'

    .local pmc pat_cstr
    $P0 = dlfunc NULL, "Parrot_str_to_cstring", "ppS"
    $P1 = getinterp
    pat_cstr = $P0($P1, pat)

    .local pmc code, errmsgptr
    .local int erroffs
    (code, errmsgptr, erroffs) = PCRE_NCI_compile( pat_cstr, options, NULL, 0, NULL )

    $P0 = dlfunc NULL, "Parrot_str_free_cstring", "vp"
    $P0(pat_cstr)

    .local string errmsg
    errmsg = ""

    unless_null code, RETURN

    $P0 = dlfunc NULL, "Parrot_str_new", "SppI"
    $P1 = getinterp
    errmsg = $P0($P1, errmsgptr, 0)

RETURN:
    .return( code, errmsg, erroffs )
.end


.sub exec
    .param pmc regex
    .param string s
    .param int start
    .param int options

    .local int len
    length len, s

    .local pmc NULL
    NULL = null

    ## osize -- 2 * sizeof (int)
    ## on 32 bit systems
    .local int osize
    osize = 8

    ## number of result pairs
    .local int num_result_pairs
    num_result_pairs = 10

    .local int ovector_length
    ovector_length = osize * num_result_pairs

    .local pmc ovector
    ovector = new 'ManagedStruct'
    ovector = ovector_length

    .local pmc PCRE_NCI_exec
    PCRE_NCI_exec = get_hll_global ['PCRE'; 'NCI'], 'PCRE_exec'

    .local pmc s_cstr
    $P0 = dlfunc NULL, "Parrot_str_to_cstring", "ppS"
    $P1 = getinterp
    s_cstr = $P0($P1, s)

    .local int ok
    ok = PCRE_NCI_exec( regex, NULL, s_cstr, len, start, options, ovector, num_result_pairs )

    $P0 = dlfunc NULL, "Parrot_str_free_cstring", "vp"
    $P0(s_cstr)

    .return( ok, ovector )
.end


.sub result
    .param string s
    .param int ok
    .param pmc ovector
    .param int n

    .local string match
    match= ""
    if ok <= 0 goto NOMATCH

    .local int ovecs
    .local int ovece

    .local pmc struct
    struct = new 'FixedPMCArray'
    struct = 3

    .include "datatypes.pasm"

    struct[0] = .DATATYPE_INT
    $I0 = ok * 2
    struct[1] = $I0
    struct[2] = 0
    assign ovector, struct
    $I0 = n * 2
    ovecs = ovector[0;$I0]
    inc $I0
    ovece = ovector[0;$I0]
    $I0 = ovece - ovecs
    if ovecs >= 0 goto M1
    match = ""
    goto M0
M1:
    substr match, s, ovecs, $I0
M0:
NOMATCH:
    .return( match )
.end

=head1 FILES

pcre.pir, libpcre.pir

=head1 SEE ALSO

pcre(3)

=head1 AUTHORS

Original code by Leo Toetsch, updated by Jerry Gay
E<lt>jerry dot gay at gmail dot com<gt>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
