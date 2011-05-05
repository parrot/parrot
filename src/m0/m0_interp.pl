#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/m0/m0_interpreter.pl - M0 Interpreter Prototype 

=head1 SYNOPSIS

    % m0_interpreter.pl foo.m0b

=head1 DESCRIPTION

Run M0 bytecode assembled by the M0 assembler.

=cut

use strict;
use warnings;
use feature 'say';
use autodie qw/:all/;
use File::Slurp qw/slurp/;
use Data::Dumper;

my $file = shift || die "Usage: $0 foo.m0b";

run_m0b($file);


=item C<run_m0b>

Load and run an M0 bytecode file.

=cut

sub run_m0b {
    my ($filename) = @_;

    my $interp = new_interp();
    load_m0b($interp, $filename);
    #$ctx = new_context($interp);
    #run_ops($ctx);
}


=item C<initialize_interp>

Initialize an M0 interpreter.  Note that this is different from a context,
where most of the interesting work takes place.

=cut

sub new_interp {
    my $interp;

    $interp->{opfuncs} = [
        \&m0_opfunc_noop,
        \&m0_opfunc_say_i,
    ];
    $interp->{config} = {};
    $interp->{contexts} = [];
    $interp->{chunk_info} = [];
    return $interp;
}


=item C<load_m0b>

Load an M0 bytecode file into memory.

=cut

sub load_m0b {
    my ($interp, $filename) = @_;

    my $m0b = slurp($filename);
    my $cursor = 0;
    parse_m0b_header($interp, $m0b, \$cursor);
    parse_m0b_dirseg($interp, $m0b, \$cursor);
    parse_m0b_chunks($interp, $m0b, \$cursor);
}

sub m0_opfunc_noop { }

sub m0_opfunc_say_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    print $a1 $a2;
}


=item C<parse_m0b_header>

Verify that an M0 bytecode header is valid.

=cut

sub parse_m0b_header {
    my ($interp, $m0b, $cursor) = @_;

    # verify magic number
    my $m0b_magic = get_bytes($m0b, $cursor, 8);
    my $real_magic = "\376M0B\r\n\032\n";
    if ($real_magic cmp $m0b_magic) {
      die "magic number mismatch";
    }
    
    # verify that the interp understands this version of the m0b format
    my $m0_version = ord(get_bytes($m0b, $cursor, 1));
    if ($m0_version != 0) {
      die "can't read m0b version $m0_version";
    }

    # ignore everything else
    get_bytes($m0b, $cursor, 7);
    # TODO: store config info in $interp->{config}
}

sub parse_m0b_dirseg {
    my ($interp, $m0b, $cursor) = @_;

    # verify the segment identifier
    # store number of bytes in this segment
    # store number of entries in this segment
    # while cursor <= (24 + size)
        # store the offset of the variables chunk
        # store the size of the chunk name
        # get the bytes of the chunk name
        # store the name of the chunk in $interp->{chunks}[$n]{name}
        # move the cursor to the next directory entry
}

sub parse_m0b_chunks {
    my ($interp, $m0b, $cursor) = @_;

    my @chunks = [];
    my $chunk_count = 000;
    # for each chunk
        my $chunk;
        # read the variables segment
        # for each variable
            # stick the variable into the next slot

        # read the metadata segment
        # for each metadata entry
            # add the mapping to the right offset (use offsets into the variables table, not direct values)

        # read the bytecode segment
        # for each op
            # break the op into 4 ints
            # store the ints in the next slot
}

sub get_bytes {
    my ($data, $cursor, $count) = @_;
    my $s = substr($data, $$cursor, $count);
    $$cursor += $count;
    return $s;
}
