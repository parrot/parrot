#! /usr/bin/perl -w
#
# pbc2c.pl
#
# Turn a parrot bytecode file into a C program.
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;

use Parrot::Types;
use Parrot::PackFile;
use Parrot::PackFile::ConstTable;
use Parrot::OpsFile;


use Data::Dumper;
$Data::Dumper::Useqq  = 1;
$Data::Dumper::Terse  = 1;
$Data::Dumper::Indent = 0;

use Parrot::OpLib::core;
my $ops = $Parrot::OpLib::core::ops;


#
# dump_const_table()
#

sub dump_const_table {
    my ($pf) = @_;

    my $count = $pf->const_table->const_count;

    if ($count < 1) {
	warn "Disassembling without opcode table fingerprint!";
	return;
    }

=no
    die "Cannot compile (differing opcode table)!"
        if $pf->const_table->constant(0)->data ne $opcode_fingerprint;
=cut

    print "# Constants: $count entries\n";
    print "# ID  Flags    Encoding Type     Size     Data\n"; 

    my $constant_num = 0;

    foreach ($pf->const_table->constants) {
        printf("%04x: %08x %08x %08x %08x %s\n",
	    $constant_num, $_->flags, $_->encoding, $_->type,
            $_->size, $_->data);

	$constant_num++;
    }
}


#
# compile_byte_code()
#

my $pc;
my $new_pc = 1;
my @args = ();

sub compile_byte_code {
    my ($pf) = @_;

    my $nconst = $pf->const_table->const_count;

    print <<END_C;
#include "parrot/parrot.h"
#include "parrot/string.h"
END_C

    print $ops->preamble;

    print <<END_C;

int
main(int argc, char **argv) {
    int                        i;
    struct Parrot_Interp *     interpreter;
    struct PackFile_Constant * c;
    struct PackFile *          pf;

    init_world();
  
    interpreter = make_interpreter();
    pf          = PackFile_new();

    interpreter->code = pf;

END_C

    for(my $i = 0; $i < $nconst; $i++) {
      my $const = $pf->const_table->constant($i);
      my $value = $const->value;

      if      ($const->type eq Parrot::PackFile::Constant::type_code('PFC_INTEGER')) { # TODO: Don't hardocde these codes.
        print <<END_C;
    c = PackFile_Constant_new_integer($value);
END_C
      } elsif ($const->type eq Parrot::PackFile::Constant::type_code('PFC_NUMBER')) { # TODO: Don't hardocde these codes.
        print <<END_C;
    c = PackFile_Constant_new_number($value);
END_C
      } elsif ($const->type eq Parrot::PackFile::Constant::type_code('PFC_STRING')) { # TODO: Don't hardocde these codes.
        my $type     = $value->type;
        my $encoding = $value->encoding;
        my $size     = $value->size;
        my $flags    = $value->flags;
        my $data     = Dumper($value->data);

        $data = '"' . $data . '"' unless $data =~ m/^"/;

        print <<END_C;
    c = PackFile_Constant_new_string(interpreter, string_make(interpreter, $data, $size, $encoding, $flags, $type));
END_C
      } else {
        die;
      }

      print <<END_C;
    PackFile_ConstTable_push_constant(pf->const_table, c);

END_C
    }

    my $cursor = 0;
    my $length = length($pf->byte_code);

    my $offset=0;

    my $op_code;
    my $op;

    while ($offset + sizeof('op') <= $length) {
        $pc       = $new_pc;
	$op_code  = unpack "x$offset l", $pf->byte_code;
        $op       = $ops->op($op_code);
	$offset  += sizeof('op');
        $new_pc   = $pc + $op->size;

        @args = ();

        foreach (1 .. scalar($op->arg_types) - 1) {
            die "$0: Premature end of bytecode in argument.\n"
                if ($offset + sizeof('op')) > $length;
            my $arg = unpack "x$offset l", $pf->byte_code;
            $offset += sizeof('op');
            push @args, $arg;
        }

        my $source = $op->source(\&map_ret_abs, \&map_ret_rel, \&map_arg, \&map_res_abs, \&map_res_rel);

        printf("PC_%d: { /* %s */\n%s}\n\n", $pc, $op->full_name, $source);
    }

    print <<END_C;

PC_$new_pc:
PC_0: {
    exit(0);
}

    return 0;
}
END_C

    return 0;
}


#
# map_ret_abs()
#

sub map_ret_abs
{
  my ($addr) = @_;
#print STDERR "pbcc: map_ret_abs($addr)\n";
  return sprintf("goto PC_%d", $addr);
}


#
# map_ret_rel()
#

sub map_ret_rel
{
  my ($offset) = @_;
#print STDERR "pbcc: map_ret_rel($offset)\n";
  return sprintf("goto PC_%d", $pc + $offset);
}


#
# map_arg()
#

my %arg_maps = (
  'i'  => "interpreter->int_reg->registers[%ld]",
  'n'  => "interpreter->num_reg->registers[%ld]",
  'p'  => "interpreter->pmc_reg->registers[%ld]",
  's'  => "interpreter->string_reg->registers[%ld]",

  'ic' => "%ld",
  'nc' => "interpreter->code->const_table->constants[%ld]->number",
  'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
  'sc' => "interpreter->code->const_table->constants[%ld]->string",
);

sub map_arg
{
  my ($type, $num) = @_;
#print STDERR "pbcc: map_arg($type, $num)\n";
  return sprintf($arg_maps{$type}, $args[$num - 1]);
}


#
# map_res_abs()
#

sub map_res_abs
{
  my ($addr) = @_;
  die "pbc2c.pl: Cannot handle RESUME ops!";
}


#
# map_res_rel()
#

sub map_res_rel
{
  my ($offset) = @_;
  die "pbc2c.pl: Cannot handle RESUME ops!";
}




#
# compile_file()
#

sub compile_file {
    my ($file_name) = @_;

    my $pf = Parrot::PackFile->new;
    $pf->unpack_file($file_name);

#    dump_const_table($pf);
    compile_byte_code($pf);
 
    undef $pf;

    return;
}


#
# MAIN PROGRAM:
#

@ARGV = qw(-) unless @ARGV;

foreach (@ARGV) {
    compile_file($_)
}

exit 0;

__END__

=head1 NAME

pbcc - Parrot byte code compiler

=head1 SYNOPSIS

  pbcc foo.pbc > foo.c

=head1 DESCRIPTION

Compile the Parrot Pack File listed on the command line, or
from standard input if no file is named.

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter.

