package Tie::Filehandle::Preempt::Stdin;

# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use vars qw($VERSION);

$VERSION = "0.01";

use Carp;

sub TIEHANDLE {
    my $class = shift;
    my @lines = @_;
    bless \@lines, $class;
}

sub READLINE {
    my $self = shift;
    if (@$self) {
        shift @$self;
    }
    else {
        croak "List of prompt responses has been exhausted: $!";
    }
}

1;

##### DOCUMENTATION #####

=head1 NAME

Tie::Filehandle::Preempt::Stdin - Preempt STDIN during testing.

=head1 SYNOPSIS

    use Tie::Filehandle::Preempt::Stdin;
    @prompts = qw| alpha beta gamma |;
    $object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;

=head1 DESCRIPTION

Suppose a program requires manual input from the keyboard operator.
How do we test that we have properly handled operator input?  More
specifically, how do we incorporate testing for user input in files
built on Perl's standard testing apparatus (C<Test::Simple>,
C<Test::More>, etc.)?

Tie::Filehandle::Preempt::Stdin offers one way to do it -- a relatively
simple and unsophisticated todo it.  The most difficult part is
analyzing the program to be tested so that you recognize all the points
at which input is needed via STDIN.  This in turn requires an
understanding of all the different branches your program flow can take
in response to standard input.  Once you know that, you construct a list
of dummy data that will be fed to each test at the points the program,
when put into production, would normally prompt for operator input.
This list of dummy data 'pre-empts' standard input via a tie of
filehandle STDIN; hence, the module's name.

=head1 USAGE

    @prompts = qw| alpha beta gamma |;
    $object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;

    print "Enter item 1:  ";
    chomp($entry = <STDIN>);
    # 'alpha' is supplied in lieu of standard input;
    # do something with $entry

    print "Enter item 2:  ";
    chomp($entry = <STDIN>);
    # 'beta' is supplied in lieu of standard input;
    # do something with $entry

    print "Enter item 3:  ";
    chomp($entry = <STDIN>);
    # 'gamma' is supplied in lieu of standard input;
    # do something with $entry

Should the number of elements in C<@prompts> be less than the number of
points at which a given test prompts for operator input, you will get an
error message:

    "List of prompt responses has been exhausted"

and the program will C<croak>.

=head1 BUGS

Tie::Filehandle::Preempt::Stdin does not work properly when the source
code being tested uses only the Perl diamond operator for standard input.

    print "Enter room whose data you wish to enter:  ";
    chomp ($try = <>);

This doesn't work; your program will hang.  You have to hard-code
C<STDIN> instead.

    chomp ($try = <STDIN>);

I don't know why this happens.  If this bothers you, look at
C<IO::Scalar> which is reported to handle the diamond operator properly,
but which, IMHO, has a more complex interface.

=head1 SUPPORT

Contact author or post on perl.qa@perl.org.

=head1 AUTHOR

James E Keenan.  CPAN ID: JKEENAN.  Mail to:  jkeenan [at] cpan [dot] org.

=head1 ACKNOWLEDGEMENTS

The author benefitted from -- but did not always agree with -- comments
from the following members of Perlmonks:  chromatic, Revelation,
tmoertel, NiJo and dragonchild.

Thanks to Michael G Schwern and Kevin Scaldeferri for answering
questions on the perl.qa mailing list.

=head1 COPYRIGHT

Copyright 2005 James E Keenan.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

Last revision:  Apr 17 2005.

=head1 SEE ALSO

perltie(1).

I<Programming Perl> (3rd ed.), Larry Wall, Tom Christiansen
and Jon Orwant.  O'Reilly & Associates, 1991.  Chapter 14:  Tied
Variables:  section on ''Tying Filehandles,'' p. 384 ff.

Perlmonks discussion starting at:
L<http://www.perlmonks.org/index.pl?node_id=430997>.

Postings on perl.qa at:
L<http://www.nntp.perl.org/group/perl.qa/4074> and
L<http://www.nntp.perl.org/group/perl.qa/4076>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
