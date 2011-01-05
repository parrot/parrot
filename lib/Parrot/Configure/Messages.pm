# Copyright (C) 2001-2011, Parrot Foundation.

package Parrot::Configure::Messages;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    print_introduction
    print_conclusion
);

################### SUBROUTINES ###################

sub print_introduction {
    my $parrot_version = shift;
    print <<"END";
Parrot Version $parrot_version Configure 2.0
Copyright (C) 2001-2011, Parrot Foundation.

Hello, I'm Configure. My job is to poke and prod your system to figure out
how to build Parrot. The process is completely automated, unless you passed in
the `--ask' flag on the command line, in which case I'll prompt you for a few
pieces of info.

Since you're running this program, you obviously have Perl 5--I'll be pulling
some defaults from its configuration.
END
    return 1;
}

sub print_conclusion {
    my ($conf, $make, $args) = @_;
    my @failed_steps = @{ $conf->{log} };
    my @logged_failed_steps = ();
    for (my $i = 1; $i <= $#failed_steps; $i++) {
        if ( defined $failed_steps[$i] ) {
            push @logged_failed_steps, [ $i, $conf->{log}->[$i] ];
        }
    }
    if ( scalar ( @logged_failed_steps ) ) {
        print STDERR "\nDuring configuration the following steps failed:\n";
        foreach my $fail (@logged_failed_steps) {
            my $msg = sprintf "    %02d:  %s\n", (
                $fail->[0],
                $fail->[1]->{step},
            );
            print STDERR $msg;
        }
        print STDERR "You should diagnose and fix these errors before calling '$make'\n";
        return;
    }
    else {
        unless ( $args->{silent} ) {
            print <<"END";

Okay, we're done!

You can now use `$make' to build your Parrot.
After that, you can use `$make test' to run the test suite.

Happy Hacking,
        The Parrot Team

END
        }
        return 1;
    }
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Messages - Introduce and conclude Parrot configuration process

=head1 SYNOPSIS

    use Parrot::Configure::Messages qw(
        print_introduction
        print_conclusion
    );

    print_introduction($parrot_version);

    $rv = print_conclusion( $conf, $make, $args );

=head1 DESCRIPTION

Parrot::Configure::Messages exports on demand two subroutines which print
messages to STDOUT when F<Configure.pl> is run.

=head1 SUBROUTINES

=head2 C<print_introduction()>

=over 4

=item * Purpose

Print the Parrot version, the version of F<Configure.pl>, the copyright notice
and a message introducing the Parrot configuration process.

=item * Arguments

One argument:  String holding the Parrot version number (currently supplied by
C<Parrot::BuildUtil::parrot_version()>).

=item * Return Value

Implicit true value when C<print> returns successfully.

=item * Comment

=back

=head2 C<print_conclusion()>

=over 4

=item * Purpose

Prints a message announcing the conclusion of the Parrot configuration process
and instructing the user to run F<make>.

=item * Arguments

    $rv = print_conclusion( $conf, $make, $args );

List of three arguments: the Parrot::Configure object; the string holding the
version of F<make> located by the configuration process; and the hash
reference which is the first element in the list returned by
C<Parrot::Configure::Options::process_options()>.

=item * Return Value

Returns true value when configuration is successful and message has been
printed.  Otherwise return value is undefined.

=back

=head1 NOTES

The functionality in this package was transferred from F<Configure.pl> by Jim
Keenan.

=head1 SEE ALSO

F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
