#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/m0/m0_assembler.pl - M0 Assembler Prototype

=head1 SYNOPSIS

    % m0_assembler.pl foo.m0

=head1 DESCRIPTION

Assembles M0 source code into bytecode which can be run by an M0 interpreter.

=cut

use strict;
use warnings;
use feature 'say';
use autodie qw/:all/;
use File::Slurp qw/slurp write_file/;
use Data::Dumper;

my $file = shift || die "Usage: $0 foo.m0";
my $file_metadata = {
    total_chunks => 0,
};

my $debugging = exists $ENV{M0DEBUG} ? 1 : 0;

my $M0_DIR_SEG      = 0x01;
my $M0_CONST_SEG    = 0x02;
my $M0_META_SEG     = 0x03;
my $M0_BC_SEG       = 0x04;

use constant M0_REG_RX => qr/^(([INSP]\d+)|CF|PCF|PC|RETPC|EH|CHUNK|CONSTS|MDS|BCS|INTERP|SPILLCF|x)/;

assemble($file);

sub assemble {
    my ($file) = @_;

    my $ops       = parse_op_data();
    my $source    = slurp($file);
    my $lines     = [ split(/\n/, $source) ];
    # build a hash that maps chunk names to their offset within the bytecode file
    my $chunk_map = { 
        map  { my $x = $_; $x =~ s/^\.chunk\s+"(\w+)"$/$1/; $x => our $i++; } 
        grep { m/^\.chunk\s+"(\w+)"$/ } @$lines };
    my $cursor    = 0;
    my $version   = parse_version($lines, \$cursor);
    my $chunks    = parse_chunks($lines, \$cursor, $chunk_map);
    my $header    = m0b_header();
    my $bytecode  = $header . generate_bytecode_for_chunks($ops, $chunks);
    write_bytecode($file, $bytecode);
}

sub m0_say {
    say @_ if $debugging;
}

=item C<write_bytecode($file, $bytecode)>

Write the M0 bytecode $bytecode to the file $file.

=cut

sub write_bytecode {
    my ($file, $bytecode) = @_;
    my $bytecode_file = $file . 'b';
    say "Writing bytecode to $bytecode_file";
    write_file $bytecode_file, {binmode => ':raw'}, $bytecode;
}

=item C<m0b_header>

Generate an M0 bytecode header. (Borrowed from t/m0/m0_bytecode_loading.t)

=cut

sub m0b_header {

    #m0b magic number
    my $m0b_header = "\376M0B\r\n\032\n";

    $m0b_header .= pack('C', 0); # version
    $m0b_header .= pack('C', 4); # intval size
    $m0b_header .= pack('C', 8); # floatval size
    $m0b_header .= pack('C', 4); # opcode_t size
    $m0b_header .= pack('C', 4); # void* size
    $m0b_header .= pack('C', 0); # endianness
    $m0b_header .= pack('xx');   # padding

    return $m0b_header;
}

