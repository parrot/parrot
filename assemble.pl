#! /usr/bin/perl -w
#
# assemble.pl - take a parrot assembly file and spit out a bytecode file

my %opcodes;

my %pack_type;
%pack_type = (i => 'l',
	      n => 'd',
	  );
my $sizeof_packi = length(pack($pack_type{i},1024));


open OPCODES, "<opcode_table" or die "Can't get opcode table, $!/$^E";
while (<OPCODES>) {
    next if /^\s*#/;
    chomp;
    s/^\s+//;
    next unless $_;
    my ($code, $name, $args, @types) = split /\s+/, $_;
    $opcodes{$name} = {CODE => $code,
		       ARGS => $args,
		       TYPES => [@types]
		      };
}

my $pc = 0;
my @code;
my %constants;
my @constants;

# First scan for labels and strings
while (<>) {
    s/^\s*//;
    if (s/^\s*([a-zA-Z_]\w+):\s*//) { $labels{$1} = $pc; }
    1 while s/\"([^\\\"]*(?:\\.[^\\\"]*)*)\"/constantize($1)/eg;
    my ($opcode, @args) = split /\s+/, $_;
    push @code, $_;
    $pc += 1+@args;
}

emit_magic();
emit_fixup_section();
emit_constants_section();

# Now assemble
$pc = 0;
while ($_ = shift @code) {
    chomp;
    s/,/ /g;

    my ($opcode, @args) = split /\s+/, $_;

    if (!exists $opcodes{lc $opcode}) {
	die "No opcode $opcode";
    }
    if (@args != $opcodes{$opcode}{ARGS}) {
	die "wrong arg count--got ". scalar @args. " needed " . $opcodes{$opcode}{ARGS};
    }

    $args[0] = fixup($args[0])
        if $opcode eq "branch_ic" and $args[0] =~ /[a-zA-Z]/;
    
    if ($opcode eq "eq_i_ic") {
        $args[2] = fixup($args[2]) if $args[2] =~ /[a-zA-Z]/;
        $args[3] = fixup($args[3]) if $args[3] =~ /[a-zA-Z]/;
    }
    if ($opcode eq "if_i_ic") {
        $args[1] = fixup($args[1]) if $args[1] =~ /[a-zA-Z]/;
        $args[2] = fixup($args[2]) if $args[2] =~ /[a-zA-Z]/;
    }

    print pack "l", $opcodes{$opcode}{CODE};
    foreach (0..$#args) {
	$args[$_] =~ s/^[INPS]?(\d+)$/$1/i;
	$type = $pack_type{$opcodes{$opcode}{TYPES}[$_]};
	print pack $type, $args[$_];
    }
    $pc += 1+@args;
}

sub fixup {
    my $l = shift;
    die "Unknown label $l" unless exists $labels{$l};
    return $labels{$l} - $pc;
}

sub constantize {
    my $s = shift;
    return $constants{$s} if exists $constants{$s};
    push @constants, $s;
    return $constants{$s} = $#constants;
}

sub emit_magic { print pack($pack_type{i}, 0x13155a1) }

# Dummy for now.
sub emit_fixup_section { print pack($pack_type{i}, 0) }

sub emit_constants_section {
    # First, compute how big it's going to be.
    # The fields we'll need to fill in are: strlen, flags, encoding, type
    my $size =0 ;
    for (@constants) {
        $size += 4*$sizeof_packi;
        $size += length($_);
        $size += length($_) % $sizeof_packi; # Padding
    }

    $size += $sizeof_packi if @constants; # That's for the number of constants
    print pack($pack_type{i}, $size);
    return unless @constants; # Zero means end of segment.

    # Then spit out how many constants there are, so we can allocate
    print pack($pack_type{i}, scalar @constants);
    
    # Now emit each constant
    for (@constants) {
        print pack($pack_type{i},0) x 3; # Flags, encoding, type
        print pack($pack_type{i},length($_)); # Strlen followed by that many bytes.
        print $_;
        print "\0" x (length($_) % $sizeof_packi); # Padding;
    }
}
