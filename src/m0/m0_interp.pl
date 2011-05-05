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

use constant {
    M0_DIR_SEG  => 0x01,
    M0_VARS_SEG => 0x02,
    M0_META_SEG => 0x03,
    M0_BC_SEG   => 0x04,
};

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
    $interp->{chunks} = [];
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
    my $m0b_version = ord get_bytes($m0b, $cursor, 1);
    if ($m0b_version != 0) {
      die "can't read m0b version $m0b_version";
    }
    $interp->{config}{m0b_version} = $m0b_version;

    # store the rest of the config information in the interp
    $interp->{config}{ireg_size}     = ord get_bytes($m0b, $cursor, 1);
    $interp->{config}{nreg_size}     = ord get_bytes($m0b, $cursor, 1);
    $interp->{config}{opcode_t_size} = ord get_bytes($m0b, $cursor, 1);
    $interp->{config}{pointer_size}  = ord get_bytes($m0b, $cursor, 1);
    $interp->{config}{endianness}    = ord get_bytes($m0b, $cursor, 1);

    # ignore padding bytes
    get_bytes($m0b, $cursor, 2);
}

sub parse_m0b_dirseg {
    my ($interp, $m0b, $cursor) = @_;

    # verify the segment identifier
    my $seg_ident = unpack("L",get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_DIR_SEG) {
        die "didn't find M0 directory segment";
    }

    my $seg_entry_count = unpack("L", get_bytes($m0b, $cursor, 4));
    my $seg_byte_count  = unpack("L", get_bytes($m0b, $cursor, 4));
    my $chunks_found = 0;
    while ($chunks_found < $seg_entry_count) {
        my $vars_seg_offset   = unpack("L", get_bytes($m0b, $cursor, 4));
        my $chunk_name_length = unpack("L", get_bytes($m0b, $cursor, 4));
        my $chunk_name        = unpack("a[$chunk_name_length]", get_bytes($m0b, $cursor, $chunk_name_length));
        $interp->{chunk_info}[$chunks_found]{name} = $chunk_name;
        $chunks_found++;
    }
}

sub parse_m0b_chunks {
    my ($interp, $m0b, $cursor) = @_;

    for my $chunk_name (@{$interp->{chunk_info}}) {
        my $chunk;
        $chunk->{vars} = m0b_parse_vars_seg($interp, $m0b, $cursor);
        $chunk->{meta} = m0b_parse_meta_seg($interp, $m0b, $cursor);
        $chunk->{bc}   = m0b_parse_bc_seg(  $interp, $m0b, $cursor);
        push @{$interp->{chunks}}, $chunk;
    }
}


sub m0b_parse_vars_seg {
    my ($interp, $m0b, $cursor) = @_;

    my $vars = [];
    # verify the segment identifier
    my $seg_ident = unpack("L", get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_VARS_SEG) {
        die "didn't find M0 variables segment";
    }

    my $var_count  = unpack("L", get_bytes($m0b, $cursor, 4));
    my $byte_count = unpack("L", get_bytes($m0b, $cursor, 4));
    while (scalar(@$vars) < $var_count) {
        my $var_length = unpack("L", get_bytes($m0b, $cursor, 4));
        my $var        = unpack("a[$var_length]", get_bytes($m0b, $cursor, $var_length));
        push @$vars, $var;
    }
    return $vars;
}


sub m0b_parse_meta_seg {
    my ($interp, $m0b, $cursor) = @_;

    my $metadata = {};
    # verify the segment identifier
    my $seg_ident = unpack("L", get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_META_SEG) {
        die "didn't find M0 metadata segment";
    }

    my $entry_count   = unpack("L", get_bytes($m0b, $cursor, 4));
    my $byte_count    = unpack("L", get_bytes($m0b, $cursor, 4));
    my $entries_found = 0;
    while ($entries_found < $entry_count) {
        my $offset   = unpack("L", get_bytes($m0b, $cursor, 4));
        my $name_idx = unpack("L", get_bytes($m0b, $cursor, 4));
        my $val_idx  = unpack("L", get_bytes($m0b, $cursor, 4));
        $metadata->{$offset}{$name_idx} = $val_idx;
        $entries_found++;
    }
    return $metadata;
}


sub m0b_parse_bc_seg {
    my ($interp, $m0b, $cursor) = @_;

    my $ops = [];
    # verify the segment identifier
    my $seg_ident = unpack("L", get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_BC_SEG) {
        die "didn't find M0 bytecode segment";
    }

    my $op_count   = unpack("L", get_bytes($m0b, $cursor, 4));
    my $byte_count = unpack("L", get_bytes($m0b, $cursor, 4));
    while (scalar(@$ops) < $op_count) {
        my $op = ord get_bytes($m0b, $cursor, 1);
        my $a1 = ord get_bytes($m0b, $cursor, 1);
        my $a2 = ord get_bytes($m0b, $cursor, 1);
        my $a3 = ord get_bytes($m0b, $cursor, 1);
        push @$ops, [$op, $a1, $a2, $a3];
    }
    return $ops;
}



sub get_bytes {
    my ($data, $cursor, $count) = @_;
    my $s = substr($data, $$cursor, $count);
    $$cursor += $count;
    return $s;
}
