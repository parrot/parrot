#! /usr/bin/perl -w
#
# Disassemble.pl
#
# Turn a parrot bytecode file into text

use strict;
use Parrot::Opcode;

my %unpack_type = (i => 'l',
		   I => 'l',
		   n => 'd',
		   N => 'l',
		   D => 'l',
		   S => 'l',
		   s => 'l',
                  );
my %unpack_size = (i => 4,
		   n => 8,
		   I => 4,
		   N => 4,
		   D => 4,
		   S => 4,
		   s => 4,
		   );

my %opcodes            = Parrot::Opcode::read_ops();
my $opcode_fingerprint = Parrot::Opcode::fingerprint();
my @opcodes;
for my $name (keys %opcodes) {
    $opcodes[$opcodes{$name}{CODE}] = { NAME => $name,
					%{$opcodes{$name}} };
}

$/ = \4;

my $magic = unpack('l', <>);
die "Not parrot bytecode!\n" if ($magic != 0x013155a1);

my $fixups = unpack('l', <>);
# No fixups yet

my $constants = unpack('l', <>);
if($constants) {
    my $count=unpack('l', <>);
    print "# Constants: $count entries ($constants bytes)\n";
    print "# ID  Flags    Encoding Type     Size     Data\n"; 
    my $constant_num = 0;
    foreach (1..$count) {
       my $flags=unpack('l',<>);
       my $encoding=unpack('l',<>);
       my $type=unpack('l',<>);
       my $size=unpack('l',<>);
       my $data="";
       while(length($data) < $size) {
           $data.=<>;
       }
       # strip off any padding nulls
       $data=substr($data,0,$size);
       printf("%04x: %08x %08x %08x %08x %s\n",$_-1,$flags,$encoding,$type,$size,$data);

	die "Cannot disassemble (differing opcode table)!" if $constant_num == 0 and $data ne $opcode_fingerprint;
	$constant_num++;
    }
} else {
    warn "Disassembling without opcode table fingerprint!";
}
print "# Code Section\n";
my $offset=0;
while (<>) {
    my $code = unpack 'l', $_;
    my $args = $opcodes[$code]{ARGS};
    my $op_offset=$offset;
    print sprintf("%08x:  ",$offset),$opcodes[$code]{NAME},"\t";
    my @args=();
    $offset+=4;
    if ($args) {
	foreach (1..$args) {
	    my $type=$opcodes[$code]{TYPES}[$_-1];
	    local $/ = \$unpack_size{$type};
	    $offset+=$unpack_size{$type};
	    my $data = <> || die("EOF when expecting argument!\n");
	    if($type eq "I" || $type eq "N" || $type eq "P" || $type eq "S") {
		# register
		push(@args,$type.unpack($unpack_type{$type},$data));
	    } elsif($type eq "D") {
		# destination address
		push(@args,sprintf("%08x",$op_offset+unpack($unpack_type{$type},$data)*4));
	    } elsif($type eq "s") {
		# string constant
		push(@args,sprintf("[string %04x]",unpack($unpack_type{$type},$data)));
		
	    } else { 
		# constant
		push(@args,unpack $unpack_type{$type}, $data);
	    }
	}
    }
    print join(", ",@args),"\n";
}
