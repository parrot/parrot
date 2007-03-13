# Copyright (C) 2007, The Perl Foundation.
# $Id: Mini.pm 17373 2007-03-07 00:58:56Z jkeenan $
package Parrot::IO::Capture::Mini;
use strict;

sub TIEHANDLE {
    my $class = shift;
    bless [], $class;
}

sub PRINT {
     my $self = shift;
     push @$self, join '',@_;
}

sub READLINE {
    my $self = shift;
    return wantarray ? @$self : shift @$self;
}

1;

################### DOCUMENTATION ###################

=head1 NAME

Parrot::IO::Capture::Mini - capture messages printed to STDOUT or STDERR during Parrot testing

=head1 SYNOPSIS

    use Parrot::IO::Capture::Mini;

Tie C<STDOUT> or C<STDERR>.

    $tie = tie *STDERR, "Parrot::IO::Capture::Mini" or croak "Unable to tie";

Call a function which is likely to generate a warning or error message.

    $self = Parrot::Ops2c::Utils->new( {
        argv            => [ qw( CSwitch  dan.ops dan.ops ) ],
        flag            => { dynamic => 1 },
    } );

Store what was captured in a variable, then C<untie>.

    $msg = $tie->READLINE;
    untie *STDERR or croak "Unable to untie";

Use that variable in a test.

    like($msg,
        qr/Ops file 'dan\.ops' mentioned more than once!/,
        "Got expected error message about mentioning same file twice");

=head1 DESCRIPTION

This package provides the bare minimum level of functionality needed to
capture messages printed to C<STDOUT> or C<STDERR> by Parrot build tools
written in Perl 5.

=head1 AUTHOR

Adapted by Jim Keenan from CPAN module IO::Capture::Tie_STDx.  Thanks as
always to the authors of IO::Capture, Mark Reynolds and Jon Morgan!

=head1 SEE ALSO

IO::Capture (L<http://search.cpan.org/dist/IO-Capture/>).

=cut
