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

# context mnemonics
use constant {
    INTERP => 0,
    PC     => 1,
    EH     => 2,
    EX     => 3,
    PCX    => 4,
    VAR    => 5,
    MDS    => 6,
    BCS    => 7,
    I0     => 8,
    I1     => 9,
    I2     => 10,
    I3     => 11,
    I4     => 12,
    I5     => 13,
    I6     => 14,
    I7     => 15,
    I8     => 16,
    I9     => 17,
    I10    => 18,
    I11    => 19,
    I12    => 20,
    I13    => 21,
    I14    => 22,
    I15    => 23,
    I16    => 24,
    I17    => 25,
    I18    => 26,
    I19    => 27,
    I20    => 28,
    I21    => 29,
    I22    => 30,
    I23    => 31,
    I24    => 32,
    I25    => 33,
    I26    => 34,
    I27    => 35,
    I28    => 36,
    I29    => 37,
    I30    => 38,
    I31    => 39,
    I32    => 40,
    I33    => 41,
    I34    => 42,
    I35    => 43,
    I36    => 44,
    I37    => 45,
    I38    => 46,
    I39    => 47,
    I40    => 48,
    I41    => 49,
    I42    => 50,
    I43    => 51,
    I44    => 52,
    I45    => 53,
    I46    => 54,
    I47    => 55,
    I48    => 56,
    I49    => 57,
    I50    => 58,
    I51    => 59,
    I52    => 60,
    I53    => 61,
    I54    => 62,
    I55    => 63,
    I56    => 64,
    I57    => 65,
    I58    => 66,
    I59    => 67,
    I60    => 68,
    I61    => 69,
    N0     => 70,
    N1     => 71,
    N2     => 72,
    N3     => 73,
    N4     => 74,
    N5     => 75,
    N6     => 76,
    N7     => 77,
    N8     => 78,
    N9     => 79,
    N10    => 80,
    N11    => 81,
    N12    => 82,
    N13    => 83,
    N14    => 84,
    N15    => 85,
    N16    => 86,
    N17    => 87,
    N18    => 88,
    N19    => 89,
    N20    => 90,
    N21    => 91,
    N22    => 92,
    N23    => 93,
    N24    => 94,
    N25    => 95,
    N26    => 96,
    N27    => 97,
    N28    => 98,
    N29    => 99,
    N30    => 100,
    N31    => 101,
    N32    => 102,
    N33    => 103,
    N34    => 104,
    N35    => 105,
    N36    => 106,
    N37    => 107,
    N38    => 108,
    N39    => 109,
    N40    => 110,
    N41    => 111,
    N42    => 112,
    N43    => 113,
    N44    => 114,
    N45    => 115,
    N46    => 116,
    N47    => 117,
    N48    => 118,
    N49    => 119,
    N50    => 120,
    N51    => 121,
    N52    => 122,
    N53    => 123,
    N54    => 124,
    N55    => 125,
    N56    => 126,
    N57    => 127,
    N58    => 128,
    N59    => 129,
    N60    => 130,
    N61    => 131,
    S0     => 132,
    S1     => 133,
    S2     => 134,
    S3     => 135,
    S4     => 136,
    S5     => 137,
    S6     => 138,
    S7     => 139,
    S8     => 140,
    S9     => 141,
    S10    => 142,
    S11    => 143,
    S12    => 144,
    S13    => 145,
    S14    => 146,
    S15    => 147,
    S16    => 148,
    S17    => 149,
    S18    => 150,
    S19    => 151,
    S20    => 152,
    S21    => 153,
    S22    => 154,
    S23    => 155,
    S24    => 156,
    S25    => 157,
    S26    => 158,
    S27    => 159,
    S28    => 160,
    S29    => 161,
    S30    => 162,
    S31    => 163,
    S32    => 164,
    S33    => 165,
    S34    => 166,
    S35    => 167,
    S36    => 168,
    S37    => 169,
    S38    => 170,
    S39    => 171,
    S40    => 172,
    S41    => 173,
    S42    => 174,
    S43    => 175,
    S44    => 176,
    S45    => 177,
    S46    => 178,
    S47    => 179,
    S48    => 180,
    S49    => 181,
    S50    => 182,
    S51    => 183,
    S52    => 184,
    S53    => 185,
    S54    => 186,
    S55    => 187,
    S56    => 188,
    S57    => 189,
    S58    => 190,
    S59    => 191,
    S60    => 192,
    S61    => 193,
    P0     => 194,
    P1     => 195,
    P2     => 196,
    P3     => 197,
    P4     => 198,
    P5     => 199,
    P6     => 200,
    P7     => 201,
    P8     => 202,
    P9     => 203,
    P10    => 204,
    P11    => 205,
    P12    => 206,
    P13    => 207,
    P14    => 208,
    P15    => 209,
    P16    => 210,
    P17    => 211,
    P18    => 212,
    P19    => 213,
    P20    => 214,
    P21    => 215,
    P22    => 216,
    P23    => 217,
    P24    => 218,
    P25    => 219,
    P26    => 220,
    P27    => 221,
    P28    => 222,
    P29    => 223,
    P30    => 224,
    P31    => 225,
    P32    => 226,
    P33    => 227,
    P34    => 228,
    P35    => 229,
    P36    => 230,
    P37    => 231,
    P38    => 232,
    P39    => 233,
    P40    => 234,
    P41    => 235,
    P42    => 236,
    P43    => 237,
    P44    => 238,
    P45    => 239,
    P46    => 240,
    P47    => 241,
    P48    => 242,
    P49    => 243,
    P50    => 244,
    P51    => 245,
    P52    => 246,
    P53    => 247,
    P54    => 248,
    P55    => 249,
    P56    => 250,
    P57    => 251,
    P58    => 252,
    P59    => 253,
    P60    => 254,
    P61    => 255,
};

