#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

##use strict;
##use warnings;
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

If you want to add a regular expression test that can't be expressed
in this format, don't add it here: put it in op/pat.t instead.

=head1 SYNOPSIS

    % prove t/compilers/pge/p5regexp/p5rx.t

=cut


# Poor man performance suite, 10000 is OK.
my $iters = shift || 1;

open(TESTS, catfile($PConfig{build_dir}, 't/compilers/pge/p5regexp/re_tests'))
    or die "Can\'t open re_tests";

## figure out how many tests there are
1 while (<TESTS>);
my $numtests = $.;
seek(TESTS,0,0);
$. = 0;

my $bang = sprintf "\\%03o", ord "!"; # \41 would not be portable.
my $ffff  = chr(0xff) x 2;
my $nulnul = "\0" x 2;
##my $OP = my $qr ? 'qr' : 'm';

## cut out after this many tests
my $cutoff = 130;

#plan tests => $numtests;
plan tests => $cutoff;


TEST:
while (<TESTS>) {
    last if $. > $cutoff;

    chomp;
    s/\\n/\n/g;
    s/\r//g;
    my ($pat, $subject, $result, $repl, $expect, $reason) = split(/\t/,$_,6);
    my @todo;
    my $input = join(':',$pat,$subject,$result,$repl,$expect);
    infty_subst(\$pat);
    infty_subst(\$expect);
    $pat = "'$pat'" unless $pat =~ /^[:']/;
    $pat =~ s/(\$\{\w+\})/$1/eeg;
    $pat =~ s/\\n/\n/g;
    $subject =~ s/(\$\{\w+\})/$1/eeg;
    $subject =~ s/\\n/\n/g;
    $expect =~ s/(\$\{\w+\})/$1/eeg;
    $expect =~ s/\\n/\n/g;
    $expect = $repl = '-' if $skip_amp and $input =~ /\$[&\`\']/;
    $skip = ($skip_amp ? ($result =~ s/B//i) : ($result =~ s/B//));
    $reason = 'skipping $&' if $skip_amp && $reason eq  '';
    $result =~ s/B//i unless $skip;
    my $c = $iters;

    print "not ok $.", next TEST if $skip;
    push @todo, todo => 'errors not implemented' if 'c' eq $result;

    my $template = <<P5RX;
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
    target = "$subject"
    pattern = $pat
#    target = "$subject"  pattern=$pat  expect='$expect'
    (rulesub, code, exp) = p5rx_compile(pattern)
    match = rulesub(target)
    unless match goto Match_fail
Match_success:
    eq '\$-[0]', '$repl', Match_from
    eq '\$+[0]', '$repl', Match_to
    eq '\$\&', '$repl', Match_whole
    eq '-', '$repl', Match_no_check
Match_whole:
    \$S0 = match
    print \$S0
    goto Match_end
Match_from:
    \$I0 = match.'from'()
    print \$I0
    goto Match_end
Match_to:
    \$I0 = match.'to'()
    print \$I0
    goto Match_end
Match_no_check:
Match_fail:
    print "-"
Match_end:
.end
P5RX

    pir_output_is( $template, $expect, $reason, @todo );

if(0){

    chomp( $err = $@ );
    if ($result eq 'c') {
##        if ($err !~ m!^\Q$expect!) { print "not ok $. (compile) $input => `$err'\n"; next TEST }
        last;
    }
    elsif ( $skip ) {
##        print "ok $. # skipped", length($reason) ? " $reason" : '', "\n";
        next TEST;
    }
    elsif ($@) {
##        print "not ok $. $input => error `$err'\n"; next TEST;
    }
    elsif ($result eq 'n') {
##        if ($match) { print "not ok $. $input => false positive\n"; next TEST }
    }
    else {
        if (!$match || $got ne $expect) {
##            print "not ok $. $input => `$got', match=$match\n";
            next TEST;
        }
    }
##    print "ok $.\n";

}

}

close(TESTS);

sub infty_subst                             # Special-case substitution
{                                           #  of $reg_infty and friends
    my $tp = shift;
    if( defined $reg_infty ) {
        $$tp =~ s/,\$reg_infty_m}/,$reg_infty_m}/o;
        $$tp =~ s/,\$reg_infty_p}/,$reg_infty_p}/o;
        $$tp =~ s/,\$reg_infty}/,$reg_infty}/o;
    }
}
