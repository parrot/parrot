#! perl -w
#
# Disassemble.pl
#
# Turn a parrot bytecode file into text
my %opcodes;

my %unpack_type;
%unpack_type = (i => 'l',
		n => 'd',
		);
my %unpack_size = (i => 4,
		   n => 8,
		   );

open OPCODES, "<opcode_table" or die "Can't get opcode table, $!/$^E";
while (<OPCODES>) {
    next if /^\s*#/;
    chomp;
    my ($code, $name, $args, @types) = split /\s+/, $_;
    $opcodes{$name} = {CODE => $code,
		       ARGS => $args,
		       TYPES => [@types]
		      };
    $opcodes[$code] = {NAME => $name,
		       ARGS => $args,
		       TYPES => [@types]
		       }
}

$/ = \4;
while (<>) {
    $code = unpack 'l', $_;
    $args = $opcodes[$code]{ARGS};
    print $opcodes[$code]{NAME};
    if ($args) {
	foreach (1..$args) {
	    local $/ = \$unpack_size{$opcodes[$code]{TYPES}[$_-1]};
	    $data = <>;
	    print " ", unpack $unpack_type{$opcodes[$code]{TYPES}[$_-1]}, $data;
	}
    }
    print "\n";
}
