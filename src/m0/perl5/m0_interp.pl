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
use warnings FATAL => qw(all);
use feature 'say';
use autodie qw/:all/;
use File::Slurp qw/slurp/;
use Data::Dumper;

my $file = $ARGV[0] || die "Usage: $0 foo.m0b";

my $debugging = exists $ENV{M0DEBUG} ? 1 : 0;

use constant {
    M0_DIR_SEG   => 0x01,
    M0_CONST_SEG => 0x02,
    M0_META_SEG  => 0x03,
    M0_BC_SEG    => 0x04,
};

# call frame mnemonics
use constant {
    CF       => 0,
    PCF      => 1,
    PC       => 2,
    RETPC    => 3,
    EH       => 4,
    CHUNK    => 5,
    CONSTS   => 6,
    MDS      => 7,
    BCS      => 8,
    INTERP   => 9,
    SPILLCF  => 11,
};

# interp mnemonics

use constant {
  OP_FUNCS    => 0,
  CHUNKS      => 1,
  CHUNK_INFO  => 2,
  CHUNK_MAP   => 3,
  CALL_FRAMES => 4,
  CONFIG      => 5,
  M0_ARGC     => 6,
  M0_ARGV     => 7,
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
    my $cf = new_call_frame($interp);
    run_ops($cf);
}


=item C<initialize_interp>

Initialize an M0 interpreter.  Note that this is different from a call frame,
where most of the interesting work takes place.

=cut

