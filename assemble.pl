#! /usr/bin/perl -w
#
# assemble.pl - take a parrot assembly file and spit out a bytecode file

use strict;

my(%opcodes, %labels);
my ($output, $opt_c);
if (@ARGV and $ARGV[0] eq "-c") {
    shift @ARGV;
    $opt_c = 1;
}

my %pack_type;
%pack_type = (i => 'l',
	      n => 'd',
	  );

my %real_type=('i'=>'l',
              'n'=>'d',
              'N'=>'l',
              'I'=>'l',
              'S'=>'l',
              's'=>'l',
              'D'=>'l');

my $sizeof_packi = length(pack($pack_type{i},1024));

open GUTS, "interp_guts.h";
my $opcode;
while (<GUTS>) {
    next unless /\tx\[(\d+)\] = ([a-z0-9_]+);/;
    $opcodes{$2}{CODE} = $1;
}

open OPCODES, "<opcode_table" or die "Can't get opcode table, $!/$^E";
while (<OPCODES>) {
    next if /^\s*#/;
    chomp;
    s/^\s+//;
    next unless $_;
    my ($name, $args, @types) = split /\s+/, $_;
    my @rtypes=@types;
    @types=map { $_ = $real_type{$_}} @types;
    $opcodes{$name}{ARGS} = $args;
    $opcodes{$name}{TYPES} = [@types];
    $opcodes{$name}{RTYPES}=[@rtypes];
}

my $pc = 0;
my @code;
my %constants;
my @constants;

# First scan for labels and strings
while (<>) {
    next if /^\s?#/;
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
my $line = 0;
while ($_ = shift @code) {
    $line++;
    chomp;
    s/,/ /g;

    my ($opcode, @args) = split /\s+/, $_;

    if (!exists $opcodes{lc $opcode}) {
	die "No opcode $opcode at line $line:\n  <$_>\n";
    }
    if (@args != $opcodes{$opcode}{ARGS}) {
	die "wrong arg count--got ". scalar @args. " needed " . $opcodes{$opcode}{ARGS};
    }
    $output .= pack "l", $opcodes{$opcode}{CODE};
    foreach (0..$#args) {
       my($rtype)=$opcodes{$opcode}{RTYPES}[$_];
       my($type)=$opcodes{$opcode}{TYPES}[$_];
       if($rtype eq "I" || $rtype eq "N" || $rtype eq "P" || $rtype eq "S") {
           # its a register argument
           $args[$_]=~s/^[INPS](\d+)$/$1/i;
       } elsif($rtype eq "D") {
           # a destination
           $args[$_]=fixup($args[$_]);
       }
       $output .= pack $type, $args[$_];
    }
    $pc += 1+@args;
}

print $output unless (defined $opt_c and $opt_c);

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

sub emit_magic { $output .= pack($pack_type{i}, 0x13155a1) }

# Dummy for now.
sub emit_fixup_section { $output .= pack($pack_type{i}, 0) }

sub emit_constants_section {
    # First, compute how big it's going to be.
    # The fields we'll need to fill in are: strlen, flags, encoding, type
    my $size =0 ;
    for (@constants) {
        $size += 4*$sizeof_packi;
        $size += length($_);
	my($pad)=length($_) % $sizeof_packi;
	if($pad) {
	    $size+=$sizeof_packi-$pad;
	}
    }

    $size += $sizeof_packi if @constants; # That's for the number of constants
    $output .= pack($pack_type{i}, $size);
    return unless @constants; # Zero means end of segment.

    # Then spit out how many constants there are, so we can allocate
    $output .= pack($pack_type{i}, scalar @constants);

    # Now emit each constant
    for (@constants) {
        $output .= pack($pack_type{i},0) x 3; # Flags, encoding, type
        $output .= pack($pack_type{i},length($_)); # Strlen followed by that many bytes.
        $output .= $_;
	my $pad=(length($_) % $sizeof_packi);
	if($pad) {
	    $output .= "\0" x ($sizeof_packi-(length($_) % $sizeof_packi)); # Padding;
       }
    }
}
