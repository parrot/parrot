#! /usr/bin/perl -w
#
# Disassemble.pl
#
# Turn a parrot bytecode file into text

use strict;

my(%opcodes, @opcodes);

my %unpack_type;
%unpack_type = (i => 'l',
		n => 'd',
		);
my %unpack_size = (i => 4,
		   n => 8,
		   );

open GUTS, "interp_guts.h";
my $opcode;
while (<GUTS>) {
    next unless /\tx\[(\d+)\] = ([a-z_]+);/;
    $opcodes{$2}{CODE} = $1;
}

open OPCODES, "<opcode_table" or die "Can't get opcode table, $!/$^E";
while (<OPCODES>) {
    next if /^\s*#/;
    s/^\s+//;
    chomp;
    next unless $_;
    my ($name, $args, @types) = split /\s+/, $_;
    next unless defined $name;
    $opcodes{$name}{ARGS} = $args;
    $opcodes{$name}{TYPES} = [@types];
    my $code = $opcodes{$name}{CODE};
    $opcodes[$code] = {NAME => $name,
		       ARGS => $args,
		       TYPES => [@types]
		       }
}

$/ = \4;

my $magic = unpack('l', <>);
die "Not parrot bytecode!\n" if ($magic != 0x013155a1);

my $fixups = unpack('l', <>);
# No fixups yet

my $constants = unpack('l', <>);
# Skip for now

while (<>) {
    my $code = unpack 'l', $_;
    my $args = $opcodes[$code]{ARGS};
    print $opcodes[$code]{NAME};
    if ($args) {
	foreach (1..$args) {
	    local $/ = \$unpack_size{$opcodes[$code]{TYPES}[$_-1]};
	    my $data = <> || die("EOF when expecting argument!\n");
	    print " ", unpack $unpack_type{$opcodes[$code]{TYPES}[$_-1]}, $data;
	}
    }
    print "\n";
}