sub new_interp {
    my $interp;

    $interp->[OP_FUNCS] = [
        \&m0_opfunc_noop,
        \&m0_opfunc_goto,
        \&m0_opfunc_goto_if,
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
        \&m0_opfunc_convert_i_n,
        \&m0_opfunc_convert_n_i,
        \&m0_opfunc_ashr,
        \&m0_opfunc_lshr,
        \&m0_opfunc_shl,
        \&m0_opfunc_and,
        \&m0_opfunc_or,
        \&m0_opfunc_xor,
        \&m0_opfunc_not,
        \&m0_opfunc_gc_alloc,
        \&m0_opfunc_sys_alloc,
        \&m0_opfunc_sys_free,
        \&m0_opfunc_copy_mem,
        \&m0_opfunc_set,
        \&m0_opfunc_set_imm,
        \&m0_opfunc_deref,
        \&m0_opfunc_set_ref,
        \&m0_opfunc_set_byte,
        \&m0_opfunc_get_byte,
        \&m0_opfunc_set_word,
        \&m0_opfunc_get_word,
        \&m0_opfunc_csym,
        \&m0_opfunc_ccall_arg,
        \&m0_opfunc_ccall_ret,
        \&m0_opfunc_ccall,
        \&m0_opfunc_print_s,
        \&m0_opfunc_print_i,
        \&m0_opfunc_print_n,
        \&m0_opfunc_exit,
    ];
    $interp->[CONFIG] = {};
    $interp->[CALL_FRAMES] = [];
    $interp->[CHUNK_INFO] = [];
    $interp->[CHUNK_MAP] = {};
    $interp->[CHUNKS] = [];

    # make cli arguments accessible to M0 code
    $interp->[M0_ARGC] = i($#ARGV + 1);
    $interp->[M0_ARGV] = \@ARGV;

    return $interp;
}

=item C<new_call_frame>

Create a new call frame and perform any initializiation necessary to start running
bytecode.

=cut

sub new_call_frame{
    my ($interp) = @_;
    my $cf = [];

    $cf->[$_] = 0 for (0 .. 255);

    $cf->[CF]       = $cf;
    $cf->[PCF]      = {};
    $cf->[PC]       = 0;
    $cf->[RETPC]    = 0;
    $cf->[EH]       = {};
    $cf->[CHUNK]    = $interp->[CHUNKS][0]{name};
    $cf->[CONSTS]   = $interp->[CHUNKS][0]{consts};
    $cf->[MDS]      = $interp->[CHUNKS][0]{meta};
    $cf->[BCS]      = $interp->[CHUNKS][0]{bc};
    $cf->[INTERP]   = $interp;
    $cf->[SPILLCF]  = {};

    return $cf;
}


=item C<run_ops>

Run ops until there aren't ops left to run.

=cut

sub run_ops {
    my ($cf) = @_;
    
    while (1) {
        my $init_pc = $cf->[PC];
        my $instr_count = scalar(@{$cf->[BCS]});
        if ($init_pc >= $instr_count){
            exit;
        }
        my $op_num  = $cf->[BCS][$init_pc][0];
        my $op_func = $cf->[INTERP][OP_FUNCS][$op_num];
        my $a1 = $cf->[BCS][$init_pc][1];
        my $a2 = $cf->[BCS][$init_pc][2];
        my $a3 = $cf->[BCS][$init_pc][3];
        &$op_func(\$cf, $a1, $a2, $a3);

        # If an op hasn't changed the PC, increment it.
        $cf->[PC]++ if ($init_pc == $cf->[PC]);
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


=item C<i>

helper function to convert Perl ints to/from M0 ints and to reduce visual
noise, probably pubishable in some countries

=cut

sub i {
    if (scalar(@_) == 2) {
        my ($cf, $reg) = @_;
        return unpack('l', $cf->[$reg]);
    }
    return pack('l', $_[0] );
}

sub n {
    if (scalar(@_) == 2) {
        my ($cf, $reg) = @_;
        return unpack('f', $cf->[$reg]);
    }
    return pack('f', $_[0] );
}


sub m0_opfunc_noop {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "noop $a1, $a2, $a3";
}

sub m0_opfunc_goto {
    my ($cf, $a1, $a2, $a3) = @_;
    my $offset = 256 * $a1 + $a2;
    m0_say "goto $a1, $a2, $a3 ($offset, x)";

    $$cf->[PC] = $offset;
}

sub m0_opfunc_goto_if {
    my ($cf, $a1, $a2, $a3) = @_;
    my $offset = 256 * $a1 + $a2;
    m0_say "goto_if $a1, $a2, $a3 ($offset)";

    my $cond   = i($$cf,$a3);
    $$cf->[PC] = $offset if ($cond);
}

sub m0_opfunc_goto_chunk {
    my ($cf, $a1, $a2, $a3) = @_;

    my $new_pc      = unpack('l', $$cf->[$a1]);
    my $name_len    = unpack('l', bytes::substr($$cf->[$a2], 0, 4));
    my $encoding    = unpack('l', bytes::substr($$cf->[$a2], 4, 4));
    my $chunk_name  = unpack("a[$name_len]", bytes::substr($$cf->[$a2], 8));
    chop($chunk_name); #remove trailing null
    my $interp      = $$cf->[INTERP];

    m0_say "goto_chunk $a1, $a2, $a3 (chunk = '$chunk_name')";

    die "invalid chunk name '$chunk_name' in goto_chunk"
      unless exists $interp->[CHUNK_MAP]{$chunk_name};

    my $chunk_num = $interp->[CHUNK_MAP]{$chunk_name};
    $$cf->[CHUNK]  = $interp->[CHUNKS][$chunk_num]{name};
    $$cf->[CONSTS] = $interp->[CHUNKS][$chunk_num]{consts};
    $$cf->[MDS]    = $interp->[CHUNKS][$chunk_num]{meta};
    $$cf->[BCS]    = $interp->[CHUNKS][$chunk_num]{bc};
    $$cf->[PC]     = $new_pc;
}

sub m0_opfunc_add_i {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "add_i $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) + i($$cf,$a3) );
}

sub m0_opfunc_add_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "add_n $a1, $a2, $a3";

    $$cf->[$a1] = n( n($$cf,$a2) + n($$cf,$a3) );
}

sub m0_opfunc_sub_i {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "sub_i $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) - i($$cf,$a3) );
}

sub m0_opfunc_sub_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "sub_n $a1, $a2, $a3";

    $$cf->[$a1] = n( n($$cf,$a2) - n($$cf,$a3) );
}

sub m0_opfunc_mult_i {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "mult_i $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) * i($$cf,$a3) );
}

sub m0_opfunc_mult_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "mult_n $a1, $a2, $a3";

    $$cf->[$a1] = n( n($$cf,$a2) * n($$cf,$a3) );
}

sub m0_opfunc_div_i {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "div_i $a1, $a2, $a3";

    $$cf->[$a1] = i(int( i($$cf,$a2) / i($$cf,$a3) ));
}

sub m0_opfunc_div_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "div_n $a1, $a2, $a3";

    $$cf->[$a1] = n( n($$cf,$a2) / n($$cf,$a3) );
}

sub m0_opfunc_mod_i {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "mod_i $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) % i($$cf,$a3) );
}

sub m0_opfunc_mod_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "mod_n $a1, $a2, $a3";

    $$cf->[$a1] = n( n($$cf,$a2) % n($$cf,$a3) );
}

