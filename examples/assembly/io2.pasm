# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/io2.pasm - IO Example

=head1 SYNOPSIS

    % ./parrot examples/assembly/io2.pasm

=head1 DESCRIPTION

Quick sample for using the open/read ops read op is limited to 65535
bytes per read.

Note that the file it expects to find is F</etc/passwd>.

=cut

open P0, "/etc/passwd", "<"
read S0, P0, 256 
print S0
end

=head1 SEE ALSO

F<examples/assembly/io1.pasm>.

=cut