package P6C::TestCompiler;

my $PARROT = '../..';
my $PERL = $ENV{PERL} || 'perl';

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
    my ($code, $out, $desc) = @_;
    unless ($desc) {
	(undef, my $file, my $line) = caller;
	$desc = "($file line $line)";
    }
    open(O, "| perl prd-perl6.pl --batch --imc > a.imc 2>/dev/null") or die $!;
    print O $code;
    unless (close O) {
	ok(0, "$desc: parse: $!");
	return;
    }
    (mysystem("$PARROT/languages/imcc/imcc a.imc a.pasm 2>/dev/null", $desc)
     && mysystem("$PERL $PARROT/assemble.pl a.pasm > a.pbc", $desc)
     && mysystem("$PARROT/parrot a.pbc > a.output", $desc))
	or return 0;
    open(I, 'a.output');
    my $result = join '', <I>;
    ok($out eq $result, $desc);
}

1;