# interp mnemonics

use constant {
  OP_FUNCS   => 0,
  CHUNKS     => 1,
  CHUNK_INFO => 2,
  CONTEXTS   => 3,
  CONFIG     => 4,
};


run_m0b($file);


=item C<run_m0b>

Load and run an M0 bytecode file.

=cut

sub run_m0b {
    my ($filename) = @_;

    my $interp = new_interp();
    load_m0b($interp, $filename);
    my $ctx = new_context($interp);
    run_ops($ctx);
}


=item C<initialize_interp>

Initialize an M0 interpreter.  Note that this is different from a context,
where most of the interesting work takes place.

=cut

sub new_interp {
    my $interp;

    $interp->[OP_FUNCS] = [
        \&m0_opfunc_noop,
        \&m0_opfunc_goto,
        \&m0_opfunc_goto_if_eq,
        \&m0_opfunc_goto_cs,
        \&m0_opfunc_add_i,
        \&m0_opfunc_add_n,
        \&m0_opfunc_sub_i,
        \&m0_opfunc_sub_n,
        \&m0_opfunc_mult_i,
        \&m0_opfunc_mult_n,
        \&m0_opfunc_div_i,
        \&m0_opfunc_div_n,
        \&m0_opfunc_mod_i,
        \&m0_opfunc_mod_n,
        \&m0_opfunc_iton,
        \&m0_opfunc_ntoi,
        \&m0_opfunc_ashr,
        \&m0_opfunc_lshr,
        \&m0_opfunc_shl,
        \&m0_opfunc_and,
        \&m0_opfunc_or,
        \&m0_opfunc_xor,
        \&m0_opfunc_set,
        \&m0_opfunc_copy_byte,
        \&m0_opfunc_copy_mem,
        \&m0_opfunc_set_var,
        \&m0_opfunc_csym,
        \&m0_opfunc_ccall_arg,
        \&m0_opfunc_ccall_ret,
        \&m0_opfunc_ccall,
        \&m0_opfunc_print_s,
        \&m0_opfunc_print_i,
        \&m0_opfunc_print_n,
        \&m0_opfunc_alloc,
        \&m0_opfunc_free,
        \&m0_opfunc_exit,
    ];
    $interp->[CONFIG] = {};
    $interp->[CONTEXTS] = [];
    $interp->[CHUNK_INFO] = [];
    $interp->[CHUNKS] = [];
    return $interp;
}

=item C<new_context>

Create a new context and perform any initializiation necessary to start running
bytecode.

=cut

sub new_context {
    my ($interp) = @_;
    my $ctx = [];

    $ctx->[$_] = 0 for (0 .. 255);

    $ctx->[INTERP] = $interp;
    $ctx->[PC]     = {seg => 0, instr => 0};
    $ctx->[EH]     = {};
    $ctx->[EX]     = {};
    $ctx->[PCX]    = {};
    $ctx->[VAR]    = $interp->[CHUNKS][0]{vars};
    $ctx->[MDS]    = $interp->[CHUNKS][0]{meta};
    $ctx->[BCS]    = $interp->[CHUNKS][0]{bc};

    return $ctx;
}


=item C<run_ops>

Run ops until there aren't ops left to run.

=cut

sub run_ops {
    my ($ctx) = @_;
    
    while (1) {
        my $init_pc = $ctx->[PC]{instr};
        my $instr_count = scalar(@{$ctx->[BCS]});
        if ($ctx->[PC]{instr} >= $instr_count){
            exit;
        }
        my $op_num  = $ctx->[BCS][$init_pc][0];
        my $op_func = $ctx->[INTERP][OP_FUNCS][$op_num];
        my $a1 = $ctx->[BCS][$init_pc][1];
        my $a2 = $ctx->[BCS][$init_pc][2];
        my $a3 = $ctx->[BCS][$init_pc][3];
        &$op_func($ctx, $a1, $a2, $a3);
        my $final_pc = $ctx->[PC]{instr};

        # allow ops to change control flow
        if ($init_pc == $final_pc) {
            $ctx->[PC]{instr}++;
        }
    }
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

sub m0_opfunc_noop {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "noop $a1, $a2, $a3";
}

sub m0_opfunc_goto {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "goto $a1, $a2, $a3";
}

sub m0_opfunc_goto_if_eq {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "goto_if_eq $a1, $a2, $a3";
}

sub m0_opfunc_goto_cs {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "goto_cs $a1, $a2, $a3";
}

sub m0_opfunc_add_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "add_i $a1, $a2, $a3";
}

