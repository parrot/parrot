# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/uniq.pasm - Remove duplicate lines from a sorted file

=head1 SYNOPSIS

    % ./parrot uniq.pasm -o uniq.pbc
    % ./parrot uniq.pbc data.txt
    % ./parrot uniq.pbc -c data.txt

=head1 DESCRIPTION

Parrot implementation of C<uniq>. Removes duplicate lines from a sorted
file. You'll have to create a suitable file to "de-dup".

=head2 Command-line Options

=over 4

=item C<-c>

Precede each output line with the count of the number of times the
   line occurred in the input, followed by a single space

=item C<-d>

Don't output lines that are not repeated in the input

=item C<-u>

Don't output lines that are repeated in the input

=back

=cut

  set I0, P5
  shift S0, P5
  ne I0, 1, SOURCE
  print "usage: parrot "
  print S0
  print " [-c] [-d] [-u] filename\n"
  end

SOURCE:
  # do some simple option parsing
  shift S0, P5

  ne S0, "-c", NOTC
  set I10, 1 # count mode
  shift S0, P5

NOTC:
  ne S0, "-d", NOTD
  set I11, 1 # duplicate mode
  shift S0, P5

NOTD:
  ne S0, "-u", GO
  set I12, 1 # unique mode
  shift S0, P5

GO:
  # S2 is the previous line

  set I1, 1 # count
  # Read the file into S1
  open P1, S0, "<"
  unless P1, err
  readline S2, P1

SOURCE_LOOP:
  readline S1, P1

  eq S1, S2, MATCH

  # different line

  unless I10, NOTC2
  # count mode
  # we go to some lengths to make the count pretty
  set S3, I1
  length I2, S3
  sub I2, 7, I2
  set S3, " "
  repeat S3, S3, I2
  print S3
  print I1
  print " "
  print S2
  branch RESET

NOTC2:
  unless I11, NOTD2

  # show duplicates mode
  eq 1, I1, RESET
  print S2
  branch RESET

err:
  print "Couldn't read "
  print S0
  exit 1

NOTD2:
  unless I12, NOTU2

  # don't show lines that are duplicated mode
  ne 1, I1, RESET
  print S2
  branch RESET

NOTU2:

  # default mode
  print S2
  branch RESET

RESET:
  set I1, 1
  branch LOOP

MATCH:
  inc I1
  # fall through

LOOP:
  set S2, S1
  if S1, SOURCE_LOOP
  close P1

  end

=head1 HISTORY

By Leon Brocard <acme@astray.com>

=cut
