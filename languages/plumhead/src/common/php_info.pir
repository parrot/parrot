# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_info.pir - PHP info Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string php_egg_logo_guid(void)>

Return the special ID used to request the PHP logo in phpinfo screens

=cut

.sub 'php_egg_logo_guid'
    not_implemented()
.end

=item C<string php_ini_loaded_file(void)>

Return the actual loaded ini filename

=cut

.sub 'php_ini_loaded_file'
    not_implemented()
.end

=item C<string php_ini_scanned_files(void)>

Return comma-separated string of .ini files parsed from the additional ini dir

=cut

.sub 'php_ini_scanned_files'
    not_implemented()
.end

=item C<string php_logo_guid(void)>

Return the special ID used to request the PHP logo in phpinfo screens

=cut

.sub 'php_logo_guid'
    not_implemented()
.end

=item C<string php_real_logo_guid(void)>

Return the special ID used to request the PHP logo in phpinfo screens

=cut

.sub 'php_real_logo_guid'
    not_implemented()
.end

=item C<string php_sapi_name(void)>

Return the current SAPI module name

=cut

# For now, only plain old CGI is supported
# Lie about the 'fcgi', in order to keep in line with the reference implementation
.sub 'php_sapi_name'
  .return( 'cgi-fcgi' )
.end


=item C<string php_uname(void)>

Return information about the system PHP was built on

=cut

.sub 'php_uname'
    not_implemented()
.end

=item C<void phpcredits([int flag])>

Prints the list of people who've contributed to the PHP project

=cut

.sub 'phpcredits'
    not_implemented()
.end

=item C<void phpinfo([int what])>

Output a page of useful information about PHP and the current request

=cut

.sub 'phpinfo'
    not_implemented()
.end

=item C<string phpversion([string extension])>

Return the current PHP version

=cut

.sub 'phpversion'
    not_implemented()
.end

=item C<string zend_logo_guid(void)>

Return the special ID used to request the Zend logo in phpinfo screens

=cut

.sub 'zend_logo_guid'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