sub m0_opfunc_add_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "add_n $a1, $a2, $a3";
}

sub m0_opfunc_sub_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "sub_i $a1, $a2, $a3";
}

sub m0_opfunc_sub_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "sub_n $a1, $a2, $a3";
}

sub m0_opfunc_mult_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "mult_i $a1, $a2, $a3";
}

sub m0_opfunc_mult_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "mult_n $a1, $a2, $a3";
}

sub m0_opfunc_div_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "div_i $a1, $a2, $a3";
}

sub m0_opfunc_div_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "div_n $a1, $a2, $a3";
}

sub m0_opfunc_mod_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "mod_i $a1, $a2, $a3";
}

sub m0_opfunc_mod_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "mod_n $a1, $a2, $a3";
}

sub m0_opfunc_iton {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "iton $a1, $a2, $a3";
}

sub m0_opfunc_ntoi {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "ntoi $a1, $a2, $a3";
}

sub m0_opfunc_ashr {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "ashr $a1, $a2, $a3";
}

sub m0_opfunc_lshr {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "lshr $a1, $a2, $a3";
}

sub m0_opfunc_shl {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "shl $a1, $a2, $a3";
}

sub m0_opfunc_and {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "and $a1, $a2, $a3";
}

sub m0_opfunc_or {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "or $a1, $a2, $a3";
}

sub m0_opfunc_xor {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "xor $a1, $a2, $a3";
}

sub m0_opfunc_set {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "set $a1, $a2, $a3";
}

sub m0_opfunc_copy_byte {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "copy_byte $a1, $a2, $a3";
}

sub m0_opfunc_copy_mem {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "copy_mem $a1, $a2, $a3";
}

sub m0_opfunc_set_var {
    my ($ctx, $a1, $a2, $a3) = @_;
    my $idx     = $a2 * 256 + $a3;
    my $var     = $ctx->[VAR][$idx];
    $ctx->[$a1] = $var;
    say "set_var $a1, $a2, $a3 (var = $var)";
}

sub m0_opfunc_csym {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "csym $a1, $a2, $a3";
}

sub m0_opfunc_ccall_arg {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "ccall_arg $a1, $a2, $a3";
}

sub m0_opfunc_ccall_ret {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "ccall_ret $a1, $a2, $a3";
}

sub m0_opfunc_ccall {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "ccall $a1, $a2, $a3";
}

sub m0_opfunc_print_s {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "print_s $a1, $a2, $a3";
    my $var = $ctx->[$a2];
    my $handle = $ctx->[$a1];
    # TODO: print to $handle instead of stdout
    say $var;
}

sub m0_opfunc_print_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "print_i $a1, $a2, $a3";
}

sub m0_opfunc_print_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "print_n $a1, $a2, $a3";
}

sub m0_opfunc_alloc {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "alloc $a1, $a2, $a3";
}

sub m0_opfunc_free {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "free $a1, $a2, $a3";
}

sub m0_opfunc_exit {
    my ($ctx, $a1, $a2, $a3) = @_;
    say "exit $a1, $a2, $a3";
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
    $interp->[CONFIG]{m0b_version} = $m0b_version;

    # store the rest of the config information in the interp
    $interp->[CONFIG]{ireg_size}     = ord get_bytes($m0b, $cursor, 1);
    $interp->[CONFIG]{nreg_size}     = ord get_bytes($m0b, $cursor, 1);
    $interp->[CONFIG]{opcode_t_size} = ord get_bytes($m0b, $cursor, 1);
    $interp->[CONFIG]{pointer_size}  = ord get_bytes($m0b, $cursor, 1);
    $interp->[CONFIG]{endianness}    = ord get_bytes($m0b, $cursor, 1);

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
        $interp->[CHUNK_INFO][$chunks_found]{name} = $chunk_name;
        $chunks_found++;
    }
}

sub parse_m0b_chunks {
    my ($interp, $m0b, $cursor) = @_;

    for my $chunk_name (@{$interp->[CHUNK_INFO]}) {
        my $chunk;
        $chunk->{vars} = m0b_parse_vars_seg($interp, $m0b, $cursor);
        $chunk->{meta} = m0b_parse_meta_seg($interp, $m0b, $cursor);
        $chunk->{bc}   = m0b_parse_bc_seg(  $interp, $m0b, $cursor);
        push @{$interp->[CHUNKS]}, $chunk;
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
