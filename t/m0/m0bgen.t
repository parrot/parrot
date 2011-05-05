#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use feature 'say';
use Test::More;
use Parrot::Test tests => 7;
use Data::Dumper;

=head1 NAME

t/m0/m0bgen.t - M0 bytecode parser tests

=head1 SYNOPSIS

    % prove t/m0/m0bgen.t

=head1 DESCRIPTION

Test the M0 bytecode interpreter by generating simple known-good hard-coded M0
bytecode files.

Note that although this code behaves superficially like an assembler, it is not
and never will be an assembler.  Its only purpose is to generate superficially
valid M0 bytecode for testing, not to generate non-trivial runnable code.

=cut


my $M0_DIR_SEG      = 0x01;
my $M0_VARS_SEG     = 0x02;
my $M0_META_SEG     = 0x03;
my $M0_BC_SEG       = 0x04;


# basic test with one chunk containing all empty segments

my $m0_interp = 'false';

my $m0b_data = [
    { 
      name => 'chunk_0',
      vars => [],
      meta => {},
      bc   => 0,
    },
];

can_parse($m0_interp, $m0b_data, "very minimal bytecode file" );



$m0b_data = [
    { 
      name => 'chunk_0', 
      vars => [ qw(quux flub buuuz) ],
      vars => [],
      meta => {},
      bc   => 0,
    },
];

can_parse($m0_interp, $m0b_data, "minimal bytecode with some variables" );


$m0b_data = [
    { 
      name => 'chunk_0', 
      vars => [],
      meta => { 0 => {line => 3, file => 'awesome'},
                3 => {cow  => 4},
              },
      bc   => 0,  # number of ops to generate (all null)
    },
];

can_parse($m0_interp, $m0b_data, "minimal bytecode file with a metadata segment" );


$m0b_data = [
    { 
      name => 'chunk_0', 
      vars => [ qw(quux flub buuuz) ],
      meta => { 0 => {line => 3, file => 'awesome'},
                3 => {cow  => 4},
              },
      bc   => 0,  # number of ops to generate (all null)
    },
];

can_parse($m0_interp, $m0b_data, "bytecode file with metadata and vars" );


$m0b_data = [
    { 
      name => 'chunk_0', 
      vars => [ ],
      meta => { },
      bc   => 99,  
    },
];

can_parse($m0_interp, $m0b_data, "bytecode file with null ops" );


$m0b_data = [
    { 
      name => 'chunk_0', 
      vars => [ qw(quux flub buuuz) ],
      meta => { 0 => {line => 3, file => 'awesome'},
                3 => {cow  => 4},
              },
      bc   => 99,  # number of ops to generate (all null)
    },
];

can_parse($m0_interp, $m0b_data, "bytecode file with metadata, vars and null ops" );


$m0b_data = [
    { 
      name => 'chunk_0', 
      vars => [ qw(quux flub buuuz) ],
      meta => { 0 => {line => 3, file => 'awesome'},
                3 => {cow  => 4},
              },
      bc   => 11,  # number of ops to generate (all null)
    },
    { 
      name => 'chunk_2', 
      vars => [ qw(quux2 flub2 buuuz2) ],
      meta => { 0 => {line2 => 32, file2 => 'awesome2'},
                3 => {cow2  => 42},
              },
      bc   => 22,  # number of ops to generate (all null)
    },
    { 
      name => 'chunk_3', 
      vars => [ qw(quux3 flub3 buuuz3) ],
      meta => { 03 => {line3 => 33, file3 => 'awesome3'},
                33 => {cow3  => 43},
              },
      bc   => 33,  # number of ops to generate (all null)
    },
];

can_parse($m0_interp, $m0b_data, "bytecode file with several chunks" );




sub can_parse {
    my ($interp, $data, $msg) = @_;
    my $file = 'temp.m0b';
    m0b_build_file($data, $file);
    my $status = system($interp, $file);
    is($status, 0, $msg);
    unlink($file);
}

=item C<m0b_build_file>

Generate an M0 bytecode file from m0b_data.

=cut

sub m0b_build_file {
    my ($chunks, $filename) = @_;

    my $bytes = m0b_build_bytes($chunks);
    open my $fh, '>', $filename or die "Couldn't open '$filename': $?";
    print $fh  $bytes;
    close $fh;

}


=item C<m0b_build_bytes>

Generate the binary version of an M0 chunk directory segment.

=cut

sub m0b_build_bytes {
    my ($chunks) = @_;

    my $m0b_bytes = m0b_header();
    $m0b_bytes .= m0b_dir_seg( $chunks );

    for my $chunk (@$chunks) {
        my $vars = $chunk->{vars};
        my $meta_seg = m0b_meta_seg( $chunk->{meta}, $vars );
        my $vars_seg = m0b_vars_seg( $vars );
        my $bc_seg   = m0b_bc_seg(   $chunk->{bc} );
        $m0b_bytes .= $vars_seg . $meta_seg . $bc_seg;
    }
    #say "bytecode contains ".length($m0b_bytes)." bytes";

    return $m0b_bytes;
}


=item C<m0b_header>

Generate an M0 bytecode header.

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


=item C<m0b_header_length>

Return the number of bytes in an M0 bytecode header.

=cut

sub m0b_header_length {
    return 8  # magic number
         + 8; # config data
}

=item C<m0b_dir_seg>

Generate a directory for the given set of chunks, assuming that the directory
segment's first byte is at $offset.

