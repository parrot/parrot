# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_info.pir - PHP info Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.include 'languages/pipp/src/common/php_MACRO.pir'

.const string PHP_LOGO_GUID     = 'PHPE9568F34-D428-11d2-A769-00AA001ACF42'
.const string PHP_EGG_LOGO_GUID = 'PHPE9568F36-D428-11d2-A769-00AA001ACF42'
.const string ZEND_LOGO_GUID    = 'PHPE9568F35-D428-11d2-A769-00AA001ACF42'

.include 'tm.pasm'

.sub '__init' :anon :load :init
    $S0 = sysinfo .SYSINFO_PARROT_OS
    .REGISTER_STRING_CONSTANT('PHP_OS', $S0)
    .REGISTER_STRING_CONSTANT('PHP_VERSION', "5.3.0 on Parrot")
    .REGISTER_LONG_CONSTANT('PHP_MAJOR_VERSION', 5)
    .REGISTER_LONG_CONSTANT('PHP_MINOR_VERSION', 3)
    .REGISTER_LONG_CONSTANT('PHP_RELEASE_VERSION', 0)
    .REGISTER_STRING_CONSTANT('PHP_EXTRA_VERSION', " on Parrot")
    .REGISTER_LONG_CONSTANT('PHP_VERSION_ID', 50300)
    .REGISTER_LONG_CONSTANT('PHP_ZTS', 0)

    .REGISTER_STRING_CONSTANT('DEFAULT_INCLUDE_PATH', '.')

    # register NULL
    .local pmc cst
    cst = get_hll_global 'php_constants'
    new $P0, 'PhpNull'
    cst['NULL'] = $P0

.end

.sub 'logo_guid' :anon
    $I0 = time
    $P0 = decodetime $I0
    $I0 = $P0[.TM_MON]
    unless $I0 == 4 goto L1
    $I0 = $P0[.TM_MDAY]
    unless $I0 == 1 goto L1
    .RETURN_STRING(PHP_EGG_LOGO_GUID)
  L1:
    .RETURN_STRING(PHP_LOGO_GUID)
.end

.include 'sysinfo.pasm'

.sub 'get_uname' :anon
    .param string mode
    $S0 = sysinfo .SYSINFO_PARROT_OS
    .RETURN_STRING($S0)
.end

=item C<string php_egg_logo_guid(void)>

Return the special ID used to request the PHP logo in phpinfo screens

=cut

.sub 'php_egg_logo_guid'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .RETURN_STRING(PHP_EGG_LOGO_GUID)
.end

=item C<string php_ini_loaded_file(void)>

Return the actual loaded ini filename

NOT IMPLEMENTED.

=cut

.sub 'php_ini_loaded_file'
    not_implemented()
.end

=item C<string php_ini_scanned_files(void)>

Return comma-separated string of .ini files parsed from the additional ini dir

NOT IMPLEMENTED.

=cut

.sub 'php_ini_scanned_files'
    not_implemented()
.end

=item C<string php_logo_guid(void)>

Return the special ID used to request the PHP logo in phpinfo screens

=cut

.sub 'php_logo_guid'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .tailcall logo_guid()
.end

=item C<string php_real_logo_guid(void)>

Return the special ID used to request the PHP logo in phpinfo screens

=cut

.sub 'php_real_logo_guid'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .RETURN_STRING(PHP_LOGO_GUID)
.end

=item C<string php_sapi_name(void)>

Return the current SAPI module name

DUMMY IMPLEMENTATION.

=cut

.sub 'php_sapi_name'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    # For now, only plain old CGI is supported
    # Lie about the 'fcgi', in order to keep in line with the reference implementation
    .RETURN_STRING('cgi-fcgi')
.end


=item C<string php_uname([string mode])>

Return information about the system PHP was built on

STILL INCOMPLETE (see get_uname).

=cut

.sub 'php_uname'
    .param pmc args :slurpy
    .local string mode
    mode = 'a'
    ($I0, mode) = parse_parameters('|s', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .tailcall get_uname(mode)
.end

=item C<void phpcredits([int flag])>

Prints the list of people who've contributed to the PHP project

NOT IMPLEMENTED.

=cut

.sub 'phpcredits'
    not_implemented()
.end

=item C<void phpinfo([int what])>

Output a page of useful information about PHP and the current request

NOT IMPLEMENTED.

=cut

.sub 'phpinfo'
    not_implemented()
.end

=item C<string phpversion([string extension])>

Return the current PHP version

STILL INCOMPLETE (see get_module_version).

=cut

.sub 'phpversion'
    .param pmc args :slurpy
    .local int argc
    argc = args
    if argc goto L1
    .RETURN_STRING('5.3.0 on Parrot')
  L1:
    unless argc == 1 goto L2
    .local string ext
    $P1 = shift args
    ext = $P1
    $S0 = get_module_version(ext)
    unless $S0 == '' goto L3
    .RETURN_FALSE()
  L3:
    .RETURN_STRING($S0)
  L2:
    wrong_param_count()
    .RETURN_NULL()
.end

=item C<string zend_logo_guid(void)>

Return the special ID used to request the Zend logo in phpinfo screens

=cut

.sub 'zend_logo_guid'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    .RETURN_STRING(ZEND_LOGO_GUID)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
