#!/usr/bin/perl -w
use strict;
use Getopt::Std;

my ($DIS, @dis, @source, $file, %opt, $DEFVAR, $cur_func);
$DIS = 'python -i mydis.py';
$DEFVAR = 'PerlInt';

getopts('dnD', \%opt);
$file = $ARGV[0];

get_dis($DIS, $file);
get_source($file);
exit if $opt{D};
gen_code();


# return disassembly of file
# Pfew
sub get_dis {
    my ($cmd, $f) = @_;
    use FileHandle;
    use IPC::Open3;
    my $mod;
    $f =~ /(\w+)/;
    $mod = $1;
    open3(*Wr, *Rd, *Er, "$cmd $f");
    print Wr "import $mod\n";
    print Wr "dis($mod)\n";
    close Wr;
    close Er;
    @dis = <Rd>;
    close Rd;
    #@dis = qx($cmd $f);
    print @dis if $opt{d};
}

sub get_source {
    my ($f) = @_;
    open IN, $f or die "can't read $f: $!";
    @source = <IN>;
    close(IN);
}

my ($code_l, %params, %lexicals, %names, %def_args, %arg_count);

sub decode_line {
    my $l = shift;
    my ($pc, $line ,$opcode, $arg, $rest);
    if ($l =~ /Disassembly of (\w+)/) {
	$arg = $1;
	print <<EOC;
.end		# $cur_func

.sub $arg prototyped
	new_pad 0
EOC
	if ($def_args{$arg}) {
	    my ($i, $n, $defs);
	    $n = $arg_count{$arg};
	    $defs = @{$def_args{$arg}};
	# @{$def_args{$arg}}
	    for ($i = $n; $i >= $defs; $i--) {
		my $reg = 4 + $i;
		my $d = pop @{$def_args{$arg}};
		print <<EOC;
	if argcP >= $i goto arg_ok
	    find_global P$reg, "${arg}_$d"
EOC
	    }
	    print <<EOC;
arg_ok:
EOC
	}
	$cur_func = $arg;
	%params = ();
	%lexicals = ();
	%names = ();
	return (undef, undef);
    }
    if ($l =~ />>\s+(\d+)/) {
	my $label = $1;
	$l =~ s/>>//;
	print <<EOC;
pc_$label:
EOC
    }
    if ($l =~ /^\s+	     # intial space
	(?:(\d+)\s+)?   # optional line
	(\d+)\s+        # PC
	(\w+)\s+        # opcode
	(?:(\d+)(?:\s+\((.*)\))?)? # oparg rest
	/x) {
	($line, $pc, $opcode, $arg, $rest) = ($1, $2, $3, $4, $5);
	if ($line) {
	    print "\n##\t\t", $source[$line-1];
	    if ($source[$line-1] =~ /def (\w+)\s*\((.*)\)/) {
		my ($f, $args) = ($1, $2);
		my @args = split(/,/, $args);
		my $n = @args;
		print "# '$f' $n args\n";
		$arg_count{$f} = $n;
	    }
	}
	$arg = '' unless defined $arg;
	$rest = '' unless defined $rest;
    }
    else {
	print "# XXX $l";
    }
    ($line, $pc, $opcode, $arg, $rest);
}

sub gen_code {
    $cur_func = 'test::main';
    print <<EOC;
.sub $cur_func \@MAIN
    .param pmc sys::argv
    .local pmc __name__
    __name__ = new $DEFVAR
    __name__ = '__main__'
EOC
    $code_l = 0;
    while ($code_l < @dis) {
	my $l = $dis[$code_l++];
	my ($line , $pc, $opcode, $arg, $rest);
	next if $l =~ /^\s*$/;
	($line, $pc, $opcode, $arg, $rest) = decode_line($l);
	next unless defined $pc;
	print "\t\t\t\t# $opcode\t$arg $rest\n" unless $opt{n};
	gen_pir($opcode, $arg, $rest);
    }
    print ".end\t\t# $cur_func\n";
}

sub gen_pir {
    my ($opcode, $arg, $rest) = @_;
    no strict "refs";
    &$opcode($arg, $rest);
}

my (@stack, $temp, %globals, $make_f, %pir_functions);

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

sub promote {
    my $v = $_[0];
    my $n = $v->[1];
    if ($v->[2] ne 'P') {
	$n = temp('P');
	print <<"EOC";
	$n = new $DEFVAR
	$n = $v->[1]
EOC
    }
    $n;
}

