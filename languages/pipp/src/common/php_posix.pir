# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_posix.pir - PHP posix  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool posix_access(string file [, int mode])>

Determine accessibility of a file (POSIX.1 5.6.3)

NOT IMPLEMENTED.

=cut

.sub 'posix_access'
    not_implemented()
.end

=item C<string posix_ctermid(void)>

Generate terminal path name (POSIX.1, 4.7.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_ctermid'
    not_implemented()
.end

=item C<int posix_get_last_error(void)>

Retrieve the error number set by the last posix function which failed.

NOT IMPLEMENTED.

=cut

.sub 'posix_get_last_error'
    not_implemented()
.end

=item C<string posix_getcwd(void)>

Get working directory pathname (POSIX.1, 5.2.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_getcwd'
    not_implemented()
.end

=item C<int posix_getegid(void)>

Get the current effective group id (POSIX.1, 4.2.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getegid'
    not_implemented()
.end

=item C<int posix_geteuid(void)>

Get the current effective user id (POSIX.1, 4.2.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_geteuid'
    not_implemented()
.end

=item C<int posix_getgid(void)>

Get the current group id (POSIX.1, 4.2.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getgid'
    not_implemented()
.end

=item C<array posix_getgrgid(long gid)>

Group database access (POSIX.1, 9.2.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getgrgid'
    not_implemented()
.end

=item C<array posix_getgrnam(string groupname)>

Group database access (POSIX.1, 9.2.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getgrnam'
    not_implemented()
.end

=item C<array posix_getgroups(void)>

Get supplementary group id's (POSIX.1, 4.2.3)

NOT IMPLEMENTED.

=cut

.sub 'posix_getgroups'
    not_implemented()
.end

=item C<string posix_getlogin(void)>

Get user name (POSIX.1, 4.2.4)

NOT IMPLEMENTED.

=cut

.sub 'posix_getlogin'
    not_implemented()
.end

=item C<int posix_getpgid(void)>

Get the process group id of the specified process (This is not a POSIX function, but a SVR4ism, so we compile conditionally)

NOT IMPLEMENTED.

=cut

.sub 'posix_getpgid'
    not_implemented()
.end

=item C<int posix_getpgrp(void)>

Get current process group id (POSIX.1, 4.3.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getpgrp'
    not_implemented()
.end

=item C<int posix_getpid(void)>

Get the current process id (POSIX.1, 4.1.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getpid'
    not_implemented()
.end

=item C<int posix_getppid(void)>

Get the parent process id (POSIX.1, 4.1.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getppid'
    not_implemented()
.end

=item C<array posix_getpwnam(string groupname)>

User database access (POSIX.1, 9.2.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_getpwnam'
    not_implemented()
.end

=item C<array posix_getpwuid(long uid)>

User database access (POSIX.1, 9.2.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_getpwuid'
    not_implemented()
.end

=item C<array posix_getrlimit(void)>

Get system resource consumption limits (This is not a POSIX function, but a BSDism and a SVR4ism. We compile conditionally)

NOT IMPLEMENTED.

=cut

.sub 'posix_getrlimit'
    not_implemented()
.end

=item C<int posix_getsid(void)>

Get process group id of session leader (This is not a POSIX function, but a SVR4ism, so be compile conditionally)

NOT IMPLEMENTED.

=cut

.sub 'posix_getsid'
    not_implemented()
.end

=item C<int posix_getuid(void)>

Get the current user id (POSIX.1, 4.2.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_getuid'
    not_implemented()
.end

=item C<bool posix_initgroups(string name, int base_group_id)>

Calculate the group access list for the user specified in name.

NOT IMPLEMENTED.

=cut

.sub 'posix_initgroups'
    not_implemented()
.end

=item C<bool posix_isatty(int fd)>

Determine if filedesc is a tty (POSIX.1, 4.7.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_isatty'
    not_implemented()
.end

=item C<bool posix_kill(int pid, int sig)>

Send a signal to a process (POSIX.1, 3.3.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_kill'
    not_implemented()
.end

=item C<bool posix_mkfifo(string pathname, int mode)>

Make a FIFO special file (POSIX.1, 5.4.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_mkfifo'
    not_implemented()
.end

=item C<bool posix_mknod(string pathname, int mode [, int major [, int minor]])>

Make a special or ordinary file (POSIX.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_mknod'
    not_implemented()
.end

=item C<bool posix_setegid(long uid)>

Set effective group id

NOT IMPLEMENTED.

=cut

.sub 'posix_setegid'
    not_implemented()
.end

=item C<bool posix_seteuid(long uid)>

Set effective user id

NOT IMPLEMENTED.

=cut

.sub 'posix_seteuid'
    not_implemented()
.end

=item C<bool posix_setgid(int uid)>

Set group id (POSIX.1, 4.2.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_setgid'
    not_implemented()
.end

=item C<bool posix_setpgid(int pid, int pgid)>

Set process group id for job control (POSIX.1, 4.3.3)

NOT IMPLEMENTED.

=cut

.sub 'posix_setpgid'
    not_implemented()
.end

=item C<int posix_setsid(void)>

Create session and set process group id (POSIX.1, 4.3.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_setsid'
    not_implemented()
.end

=item C<bool posix_setuid(long uid)>

Set user id (POSIX.1, 4.2.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_setuid'
    not_implemented()
.end

=item C<string posix_strerror(int errno)>

Retrieve the system error message associated with the given errno.

NOT IMPLEMENTED.

=cut

.sub 'posix_strerror'
    not_implemented()
.end

=item C<array posix_times(void)>

Get process times (POSIX.1, 4.5.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_times'
    not_implemented()
.end

=item C<string posix_ttyname(int fd)>

Determine terminal device name (POSIX.1, 4.7.2)

NOT IMPLEMENTED.

=cut

.sub 'posix_ttyname'
    not_implemented()
.end

=item C<array posix_uname(void)>

Get system name (POSIX.1, 4.4.1)

NOT IMPLEMENTED.

=cut

.sub 'posix_uname'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
