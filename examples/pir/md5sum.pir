# Parrot md5sum; Nick Glencross <nickg@glencros.demon.co.uk>
#                Improvements from Leo
#
# Harness for the Digest/MD5.pir library

=head1 NAME

examples/pir/md5sum.imc - calculate MD5 checksums

=head1 SYNOPSIS

    % ./parrot examples/pir/md5sum.imc filename [filename ...]

=head1 DESCRIPTION

Behave very much like md5sum(1).

Running parrot with -j will give a significant performance boost (often
about ten-fold).

=cut

###########################################################################

# Main Harness to demonstrate MD5.imc

.sub _main :main
    .param pmc args

    .local int size
    load_bytecode "Digest/MD5.pbc"
    # Argument count
    $I0 = args
    $I0 = $I0 - 1
    if $I0 > 0 goto has_args
    $S0 = args[0]
    printerr "(parrot) "
    printerr $S0
    printerr " filename [filename ...]\n"
    exit 1

has_args:

    $I1 = 1

next_iter:

    if $I1 > $I0 goto iter_done
    .local string file
    file = args[$I1]
    .include "stat.pasm"
    # Get size of file
    stat size, file, .STAT_FILESIZE
    .local pmc pio, cl
    cl = getclass "ParrotIO"
    # slurp the file into memory
    pio = cl."open"(file, "<", "mmap")
    # pio = open file, "<"
    defined $I2, pio
    if $I2 goto found
    printerr file
    printerr ": Cannot find\n"
    goto iter_cont
found:
    read $S1, pio, size
    close pio

    $I2 = length $S1
    if $I2 == size goto size_ok

    printerr file
    printerr ": size mismatch\n"
    goto iter_cont

size_ok:

    $P0 = _md5sum ($S1)
    _md5_print ($P0)
    print "\t"
    print file
    print "\n"

iter_cont:

    $I1 = $I1 + 1
    goto next_iter

iter_done:

.end

