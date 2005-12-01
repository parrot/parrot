# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pir/uniq.pir - Remove duplicate lines from a sorted file

=head1 SYNOPSIS

    % ./parrot examples/pir/uniq.pir -o uniq.pbc

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

=head1 HISTORY

By Leon Brocard <acme@astray.com>.

Converted to PIR by Bernhard Schmalhofer.

=cut

.sub "uniq" :main
  .param pmc argv

  .local string program
  program = shift argv

  .local int num_args
  num_args = argv
  if num_args > 0 goto SOURCE
  print "usage: parrot "
  print program
  print " [-c] [-d] [-u] filename\n"
  goto END

SOURCE:
  # set up flag registers
  I10 = 0
  I11 = 0
  I12 = 0
  # do some simple option parsing
  .local string option
  option = shift argv

  ne option, "-c", NOTC
  I10 = 1 # count mode
  option = shift argv

NOTC:
  ne option, "-d", NOTD
  I11 = 1 # duplicate mode
  option = shift argv

NOTD:
  ne option, "-u", GO
  I12 = 1 # unique mode
  option = shift argv

GO:
  .local string file_name
  file_name = option

  I1 = 1 # count
  .local pmc in_fh
  in_fh = open file_name, "<"
  unless in_fh, ERR
  .local string prev_line, curr_line
  prev_line = readline in_fh

SOURCE_LOOP:
  unless in_fh, END
  curr_line = readline in_fh

  if curr_line == prev_line goto MATCH

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
  print prev_line
  branch RESET

NOTC2:
  unless I11, NOTD2

  # show duplicates mode
  eq 1, I1, RESET
  print prev_line
  branch RESET

ERR:
  print "Couldn't read "
  print S0
  exit 1

NOTD2:
  unless I12, NOTU2

  # don't show lines that are duplicated mode
  ne 1, I1, RESET
  print prev_line
  branch RESET

NOTU2:

  # default mode
  print prev_line
  branch RESET

RESET:
  set I1, 1
  branch LOOP

MATCH:
  inc I1
  # fall through

LOOP:
  set prev_line, curr_line
  if curr_line, SOURCE_LOOP
  close in_fh

END:
.end

