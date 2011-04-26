# Copyright (C) 2004-2009, Parrot Foundation.

=head1 TITLE

pcre.pir - user interface to Perl-Compatible Regular Expression library

=head1 SYNOPSIS

    load_bytecode 'pcre.pbc'

    .local pmc func, lib
    func = get_hll_global ['PCRE'], 'init'
    lib = func()

    func = get_hll_global ['PCRE'], 'compile'
    ( regex, error, errptr )= func( pat, options )

    func = get_hll_global ['PCRE'], 'match'
    ( ok, result )= func( regex, string, start, options )

    func = get_hll_global ['PCRE'], 'dollar'
    match = func( string, ok, result, i )

=head1 DESCRIPTION

This is the user interface to PCRE. Use this to initialize the library,
compile regexes, match against strings, and return the results.
All functions are found in the 'PCRE' namespace.

The NCI interface is contained in libpcre.pir.

=cut


.namespace ['PCRE']


=over 4

=item sub init()

Initialize the pcre library. The library handle is returned as a PMC
and is additionally stored as global 'PCRE', 'lib'.

=cut

.loadlib 'sys_ops'
.include "sysinfo.pasm"
.include 'datatypes.pasm'

.sub init
    .local pmc libpcre
    .local pmc pcre_function
    .local string osname
    .local int loaded

    osname = sysinfo .SYSINFO_PARROT_OS

    if 'MSWin32' == osname goto LIB_WIN32
    if 'cygwin'  == osname goto LIB_CYGWIN

LIB_DEFAULT:
# Plain name
    loadlib libpcre, 'libpcre'
    loaded = defined libpcre
    if loaded goto LIB_LOADED
# Shared object name
    loadlib libpcre, 'libpcre.so'
    loaded = defined libpcre
    if loaded goto LIB_LOADED
# soname of recent versions
    loadlib libpcre, 'libpcre.so.3'
    loaded = defined libpcre
    if loaded goto LIB_LOADED

    # See TT #578
    loadlib libpcre, 'libpcre.so.0'
    loaded = defined libpcre
    if loaded goto LIB_LOADED

    branch LIB_FAILED

LIB_WIN32:
    # Usually it's pcre.dll
    loadlib libpcre, 'pcre'
    loaded = defined libpcre
    if loaded goto LIB_LOADED
    # But maybe you have GnuWin32 pcre3.dll?
    loadlib libpcre, 'pcre3'
    loaded = defined libpcre
    if loaded goto LIB_LOADED
    loadlib libpcre, 'libpcre-0' # pcre 8.10 and maybe others
    loaded = defined libpcre
    if loaded goto LIB_LOADED
    branch LIB_FAILED

LIB_CYGWIN:
    loadlib libpcre, 'cygpcre-0'
    loaded = defined libpcre
    if loaded goto LIB_LOADED
    branch LIB_FAILED