sub LOAD_CONST{
    my ($n, $c) = @_;
    if ($c =~ /^[_a-zA-Z]/ && !$names{$c}) {
	print <<EOC;
	.local pmc $c
	$c = new .$c
EOC
	$names{$c} = 1;
    }
    push @stack, [$n, $c, typ($c)];
}
sub STORE_NAME() {
    my ($n, $c) = @_;
    if ($make_f) {
	$make_f = 0;
	return;
    }
    my $tos = pop @stack;
    if ($globals{$c}) {
	print <<"EOC";
	assign $c, $tos->[1]
EOC
    }
    else {
	$globals{$c} = 1;
	$names{$c} = 1;
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
    unless ($cur_func eq 'test::main') {
	print <<EOC;
    	.pcc_begin_return
	.return $tos->[1]
	.pcc_end_return
EOC
    }
}

sub MAKE_FUNCTION
{
    my ($n, $c) = @_;
    my $tos = pop @stack;
    my $f;
    $tos->[1] =~ /code object (\w+)/;
    $f = $1;
    if ($n) {
	for (my $i=0; $i < $n; ++$i) {
	    my $arg = pop @stack;
	    my $g = promote($arg);
	    # TODO should better be namespace of func
	    # but can't create namespace yet
	    my $gn = "def_arg_" . ($n-$i-1);
	    print <<EOC;
	# $gn $g
	store_global "${f}_$gn", $g
EOC
	    unshift @{$def_args{$f}}, $gn;
	}
    }
    $pir_functions{$1} = 1;
    $make_f = 1;
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
	my $nl = promote($l);
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

sub JUMP_FORWARD()
{
    my ($n, $c) = @_;
    my $targ = "pc_xxx";
    if ($c =~ /to (\d+)/) {
	$targ = "pc_$1";
    }
    print <<EOC;
	goto $targ
EOC
}

sub COMPARE_OP()
{
    my ($n, $c) = @_;
    my $r = pop @stack;
    my $l = pop @stack;
    my %rev_map = (
	'==' => '!=',
	'!=' => '==',
    );
    my $op = $rev_map{$c};
    my ($line, $pc, $opcode, $arg, $rest) = decode_line($dis[$code_l]);
    my $targ = "pc_xxx";
    if ($opcode eq 'JUMP_IF_FALSE') {
	$code_l++;
	if ($rest =~ /to (\d+)/) {
	    $targ = "pc_$1";
	}
    }
    else {
	print "# XXX \n";
    }
    if ($r->[2] eq 'I' && $l->[2] eq 'I') {
	print <<"EOC";
	if $l->[1] $op $r->[1] goto $targ
EOC
    }
    else {
	my $nl = promote($l);
	print <<"EOC";
	if $nl $op $r->[1] goto $targ
EOC
    }
}

sub CALL_FUNCTION()
{
    my ($n, $c) = @_;
    my @args;
    for (my $i = 0; $i < $n; $i++) {
	my $arg = pop @stack;
	unshift @args, promote($arg);
    }
    my $tos = pop @stack;
    my $args = join ', ', @args;
    print <<EOC;
	$tos->[1]($args) 	# nargs = $n
EOC
    my ($line, $pc, $opcode, $arg, $rest) = decode_line($dis[$code_l]);
    if ($opcode eq 'POP_TOP') {
	$code_l++;
    }
    else {
	push @stack, [-1, 'P5', 'P'];
    }
}

sub POP_TOP
{
    pop @stack;
}
sub LOAD_FAST()
{
    my ($n, $c) = @_;
    if ($lexicals{$c}) {
	print <<EOC;
	# lexical $n '$c'
EOC
    }
    else {
	my $p = 5 + keys %params;
	$params{$c} = 1;
	$lexicals{$c} = 1;
	$names{$c} = 1;
	print <<EOC;
	# .param pmc $c
	.local pmc $c
	$c = P$p
	store_lex -1, $n, $c
EOC
    }
    push @stack, [$n, $c, 'P'];
}

sub STORE_FAST()
{
    my ($n, $c) = @_;
    my $tos = pop @stack;
    if ($lexicals{$c}) {
	print <<"EOC";
	assign $c, $tos->[1]
EOC
    }
    else {
	$lexicals{$c} = 1;
	print <<"EOC";
        .local pmc $c
	$c = new $DEFVAR
	$c = $tos->[1]
	store_lex -1, $n, $c
EOC
    }
}
