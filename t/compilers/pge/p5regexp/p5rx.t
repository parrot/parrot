#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;
use Parrot::Config;
use File::Spec::Functions qw/ catfile /;


=head1 NAME

t/compilers/pge/p5regexp/p5rx.t - Perl 5 Regular Expression tests

=head1 DESCRIPTION

These tests are ripped from the Perl 5.9.2 distribution. The test harness
has been modified to feed them to PGE's P5Regexp compiler. The tests are
in a separate file in the same directory, named 're_tests'.

B<NOTE:> Don't add new tests here. This file is strictly for Perl 5's tests.

B<NOTE:> Only the first 130 tests are run, as the test framework is still
under development.

The Perl 5 equivalent file provides the following description of the test
format. There are five columns, separated by tabs.

Column 1 contains the pattern, optionally enclosed in C<''>.
Modifiers can be put after the closing C<'>. #'

Column 2 contains the string to be matched.

Column 3 contains the expected result:
    y	expect a match
    n	expect no match
    c	expect an error
    B	test exposes a known bug in Perl, should be skipped
    b	test exposes a known bug in Perl, should be skipped if noamp

Columns 4 and 5 are used only if column 3 contains C<y> or C<c>.

Column 4 contains a string, usually C<$&>.

Column 5 contains the expected result of double-quote
interpolating that string after the match, or start of error message.

Column 6, if present, contains a reason why the test is skipped.
This is printed with "skipped", for harness to pick up.

\n in the tests are interpolated, as are variables of the form ${\w+}.

=head1 SYNOPSIS

    % prove t/compilers/pge/p5regexp/p5rx.t

=cut


open(TESTS, catfile($PConfig{build_dir}, 't/compilers/pge/p5regexp/re_tests'))
    or die "Can\'t open re_tests";

## figure out how many tests there are
1 while (<TESTS>);
my $numtests = $.;
seek(TESTS,0,0);
$. = 0;


## cut out after this many tests
my $cutoff = 800;

#plan tests => $numtests;
plan tests => $cutoff;     ## still not ready to run *all* tests


## todo these failing tests to prevent noise
my @todo_tests = qw/
	81 82 88 99 100 130 131 132 133 134 139 140 141 142 156 157
	160 161 162 163 164 171 172 184 185 232 233 234 241 243 244
	246 247 253 254 256 257 260 261 396 397 398 407 419 422 428
	429 432 435 439 440 441 442 443 444 445 446 447 448 449 452
	453 454 455 481 482 485 491 493 495 498 500 501 503 504 505
	506 507 508 509 510 511 512 515 522 523 524 527 528 536 540
	541 543 544 545 548 549 553 554 556 557 568 569 570 571 572
	573 574 575 576 577 578 579 580 581 582 583 584 585 586 587
	588 589 590 591 592 595 596 600 601 602 603 604 605 606 607
	621 623 624 625 639 641 642 643 693 695 696 697 747 749 750
	751 800
/;

## unconditionally skip thene tests which cause infinite recursion
my @skip_tests = qw/ 502 597 /;


while (<TESTS>)
{
	my $test_num = $.;
	last if $test_num > $cutoff;

	chomp;
	s/\\n/\n/g;
	s/\r//g;
	my( $pattern, $subject, $result, $repl, $expect, $reason ) =
		split /\t/ => $_, 6;
	my( $skip, @todo );

	my $input =  join ':' => $pattern, $subject, $result, $repl, $expect;

	$pattern  =  replace_special_vars( $pattern );
	$subject  =  replace_special_vars( $subject );
	$expect   =  replace_special_vars( $expect  );

	## skip tests that break parrot
	$skip++ if grep { /^$test_num$/ } @skip_tests;
	## skip bugs and errors (PGE is not ready for them yet)
	$skip++ if $result =~ m/b|c/i;
	## skip patterns with trailing modifiers (same reason)
	$skip++ if $pattern =~ m/'\w+$/;

	$result   =~ s/b//i
		unless $skip;

	push @todo, todo => 'various reasons'
		if grep { /^$test_num$/ } @todo_tests;


	## create the test from the template
	my $pir_code = p5rx_template();

	my $results = generate_pir_for_results( $repl );

	$pir_code    =~ s/<<SUBJECT>>/$subject/g;
	$pir_code    =~ s/<<PATTERN>>/$pattern/g;
	$pir_code    =~ s/<<EXPECT>>/$expect/g;
	$pir_code    =~ s/<<REPL>>/$repl/g;
	$pir_code    =~ s/<<RESULTS>>/$results/g;


	## run the test, but skip it if i'm told to
	SKIP:
	{
		skip 'bugs | errors | trailing modifiers' => 1
			if $skip;
		pir_output_is( $pir_code, $expect, $reason, @todo );
	}
}

