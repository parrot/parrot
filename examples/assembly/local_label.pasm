# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/local_label.pasm - Local labels

=head1 SYNOPSIS

    % ./parrot examples/assembly/local_label.pasm

=head1 DESCRIPTION

Show the use of a C<.local> label.

Note that this file contains IMC (PIR) not PASM.

=cut

.macro MAIN ()
              print	"test 1\n"
	      branch	.$ok
.local $ng:   print	"ng 1\n"
	      branch	test2
.local $ok:   print	"ok 1\n"

.endm

.macro TEST2 ()
test2:
              print	"test 2\n"
	      branch	.$ok
.local $ng:   print	"ng 2\n"
	      branch	done
.local $ok:   print	"ok 2\n"

.endm

              .MAIN ()
              .TEST2 ()

done:	      end
	

