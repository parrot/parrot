package P6C::TestCompiler;

my $PARROT = '../..';
my $PERL = $ENV{PERL} || 'perl';
my $ERR = 'a.err';
my $testno = 0;
my $code;

sub dumperr {
    open IN, $ERR;
    print STDERR <IN>;
    close IN;
    open O, ">test-$testno.p6";
    print O $code;
    close O;
    for my $ext (qw(pasm pbc imc err)) {
	rename "a.$ext", "test-$testno.$ext";
    }
    print STDERR "See test-$testno.{p6,imc,pasm,pbc} for output,",
	"and test-$testno.err for errors\n";
}

sub import {
    my $pkg = caller;
    for (qw(output_is)) {
	no strict 'refs';
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
	return 0;
    }
    return 1;
}

sub output_is {
    $code = shift;
    ++$testno;
    my ($out, $desc) = @_;
    unless ($desc) {
	(undef, my $file, my $line) = caller;
	$desc = "($file line $line)";
    }
    open(O, "| perl prd-perl6.pl --batch --imc > a.imc 2>$ERR") or die $!;
    print O $code;
    unless (close O) {
	ok(0, "$desc: compile error: $!");
	dumperr;
	return;
    }
    unless(mysystem("$PARROT/languages/imcc/imcc a.imc a.pasm 2>$ERR", $desc)
	   && mysystem("$PERL $PARROT/assemble.pl a.pasm > a.pbc 2>$ERR",$desc)
	   && mysystem("$PARROT/parrot a.pbc > a.output 2>$ERR", $desc)) {
	dumperr;
	return;
    }
    open(I, 'a.output');
    my $result = join '', <I>;
    ok($out eq $result, $desc);
}

1;