=cut

sub m0b_dir_seg {
    my ($chunks) = @_;

    my $offset     = m0b_header_length();
    my $seg_bytes  = pack('L', $M0_DIR_SEG);
    $seg_bytes    .= pack('L', scalar @$chunks);
    $seg_bytes    .= pack('L', m0b_dir_seg_length($chunks));
    $offset       += m0b_dir_seg_length($chunks);

    for (@$chunks) {
        $seg_bytes .= pack('L', $offset);
        $seg_bytes .= pack('L', length($_->{name}));
        $seg_bytes .= $_->{name};
        $offset    += m0b_chunk_length($_);
        #say "offset of next chunk is $offset";
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

    for (@$chunks) {
        $seg_length += 4; # offset into the m0b file
        $seg_length += 4; # size of name
        $seg_length += length($_->{name});
    }

    return $seg_length;
}

=item C<m0b_chunk_length>

Calculate the number of bytes in a chunk.

=cut

sub m0b_chunk_length {
    my ($chunk) = @_;
    my $chunk_length =
           m0b_bc_seg_length($chunk->{bc})
         + m0b_vars_seg_length($chunk->{vars})
         + m0b_meta_seg_length($chunk->{meta});
    #say "chunk length is $chunk_length";
    return $chunk_length;
}


=item C<m0b_bc_seg>

Generate the binary version of an M0 bytecode segment, using "\0" for the bytes.

=cut

sub m0b_bc_seg {
    my ($size) = @_;


    my $seg_bytes   = pack('L', $M0_BC_SEG);
    $seg_bytes     .= pack('L', $size);
    $seg_bytes     .= pack('L', m0b_bc_seg_length($size));
    while ($size--) {
        $seg_bytes .= pack('CCCC', 0, 0, 0, 0);
    }

    return $seg_bytes;
}


=item C<m0b_bc_seg_length>

Calculate the size of an M0 bytecode segment.

=cut

sub m0b_bc_seg_length {
    my ($size) = @_;

    my $seg_length = 12; # 4 for segment identifier, 4 for count, 4 for size
    $seg_length += $size * 4;

    #say "bytecode seg length is $seg_length";
    return $seg_length;
}


=item C<m0b_vars_seg>

Generate the binary version of an M0 variables segment, using the variables in
the first argument.

NOTE: Currently this generates an empty variables segment.  

=cut

sub m0b_vars_seg {
    my ($vars) = @_;

    my $seg_bytes  = pack("L", $M0_VARS_SEG);
    $seg_bytes    .= pack("L", scalar @$vars);
    $seg_bytes    .= pack("L", m0b_vars_seg_length($vars));

    #for each variable
    for (@$vars) {
        my $var_length = length($_);
        $seg_bytes .= pack("L", $var_length);
        $seg_bytes .= $_;
    }

    return $seg_bytes;
}


=item C<m0b_vars_seg_length>

Calculate the number of bytes that a variables segment will occupy.

=cut

sub m0b_vars_seg_length {
    my ($vars) = @_;

    my $seg_length = 12; # 4 for segment identifier, 4 for count, 4 for size

    for (@$vars) {
        my $var_length = length($_);
        $seg_length += 4; # storage of size of variable
        $seg_length += length($_);
        #say "after adding var '$_', length is $seg_length";
    }

    #say "vars seg length is $seg_length";
    return $seg_length;
}


=item C<m0b_meta_seg>

Generate the binary version of an M0 metadata segment, using the values in the
first argument and adding them to the variables list in the second.

NOTE: Currently generates an empty metadata segment.

=cut

sub m0b_meta_seg {
    my ($metadata, $var_seg) = @_;
    
    my $entry_count = 0;
    for my $offset (keys %$metadata) {
        $entry_count += keys %{$metadata->{$offset}};
    }

    my $seg_bytes  = pack("L", $M0_META_SEG);
    $seg_bytes    .= pack("L", $entry_count);
    $seg_bytes    .= pack("L", m0b_meta_seg_length($metadata));

    #for each entry
    for my $offset (keys %$metadata) {
        for my $key (keys %{$metadata->{$offset}}) {
            my $key_idx = m0b_get_val_idx($key, $var_seg);
            my $val_idx = m0b_get_val_idx($metadata->{$offset}{$key}, $var_seg);
            $seg_bytes .= pack('L', $offset);
            $seg_bytes .= pack('L', $key_idx);
            $seg_bytes .= pack('L', $val_idx);
        }
    }

    return $seg_bytes;
}



=item C<m0b_meta_seg_length>

Calculate the number of bytes that a metadata segment will occupy.

=cut

sub m0b_meta_seg_length {
    my ($metadata) = @_;
    
    my $seg_length = 12; # 4 for segment identifier, 4 for count, 4 for size

    for my $offset (keys %$metadata) {
        for (keys %{$metadata->{$offset}}) {
            $seg_length += 12;
        }
    }

    #say "metadata seg length is $seg_length";
    return $seg_length;
}


=item C<m0b_get_val_idx>

If the value exists in @$seg, return the index of it.  Otherwise, append it and
return the index.

=cut

sub m0b_get_val_idx {
    my ($val, $vars) = @_;

    my $val_idx = -1;
    for (my $i = 0; $i < scalar(@$vars); $i++) {
        return $i if ($vars->[$i] eq $val);
    }
    #say "added '$val' to vars";
    return push(@$vars, $val)-1;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
