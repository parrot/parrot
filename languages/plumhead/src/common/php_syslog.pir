# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_syslog.pir - PHP syslog Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool closelog(void)>

Close connection to system logger

=cut

.sub 'closelog'
    not_implemented()
.end

=item C<void define_syslog_variables(void)>

Initializes all syslog-related variables

=cut

.sub 'define_syslog_variables'
    not_implemented()
.end

=item C<bool openlog(string ident, int option, int facility)>

Open connection to system logger

=cut

.sub 'openlog'
    not_implemented()
.end

=item C<bool syslog(int priority, string message)>

Generate a system log message

=cut

.sub 'syslog'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
