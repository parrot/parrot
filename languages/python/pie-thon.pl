#!/usr/bin/perl -w
use strict;

my ($DIS, @dis, @source, $file, %opt, $DEFVAR);
$DIS = 'python mydis.py';
$DEFVAR = 'PerlInt';

$file = $ARGV[0];

get_dis($DIS, $file);
get_source($file);
gen_code();


# return disassembly of file
# XXX this doesn't disassemble functions
sub get_dis {
    my ($cmd, $f) = @_;
    @dis = qx($cmd $f);
    print @dis if $opt{debug};
}

sub get_source {
    my ($f) = @_;
    open IN, $f or die "can't read $f: $!";
    @source = <IN>;
    close(IN);
}

sub gen_code {
    print ".sub main \@MAIN\n";
    for (@dis) {
	if (/^\s+	     # intial space
	     (?:(\d+)\s+)?   # optional line
	     (?:\d+)\s+      # PC
	     (\w+)\s+        # opcode
	     (?:(\d+)\s+\((.*)\))? # oparg rest
	     /x) {
	    my ($line, $opcode, $arg, $rest) = ($1, $2, $3, $4);
	    if ($line) {
		print "\n## ", $source[$line-1];
	    }
	    $arg = '' unless defined $arg;
	    $rest = '' unless defined $rest;
	    print "# $opcode\t$arg $rest\n";
	    gen_pir($opcode, $arg, $rest);
	}
    }
    print ".end\n"
}

sub gen_pir {
    my ($opcode, $arg, $rest) = @_;
    no strict "refs";
    &$opcode($arg, $rest);
}

my (@stack, $temp, %globals);

sub temp {
    my $t = $_[0];
    "\$$t" . ++$temp;
}

sub typ {
    my $c = $_[0];
    my $t = 'P';
    if ($c =~ /^\d+$/) {	# int
	$t = 'I';
    }
    elsif ($c =~ /^\d+L$/) {	# bigint
	$t = 'B';
    }
    elsif ($c =~ /^'.*'$/) {	# string
	$t = 'B';
    }
    $t;
}

sub LOAD_CONST() {
    my ($n, $c) = @_;
    push @stack, [$n, $c, typ($c)];
}
sub STORE_NAME() {
    my ($n, $c) = @_;
    my $tos = pop @stack;
    if ($globals{$c}) {
	print <<"EOC";
	assign $c, $tos->[1]
EOC
    }
    else {
	$globals{$c} = 1;
	print <<"EOC";
        .local pmc $c
	$c = new $DEFVAR
	$c = $tos->[1]
	global "$c" = $c
EOC
    }
}

sub LOAD_NAME() {
    my ($n, $c) = @_;
    print <<"EOC";
	# $c = global "$c"
EOC
    push @stack, [$n, $c, 'P'];
}
sub PRINT_ITEM()
{
    my $tos = pop @stack;
    print <<"EOC";
	print_item $tos->[1]
EOC
}

sub PRINT_NEWLINE
{
    print <<"EOC";
	print_newline
EOC
}

sub RETURN_VALUE
{
    my $tos = pop @stack;
    # TODO
}
sub binary
{
    my ($op) = @_;
    my $r = pop @stack;
    my $l = pop @stack;
    my ($t, $n);
    if ($r->[2] eq 'I' && $l->[2] eq 'I') {
	$n = temp($t = 'I');
	# TODO only if args are small constants
	print <<"EOC";
	$n = $l->[1] $op $r->[1]
EOC
    }
    else {
	my $nl = $l->[1];
	if ($l->[2] ne 'P') {
	    $nl = temp('P');
	    print <<"EOC";
	$nl = new $DEFVAR
	$nl = $l->[1]
EOC
	}
	$n = temp($t = 'P');
	print <<"EOC";
	$n = new $DEFVAR
	$n = $nl $op $r->[1]
EOC
    }
    push @stack, [-1, $n, $t];
}
sub BINARY_ADD()
{
    binary('+');
}


sub BINARY_SUBTRACT()
{
    binary('-');
}
