# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_exec.pir - PHP exec Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string escapeshellarg(string arg)>

Quote and escape an argument for use in a shell command

NOT IMPLEMENTED.

=cut

.sub 'escapeshellarg'
    not_implemented()
.end

=item C<string escapeshellcmd(string command)>

Escape shell metacharacters

NOT IMPLEMENTED.

=cut

.sub 'escapeshellcmd'
    not_implemented()
.end

=item C<string exec(string command [, array &output [, int &return_value]])>

Execute an external program

NOT IMPLEMENTED.

=cut

.sub 'exec'
    not_implemented()
.end

=item C<void passthru(string command [, int &return_value])>

Execute an external program and display raw output

NOT IMPLEMENTED.

=cut

.sub 'passthru'
    not_implemented()
.end

=item C<bool proc_nice(int priority)>

Change the priority of the current process

NOT IMPLEMENTED.

=cut

.sub 'proc_nice'
    not_implemented()
.end

=item C<string shell_exec(string cmd)>

Execute command via shell and return complete output as string

NOT IMPLEMENTED.

=cut

.sub 'shell_exec'
    not_implemented()
.end

=item C<int system(string command [, int &return_value])>

Execute an external program and display output

NOT IMPLEMENTED.

=cut

.sub 'system'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