sub m0_opfunc_convert_i_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "convert_i_n $a1, $a2, $a3";

    $$cf->[$a1] = i(int(n($$cf,$a2)));
}

sub m0_opfunc_convert_n_i{
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "convert_n_i $a1, $a2, $a3";

    $$cf->[$a1] = n(i($$cf,$a2));
}

sub m0_opfunc_ashr {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "ashr $a1, $a2, $a3";

    {
        # shift right with sign extension
        use integer;
        $$cf->[$a1] = i( i($$cf,$a2) >> i($$cf,$a3) );
    }
}

sub m0_opfunc_lshr {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "lshr $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) >> i($$cf,$a3) );
}

sub m0_opfunc_shl {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "shl $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) << i($$cf,$a3) );
}

sub m0_opfunc_and {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "and $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) & i($$cf,$a3) );
}

sub m0_opfunc_or {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "or $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) | i($$cf,$a3) );
}

sub m0_opfunc_xor {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "xor $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) ^ i($$cf,$a3) );
}

sub m0_opfunc_not {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "not $a1, $a2, $a3";

    $$cf->[$a1] = i( i($$cf,$a2) ^ 0xFFFFFFFF);
}

sub m0_opfunc_gc_alloc {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "gc_alloc $a1, $a2, $a3";

    # "allocate" a gc-able array of the requested size
    # this isn't quite right because the requested size is in bytes, but it'll
    # work for now
    my $word_count = i($$cf,$a2) / 8;
    my $a = [];
    for my $i (0 .. $word_count) {
        $a->[$i] = 0;
    }
    $$cf->[$a1] = $a;
}

sub m0_opfunc_sys_alloc {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "sys_alloc $a1, $a2, $a3";
}

sub m0_opfunc_sys_free {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "sys_free $a1, $a2, $a3";
}

sub m0_opfunc_copy_mem {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "copy_mem $a1, $a2, $a3";
}

sub m0_opfunc_set {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "set $a1, $a2, $a3";
    
    $$cf->[$a1] = $$cf->[$a2];
    $$cf = $$cf->[CF];
}

sub m0_opfunc_set_imm {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "set_imm $a1, $a2, $a3";

    $$cf->[$a1] = i($a2 * 256 + $a3);
}

sub m0_opfunc_deref {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "deref $a1, $a2, $a3";

    $$cf->[$a1] = $$cf->[$a2][ i($$cf,$a3) ];
}

sub m0_opfunc_set_ref {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "set_ref $a1, $a2, $a3";

    $$cf->[$a1][ i($$cf,$a2) ] = $$cf->[$a3];
}

sub m0_opfunc_set_byte {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "set_byte $a1, $a2, $a3";
    
    $$cf->[$a1] = bytes::substr($$cf->[$a2], i($$cf,$a3));
    my $new_byte = bytes::chr($$cf->[$a3] & 255);
    bytes::substr($$cf->[$a2], i($$cf,$a3), $new_byte);
}

sub m0_opfunc_get_byte {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "get_byte $a1, $a2, $a3";
    
    $$cf->[$a1] = bytes::ord(bytes::substr($$cf->[$a2], i($$cf,$a3), 1));
}

sub m0_opfunc_set_word {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "set_word $a1, $a2, $a3";
    
    #turn *$3 into 4 bytes
    my $word = i($$cf,$a3);
    bytes::substr($$cf->[$a1], 4 * i($$cf,$a2), 4, $word);
}

sub m0_opfunc_get_word {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "get_word $a1, $a2, $a3";
    
    #$$cf->[$a1] = unpack("l", bytes::substr($$cf->[$a2], 4 * $$cf->[$a3], 4));
    $$cf->[$a1] = bytes::substr($$cf->[$a2], 4 * i($$cf,$a3), 4);
}

sub m0_opfunc_csym {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "csym $a1, $a2, $a3";
}

sub m0_opfunc_ccall_arg {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "ccall_arg $a1, $a2, $a3";
}

sub m0_opfunc_ccall_ret {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "ccall_ret $a1, $a2, $a3";
}

sub m0_opfunc_ccall {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "ccall $a1, $a2, $a3";
}

sub m0_opfunc_print_s {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "print_s $a1, $a2, $a3";

    my $handle = $$cf->[$a1];
    # don't print the header
    my $byte_count = unpack('l', bytes::substr($$cf->[$a2], 0, 4));
    my $var    = bytes::substr($$cf->[$a2], 8, $byte_count-1);
    # TODO: print to $handle instead of stdout
    print $var;
}