LIB_LOADED:
    set_hll_global ['PCRE'], 'lib', libpcre

    load_bytecode 'libpcre.pbc'

    # pcre *pcre_compile(const char *pattern, int options,
    #            const char **errptr, int *erroffset,
    #            const unsigned char *tableptr
    $P0 = new ['FixedIntegerArray'], 6
    $P0[0] = .DATATYPE_PTR                      # pcre*
    $P0[1] = .DATATYPE_PTR                      # const char *pattern
    $P0[2] = .DATATYPE_INT                      # int options
    $I0    = .DATATYPE_PTR | .DATATYPE_REF_FLAG
    $P0[3] = $I0                                # const char **errptr
    $I0    = .DATATYPE_INT | .DATATYPE_REF_FLAG
    $P0[4] = $I0                                # int *erroffset
    $P0[5] = .DATATYPE_PTR                      # const unsigned char *tableptr
    pcre_function = dlfunc libpcre, 'pcre_compile', $P0
    set_hll_global ['PCRE'; 'NCI'], 'PCRE_compile', pcre_function

    #int pcre_exec(const pcre *code, const pcre_extra *extra,
    #        const char *subject, int length, int startoffset,
    #        int options, int *ovector, int ovecsize);
    $P0 = new ['FixedIntegerArray'], 9
    $P0[0] = .DATATYPE_INT # int
    $P0[1] = .DATATYPE_PTR # const pcre *code
    $P0[2] = .DATATYPE_PTR # const pcre_extra *extra
    $P0[3] = .DATATYPE_PTR # const char *subject
    $P0[4] = .DATATYPE_INT # int length
    $P0[5] = .DATATYPE_INT # int startoffset
    $P0[6] = .DATATYPE_INT # int options
    $P0[7] = .DATATYPE_PTR # int *ovector
    $P0[8] = .DATATYPE_INT # int ovecsize
    dlfunc pcre_function, libpcre, 'pcre_exec', $P0
    set_hll_global ['PCRE'; 'NCI'], 'PCRE_exec', pcre_function

    #int pcre_copy_substring(const char *subject, int *ovector,
    #        int stringcount, int stringnumber, char *buffer,
    #        int buffersize);
    $P0 = new ['FixedIntegerArray'], 7
    $P0[0] = .DATATYPE_INT # int
    $P0[1] = .DATATYPE_PTR # const char *subject
    $P0[2] = .DATATYPE_PTR # int *ovector
    $P0[3] = .DATATYPE_INT # int stringcount
    $P0[4] = .DATATYPE_INT # int stringnumber
    $P0[5] = .DATATYPE_PTR # char *buffer
    $P0[6] = .DATATYPE_INT # buffersize
    dlfunc pcre_function, libpcre, 'pcre_copy_substring', $P0
    set_hll_global ['PCRE'; 'NCI'], 'PCRE_copy_substring', pcre_function

    # const char *pcre_version(void);
    $P0 = new ['FixedIntegerArray'], 1
    $P0[0] = .DATATYPE_PTR
    dlfunc pcre_function, libpcre, 'pcre_version', $P0
    set_hll_global ['PCRE'; 'NCI'], 'PCRE_version', pcre_function

    .return( libpcre )

LIB_FAILED:
    die "Failed to load libpcre"
.end


=item sub ( regex, error, errptr )= compile( pattern, options )

Compile the string B<pattern> with int B<options>.
Returns pmc B<regex>, string B<error> and int B<errptr>.

=cut

.sub compile
    .param string pattern
    .param int options
    .local pmc pcre_function

    pcre_function= get_hll_global ['PCRE'; 'NCI'], 'compile'

    .local pmc regex
    .local string error
    .local int errptr

    ( regex, error, errptr )= pcre_function( pattern, options )

    .return( regex, error, errptr )
.end


=item sub ( ok, result )= match( regex, string, start, options )
 sub match ()= match()

Match the pmc B<regex> against string B<string> from int B<start> with
int B<options>. Returns the number of matches in int B<ok> and the ovector
in pmc B<result>.

=cut

.sub match
    .param pmc regex
    .param string str
    .param int start
    .param int options
    .local pmc pcre_function

    pcre_function= get_hll_global ['PCRE'; 'NCI'], 'exec'

    .local int ok
    .local pmc res

    ( ok, res )= pcre_function( regex, str, start, options )

    .return( ok, res )
.end


=item sub match= dollar( string, ok, result, i )

Extract from string B<string> the int B<i>th result into string B<match>.
Returns the match.

=cut

.sub dollar
    .param string str
    .param int ok
    .param pmc res
    .param int n
    .local pmc pcre_function

    pcre_function= get_hll_global ['PCRE'; 'NCI'], 'result'

    .local string matched

    matched= pcre_function( str, ok, res, n )

    .return( matched )
.end


=item sub (string)= version()

=cut

.sub version
    .local pmc pcre_function

    pcre_function = get_hll_global ['PCRE'; 'NCI'], 'PCRE_version'

    .local string ver

    ver = pcre_function()

    .return( ver )
.end

=back

=head1 BUGS

None known, but this hasn't been well tested. This interface
is designed to work on all platforms where PCRE and parrot
are supported, but has not been tested on all of them.
Send bug reports to E<lt>parrotbug@parrotcode.org<gt>

=cut

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
