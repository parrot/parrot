package P6C::TestCompiler;

my $PARROT = '../..';
my $PERL = $ENV{PERL} || 'perl';
my $ERR = 'a.err';
my $PARROT_BIN;
if ($^O eq 'cygwin') {
    $PARROT_BIN = 'parrot.exe';
else {
    $PARROT_BIN = 'parrot';
}

my $testno = 0;
my $code;
my $out;

sub dumperr {
    open IN, $ERR;
    print STDERR <IN>;
    close IN;
    open O, ">test-$testno.p6";
    print O $code;
    close O;
    open O, ">test-$testno.out";
    print O $out;
    close O;
    for my $ext (qw(pasm pbc imc err)) {
	rename "a.$ext", "test-$testno.$ext";
    }
    print STDERR "See test-$testno.{p6,imc,pasm,pbc,out},",
	"and test-$testno.err for errors\n";
}

sub import {
    my $pkg = caller;
    no strict 'refs';
    for (qw(output_is)) {
	*{$pkg.'::'.$_} = \&$_;
    }
    my $class = shift;
    eval "use Test::Simple qw(@_)";
}

sub mysystem($$) {
    my ($cmd, $desc) = @_;
    if (system $cmd) {
	my ($subcmd) = split ' ', $cmd;
	ok(0, "$desc: $subcmd: ".($? >> 8));
	if (($? & 255) == 2) {
	    die "interrupted";
	}
	return 0;
    }
    return 1;
}

sub output_is {
    $code = shift;
    ++$testno;
    ($out, my $desc) = @_;
    unless ($desc) {
	(undef, my $file, my $line) = caller;
	$desc = "($file line $line)";
    }
    open(O, "| perl prd-perl6.pl --batch --imc > a.imc 2>$ERR") or die $!;
    print O $code;
    unless (close O) {
	ok(0, "$desc: compile error: ".($?>>8));
	if (($? & 255) == 2) {
	    die "interrupted";
	}
	dumperr;
	return;
    }
    unless(mysystem("$PARROT/languages/imcc/imcc a.imc a.pasm 2>$ERR", $desc)
	   && mysystem("$PERL $PARROT/assemble.pl a.pasm > a.pbc 2>$ERR",$desc)
	   && mysystem("$PARROT/$PARROT_BIN a.pbc > a.output 2>$ERR", $desc)) {
	dumperr;
	return;
    }
    open(I, 'a.output');
    my $result = join '', <I>;
    if ($out eq $result) {
	ok(1, $desc);
    } else {
	ok(0, $desc);
	dumperr;
    }
}

1;