sub m0_opfunc_print_i {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "print_i $a1, $a2, $a3";

    my $handle = $$cf->[$a1];
    my $var    = i($$cf,$a2);
    # TODO: print to $handle instead of stdout
    print $var;
}

sub m0_opfunc_print_n {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "print_n $a1, $a2, $a3";

    my $handle = $$cf->[$a1];
    my $var    = n($$cf,$a2);
    # TODO: print to $handle instead of stdout
    print $var;
}

sub m0_opfunc_exit {
    my ($cf, $a1, $a2, $a3) = @_;
    m0_say "exit $a1, $a2, $a3";

    exit(i($$cf,$a1));
}


=item C<dump_cf>

Print a reasonably compact representation of a call frame to stdout.

=cut

sub dump_cf {
    my ($cf) = @_;

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
    my $seg_ident = unpack("l",get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_DIR_SEG) {
        die "didn't find M0 directory segment";
    }

    my $seg_entry_count = unpack("l", get_bytes($m0b, $cursor, 4));
    my $seg_byte_count  = unpack("l", get_bytes($m0b, $cursor, 4));
    my $chunks_found = 0;
    while ($chunks_found < $seg_entry_count) {
        my $consts_seg_offset   = unpack("l", get_bytes($m0b, $cursor, 4));
        my $chunk_name_length = unpack("l", get_bytes($m0b, $cursor, 4));
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
        $chunk->{consts} = m0b_parse_const_seg($interp, $m0b, $cursor);
        $chunk->{meta}   = m0b_parse_meta_seg($interp, $m0b, $cursor);
        $chunk->{bc}     = m0b_parse_bc_seg(  $interp, $m0b, $cursor);
        $chunk->{name}   = $chunk_name->{name};
        push @{$interp->[CHUNKS]}, $chunk;
    }
}


sub m0b_parse_const_seg {
    my ($interp, $m0b, $cursor) = @_;

    my $consts = [];
    # verify the segment identifier
    my $seg_ident = unpack("l", get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_CONST_SEG) {
        die "didn't find M0 constants segment";
    }

    my $const_count = unpack("l", get_bytes($m0b, $cursor, 4));
    my $byte_count  = unpack("l", get_bytes($m0b, $cursor, 4));
    my $const_num   = 0;
    m0_say "found $const_count constants occupying $byte_count bytes";

    while (scalar(@$consts < $const_count)) {
        my $const_length = unpack("l", get_bytes($m0b, $cursor, 4));
        my $const        = get_bytes($m0b, $cursor, $const_length);
        m0_say "found constant #$const_num of length $const_length";
        $const_num++;
        for (my $i = 0; $i < bytes::length($const); $i++) {
            m0_say "byte $i is ".ord(bytes::substr($const, $i, 1));
        }
        push @$consts, $const;
    }
    return $consts;
}


sub m0b_parse_meta_seg {
    my ($interp, $m0b, $cursor) = @_;

    my $metadata = {};
    # verify the segment identifier
    my $seg_ident = unpack("l", get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_META_SEG) {
        die "didn't find M0 metadata segment";
    }

    my $entry_count   = unpack("l", get_bytes($m0b, $cursor, 4));
    my $byte_count    = unpack("l", get_bytes($m0b, $cursor, 4));
    my $entries_found = 0;
    while ($entries_found < $entry_count) {
        my $offset   = unpack("l", get_bytes($m0b, $cursor, 4));
        my $name_idx = unpack("l", get_bytes($m0b, $cursor, 4));
        my $val_idx  = unpack("l", get_bytes($m0b, $cursor, 4));
        $metadata->{$offset}{$name_idx} = $val_idx;
        $entries_found++;
    }
    return $metadata;
}


sub m0b_parse_bc_seg {
    my ($interp, $m0b, $cursor) = @_;

    my $ops = [];
    # verify the segment identifier
    my $seg_ident = unpack("l", get_bytes($m0b, $cursor, 4));
    if ($seg_ident != M0_BC_SEG) {
        die "didn't find M0 bytecode segment";
    }

    my $op_count   = unpack("l", get_bytes($m0b, $cursor, 4));
    my $byte_count = unpack("l", get_bytes($m0b, $cursor, 4));
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
    m0_say "getting $count bytes";
    return $s;
}
