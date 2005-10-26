=head1 NAME

Parrot::Test::PGE - test functions for Perl 6 Grammar Engine

=head1 SYNOPSIS

In a .t file:

  use Parrot::Test tests => 2;
  use Parrot::Test::PGE;

  p6rule_is('abc', '^abc', 'BOS abc');
  p6rule_is("   int argc ",
    [
        [ type    => 'int | double | float | char' ],
        [ ident   => '\w+' ],
        [ _MASTER => ':w<type> <ident>' ],
    ],
    "simple subrules test");
  p6rule_isnt('abc', '^bc', 'BOS bc');
  p6rule_like('abcdef', 'bcd', qr/0: <bcd @ 1>/, '$0 capture');

=head1 DESCRIPTION

Parrot::Test::PGE provides functions for testing the grammar engine
and Perl 6 rules.

=cut

use strict;

require Parrot::Test;

=head2 Functions

=over 4

=item C<p6rule_is($target, $pattern, $description)>

Runs the target string against the Perl 6 pattern, passing the test
if they match.  Note that patterns should be specified as strings
and without leading/trailing pattern delimiters.

(Hint: if you try using qr// for the $pattern then you're misreading
what this does.)

subrules: In addition to a simple scalar string, the pattern can be a
reference to an array of arrays. Containing subrules that refer to each
other. In this form:

    [
        [ name1 => 'pattern 1' ],
        [ name2 => 'pattern 2' ],
        [ name3 => '<name1> pattern 3' ],
        [ _MASTER => '<name1> <name2> <name3>' ],
    ],

The last rule, labelled with _MASTER, is the rule that your target string
will be matched against. The 'outer rule' if you will.

=cut

sub p6rule_is {
    my ($target, $pattern, $description, @todo) = @_;

    if (ref $pattern) {
        Parrot::Test::pir_output_is(
            Parrot::Test::PGE::_generate_subrule_pir($target, $pattern),
            'matched',
            $description,
            @todo);
    } else {
        Parrot::Test::pir_output_is(
            Parrot::Test::PGE::_generate_pir_for($target, $pattern),
            'matched',
            $description,
            @todo);
    }
}

=item C<p6rule_isnt($target, $pattern, $description)>

Runs the target string against the Perl 6 pattern, passing the test if
they do not match. The same pattern argument syntax above applies here.

=cut

sub p6rule_isnt {
    my ($target, $pattern, $description, @todo) = @_;

    if (ref $pattern) {
        Parrot::Test::pir_output_is(
            Parrot::Test::PGE::_generate_subrule_pir($target, $pattern),
            'failed',
            $description,
            @todo);
    } else {
        Parrot::Test::pir_output_is(
            Parrot::Test::PGE::_generate_pir_for($target, $pattern),
            'failed',
            $description,
            @todo);
    }
}

=item C<p6rule_like($target, $pattern, $expected, $description)>

Runs the target string against the Perl 6 pattern, passing the test
if the output produced by the test code matches the C<$expected>
parameter.  Note that C<$expected> is a I<Perl 5> pattern.

=cut

sub p6rule_like {
    my ($target, $pattern, $expected, $description, @todo) = @_;
    Parrot::Test::pir_output_like(
            Parrot::Test::PGE::_generate_pir_for($target, $pattern, 1),
            $expected,
            $description,
            @todo);
}

package Parrot::Test::PGE;

sub _parrot_stringify {
    $_ = $_[0];
    s/\\/\\\\/g;
    s/\n/\\n/g;
    s/\r/\\r/g;
    s/\"/\\"/g;
    return $_;
}

sub _generate_pir_for {
    my($target, $pattern, $captures) = @_;
    $target = _parrot_stringify($target);
    $pattern = _parrot_stringify($pattern);
    if ($captures) { 
        $captures = qq(
            print "\\n"
            match."dump"("mob"," ","")\n); 
    }
    else {
        $captures = "";
    }
    return qq(
        .sub _PGE_Test
            .local pmc p6rule_compile
            load_bytecode "PGE.pbc"
            load_bytecode "PGE/Dumper.pir"
            load_bytecode "PGE/Text.pir"
            find_global p6rule_compile, "PGE", "p6rule"

            .local string target
            .local string pattern
            .local pmc rulesub
            .local pmc match
            .local pmc code
            .local pmc exp
            target = "$target"
            pattern = "$pattern"
            (rulesub, code, exp) = p6rule_compile(pattern)
            match = rulesub(target)
            unless match goto match_fail
          match_success:
            print "matched"
            $captures
            goto match_end
          match_fail:
            print "failed"
          match_end:
        .end\n);
}

sub _generate_subrule_pir {
    my($target, $pattern) = @_;
    $target = _parrot_stringify($target);

    # Beginning of the pir code
    my $pirCode = qq(
        .sub _PGE_Test
            .local pmc p6rule_compile
            load_bytecode "PGE.pbc"
            find_global p6rule_compile, "PGE", "p6rule"

            .local string target
            .local pmc rulesub
            .local pmc match
            .local string name
            .local string subpat

            target = "$target"\n\n);

    # Loop to create the subrules pir code 
    for my $ruleRow (@$pattern) {
        my ($name, $subpat) = @$ruleRow;
        $subpat = _parrot_stringify($subpat);

        $pirCode .= qq(
            name = "$name"
            subpat = "$subpat"
            rulesub = p6rule_compile(subpat)\n);

        last if $name eq '_MASTER';

        $pirCode .= qq(
            store_global name, rulesub\n\n);
    }

    # End of the pir code
    $pirCode .= qq(
            match = rulesub(target)

            unless match goto match_fail
          match_success:
            print "matched"
            goto match_end
          match_fail:
            print "failed"
          match_end:
        .end\n);

    return $pirCode;
}

=back

=head1 AUTHOR

Patrick R. Michaud, pmichaud@pobox.com   18-Nov-2004

=cut

1;
