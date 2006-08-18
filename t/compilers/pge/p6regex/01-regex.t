#!perl
# Copyright (C) 2001-2003, The Perl Foundation.

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test tests => 498;
use Parrot::Test::PGE;
use Parrot::Config;

=head1 NAME

t/compilers/pge/p6regex/01-regex.t  -- Basic P6 Regex tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>.
Individual tests are stored in the regex_tests file in the same
directory; each test consist of the following (separated by one or more
tabs):

    pattern being tested
    target string for the pattern
    expected result -- one of
        y     = successful match
        n     = failed match
        /rx/  = output matches result (note that /rx/ is a perl *5* regex)
    description of the test

The test harness also has two variables @skip_tests and @todo_tests, which
provide the test numbers and the reasons for todoing or skipping them.

=head1 SYNOPSIS

	% prove t/compilers/pge/01-regex.t

=cut

my $tests = 't/compilers/pge/p6regex/regex_tests';

my @todo_tests = (
    q{conjunction (&) - null both args illegal} => qw<94>,
    q{nth occurance (:nth)} => qw<517 518>,
    q{basic ws match} => qw<507>,
    q{alternation and conjunction (&|) - parse error} => qw<97>,
    q{perl5 syntax (:perl5)} => qw<512>,
    q{alternation (|) - null both args illegal} => qw<81>,
    q{alternation (|) - null left arg illegal} => qw<80>,
    q{retired metachars (\1)} => qw<115>,
    q{alternation (|) - literal must be escaped} => qw<83>,
    q{illegal character range} => qw<257>,
    q{alternation and conjunction (|&) - parse error} => qw<98>,
    q{retired metachars (\P)} => qw<107>,
    q{conjunction (&) - null left arg illegal} => qw<93>,
    q{retired metachars (\p)} => qw<105>,
    q{conjunction (&) - literal must be escaped} => qw<96>,
    q{gt character class} => qw<273>,
    q{null pattern invalid} => qw<103>,
    q{metasyntax with leading + (<+...>)} => qw<360>,
);

my @skip_tests = (
);

unless ($PConfig{has_icu}) {
    push @skip_tests, q{no ICU} => qw<121>;
}

##   Perform the tests.
open TESTS, "<$tests" or die "Can't open $tests";
while (<TESTS>) {
    ##   skip lines without tabs
    next unless /\t/;

    chomp;
    my($pattern, $target, $result, $description) = split /\t+/, $_;

    $target =~ s/^'(.*)'$/$1/;
    $target =~ s/\\n/\n/g;
    $target =~ s/\\r/\r/g;
    $target =~ s/\\e/\e/g;
    $target =~ s/\\t/\t/g;
    $target =~ s/\\f/\f/g;
    $target =~ s/\\(\d{3})/chr(oct($1))/eg;
    $target =~ s/\\x(..)/chr(hex($1))/eg;

    my @todo = ();
    if (grep {$_ eq $.} @todo_tests) {
        @todo = ('todo' => find_reason_for(@todo_tests));
    }
    elsif (grep {$_ eq $.} @skip_tests) {
        SKIP: {
            skip(find_reason_for(@skip_tests), 1);
        }
        next;
    }

    if ($result =~ m{^/(.*)/$}) {
        p6rule_like($target, $pattern, qr/$1/, $description, @todo);
    } elsif ($result eq 'y') {
        p6rule_is($target, $pattern, $description, @todo);
    } elsif ($result eq 'n') {
        p6rule_isnt($target, $pattern, $description, @todo);
    } else { ok(0, "Invalid test result $result"); }
}
close TESTS;

sub find_reason_for {
    my $reason;
    for (@_) {
        $reason = $_ and next if /\D/;
        return $reason if $_ == $.;
    }
}
