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

my $debugging = 0;

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
    CHUNK  => 5
    VAR    => 6,
    MDS    => 7,
    BCS    => 8,
};

# interp mnemonics

use constant {
  OP_FUNCS   => 0,
  CHUNKS     => 1,
  CHUNK_INFO => 2,
  CHUNK_MAP  => 3,
  CONTEXTS   => 4,
  CONFIG     => 5,
};


run_m0b($file);


=item C<m0_say>

print out debugging info

=cut

sub m0_say {
    say @_ if ($debugging);
}

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
        \&m0_opfunc_goto_chunk,
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
    $interp->[CHUNK_MAP] = {};
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
    $ctx->[PC]     = 0;
    $ctx->[EH]     = {};
    $ctx->[EX]     = {};
    $ctx->[PCX]    = {};
    $ctx->[CHUNK]  = $interp->[CHUNKS][0]{name};
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
        my $init_pc = $ctx->[PC];
        my $instr_count = scalar(@{$ctx->[BCS]});
        if ($ctx->[PC] >= $instr_count){
            exit;
        }
        my $op_num  = $ctx->[BCS][$init_pc][0];
        my $op_func = $ctx->[INTERP][OP_FUNCS][$op_num];
        my $a1 = $ctx->[BCS][$init_pc][1];
        my $a2 = $ctx->[BCS][$init_pc][2];
        my $a3 = $ctx->[BCS][$init_pc][3];
        &$op_func($ctx, $a1, $a2, $a3);
        my $final_pc = $ctx->[PC];

        # allow ops to change control flow
        if ($init_pc == $final_pc) {
            $ctx->[PC]++;
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
    m0_say "noop $a1, $a2, $a3";
}

sub m0_opfunc_goto {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "goto $a1, $a2, $a3";

    my $offset = $ctx->[$a1];
    $ctx->[PC] = $offset;
}

sub m0_opfunc_goto_if_eq {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "goto_if_eq $a1, $a2, $a3";

    my $offset = $ctx->[$a1];
    my $v2 = $ctx->[$a2];
    my $v3 = $ctx->[$a3];
    $ctx->[PC] = $offset if ($v2 == $v3);
}

sub m0_opfunc_goto_chunk {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "goto_chunk $a1, $a2, $a3";

    my $new_pc      = $ctx->[$a1];
    my $chunk_name  = $ctx->[$a2];
    my $interp      = $ctx->[INTERP];

    die "invalid chunk name '$chunk_name' in goto_chunk"
      unless exists $interp->[CHUNK_MAP]{$chunk_name};

    my $chunk_num  = $interp->[CHUNK_MAP]{$chunk_name};
    $ctx->[CHUNK]  = $interp->[CHUNKS][$chunk_num]{name};
    $ctx->[VAR]    = $interp->[CHUNKS][$chunk_num]{vars};
    $ctx->[MDS]    = $interp->[CHUNKS][$chunk_num]{meta};
    $ctx->[BCS]    = $interp->[CHUNKS][$chunk_num]{bc};
    $ctx->[PC]     = $new_pc;
    $ctx->[CHUNK]  = $chunk_name;
}

sub m0_opfunc_add_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "add_i $a1, $a2, $a3";
}

sub m0_opfunc_add_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "add_n $a1, $a2, $a3";
}

sub m0_opfunc_sub_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "sub_i $a1, $a2, $a3";
}

sub m0_opfunc_sub_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "sub_n $a1, $a2, $a3";
}

sub m0_opfunc_mult_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "mult_i $a1, $a2, $a3";
}

sub m0_opfunc_mult_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "mult_n $a1, $a2, $a3";
}

sub m0_opfunc_div_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "div_i $a1, $a2, $a3";
}

sub m0_opfunc_div_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "div_n $a1, $a2, $a3";
}

sub m0_opfunc_mod_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "mod_i $a1, $a2, $a3";
}

sub m0_opfunc_mod_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "mod_n $a1, $a2, $a3";
}

sub m0_opfunc_iton {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "iton $a1, $a2, $a3";
}

sub m0_opfunc_ntoi {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "ntoi $a1, $a2, $a3";
}

sub m0_opfunc_ashr {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "ashr $a1, $a2, $a3";
}

sub m0_opfunc_lshr {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "lshr $a1, $a2, $a3";
}

sub m0_opfunc_shl {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "shl $a1, $a2, $a3";
}

sub m0_opfunc_and {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "and $a1, $a2, $a3";
}

sub m0_opfunc_or {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "or $a1, $a2, $a3";
}

sub m0_opfunc_xor {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "xor $a1, $a2, $a3";
}

sub m0_opfunc_set {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "set $a1, $a2, $a3";
}

sub m0_opfunc_copy_byte {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "copy_byte $a1, $a2, $a3";
}

sub m0_opfunc_copy_mem {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "copy_mem $a1, $a2, $a3";
}

sub m0_opfunc_set_var {
    my ($ctx, $a1, $a2, $a3) = @_;
    my $idx     = $a2 * 256 + $a3;
    my $var     = $ctx->[VAR][$idx];
    $ctx->[$a1] = $var;
    m0_say "set_var $a1, $a2, $a3 (var = $var)";
}

sub m0_opfunc_csym {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "csym $a1, $a2, $a3";
}

sub m0_opfunc_ccall_arg {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "ccall_arg $a1, $a2, $a3";
}

sub m0_opfunc_ccall_ret {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "ccall_ret $a1, $a2, $a3";
}

sub m0_opfunc_ccall {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "ccall $a1, $a2, $a3";
}

sub m0_opfunc_print_s {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "print_s $a1, $a2, $a3";
    my $var = $ctx->[$a2];
    my $handle = $ctx->[$a1];
    # TODO: print to $handle instead of stdout
    say $var;
}

sub m0_opfunc_print_i {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "print_i $a1, $a2, $a3";
}

sub m0_opfunc_print_n {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "print_n $a1, $a2, $a3";
}

sub m0_opfunc_alloc {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "alloc $a1, $a2, $a3";
}

sub m0_opfunc_free {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "free $a1, $a2, $a3";
}

sub m0_opfunc_exit {
    my ($ctx, $a1, $a2, $a3) = @_;
    m0_say "exit $a1, $a2, $a3";
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
        $interp->[CHUNK_MAP]{$chunk_name} = $chunks_found;
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
        $chunk->{name} = $chunk_name;
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
