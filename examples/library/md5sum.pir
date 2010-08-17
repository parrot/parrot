# Copyright (C) 2005-2009, Parrot Foundation.
# $Id$

=head1 NAME

examples/library/md5sum.pir - calculate MD5 checksums

=head1 SYNOPSIS

    % ./parrot examples/library/md5sum.pir filename [filename ...]

=head1 DESCRIPTION

The main purpose of this script is testing the Digest/MD5.pir library.
It should behave very much like md5sum(1).

Running parrot with C<-R jit> will give a significant performance boost (often
about ten-fold).

=head1 AUTHOR

Nick Glencross     - <nickg@glencros.demon.co.uk>
Leopold Toetsch    - <lt@toetsch.at>

=cut

.loadlib 'os'       # OS object

.sub _main :main
    .param pmc args

    .local int size
    load_bytecode "Digest/MD5.pbc"
    # Argument count
    $I0 = args
    $I0 = $I0 - 1
    if $I0 > 0 goto has_args
    $S0 = args[0]
    print "(parrot) "
    print $S0
    print " filename [filename ...]\n"
    exit 1

has_args:

    $I1 = 1

next_iter:

    if $I1 > $I0 goto iter_done
    .local string file
    file = args[$I1]
    .include "stat.pasm"
    # Get size of file
    .local pmc os, stat_buf
    os = new ['OS']
    stat_buf = os.'stat'(file)
    size = stat_buf[7]
    .local pmc pio, cl
    cl = new 'FileHandle'
    # slurp the file into memory
    .local string contents
    contents = cl.'readall'(file)

    $I2 = length contents
    if $I2 == size goto size_ok

    print file
    print ": size mismatch ("
    print size
    print " vs "
    print $I2
    print ")\n"
    goto iter_cont

size_ok:

    $P0 = _md5sum (contents)
    _md5_print ($P0)
    print "\t"
    print file
    print "\n"

iter_cont:

    $I1 = $I1 + 1
    goto next_iter

iter_done:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