sub parse_op_data {
    my $ops;
    my $num = 0;
    while (<DATA>) {
        chomp;
        next if (/^#/);
        $ops->{$_} = $num;
        $num++;
    }
    say "Parsed data for " . scalar(keys %$ops) . " ops";
    return $ops;
}

=item to_bytecode

Take a hash containing an opname and three arguments (arg1, arg2, arg3) and
return the bytecode represenation of the operation.

=cut

# Ix = 12+x, Nx = 73+x, Sx = 134+x, Px = 195+x
sub register_name_to_num {
    my ($register) = @_;

    my $symbols = { 
        # call frame values
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

        # global interp values
        OP_FUNCS    => 0,
        CHUNKS      => 1,
        CHUNK_INFO  => 2,
        CHUNK_MAP   => 3,
        CALL_FRAMES => 4,
        CONFIG      => 5,
        ARGC        => 6,
        ARGV        => 7,

        # convenience
        x => 0,
    };

    if ($register =~ /^\d+/ && $register <= 255) {
        return $register;
    }

    if($register !~ /^[INSP]\d+$/){
        my $number = $symbols->{$register};
        die "Invalid register name: $register" unless exists $symbols->{$register};
        return $number;
    }

    if( length $register > 3 ){
       die "Invalid register name: $register";
    }

    my $num  = substr($register, 1, 2);
    my $type = substr($register, 0, 1);

    unless ( defined $num && $num >= 0 && $num <= 61 ) {
       die "Invalid register number: $register";
    }

    unless ( $type =~ m/^[INSP]$/ ) {
        die "Invalid register type $type in register $register";
    }

    my $reg_table = {
        I => sub { $_[0] + 12  },
        N => sub { $_[0] + 73  },
        S => sub { $_[0] + 134 },
        P => sub { $_[0] + 195 },
    };
    return $reg_table->{$type}->($num);
}

sub to_bytecode {
    my ($ops,$op)      = @_;
    my $opnumber       = opname_to_num($ops, $op->{opname});
    my ($a1, $a2, $a3) = map { $op->{"arg" . $_} } (1 .. 3);
    my $bytecode       = pack('C', $opnumber);

    # We need to convert the symbolic register names into numbers
    # as described in "Register Types and Context Structure" in the M0 spec

    map {
        my $reg = register_name_to_num($_);
        die "Invalid register '$reg'" if ($reg !~ /^\d+$/);
        $bytecode .= pack('C', $reg );
    } ($a1, $a2, $a3);

    return $bytecode;
}

sub generate_bytecode_for_chunks {
    my ($ops, $chunks) = @_;

    # First, add the directory segment
    my $bytecode = m0b_dir_seg( $chunks );

    for my $chunk (@$chunks) {

        my $metadata_seg  = m0b_metadata_seg($chunk);
        my $constants_seg = m0b_constants_seg($chunk);
        my $bytecode_seg  = m0b_bytecode_seg($ops, $chunk);
        $bytecode .= $constants_seg . $metadata_seg . $bytecode_seg;
    }
    return $bytecode;
}

sub m0b_metadata_seg {
    my ($chunk) = @_;

    my $entry_count = scalar(split /\n/, $chunk->{metadata});
    my $metadata  = $chunk->{metadata};

    my $bytecode  = pack("i", $M0_META_SEG);
    $bytecode    .= pack("i", $entry_count);
    $bytecode    .= pack("i", $entry_count * 12);

    #for each entry
    for (split /\n/, $metadata) {
        my ($addr, $name_idx, $value_idx) = split /\s+/, $_;
        $bytecode .= pack('iii', $addr, $name_idx, $value_idx);
    }

    return $bytecode;
}
                          

sub m0b_bytecode_seg {
    my ($ops, $chunk) = @_;

    # op count = number of lines that have words
    my $op_count = 0;
    my $word_count = $op_count * 4;
    my $bytecode = '';
    my $pc = 0;
    my %label_map;
    my @lines = split /\n/, $chunk->{bytecode};

    # calculate addresses of labels
    for my $line (@lines) {
        if ($line =~ /(?<!#)\w[,\s]+\w/) {
            $pc++;
            $op_count++;
        }
        if ($line =~ m/^(?<label>[a-zA-Z][a-zA-Z0-9_]+):/) {
            my $label = $+{label};
            die "Invalid M0: duplicate label '$label' in chunk '$chunk->{name}'"
                if (exists $label_map{$label});
            $label_map{ $label } = $pc;
        }
    }

    $bytecode  = pack('i', $M0_BC_SEG);
    $bytecode .= pack('i', $op_count);
    $bytecode .= pack('i', $word_count);

    for my $line (@lines) {
        if ($line =~ m/^((?<label>[a-zA-Z][a-zA-Z0-9_]+):)?\s*(?<opname>[A-z_]+)\s+(?<arg1>\w+)\s*,\s*(?<arg2>\w+)\s*,\s*(?<arg3>\w+)\s*$/) {
            m0_say "adding op $+{opname} to bytecode seg";
            $bytecode .= to_bytecode($ops,\%+);
        }
        # special case for goto with a label
        elsif ($line =~ m/^((?<label>[a-zA-Z][a-zA-Z0-9_]+):)?\s*goto\s+(?<target_label>\w+)\s*(,\s*\w+\s*)?$/) {
            m0_say "adding op goto to bytecode seg";
            if (!exists $label_map{ $+{target_label} } ) {
                die "Invalid M0 - attempt to use undefined label $+{target_label}";
            }
            my %x;
            $x{arg1} = int($label_map{ $+{target_label} } / 256);
            $x{arg2} = int($label_map{ $+{target_label} } % 255);
            $x{arg3} = 'x';
            $x{opname} = 'goto';
            m0_say "goto arg1 is ".$x{arg1};
            m0_say "goto arg2 is ".$x{arg2};
            $x{target_label} = $+{target_label};
            m0_say "adding op goto to bytecode seg";
            $bytecode .= to_bytecode($ops,\%x);
        }
        elsif ($line =~ m/^((?<label>[a-zA-Z][a-zA-Z0-9_]+):)?\s*goto_if\s+(?<target_label>[a-zA-Z][a-zA-Z0-9_]*)\s*,\s*(?<arg3>\w+)\s*$/) {
            m0_say "adding op goto_if to bytecode seg";
            if (!exists $label_map{ $+{target_label} } ) {
                die "Invalid M0 - attempt to use undefined label $+{target_label}";
            }
            my %x;
            $x{arg1} = int($label_map{ $+{target_label} } / 256);
            $x{arg2} = int($label_map{ $+{target_label} } % 255);
            $x{arg3} = $+{arg3};
            $x{opname} = 'goto_if';
            m0_say "adding op goto_if to bytecode seg";
            $bytecode .= to_bytecode($ops,\%x);
        } elsif ($line =~ m/^(?<label>[a-zA-Z][a-zA-Z0-9_]+):\s*$/) {
            # ignore
        } elsif ($line =~ m/^\s*#/) {
        } else {
            die "Invalid M0 bytecode line: '$line'";
        }
    }
    return $bytecode;
}

sub m0b_header_length {
    return 8  # magic number
         + 8; # config data
}


sub m0b_constants_seg {
    my ($chunk) = @_;

    my $constants = $chunk->{constants};
    my $bytecode  = pack("i", $M0_CONST_SEG);
    $bytecode    .= pack("i", scalar @$constants);
    $bytecode    .= pack("i", m0b_const_seg_length($constants));

    #for each constant
    for (@$constants) {
        my ($type, $value) = /^([INS&]):(.*)$/s;
        if ($type eq 'I') {
            $bytecode .= pack("ii", 4, $value);
            my $s = pack("ii", 4, $value);
            m0_say "adding I constant $value to constants segment";
        }
        elsif ($type eq 'N') {
            $bytecode .= pack("if", 4, $value + 0.0);
            m0_say "adding N constant $value to constants segment";
        }
        elsif ($type eq 'S' || $type eq '&') {
            #TODO: pad all strings to word length
            my $const_length = bytes::length($value) + 4 + 4 + 1; # byte count + encoding + string bytes + terminal null
            my $string_length = bytes::length($value) + 1; # byte count + terminal null
            my $encoding = $type eq '&' ? 0 : 1;
            $bytecode .= pack("iiia[$string_length]", $const_length, $string_length, $encoding, $value);
            m0_say "adding S constant '$value' to constants segment ($string_length bytes)";
        }
    }

    return $bytecode;
}


=item C<m0b_dir_seg>

Generate a directory for the given set of chunks, assuming that the directory
segment's first byte is at $offset.

=cut

sub m0b_dir_seg {
    my ($chunks) = @_;

    my $offset     = m0b_header_length();
    my $seg_bytes  = pack('i', $M0_DIR_SEG);
    $seg_bytes    .= pack('i', scalar @$chunks);
    $seg_bytes    .= pack('i', m0b_dir_seg_length($chunks));
    $offset       += m0b_dir_seg_length($chunks);

    for (@$chunks) {
        $seg_bytes .= pack('i', $offset);
        $seg_bytes .= pack('i', length($_->{name}));
        $seg_bytes .= $_->{name};
        $offset    += m0b_chunk_length($_);
        m0_say "offset of next chunk is $offset";
    }

    return $seg_bytes;
}

=item C<m0b_dir_seg_length>

Calculate the number of bytes in a directory segment, using the chunk names in
$chunks.

=cut

sub m0b_dir_seg_length {
    my ($chunks) = @_;

    my $seg_length = 12; # 4 bytes for identifier, 4 for count, 4 for length

    for my $chunk (@$chunks) {
        $seg_length += 4; # offset into the m0b file
        $seg_length += 4; # size of name
        $seg_length += length($chunk->{name});
    }

    return $seg_length;
}

=item C<m0b_chunk_length>

Calculate the number of bytes in a chunk.

=cut

sub m0b_chunk_length {
    my ($chunk) = @_;
    my $chunk_length =
           m0b_bc_seg_length($chunk->{bytecode})
         + m0b_const_seg_length($chunk->{constants})
         + m0b_meta_seg_length($chunk->{metadata});
    m0_say "chunk length is $chunk_length";
    return $chunk_length;
}

=item C<m0b_bc_seg_length>

Calculate the size of an M0 bytecode segment.

=cut

sub m0b_bc_seg_length {
    my ($bc_seg) = @_;

    my $op_count = 0;
    for my $line (split /\n/, $bc_seg) {
        # strip out labels
        $line =~ s/^[a-zA-Z][a-zA-Z0-9_]+://;
        # strip out comments
        $line =~ s/^\s*#.*$//;
        # count any remaining non-empty lines
        $op_count++ if $line =~ /\w/;
    }
    my $seg_length = 12; # 4 for segment identifier, 4 for count, 4 for size
    $seg_length += $op_count * 4;

    m0_say "bytecode seg length is $seg_length";
    return $seg_length;
}

=item C<m0b_const_seg_length>

Calculate the number of bytes that a constants segment will occupy.

=cut

sub m0b_const_seg_length {
    my ($consts) = @_;

    my $seg_length = 12; # 4 for segment identifier, 4 for count, 4 for size

    for (@$consts) {
        my ($type, $value) = /^([INS&]):(.*)$/s;
        if ($type eq 'I') {
            $seg_length += 8; # storage of size of constant
            m0_say "after adding I constant $value, length is $seg_length (+8)";
        }
        elsif ($type eq 'N') {
            $seg_length += 8; # storage of size of constant
            m0_say "after adding N constant $value, length is $seg_length (+8)";
        }
        elsif ($type eq 'S' || $type eq '&') {
            # const size + byte count + encoding + string bytes + terminal null
            my $const_length = 4 + bytes::length($value) + 4 + 4 + 1;
            $seg_length += $const_length;
            m0_say "after adding $type constant '$value', length is $seg_length (+$const_length)";
        }
        else {
            die "unknown type '$type'.  I don't know how this happened.";
        }
    }

    m0_say "consts seg length is $seg_length";
    return $seg_length;
}

=item C<m0b_meta_seg_length>

Calculate the number of bytes that a metadata segment will occupy.

=cut

sub m0b_meta_seg_length {
    my ($metadata) = @_;
    my $seg_length = 12; # 4 for segment identifier, 4 for count, 4 for size
    $seg_length += 12 * scalar(split /\n/, $metadata);

    m0_say "metadata seg length is $seg_length";
    return $seg_length;
}

sub opname_to_num {
    my ($ops, $opname) = @_;

    $opname =~ s/-/_/g;
    die "Invalid M0: unknown op '$opname'" if (! exists $ops->{$opname});

    return $ops->{$opname};
}

sub parse_version {
    my ($lines, $cursor) = @_;
    $$cursor++ while ($lines->[$$cursor] =~ /^\s*#/ || $lines->[$$cursor] =~ /^\s*$/);
    if ($lines->[$$cursor] !~ /\.version\s+(?<version>\d+)/) {
        die "Invalid M0: No version";
    }
    m0_say "Parsing M0 v" . $+{version};
    $$cursor++;

    return $+{version};
}

sub parse_chunks {
    my ($lines, $cursor, $chunk_map) = @_;

    my $chunks = [];
    my %chunk;
    my (@constants, @metadata, @bytecode);
    my $state = 'none';

    while (exists $lines->[$$cursor]) {

        my $line = $lines->[$$cursor];

        $$cursor++ && next if ($line =~ /^\s*#/ || $line =~ /^\s*$/);

        if ($state eq 'none') {
            if ($line =~ /^\.chunk\s+"(?<name>\w*?)"$/) {
                $chunk{name} = $+{name}; 
                $state = 'chunk start';
                m0_say "Parsing chunk #".scalar @$chunks;
            }
            else {
                die "Invalid M0: expected chunk name, got '$line' at line $$cursor";
            }
        }
        elsif ($state eq 'chunk start') {
            if ($line =~ /^\.constants\s*?$/ ) {
                $state = 'constants';
            }
            else {
                die "Invalid M0: expected constants segment start, got '$line' at line $$cursor";
            }
        }
        elsif ($state eq 'constants') {
            if ($line =~ /^\.metadata\s*?$/) {
                $state = 'metadata';
            }
            elsif ($line =~ /^\d+\s+(.*)$/) {
                my $const = $1;
                # remove leading and trailing double quotes which are used to represent strings
                if ($const =~ /^"/) {
                    $const =~ s/(^"|"$)//g;
                    $const =~ s?\\n?\n?g;
                    # replace escaped double quotes with actual double quotes
                    $const =~ s/\\"/"/g;
                    $const = "S:$const";
                }
                elsif ($const =~ /^-?\d+$/) {
                    $const = "I:$const";
                }
                # XXX: way too simplistic; should be able to parse real floats
                elsif ($const =~ /^-?\d+\.\d+$/) {
                    $const = "N:$const";
                }
                elsif ($const =~ /^&(\w+)$/) {
                    if (!exists $chunk_map->{$1}) {
                        die "invalid chunk name '$1' used as constant at line $$cursor";
                    }
                    $const =~ s/&/&:/;
                }
                else {
                    die "unhandled constant type: '$const' at line $$cursor";
                }
                push @constants, $const;
            }
            else {
                die "Invalid M0: expected constants segment data or metadata segment start, got '$line' at line $$cursor";
            }
        }
        elsif ($state eq 'metadata') {
            if ($line =~ /^\.bytecode\s*?$/) {
                $state = 'bytecode';
            }
            elsif ($line =~ /(\d+)\s+(\d+)\s+(\d+)\s*$/) {
                push @metadata, $line;
            }
            else {
                die "Invalid M0: expected metadata segment data or bytecode segment start, got '$line' at line $$cursor";
            }
        }
        elsif ($state eq 'bytecode') {
            if ($line =~ /^\.chunk\s+"(?<name>\w*?)"\s*$/) {
                $chunk{constants} = [@constants];
                $chunk{metadata}  = join("\n", @metadata);
                $chunk{bytecode}  = join("\n", @bytecode);
                push @$chunks, {%chunk};
                (@constants, @metadata, @bytecode) = ((),(),());
                %chunk = ();
                $chunk{name} = $+{name}; 
                $state = 'chunk start';
            }
            elsif ($line =~ /^[^\.].*/) {
                push @bytecode, $line;
            }
            else {
                die "Invalid M0: expected bytecode segment data or start of new chunk, got '$line' at line $$cursor";
            }
        }
        $$cursor++;
    }

    $chunk{constants} = [@constants];
    $chunk{metadata}  = join("\n", @metadata);
    $chunk{bytecode}  = join("\n", @bytecode);
    push @$chunks, {%chunk};

    return $chunks;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__DATA__
# gen_opnames_from(m0.ops) template("LC_OP")
noop
goto
goto_if
goto_chunk
add_i
add_n
sub_i
sub_n
mult_i
mult_n
div_i
div_n
mod_i
mod_n
convert_i_n
convert_n_i
ashr
lshr
shl
and
or
xor
gc_alloc
sys_alloc
sys_free
copy_mem
set
set_imm
deref
set_ref
set_byte
get_byte
set_word
get_word
csym
ccall_arg
ccall_ret
ccall
print_s
print_i
print_n
exit
# end_gen
