#! /usr/bin/perl -w
#
# disassemble.pl
#
# Turn a parrot bytecode file into text.
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;

use Parrot::Config;
use Parrot::Opcode;
use Parrot::PackFile;
use Parrot::PackFile::ConstTable;


#
# GLOBAL VARIABLES:
#

my %unpack_type;
if (($] >= 5.006) && ($PConfig{ivsize} == $PConfig{longsize}) ) {
    %unpack_type = ('i'=>'l!','n'=>'d');
}
elsif ($PConfig{ivsize} == 4) {
    %unpack_type = ('i'=>'l','n'=>'d');
}
elsif ($PConfig{ivsize} == 8) {
    %unpack_type = ('i'=>'q','n'=>'d');
}
else {
    die("I don't know how to pack an IV!\n");
}
 
my(%real_type)=('I'=>'i','i'=>'i',
                'N'=>'i','n'=>'n',
                'S'=>'i','s'=>'i',
                'D'=>'i');
my(%type_swap)=('I'=>'i',  'N'=>'n',
                'S'=>'s',  'P'=>'p',
                'i'=>'ic', 'n'=>'nc',
                's'=>'sc', 'D'=>'ic');

my %unpack_size;
foreach (keys(%real_type)) {
    $unpack_size{$_}=length(pack($unpack_type{$real_type{$_}},0));
    $unpack_type{$_} = $unpack_type{$real_type{$_}};
}

my %opcodes            = Parrot::Opcode::read_ops();
my $opcode_fingerprint = Parrot::Opcode::fingerprint();
my @opcodes;
for my $name (keys %opcodes) {
    $opcodes[$opcodes{$name}{CODE}] = { NAME => $name,
					%{$opcodes{$name}} };
}


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

    die "Cannot disassemble (differing opcode table)!"
        if $pf->const_table->constant(0)->data ne $opcode_fingerprint;

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
# disassemble_byte_code()
#

sub disassemble_byte_code {
    my ($pf) = @_;

    my $cursor = 0;
    my $length = length($pf->byte_code);

    print "# Code Section\n";

    my $offset=0;

    while ($offset + 4 <= $length) {
	my $op_start = $offset;
	my $op_code = unpack "x$offset l", $pf->byte_code;
	printf "%08x: %-10s", $op_start, $opcodes[$op_code]{NAME};
	$offset += 4;

	my $arg_count = $opcodes[$op_code]{ARGS};
	my @args = ();

        unless($arg_count) {
	    print "\n";
	    next;
	}

	foreach (0 .. $arg_count - 1) {
	    my $type        = $opcodes[$op_code]{TYPES}[$_];
	    my $unpack_type = $unpack_type{$type};
	    my $unpack_size = $unpack_size{$type};

	    die "$0: Premature end of bytecode in argument.\n"
		if ($offset + $unpack_size) > $length;

	    my $arg = unpack "x$offset $unpack_type", $pf->byte_code;
	    $offset += $unpack_size;


	    if($type =~ m/^[INPS]$/) { # Register
		push @args, $type . $arg;
	    } elsif($type eq "D") { # destination address
		push @args, sprintf("%08x",$op_start + (4 * $arg));
	    } elsif($type eq "s") { # string constant
		push @args, sprintf("[string %04x]", $arg);
	    } else { # constant
		push @args, $arg;
	    }
	}

	print join(", ", @args), "\n";
    }
}


#
# disassemble_file()
#

sub disassemble_file {
    my ($file_name) = @_;

    my $pf = Parrot::PackFile->new;
    $pf->unpack_file($file_name);

    dump_const_table($pf);
    disassemble_byte_code($pf);
 
    undef $pf;

    return;
}


#
# MAIN PROGRAM:
#

@ARGV = qw(-) unless @ARGV;

foreach (@ARGV) {
    disassemble_file($_)
}

exit 0;

__END__

=head1 NAME

disassemble.pl - disassemble the byte code from Parrot Pack Files

=head1 SYNOPSIS

  perl disassemble.pl FILE

=head1 DESCRIPTION

Disassembles the Parrot Pack Files listed on the command line, or
from standard input if no file is named.

=head1 COPYRIGHT

Copyright (C) 2001 The Parrot Team. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter.

