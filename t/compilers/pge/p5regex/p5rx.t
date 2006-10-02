#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../../lib ../../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;
use Parrot::Config;
use File::Spec::Functions qw/ catfile /;


=head1 NAME

t/compilers/pge/p5regex/p5rx.t - Perl 5 Regular Expression tests

=head1 DESCRIPTION

These tests are ripped from the Perl 5.9.2 distribution. The test harness
has been modified to feed them to PGE's P5Regex compiler. The tests are
in a separate file in the same directory, named 're_tests'.

This test harness honors a special environment variable called C<TEST_P5RX>.
If set to a number, that test will be run alone and unconditionally--even
if it's designated as SKIP or TODO by the harness. This is quite helpful
in debugging tests that cause parrot to spiral out of control.

The test harness also has two variables @skip_tests and @todo_tests, which
provide the reason to todo or skip a test followed by the test numbers
applicable.

B<NOTE:> Don't add new tests here. This file is strictly for Perl 5's tests.

The Perl 5 equivalent file provides the following description of the test
format. There are 6 columns, separated by tabs.

Column 1 contains the pattern, optionally enclosed in C<''>.
Modifiers can be put after the closing C<'>. 

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

Column 6, if present, contains a description of what is being tested.

\n in the tests are interpolated, as are variables of the form ${\w+}.

=head1 SYNOPSIS

    % prove t/compilers/pge/p5regex/p5rx.t

=cut


my @file_path = split m{/}, 't/compilers/pge/p5regex/re_tests';
open my $test_file, catfile($PConfig{build_dir}, @file_path)
	or die "Can't open ".catfile ($PConfig{build_dir}, @file_path);

## figure out how many tests there are
1 while (<$test_file>);
my $numtests = $.;
seek($test_file,0,0);
$. = 0;

plan tests => $numtests;