close(TESTS);



exit;



sub p5rx_template
{
	return <<'P5RX';
.sub 'PGE_Test' :main
	.local pmc p5rx_compile
	load_bytecode "PGE.pbc"
	load_bytecode "PGE/Dumper.pir"
	load_bytecode "PGE/Text.pir"
	p5rx_compile = compreg "PGE::P5Regexp"

	.local string target
	.local string pattern
	.local pmc rulesub
	.local pmc match
	.local pmc code
	.local pmc exp
	target = <<"TARGET"
<<SUBJECT>>
TARGET
	chopn target, 1

	pattern = <<"PATTERN"
<<PATTERN>>
PATTERN
	chopn pattern, 1

=for comment

target  = <<SUBJECT>>

pattern = <<PATTERN>>

expect  = <<EXPECT>>

repl    = <<REPL>>

=cut

	(rulesub, code, exp) = p5rx_compile(pattern)
	match = rulesub(target)
	unless match goto Match_fail

  Match_success:
	eq '-', '<<REPL>>', Match_no_check

<<RESULTS>>

  Match_no_check:
  Match_fail:
	print "-"
  Match_end:
.end
P5RX
}


sub generate_pir_for_results
{
	my( $repl ) = @_;
	my $replace_me = $repl;
	my @results;

	my $tokens = {
		'\$\&' => <<'Match_whole',
	$S0 = match
	print $S0
Match_whole

		'\$\-\[0\]' => <<'Match_whole_from',
	$I0 = match.'from'()
	print $I0
Match_whole_from

		'\$\+\[0\]' => <<'Match_whole_to',
	$I0 = match.'to'()
	print $I0
Match_whole_to

		'\$(\d+)' => <<"Match_backref",
	\$P0 = match[<<I>>]
	\$S0 = \$P0
	print \$S0
Match_backref

		'\$\-\[([123456789]+)\]' => <<"Match_backref_from",
	\$P0 = match[<<I>>]
	\$I0 = \$P0\.'from'()
	print \$I0
Match_backref_from

		'\$\+\[([123456789]+)\]' => <<"Match_backref_to",
	\$P0 = match[<<I>>]
	\$I0 = \$P0\.'to'()
	print \$I0
Match_backref_to

		'-' => <<'Match_hyphen',
	print '-'
Match_hyphen
	};


	## don't process  more than this many tokens (prevent runaway while loop)
	my $max_tokens = 10;
	my $tok_count = 0;

	while( length $replace_me and $tok_count < $max_tokens)
	{
		for my $tok ( sort {length $b <=> length $a} keys %$tokens )
		{
			my $rx = qr/(?x) ^ ( $tok ) /;

			my $tok_code;
			if( $replace_me   =~ s/$rx// )
			{
				my $index     =  defined $2 ? $2 - 1 : 0;
				my $tok_code  =  $tokens->{$tok};
				$tok_code     =~ s/<<I>>/$index/g;

				push @results => $tok_code;
				last;
			}
		}
		$tok_count++;
		push @results => "## unknown or too many tokens: $replace_me";
	}
	push @results    => "\tgoto Match_end";

	return join "\n" => @results;
}


## replacement vars for special characters
sub replace_special_vars
{
	my $string =  shift;

	my $bang   =  sprintf "\\%03o", ord "!"; # \41 would not be portable.
	my $ffff   =  chr(0xff) x 2;
	my $nulnul =  "\0" x 2;

	$string    =~ s/(\$\{\w+\})/$1/eeg;
	$string    =~ s/\\n/\n/g;
	$string    =~ s/\$\{bang\}/$bang/eeg;
	$string    =~ s/\$\{ffff\}/$ffff/eeg;
	$string    =~ s/\$\{nulnul\}/$nulnul/eeg;

	return $string;
}

