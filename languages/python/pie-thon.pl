#!/usr/bin/perl -w
#
# This is a minimal and incomplete python bytecode to PIR translator
# It's purpose is just to investigate missing pythonic features
# in Parrot and how to translate Python stack-oriented bytecode to PIR.
#

use strict;
use Getopt::Std;

my ($DIS, @dis, @source, $file, %opt, $DEFVAR, $cur_func);
$DIS = 'python -i mydis.py';
$DEFVAR = 'PerlInt';

getopts('dnD', \%opt);
$file = $ARGV[0];

my %builtins = (
    abs => 1
);

get_dis($DIS, $file);
get_source($file);
exit if $opt{D};
gen_code();

sub parse_dis
{
    my @d = @_;
    my ($dir1, $dir2);
    for (@d) {
	if (/^\[/) {
	    if ($dir1) {
		$dir2 = $_;
	    }
	    else {
		$dir1 = $_;
	    }
	}
    }
    $dir1 =~ s/^\[//;
    $dir2 =~ s/^\[//;
    $dir1 =~ s/\[$//;
    $dir2 =~ s/\[$//;
    my @dir1 = split(/,/, $dir1);
    my @dir2 = split(/,/, $dir2);
    my (%dir1, %dir2);
    @dir1{@dir1} = (1) x scalar @dir1;
    @dir2{@dir2} = (1) x scalar @dir2;
    my @diff;
    foreach (keys(%dir2)) {
	push @diff, $_ unless $dir1{$_};
    }
    print "diff @diff\n" if $opt{d};
    @diff;
}

# return disassembly of file
# Pfew
sub get_dis2 {
    my ($cmd, $f, @syms) = @_;
    use FileHandle;
    use IPC::Open3;
    my ($mod, $dir1, $dir2);
    $f =~ /(\w+)/;
    $mod = $1;
    open3(*Wr, *Rd, *Er, "$cmd $f");
    print Wr qq!print\n!;
    print Wr "from $mod import *\n";
    for my $s (@syms) {
	$s =~ s/[\s']//g;
	print Wr qq!print\n!;
	print Wr qq!print "Disassembly of $s"\n!;
	print Wr "dis($s)\n";
	print STDERR "dis($s)\n" if $opt{d};
    }
    close Wr;
    @dis = <Rd>;
    close Er;
    close Rd;
    print @dis if $opt{d};
    @dis;
}
sub get_dis {
    my ($cmd, $f) = @_;
    use FileHandle;
    use IPC::Open3;
    my ($mod, $dir1, $dir2);
    $f =~ /(\w+)/;
    $mod = $1;
    open3(*Wr, *Rd, *Er, "$cmd $f");
    # print Wr "import $mod\n";
    # print Wr "dis($mod)\n";
    print Wr "dir()\n";
    print Wr "from $mod import *\n";
    print Wr "dir()\n";
    close Wr;
    my @d = <Rd>;
    close Er;
    close Rd;
    #@dis = qx($cmd $f);
    #print @dis if $opt{d};
    my (@syms) = parse_dis(@d);
    get_dis2($cmd, $f, @syms);
}

sub get_source {
    my ($f) = @_;
    open IN, $f or die "can't read $f: $!";
    @source = <IN>;
    close(IN);
}

my ($code_l, %params, %lexicals, %names, %def_args, %arg_count,
    @code, %classes);

sub decode_line {
    my $l = shift;
    my ($pc, $line ,$opcode, $arg, $rest);
    if ($l =~ /Disassembly of (\w+)/) {
	push @code, [ 0, 0, "New_func", 0, $1, undef ];
	return;
    }
    if ($l =~ />>\s+(\d+)/) {
	push @code, [ 0, $1, "Label", $1, "", undef ];
	$l =~ s/>>//;
    }
    my $source = undef;
    if ($l =~ /^\s+	     # intial space
	(?:(\d+)\s+)?   # optional line
	(\d+)\s+        # PC
	(\w+)\s+        # opcode
	(?:(\d+)(?:\s+\((.*)\))?)? # oparg rest
	/x) {
	($line, $pc, $opcode, $arg, $rest) = ($1, $2, $3, $4, $5);
	## print STDERR "Op: '$opcode'\n";
	if ($line) {
	    $source = $source[$line-1];
	    if ($source =~ /def (\w+)\s*\((.*)\)/) {
		my ($f, $args) = ($1, $2);
		my @args = split(/,/, $args);
		my $n = @args;
		$arg_count{$f} = $n;
		push @code, [$line, $pc, "ARG_count", $n, $f, $source];
	    }
	}
	$arg = '' unless defined $arg;
	$rest = '' unless defined $rest;
    }
    else {  # program output from import - really ugly
	push @code, [0,0, undef, 0, $l, ''];
	return;
    }
    push @code, [$line, $pc, $opcode, $arg, $rest, $source];
}

sub XXX {
   my ($n, $c, $cmt) = @_;
   print "#Unknown '$cmt'\n";
}

sub Label {
   my ($n, $c) = @_;
   print <<EOC;
pc_$n:
EOC
}

sub New_func {
    my ($n, $arg) = @_;
    print <<EOC;
.end		# $cur_func

.sub $arg prototyped
	new_pad 0
EOC
    if ($def_args{$arg}) {
	my ($i, $n, $defs);
	$n = $arg_count{$arg};
	$defs = @{$def_args{$arg}};
	print "# @{$def_args{$arg}}\n";
	# XXX this is wrong, the default args should be evaluated once
	#     if this value depends on a global and that changes, this fails
	for ($i = $n; @{$def_args{$arg}}; $i--) {
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
}

sub ARG_count {
    my ($n, $c) = @_;
    print <<EOC;
	# $c($n)
EOC
}
my (@stack, $temp, %globals, $make_f, %pir_functions);

sub gen_code {
    $cur_func = 'test::main';
    print <<EOC;
.sub $cur_func \@MAIN
    .param pmc sys::argv
    .local pmc __name__
    __name__ = new $DEFVAR
    __name__ = '__main__'
EOC
    $globals{'__name__'} = 1;
    $code_l = 0;
    for (@dis) {
	next if /^\s*$/;
	decode_line($_);
    }
    while ($code_l < @code) {
	my $l = $code[$code_l++];
	my ($opcode, $arg, $rest, $src) = ($l->[2], $l->[3], $l->[4], $l->[5]);
	next unless $opcode;
	my $cmt = "";
	print "## $src" if  $src;

	if ($rest =~ /(<code object \w+)/) {
	    $rest = "$1 ..>";
	}
	$cmt = "\t\t# $opcode\t$arg $rest" unless $opt{n};
	gen_pir($opcode, $arg, $rest, $cmt);
    }
    print ".end\t\t# $cur_func\n";
}

sub gen_pir {
    my ($opcode, $arg, $rest, $cmt) = @_;
    no strict "refs";
    &$opcode($arg, $rest, $cmt);
}

sub temp {
    my $t = $_[0];
    "\$$t" . ++$temp;
}

sub is_num {
    my $c = $_[0];
    my ($pointfloat, $expfloat, $frac, $exp);
    $exp = qr/[eE][-+]?\d+/;
    $frac = qr/\.\d+/;
    $pointfloat = qr/(?:(?:\d+)?$frac)|\d+\./o;
    $expfloat = qr/(?:\d+|$pointfloat)$exp/o;
    return 1 if ($c =~ /$pointfloat|$expfloat/o);
    return 0;
}

sub is_imag {
    my $c = $_[0];
    return 1 if ($c =~ /^[+-]?\d+[jJ]$/);
    return 1 if ($c =~ s/[jJ]$// && is_num($c));
    return 0;
}

sub typ {
    my $c = $_[0];
    my $t = 'P';
    if ($c =~ /code object/) {
	$t = 'c';
    }
    elsif ($c =~ /^[+-]?\d+$/) {	# int
	$t = 'I';
    }
    elsif ($c =~ /^\d+[lL]$/) {	# bigint   XXX
	$t = 'B';
    }
    elsif ($c =~ /^'.*'$/) {	# string
	$t = 'S';
    }
    elsif (is_num($c)) {        # num
	$t = 'N';
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

sub LOAD_CONST {
    my ($n, $c, $cmt) = @_;
    if ($c =~ /^[_a-zA-Z]/ && !$names{$c}) {	# True, False ...
	print <<EOC;
	.local pmc $c $cmt
	$c = new .$c
EOC
	$names{$c} = 1;
    }
    elsif (typ($c) eq 'P') {
	my $typ = $DEFVAR;
	if (is_imag($c)) {
	    $typ = '.Complex';
	    $c = qq!"$c"!;
	}
        my $pmc = temp('P');
	print <<EOC;
	$pmc = new $typ $cmt
	$pmc = $c
EOC
	push @stack, [$n, $pmc, 'P'];
	return;
    }
    elsif (typ($c) eq 'B') {
	my $typ = $DEFVAR;
        my $pmc = temp('P');
	$c =~ s/[lL]$//;
	print <<EOC;
	$pmc = new .BigInt $cmt
	$pmc = "$c"
EOC
	push @stack, [$n, $pmc, 'P'];
	return;
    }
    else {
	print <<EOC;
	\t$cmt
EOC
    }
    push @stack, [$n, $c, typ($c)];
}
sub STORE_NAME {
    my ($n, $c, $cmt) = @_;
    if ($make_f) {
	$make_f = 0;
	print "\t\t$cmt\n";
	return;
    }
    my $tos = pop @stack;
    my $pmc;
    print "\t\t$cmt\n";
    unless ($names{$c}) {
	print <<"EOC";
	.local pmc $c \t# case 0
EOC
	if ($tos->[2] eq 'P' && $tos->[1] =~ /^\$/) {
	    $pmc = $tos->[1];
	}
	else {
	    print <<"EOC";
	$c = new $DEFVAR \t# case 1
EOC
	    $pmc = $c
	}
    }
    if ($tos->[2] eq 'P') {
	$pmc = $tos->[1];
    }
    else {
	$pmc = promote($tos);
    }
    $globals{$c} = 1;
    $names{$c} = 1;
    # a temp - store it
    if ($pmc =~ /^\$/) {
	print <<"EOC";
	global "$c" = $pmc \t# case 2
	$c = $pmc
EOC
    }
    else {
	print <<"EOC";
	assign $c, $pmc \t# case 3
EOC
    }
}

sub STORE_GLOBAL {
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    print <<EOC;
	global "$c" = $tos->[1] $cmt
EOC
}


sub is_builtin {
    my $f = shift;
    return $builtins{$f};
}

sub LOAD_GLOBAL {
    my ($n, $c, $cmt) = @_;
    my $p = temp('P');
    if ($c eq 'range') {
    	$c = 'range_1';
    }
    if (is_builtin($c)) {
    print <<EOC;
	# builtin $c $cmt
EOC
	push @stack, [-1, $c, 'F'];
    }
    else {
	print <<EOC;
	$p = global "$c" $cmt
EOC
	push @stack, [$c, $p, 'P'];
    }
    # print_stack();
}

sub LOAD_NAME() {
    my ($n, $c, $cmt) = @_;
    if (is_builtin($c)) {
	print <<EOC;
	# builtin $c $cmt
EOC
	push @stack, [-1, $c, 'F'];
	return;
    }
    if ($c eq 'range') {
    	$c = 'range_1';
    }
    if ($globals{$c}) {
	print <<"EOC";
	# $c = global "$c" $cmt
EOC
    }
    else {
	$globals{$c} = 1;
	print <<"EOC";
	.local pmc $c $cmt
	$c = global "$c"
EOC
    }
    push @stack, [$c, $c, 'P'];
}

sub PRINT_ITEM
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    print <<"EOC";
	print_item $tos->[1] $cmt
EOC
}

sub PRINT_NEWLINE
{
    my ($n, $c, $cmt) = @_;
    print <<"EOC";
	print_newline $cmt
EOC
}

sub RETURN_VALUE
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    unless ($cur_func eq 'test::main') {
	print <<EOC;
    	.pcc_begin_return $cmt
	.return $tos->[1]
	.pcc_end_return
EOC
    }
    else {
	print <<EOC;
	# $cmt
EOC
    }
}

sub MAKE_FUNCTION
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    my $f;
    $tos->[1] =~ /code object (\w+)/;
    $f = $1;
    print "\t\t$cmt\n";
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
    my ($op, $cmt) = @_;
    my $r = pop @stack;
    my $l = pop @stack;
    my ($t, $n);
    if ($r->[2] eq 'I' && $l->[2] eq 'I') {
	$n = temp($t = 'I');
	# TODO only if args are small constants
	print <<"EOC";
	$n = $l->[1] $op $r->[1] $cmt
EOC
    }
    else {
	my $nl = promote($l);
	$n = temp($t = 'P');
	print <<"EOC";
	$n = new $DEFVAR $cmt
	$n = $nl $op $r->[1]
EOC
    }
    push @stack, [-1, $n, $t];
}
sub BINARY_ADD
{
    my ($n, $c, $cmt) = @_;
    binary('+', $cmt);
}


sub BINARY_SUBTRACT
{
    my ($n, $c, $cmt) = @_;
    binary('-', $cmt);
}

sub BINARY_MODULO
{
    my ($n, $c, $cmt) = @_;
    binary('%', $cmt);
}
sub BINARY_MULTIPLY
{
    my ($n, $c, $cmt) = @_;
    binary('*', $cmt);
}
sub JUMP_FORWARD()
{
    my ($n, $c, $cmt) = @_;
    my $targ = "pc_xxx";
    if ($c =~ /to (\d+)/) {
	$targ = "pc_$1";
    }
    print <<EOC;
	goto $targ $cmt
EOC
}

sub JUMP_ABSOLUTE()
{
    my ($n, $c, $cmt) = @_;
    my $targ = "pc_$n";
    print <<EOC;
	goto $targ $cmt
EOC
}

sub JUMP_IF_FALSE
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    my $targ = "pc_xxx";
    if ($c =~ /to (\d+)/) {
	$targ = "pc_$1";
    }
    print <<EOC;
	unless $tos->[1] goto $targ $cmt
EOC
}

sub JUMP_IF_TRUE
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    my $targ = "pc_xxx";
    if ($c =~ /to (\d+)/) {
	$targ = "pc_$1";
    }
    print <<EOC;
	if $tos->[1] goto $targ $cmt
EOC
}

sub UNARY_NOT
{
    my ($n, $c, $cmt) = @_;
    my ($opcode, $arg, $rest) = ($code[$code_l]->[2],
	$code[$code_l]->[3],$code[$code_l]->[4]);

    if ($opcode eq 'JUMP_IF_FALSE') {
	print "\t\t$cmt\n";
	$code_l++;
	JUMP_IF_TRUE($arg, $rest);
    }
    else {
	my $tos = pop @stack;
	my $n = temp($tos->[2]);
	print <<EOC;
	$n = not $tos->[1] $cmt
EOC
	push @stack, [-1, $n, $tos->[2]];

    }
}

sub except_compare
{
    my ($l, $r) = @_;
    my $cmp = temp('I');
    if ($l && $l->[1]) {
	$l = $l->[1];
    }
    else {
	$l = 'P5';
    }
    push @stack, [-1, 'P5', 'P'];   # simulate the DUP_TOP
    print <<EOC;
	# except compare '$l' <=> $r->[1]
	$cmp = iseq $l, $r->[1]
EOC
    push @stack, [-1, $cmp, 'P'];
}

sub COMPARE_OP
{
    my ($n, $c, $cmt) = @_;
    my $r = pop @stack;
    my $l = pop @stack;
    if ($c =~ /exception match/) {
	return except_compare($l, $r);
    }
    my %rev_map = (
	'==' => '!=',
	'!=' => '==',
	'>' => '<=',
	'>=' => '<',
	'<' => '>=',
	'<=' => '>',
    );
    my $op = $rev_map{$c};
    my ($opcode, $rest) = ($code[$code_l]->[2],$code[$code_l]->[4]);
    my $targ = "pc_xxx";
    my $label = '';
    if ($opcode eq 'Label') {
	$label = "pc_" . $code[$code_l]->[3] . ":";
	$code_l++;
	($opcode, $rest) = ($code[$code_l]->[2],$code[$code_l]->[4]);
    }
    if ($opcode eq 'JUMP_IF_FALSE') {
	print "\t\t$cmt\n";
	$code_l++;
	$cmt ="\t\t# $opcode\t $rest";
	if ($rest =~ /to (\d+)/) {
	    $targ = "pc_$1";
	}
    }
    elsif ($opcode eq 'JUMP_IF_TRUE') {
	print "\t\t$cmt\n";
	$code_l++;
	$cmt ="\t\t# $opcode\t $rest";
	if ($rest =~ /to (\d+)/) {
	    $targ = "pc_$1";
	}
	$op = $c;
    }
    elsif ($opcode eq 'UNARY_NOT' && $code[$code_l+1]->[2] eq 'JUMP_IF_FALSE') {
	$code_l++;
	print "\t\t\t# UNARY_NOT\n\t\t\t# JUMP_IF_FALSE\n";
        ($opcode, $rest) = ($code[$code_l]->[2],$code[$code_l]->[4]);
	if ($rest =~ /to (\d+)/) {
	    $targ = "pc_$1";
	}
	$cmt ="\t\t# $opcode\t $rest";
	$code_l++;
	$op = $c;
    }
    else {
	$code_l-- if ($label ne '');
	# plain compare, no branch
	my %is_map = (
	    '==' => 'iseq',
	    '!=' => 'isne',
	    '>' => 'isgt',
	    '>=' => 'isge',
	    '<' => 'islt',
	    '<=' => 'isle',
	);
	my $res = temp('I');
	my $pres = temp('P');
	$op = $is_map{$c};
	my $lp = promote($l);
	my $rp = promote($r);
	print <<EOC;
	$res = $op $lp, $rp
	$pres = new .Boolean
	$pres = $res # ugly
EOC
	push @stack, [-1, $pres, 'I'];
	return;

    }
    # XXX the label may be wrong, if the JUMP_IF_x got rewritten
    if ($r->[2] eq 'I' && $l->[2] eq 'I') {
	print <<"EOC";
	if $l->[1] $op $r->[1] goto $targ $cmt
$label
EOC
    }
    else {
	my $nl = promote($l);
	print <<"EOC";
      	if $nl $op $r->[1] goto $targ $cmt
$label
EOC
    }
}
sub print_stack {
    for $_ (@stack) {
	print "# st $_->[2] : $_->[1]\n";
    }
}
sub CALL_FUNCTION
{
    my ($n, $c, $cmt) = @_;
    my @args;
    if ($make_f) {
	$make_f = 0;
	print <<EOC;
	\t$cmt
EOC
	pop @stack;
	return;
    }
    # arguments = $n & 0xff
    # named args: = $n >> 8 # ???
    $n =  ($n & 0xff) + 2*($n >> 8);	# XXX ???
    for (my $i = 0; $i < $n; $i++) {
	my $arg = pop @stack;
	unshift @args, promote($arg);
    }
    my $tos = pop @stack;
    my $args = join ', ', @args;
    my $t;
    my $func = $tos->[1];
    my $name = $tos->[0];
    if ($name =~ /^range/) {
	$func = $name;
	if ($func =~ s/^(range)_\d+/$1/) {
	    $func = "${func}_$n";	# range_1 .. range_3
	    unless ($globals{$func}) {
		$globals{$func} = 1;
		print <<"EOC";
	.local NCI $func
	$func = global "$func"
EOC
	    }
	}
    }
    if ($tos->[2] eq 'F') {	# builtin
	$t = temp('P');
	print <<EOC;
	$t = new $DEFVAR
	$t = $func $args   $cmt
EOC
    }
    else {
	print <<EOC;
	$func($args)  $cmt
EOC
    }
    my $opcode = $code[$code_l]->[2];
    if ($opcode eq 'POP_TOP') {
	print "# POP_TOP\n";
	$code_l++;
    }
    else {
	if (!$t) {
	    $t = temp('P');
	    print <<EOC;
	$t = P5
EOC
	}
	push @stack, [-1, $t, 'P'];
    }
}

sub POP_TOP
{
    my ($n, $c, $cmt) = @_;
    print "\t\t$cmt\n";
    #pop @stack;
}
sub LOAD_FAST
{
    my ($n, $c, $cmt) = @_;
    if ($lexicals{$c}) {
	print <<EOC;
	# lexical $n '$c' $cmt
EOC
    }
    else {
	my $p = 5 + keys %params;
	$params{$c} = 1;
	$lexicals{$c} = 1;
	$names{$c} = 1;
	print <<EOC;
	# .param pmc $c $cmt
	.local pmc $c
	$c = P$p
	store_lex -1, $n, $c
EOC
    }
    push @stack, [$n, $c, 'P'];
}

sub STORE_FAST
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    if ($lexicals{$c}) {
	print <<"EOC";
	assign $c, $tos->[1] $cmt
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

sub UNARY_CONVERT
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    my $p = promote($tos);
    my $s = temp('S');
    print <<EOC;
	$s = $p $cmt
EOC
    push @stack, [-1, $s, 'S'];
}

sub BUILD_TUPLE
{
    my ($n, $c, $cmt) = @_;
    my $ar = temp('P');
    print <<EOC;
	$ar = new PerlArray $cmt
EOC
    for (my $i = $n-1; $i >= 0; $i--) {
	my $p = pop @stack;
	print <<EOC;
	$ar\[$i\] = $p->[1]
EOC
    }
    push @stack, [-1, $ar, 'P'];
}

sub BUILD_LIST
{
    BUILD_TUPLE(@_)
}
sub BUILD_MAP
{
    my ($n, $c, $cmt) = @_;
    my $ar = temp('P');
    print <<EOC;
	$ar = new PerlHash $cmt
EOC
    push @stack, [-1, $ar, 'P'];
}
sub RAISE_VARARGS
{
    my ($n, $c, $cmt) = @_;
    my $throw;
    if ($n == 0) {
	$throw = 'rethrow P5';
    }
    else {
	$throw = 'throw P5 # TODO create, args';
	for (my $i = $n-1; $i >= 0; $i--) {
	    my $p = pop @stack;
	    print <<EOC;
	# arg $p->[1]
EOC
	}
    }
    print <<EOC;
	$throw $cmt
EOC
}
sub SETUP_LOOP
{
    my ($n, $c, $cmt) = @_;
    print <<EOC;
	# TODO $cmt
EOC
}
sub GET_ITER
{
    my ($n, $c, $cmt) = @_;
    my $it = temp('P');
    my $tos = pop @stack;
    my $var = promote($tos);
    print <<EOC;
	$it = new .Iterator, $var $cmt
	$it = 0 # .ITERATE_FROM_START
EOC
    push @stack, [-1, $it, 'P']
}
sub FOR_ITER
{
    my ($n, $c, $cmt) = @_;
    my $targ = "pc_xxx";
    my $tos = pop @stack;
    my $iter = $tos->[1];
    if ($c =~ /to (\d+)/) {
	$targ = "pc_$1";
    }
    my $var = temp('P');
    print <<EOC;
	unless $iter goto $targ $cmt
	$var = shift $iter
EOC
    push @stack, [-1, $var, 'P']
}
sub POP_BLOCK
{
    my ($n, $c, $cmt) = @_;
    print <<EOC;
	# TODO $cmt
EOC
}

sub UNPACK_SEQUENCE
{
    my ($n, $c, $cmt) = @_;
    print <<EOC;
	# TODO $cmt
EOC
}

sub DUP_TOP
{
    my ($n, $c, $cmt) = @_;
    my $tos = $stack[-1];
    print <<EOC;
	$cmt
EOC
    push @stack, $tos;
}

sub ROT_THREE
{
    my ($n, $c, $cmt) = @_;
    print "\t\t$cmt\n";
    my $v = pop @stack;
    my $w = pop @stack;
    my $x = pop @stack;
    push @stack, $w;
    push @stack, $x;
    push @stack, $v;
}

sub STORE_SUBSCR
{
    my ($n, $c, $cmt) = @_;
    my $w = pop @stack;
    my $v = pop @stack;
    my $x = pop @stack;
    print <<EOC
	$v->[1]\[$x->[1]\] = $w->[1] $cmt
EOC
}

sub BINARY_SUBSCR
{
    my ($n, $c, $cmt) = @_;
    my $w = pop @stack;
    my $v = pop @stack;
    my $x = temp('P');
    print <<EOC;
	$x = $v->[1]\[$w->[1]\] $cmt
EOC
    push @stack, [-1, $x, 'P'];
}
# exceptions
sub SETUP_EXCEPT
{
    my ($n, $c, $cmt) = @_;
    my $targ = "pc_xxx";
    if ($c =~ /to (\d+)/) {
	$targ = "pc_$1";
    }
    my $eh = temp('P');
    print <<EOC;
	newsub $eh, .Exception_Handler, $targ $cmt
	set_eh $eh
EOC
}
sub SETUP_FINALLY
{
    my ($n, $c, $cmt) = @_;
    SETUP_EXCEPT($n, $c, $cmt);
}
sub END_FINALLY
{
    my ($n, $c, $cmt) = @_;
    print <<EOC;
	throw P5 $cmt
EOC
}

sub BUILD_CLASS
{
    my ($n, $c, $cmt) = @_;
    my $tos = pop @stack;
    my $cl = temp('P');
    $classes{$tos->[1]} = 1;
    print <<EOC;
	$cl = newclass $tos->[1] $cmt
EOC
    push @stack, ['class $tos->[1]', $cl, 'P'];
}