my @todo_tests = (
    q{unknown} => qw<99 100 142 172 184 223 232 233 234 236 241 243 244 246
        247 253 254 256 257 260 261 381 382 396 397 398 419 422 428 429 432
        435 439 440 444 445 446 447 448 449 452 453 454 455 485 495 498 500
        501 503 504 505 506 507 508 509 510 511 512 515 522 523 524 527 528
        536 540 541 543 544 545 548 549 553 554 595 596 600 601 602 603 604
        605 606 607 621 623 624 625 639 641 642 643 693 695 696 697 747 749
        750 751 801 832 833 840 859 860 861 862 863 865 866 871 874 875 876
        882 887 888 890 891 893 894 895 896 897 898 899 900>,
    q{reuse captured group}  => qw<928 929 930 931 932 933 934 935 936 937
        938 939 940 941 942>,
    q{non-greedy/lookbehind} => qw<915 916 918 919 920 921 922>,
    q{greediness/lookbehind} => qw<901 902 903 904 905>,
    q{non-greedy/zero-width assertion} => qw<907 908 909 910 912 913 914 960>,
    q{\d in character class}  => qw<825 826 827>,
    q{[ID 20010803.016]}      => qw<884>,
    q{[perl #34195]}          => qw<959>,
    q{undef [perl #16773]}    => qw<925>,
    q{unmatched bracket}      => qw<923>,
    q{16 tests for [perl #23171]} => qw<927>,
);

my @skip_tests = (
    q{trailing modifiers} => qw<264 265 266 267 268 269 270 271 272 273 274
        275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291
        292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308
        309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325
        326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342
        343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359
        360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376
        377 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393
        394 395 458 459 460 461 462 463 464 465 466 467 468 469 470 471 472
        473 474 475 476 477 478 479 480 483 484 496 609 610 611 612 613 614
        615 616 617 627 628 629 630 631 632 633 634 635 645 646 647 648 649
        650 651 652 653 663 664 665 666 667 668 669 670 671 681 682 683 684
        685 686 687 688 689 699 700 701 702 703 704 705 706 707 717 718 719
        720 721 722 723 724 725 735 736 737 738 739 740 741 742 743 753 754
        755 756 757 758 759 760 761 771 772 773 774 775 776 777 778 779 789
        790 791 792 793 794 795 796 797 802 803 805 834 835 836 838 859 862
        877 886>,
    q{bug or error}       => qw<143 144 148 149 155 167
        248 249 252 308 309 310 322 323 325 330 331 336 347 408 436 487 488
        489 490 492 531 532 563 564 566 593 594 598 599 944 945>,
    q{broken col 4?}      => qw<139>,
    q{kills a parrot}     => qw<491 493 556 557
         568 569 570 571 572 573 574 575 576 577 578 579 580 581 582 583 584
         585 586 587 588 589 590 591 592 800 828 829 830 957 958>,
    q{hangs a parrot}     => qw<806 807 808 809 810 811 812 813 814 815 816
        817 818 819 820 821 822 823 924>,
    q{unknown}            => qw<502 597 944 945>,
    q{[ID 20010811.006]}  => qw<879>,
    q{[perl #18019]}      => qw<926>,
);

while (<$test_file>) {
	chomp;
	s/\r//g;
    { # ignore message of undefined variable.
        no warnings;
	    s/(\$\{\w+\})/$1/eeg;
    }
	my ($pattern, $subject, $result, $repl, $expect,  $description ) =
		split /\t/ => $_, 6;

	$pattern  =  replace_special_vars( $pattern );
	$subject  =  replace_special_vars( $subject );
	$expect   =  replace_special_vars( $expect  );


    my @todo = ();
    if (grep {$_ eq $.} @todo_tests) {
        push @todo, todo => find_reason_for(@todo_tests);
    }

	if (grep {$_ eq $.} @skip_tests) {
		skip_test($description, $subject, $pattern, $result, $repl, $expect, find_reason_for(@skip_tests), @todo);
	} else {
		do_test($description, $subject, $pattern, $result, $repl, $expect, @todo);
	}
}

close $test_file;

exit;

sub skip_test {
	my ($description, $subject, $pattern, $result, $repl, $expect, $skip, @todo) = @_;
	SKIP: {
		skip $skip => 1;
		do_test($description, $subject, $pattern, $result, $repl, $expect, @todo);
	}
}

sub do_test {
	my ($description, $subject, $pattern, $result, $repl, $expect, @todo) = @_;
	$result =~ s/b//i;
	if ($result !~ /[cynBb]/) {
		diag "Ill-formed test case: $subject\t$pattern\t$result\t$repl\t$expect";
		return;
	}
	## create the test from the template
	my $pir_code = p5rx_template();

	my $results  = generate_pir_for_results( $repl );

	$pir_code    =~ s/<<SUBJECT>>/$subject/g;
	$pir_code    =~ s/<<PATTERN>>/$pattern/g;
	$pir_code    =~ s/<<EXPECT>>/$expect/g;
	$pir_code    =~ s/<<REPL>>/$repl/g;
	$pir_code    =~ s/<<RESULTS>>/$results/g;

	pir_output_is( $pir_code, $expect, $description, @todo );

}

sub find_reason_for {
    my $reason;
    for (@_) {
        $reason = $_ and next if /\D/;
        return $reason if $_ == $.;
    }
}

sub p5rx_template
{
	return <<'P5RX';
.sub 'PGE_Test' :main
	.local pmc p5rx_compile
	load_bytecode "PGE.pbc"
	load_bytecode "PGE/Dumper.pir"
	load_bytecode "PGE/Text.pir"
	p5rx_compile = compreg "PGE::P5Regex"

	.local string target
	.local string pattern
	.local pmc rulesub
	.local pmc match
	target = <<'TARGET'
<<SUBJECT>>
TARGET
	chopn target, 1

	pattern = <<'PATTERN'
<<PATTERN>>
PATTERN
	chopn pattern, 1

=for comment

target  = <<SUBJECT>>

pattern = <<PATTERN>>

expect  = <<EXPECT>>

repl    = <<REPL>>

=cut

	rulesub = p5rx_compile(pattern)
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

