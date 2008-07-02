# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pcntl.pir - PHP pcntl  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int pcntl_alarm(int seconds)>

Set an alarm clock for delivery of a signal

NOT IMPLEMENTED.

=cut

.sub 'pcntl_alarm'
    not_implemented()
.end

=item C<bool pcntl_exec(string path [, array args [, array envs]])>

Executes specified program in current process space as defined by exec(2)

NOT IMPLEMENTED.

=cut

.sub 'pcntl_exec'
    not_implemented()
.end

=item C<int pcntl_fork(void)>

Forks the currently running process following the same behavior as the UNIX fork() system call

NOT IMPLEMENTED.

=cut

.sub 'pcntl_fork'
    not_implemented()
.end

=item C<int pcntl_getpriority([int pid [, int process_identifier]])>

Get the priority of any process

NOT IMPLEMENTED.

=cut

.sub 'pcntl_getpriority'
    not_implemented()
.end

=item C<bool pcntl_setpriority(int priority [, int pid [, int process_identifier]])>

Change the priority of any process

NOT IMPLEMENTED.

=cut

.sub 'pcntl_setpriority'
    not_implemented()
.end

=item C<bool pcntl_signal(int signo, callback handle [, bool restart_syscalls])>

Assigns a system signal handler to a PHP function

NOT IMPLEMENTED.

=cut

.sub 'pcntl_signal'
    not_implemented()
.end

=item C<int pcntl_wait(int &status)>

Waits on or returns the status of a forked child as defined by the waitpid() system call

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wait'
    not_implemented()
.end

=item C<int pcntl_waitpid(int pid, int &status, int options)>

Waits on or returns the status of a forked child as defined by the waitpid() system call

NOT IMPLEMENTED.

=cut

.sub 'pcntl_waitpid'
    not_implemented()
.end

=item C<int pcntl_wexitstatus(int status)>

Returns the status code of a child's exit

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wexitstatus'
    not_implemented()
.end

=item C<bool pcntl_wifexited(int status)>

Returns true if the child status code represents a successful exit

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wifexited'
    not_implemented()
.end

=item C<bool pcntl_wifsignaled(int status)>

Returns true if the child status code represents a process that was terminated due to a signal

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wifsignaled'
    not_implemented()
.end

=item C<bool pcntl_wifstopped(int status)>

Returns true if the child status code represents a stopped process (WUNTRACED must have been used with waitpid)

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wifstopped'
    not_implemented()
.end

=item C<int pcntl_wstopsig(int status)>

Returns the number of the signal that caused the process to stop who's status code is passed

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wstopsig'
    not_implemented()
.end

=item C<int pcntl_wtermsig(int status)>

Returns the number of the signal that terminated the process who's status code is passed

NOT IMPLEMENTED.

=cut

.sub 'pcntl_wtermsig'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
